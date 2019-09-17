//===============================
// AUTHOR     : Naif Tarafdar
// CREATE DATE     : April 20, 2019
//===============================


#ifndef __GALAPAGOS_LOCAL_ROUTER_HPP__   // if x.h hasn't been included yet...
#define __GALAPAGOS_LOCAL_ROUTER_HPP__



enum ext_port{network};


namespace galapagos{
template<class T>
    class local_router{
        private:
    	    std::vector < std::string > kern_info_table;
            std::string my_address;
            std::vector <galapagos::interface<T> * > ext_interfaces;
            std::vector <int > ext_interfaces_indices;
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
                        int * _packets_in_flight,
                        std::shared_ptr<spdlog::logger> _logger
                        );
            void route();
            void add_kernel(kernel <T> * _gk, int index);
            void add_ext_stream(galapagos::streaming_core <T> * gsc);
            void start();
            unsigned int num_packets();
            void end();
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
                                    int * _packets_in_flight,
                                    std::shared_ptr<spdlog::logger> _logger
                                    )
{
    logger = _logger;
    logger->info("Local Router Constructor");
  
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
    
    this->logger->info("Created Router Node with Local Address:{0}, {1:d} local nodes and {2:d} external nodes", my_address, num_local, num_ext);
   
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

    this->logger->info("Adding Kernel:{0:d}", index);
    //this->logger->info("Adding Kernel to Router Node");
    galapagos::router<T>::add_stream( _gk, index);

}

template <class T> 
void galapagos::router_node<T>::start(){
    this->logger->info("Starting Router Node with Local Address:{0}", my_address);
    t=std::make_unique<std::thread>(&galapagos::router<T>::route, this); 
    t->detach();
     
}



template <class T> 
void galapagos::router_node<T>::route(){

    galapagos::stream_packet<T> gps;
    this->logger->debug("in routing function, circling through {0:d} kernels", this->m_axis.size());


    do{
        

        for(unsigned int i=0; i<this->m_axis.size(); i++){
            if(this->m_axis[i]!=nullptr){
                galapagos::stream <T> * stream_ptr = this->m_axis[i].get();
                

                if(stream_ptr->try_peak(gps)){
                    this->logger->debug("Node Routing Packet with dest:{0:x}", gps.dest);

                    if (kern_info_table[gps.dest] == my_address)
                    {
                        this->logger->debug("Node Routing Locally");
                    	// TODO this optimization is buggy
                        // stream_ptr->try_read(gps);
                        // this->s_axis[dest_to_kern_ind[gps.dest]]->write(gps);
                        int dest, src;
                        std::vector <T> vect = stream_ptr->read(&dest, &src);
                        this->s_axis[dest_to_kern_ind[gps.dest]]->write((char *)vect.data(), vect.size()*8, dest, src);
                    }
                    else{
                        this->logger->debug("Node routing to network address {0}", kern_info_table[gps.dest]);
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
    
    
    }while(!this->is_done());

}


template <class T> 
void galapagos::router_node<T>::end(){


    while(!this->is_done());
    this->logger->info("Ending Router Node with Local Address:{0}", my_address);

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
