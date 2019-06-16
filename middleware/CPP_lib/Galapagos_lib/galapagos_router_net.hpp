#ifndef __GALAPAGOS_ROUTER_NET_HPP__   // if x.h hasn't been included yet...
#define __GALAPAGOS_ROUTER_NET_HPP__

#include <map>
#include <assert.h>
#include "galapagos_packet.h"
#include "galapagos_stream.hpp"
#include "galapagos_kernel.hpp"
#include "galapagos_router.hpp"


namespace galapagos{
    template <class T> 
        class router_net: public router<T>{
            protected:
                std::map <std::string,  int >  address_map;
                std::vector < std::string > kern_info_table;
                bool _done;
                std::mutex  mutex;
                std::unique_ptr <std::thread> t;
                stream <T> * ext_port;
                std::map <int, int> dest_to_kern_ind;
                std::vector <bool> s_axis_valid;
                std::vector <stream <T> * > s_axis_ptr;
                std::vector <stream <T> * > m_axis_ptr;
            public:
                router_net(std::vector <std::string>  &_kern_info_table, 
                        stream <T> * ext, 
                        bool * _done, 
                        std::mutex * _mutex,
                        std::string my_address);
                void add_socket(galapagos::streaming_core <T> * _gsc);
                virtual void route() = 0;
                virtual void start() = 0;
                std::vector <std::string> ip_addrs;
                ~router_net(){;}
                //void end();
        };
    template <class T> 
        class router_net_out: public router_net<T>{
            public:
                router_net_out(std::vector <std::string>  &_kern_info_table, stream <T> * from_sessions, bool * _done, std::mutex * _mutex, std::string my_address);
                ~router_net_out(){;}
                void start();
                void route();
        };
}

template <class T> 
    galapagos::router_net<T>::router_net(std::vector <std::string> &  _kern_info_table, stream <T> * ext, bool * _done, std::mutex * _mutex, std::string my_address)
            :galapagos::router<T>(_done, _mutex)
    {
        ext_port = ext;

        std::vector<std::string>::iterator it;
        std::map<std::string, short >::iterator itr;
        

        for(unsigned int i=0; i<_kern_info_table.size(); i++){
            kern_info_table.push_back(_kern_info_table[i]);



            if(_kern_info_table[i] != my_address){
                it = std::find(ip_addrs.begin(), ip_addrs.end(), _kern_info_table[i]);
                if(it == ip_addrs.end()){
                    this->s_axis_ptr.push_back(nullptr);
                    this->m_axis_ptr.push_back(nullptr);
                    ip_addrs.push_back(_kern_info_table[i]); 
                    address_map[_kern_info_table[i]] = ip_addrs.size() - 1;
                }

            }

        }
        
    }

    template <class T> 
    void galapagos::router_net<T>::add_socket(galapagos::streaming_core <T> * _gsc){


        this->s_axis_ptr[_gsc->id] = _gsc->in;
        this->m_axis_ptr[_gsc->id] = _gsc->out;
        
    }


    template <class T> 
    galapagos::router_net_out<T>::router_net_out(std::vector <std::string> &  _kern_info_tables, stream <T> * from_sessions, bool * _done, std::mutex * _mutex, std::string my_address)
        :galapagos::router_net<T>::router_net(_kern_info_tables, from_sessions, _done, _mutex, my_address)
    {;}

    template <class T> 
    void galapagos::router_net_out<T>::start(){
        this->t=std::make_unique<std::thread>(&galapagos::router_net_out<T>::route, this); 
        this->t->detach();
    }

    template <class T> 
    void galapagos::router_net_out<T>::route(){

        galapagos::stream_packet<T> gps;

        while(1){

            if(this->is_done())
                break;
            for(unsigned int i=0; i<this->m_axis_ptr.size(); i++){
            
                if(this->m_axis_ptr[i] != nullptr && this->ext_port!= nullptr){
                    galapagos::stream <T>* stream_ptr = this->m_axis_ptr[i];
                    if(stream_ptr->try_peak(gps)){
                        int dest;
						// TODO should this 8 be sizeof(T)?
                        std::vector <T> vect =  stream_ptr->read(&dest);
                        this->ext_port->write((char *)vect.data(), vect.size()*8, dest);
                    }
                }
            }

        }
    }





#endif
