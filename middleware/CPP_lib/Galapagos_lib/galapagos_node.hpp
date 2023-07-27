//===============================
// AUTHOR     : Naif Tarafdar
// CREATE DATE     : April 20, 2019
//===============================

#ifndef __GALAPAGOS_NODE_HPP__   // if x.h hasn't been included yet...
#define __GALAPAGOS_NODE_HPP__

#include <map>
#include <assert.h>

#include <boost/thread/locks.hpp>
#include <boost/thread/shared_mutex.hpp>
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
            boost::shared_mutex drain_lock;
            boost::shared_lock < boost::shared_mutex > session_lock;
            std::mutex mutex_packets_in_flight;
            int packets_in_flight;


        public:
            node(std::vector <std::string>  & _kern_info_table, std::string  & _my_address);
            void add_kernel(short id, void (*func)(short, stream <T> *, stream <T> *));
            void add_kernel(short id, void (*func)(stream <T> *, stream <T> *));
            void add_kernel(short id, void (*func)());
            void start();
            void end();
    };
}

template<class T>
    galapagos::node<T>::node(std::vector <std::string>   & _kern_info_table, std::string  & _my_address){
   
        packets_in_flight=0;
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
        my_router = std::make_unique<router_node<T> >(_kern_info_table, _my_address, &done, &mutex, 1, &mutex_packets_in_flight, &packets_in_flight
                ); 
#else
        my_router = std::make_unique<router_node<T> >(_kern_info_table, _my_address, &done, &mutex, 0, &mutex_packets_in_flight, &packets_in_flight); 

#endif
        

#ifdef NETWORK
        my_router->add_port(num_local);
        net_ptr = std::make_unique<galapagos::net::tcp::tcp<T> >(num_local, 7, _kern_info_table, _my_address, 
                                                        my_router->get_s_axis(num_local), my_router->get_m_axis(num_local), 
                                                        &mutex, &done, true,
                                                        &mutex_packets_in_flight,
                                                        &packets_in_flight
                                                        );  
#endif

    }
    
    template<class T>
    void galapagos::node<T>::add_kernel(short id, void (*func)(short , stream <T> *, stream <T> *)){

        int index = dest_to_kern_ind[id];
        kernels[index] = std::make_unique<kernel<T> >(id);
        kernels[index]->set_func(func);
        my_router->add_kernel(kernels[index].get(), index);

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
        bool cont = true;

#ifdef DEBUG 
        std::cout << "BEFORE KERNELS BARRIER" << std::endl;
#endif

        for(unsigned int i=0; i<kernels.size(); i++){
            kernels[i]->barrier();
        }

#ifdef DEBUG
        std::cout << "AFTER KERNELS BARRIER" << std::endl;
#endif

        int numPacketsLeft;

        do{
            {
                std::lock_guard < std::mutex> guard(mutex_packets_in_flight);
                numPacketsLeft = my_router->num_packets();
            }

        }while(numPacketsLeft!=0);

#ifdef DEBUG
        std::cout << "AFTER ROUTERS" << std::endl;
#endif
    
        //get all packets that are in flight at the ports
        do{
#ifdef NETWORK
            
            {
                std::lock_guard < std::mutex> guard(mutex_packets_in_flight);
                numPacketsLeft = packets_in_flight;
            }
            //std::cout << "num packets in flight " << numPacketsLeft << std::endl;
#else
            numPacketsLeft = 0;
    #endif


        }while(numPacketsLeft!=0);
#ifdef DEBUG   
        std::cout << "AFTER IN FLIGHT" << std::endl;
#endif


        
        {
            std::lock_guard <std::mutex> guard(mutex);
            done = true;
        }
        my_router->end();

    }



#endif
