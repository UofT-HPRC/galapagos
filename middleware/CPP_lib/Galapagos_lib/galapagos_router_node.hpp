//===============================
// AUTHOR     : Naif Tarafdar
// CREATE DATE     : April 20, 2019
//===============================


#ifndef __GALAPAGOS_ROUTER_NODE_HPP__   // if x.h hasn't been included yet...
#define __GALAPAGOS_ROUTER_NODE_HPP__

#include "galapagos_router.hpp"


enum ext_port{network};


namespace galapagos{
template<class T>
    class router_node: public router<T>{
        private:
            std::map <std::string,  std::vector<short> >  address_map;
    	    std::vector < std::string > kern_info_table;
            std::string my_address;
            std::vector <galapagos::streaming_core <T> * > ext_streams;
            std::vector <int > ext_streams_indices;
            std::unique_ptr <std::thread> t;
            int ext_index;
            std::map <int, int> dest_to_kern_ind;
            int num_local;
            std::mutex * mutex_packets_in_flight;
            int * packets_in_flight;
        public:
            router_node(std::vector <std::string>  _kern_info_table, 
                        std::string _my_address, 
                        bool * _done, 
                        std::mutex *_mutex, 
                        int num_ext, 
                        std::mutex * _mutex_packets_in_flight,
                        int * _packets_in_flight
                        );
            void route();
            void add_kernel(kernel <T> * _gk, int index);
            void add_ext_stream(galapagos::streaming_core <T> * gsc);
            void start();
            unsigned int num_packets();
            void end();
            void drain();
            bool barrier();
            ~router_node();
    };

    

}

template <class T> 
galapagos::router_node<T>::router_node(std::vector <std::string>  _kern_info_table, 
                                    std::string _my_address,
                                    bool * _done,
                                    std::mutex * _mutex,
                                    int num_ext,
                                    std::mutex * _mutex_packets_in_flight,
                                    int * _packets_in_flight

                                    )
                                    :galapagos::router<T>::router(_done, _mutex)
{
  
    mutex_packets_in_flight = _mutex_packets_in_flight;
    packets_in_flight = _packets_in_flight;

    my_address = _my_address;

    num_local = 0;

    for(unsigned int i=0; i<_kern_info_table.size(); i++){
        kern_info_table.push_back(_kern_info_table[i]);

        if(_kern_info_table[i] == _my_address){
            dest_to_kern_ind[i] = num_local;
            num_local++;
        }
    }
   
    galapagos::router<T>::init_ports(num_local+num_ext);
    ext_index = num_local;
    
}


template <class T> 
void galapagos::router_node<T>::add_ext_stream(galapagos::streaming_core <T> * gsc){
    
   
    ext_streams.push_back(gsc);
    ext_streams[ext_streams.size() - 1]->start();

    ext_streams_indices.push_back(ext_index);
    ext_index++;

}



template <class T> 
void galapagos::router_node<T>::add_kernel(galapagos::kernel<T> * _gk, int index){

    galapagos::router<T>::add_stream( _gk, index);

}

template <class T> 
void galapagos::router_node<T>::start(){

    t=std::make_unique<std::thread>(&galapagos::router<T>::route, this); 
    t->detach();
    
}



template <class T> 
void galapagos::router_node<T>::route(){

    galapagos::stream_packet<T> gps;

#ifdef DEBUG
    std::cout << "MY NETWORK ADDRESS" << my_address << std::endl;
#endif

    while(1){
        

        if(this->is_done())
            break;
        for(unsigned int i=0; i<this->m_axis.size(); i++){
            if(this->m_axis[i]!=nullptr){
                galapagos::stream <T> * stream_ptr = this->m_axis[i].get();
                if(stream_ptr->try_peak(gps)){

                    if (kern_info_table[gps.dest] == my_address)
                    {
                    	// TODO this optimization is buggy
                        // stream_ptr->try_read(gps);
                        // this->s_axis[dest_to_kern_ind[gps.dest]]->write(gps);
                        int dest, src;
                        std::vector <T> vect = stream_ptr->read(&dest, &src);
                        this->s_axis[dest_to_kern_ind[gps.dest]]->write((char *)vect.data(), vect.size()*8, dest, src);
                    }
                    else{
#ifdef DEBUG        
                        std::cout << "WRITING TO NETWORK " << "dest " << gps.dest << " net address " << kern_info_table[gps.dest] <<  std::endl; 
#endif            
                        int dest, src;
                        {
                            std::lock_guard <std::mutex> guard(*mutex_packets_in_flight);                        
                            std::vector <T> vect = stream_ptr->read(&dest, &src);
                            this->s_axis[ext_streams_indices[0]]->write((char *)vect.data(), vect.size()*8, dest, src);
                            (*(packets_in_flight))+=vect.size();
                        }
                    }
                }
            }
        }
    }

}


template <class T> 
void galapagos::router_node<T>::end(){


    while(!this->is_done());

}

template <class T> 
bool galapagos::router_node<T>::barrier(){

    for(unsigned int i=0; i<this->s_axis.size(); i++){
        if(this->s_axis[i]->size()>0){
#ifdef DEBUG
            std::cout << " IN ROUTER NODE BARRIER S " << std::endl;
#endif
            return true;
        }
    }
    for(unsigned int i=0; i<this->m_axis.size(); i++){
        if(this->m_axis[i]->size()>0){
#ifdef DEBUG
           std::cout << " IN ROUTER NODE BARRIER M " << std::endl;
#endif
           return true;
        }
    
    }
    return false;

}

template <class T> 
void galapagos::router_node<T>::drain(){


    bool cont = true;
    while(cont){
        cont = false;
        for(unsigned int i=0; i<this->s_axis.size(); i++){
            if(this->s_axis[i]->size()>0)
                cont = true;
        }
        for(unsigned int i=0; i<this->m_axis.size(); i++){
            if(this->m_axis[i]->size()>0)
                cont = true;
        }
    }


}

template <class T> 
unsigned int galapagos::router_node<T>::num_packets(){

        unsigned int num = 0;

        for(int i=0; i<this->s_axis.size(); i++){
            num += this->s_axis[i]->size();
        }
       
        //exclude packets for in flight
        for(int i=0; i<ext_index; i++){
            num += this->m_axis[i]->size();
        }

        return num;


}

template <class T> 
galapagos::router_node<T>::~router_node(){;}



#endif
