//===============================
// AUTHOR     : Naif Tarafdar
// CREATE DATE     : April 20, 2019
//===============================

#ifndef __GALAPAGOS_NODE_HPP__   // if x.h hasn't been included yet...
#define __GALAPAGOS_NODE_HPP__

#include <map>
#include <assert.h>
#include "galapagos_packet.h"
#include "galapagos_stream.hpp"
#include "galapagos_kernel.hpp"
#include "galapagos_router_node.hpp"
#include "galapagos_net_tcp.hpp"

#define NETWORK

namespace galapagos{
    template<class T>
    class node{
        private:
            std::unique_ptr <galapagos::router_node <T> > my_router;
            std::vector < std::unique_ptr<galapagos::kernel <T> > > kernels;
            bool done;
            std::mutex  mutex;

            std::unique_ptr <galapagos::net::tcp::tcp <T> > net_ptr;
            std::map <int, int> dest_to_kern_ind;

        public:
            node(std::vector <std::string>  & _kern_info_table, std::string  & _my_address);
            void add_kernel(short id, void (*func)(stream <T> *, stream <T> *));
            void add_kernel(short id, void (*func)());
            void start();
            void end();
    };
}

template<class T>
    galapagos::node<T>::node(std::vector <std::string>   & _kern_info_table, std::string  & _my_address){
    
        done = false;

        int num_local = 0;
        for(unsigned int i=0; i<_kern_info_table.size(); i++){
            //if(_kern_info_table[i] == _my_address)
            if(_kern_info_table[i] == _my_address){
                kernels.push_back(nullptr);
                dest_to_kern_ind[i] = kernels.size() - 1;
                num_local++;
            }
        }

    #ifdef NETWORK
        // 1 external for network
        my_router = std::make_unique<router_node<T> >(_kern_info_table, _my_address, &done, &mutex, 1); 
    #else
        my_router = std::make_unique<router_node<T> >(_kern_info_table, _my_address, &done, &mutex, 0); 

    #endif
        

    #ifdef NETWORK
        my_router->add_port(num_local);
        net_ptr = std::make_unique<galapagos::net::tcp::tcp<T> >(num_local, 8889, _kern_info_table, _my_address, 
                                                        my_router->get_s_axis(num_local), my_router->get_m_axis(num_local), 
                                                        &mutex, &done, true);  
    #endif

    }


    template<class T>
    void galapagos::node<T>::add_kernel(short id, void (*func)(stream <T> *, stream <T> *)){

        int index = dest_to_kern_ind[id];
        kernels[index] = std::make_unique<kernel<T> >(id);
        kernels[index]->set_func(func);
        my_router->add_kernel(kernels[index].get(), index);

    }

    template<class T>
    void galapagos::node<T>::add_kernel(short id, void (*func)()){
        int index = dest_to_kern_ind[id];
        kernels[index] = std::make_unique<kernel<T> >(id);
        kernels[index]->set_func(func);
        my_router->add_kernel(kernels[index].get(), index);

    }


    template<class T>
    void galapagos::node<T>::start(){

        {
            std::lock_guard <std::mutex> guard(mutex);
            done = false;
        
        }

    #ifdef NETWORK
        my_router->add_ext_stream(net_ptr.get());
    #endif
        for(unsigned int i=0; i<kernels.size(); i++){
            if(kernels[i] != nullptr){
                kernels[i]->start();
            }
        }
        my_router->start();
        net_ptr->start();
    }



    template<class T>
    void galapagos::node<T>::end(){


        for(unsigned int i=0; i<kernels.size(); i++){
            kernels[i]->barrier();
        }
        
    #ifdef NETWORK
        net_ptr->barrier();
        my_router->drain();
    #endif
        {
            std::lock_guard <std::mutex> guard(mutex);
            done = true;
        }
        my_router->end();

    }



#endif
