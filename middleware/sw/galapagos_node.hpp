//===============================
// AUTHOR     : Naif Tarafdar
// CREATE DATE     : April 20, 2019
//===============================

#ifndef __GALAPAGOS_NODE_HPP__   // if x.h hasn't been included yet...
#define __GALAPAGOS_NODE_HPP__

#include <map>
#include <assert.h>

#if LOG_LEVEL>0
#include "spdlog/spdlog.h"
#include "spdlog/sinks/basic_file_sink.h"
#include "spdlog/fmt/bin_to_hex.h"
#endif

#include <boost/thread/locks.hpp>
#include <boost/thread/shared_mutex.hpp>
#include "galapagos_packet.h"
#include "galapagos_interface.hpp"
#include "galapagos_kernel.hpp"
#include "galapagos_local_router.hpp"
#include "galapagos_external_driver.hpp"

namespace galapagos{
    template<class T>
    class node{
        private:
            galapagos::done_clean my_router_dc;
            galapagos::local_router<T> my_router;
            std::vector < std::unique_ptr<galapagos::kernel <T> > > kernels;
            bool done;
            std::mutex  mutex;

            std::vector < galapagos::external_driver<T> * > ext_drivers;
            std::vector < std::unique_ptr<galapagos::done_clean> > ext_drivers_dc;
            std::map <int, int> dest_to_kern_ind;
            boost::shared_mutex drain_lock;
            boost::shared_lock < boost::shared_mutex > session_lock;
            std::mutex mutex_packets_in_flight;
            int packets_in_flight;
            int num_local;
            int kernels_added;
#if LOG_LEVEL > 0            
	        std::shared_ptr<spdlog::logger> logger;
#endif
            void prepare(std::vector <std::string>  _kern_info_table, std::string  _my_address, std::vector<galapagos::external_driver <T> * > _ext_drivers);

        public:
            node(std::vector <std::string>  _kern_info_table, std::string  _my_address, std::vector<galapagos::external_driver <T> * > _ext_drivers);
#if LOG_LEVEL > 0            
            node(std::vector <std::string>  _kern_info_table, std::string  _my_address, std::vector<galapagos::external_driver <T> * > _ext_drivers, std::shared_ptr<spdlog::logger> _logger);
#endif
            void add_kernel(short id, void (*func)(short, interface <T> *, interface <T> *));
            void start();
            void end();
    };
}

template<class T>
void galapagos::node<T>::prepare(std::vector <std::string>   _kern_info_table, std::string  _my_address, std::vector <galapagos::external_driver <T> *> _ext_drivers)
{
    packets_in_flight=0;
    done = false;
    
    num_local = 0;
    kernels_added = 0;
    for(unsigned int i=0; i<_kern_info_table.size(); i++){
        //if(_kern_info_table[i] == _my_address)
        if(_kern_info_table[i] == _my_address){
            kernels.push_back(nullptr);
            dest_to_kern_ind[i] = kernels.size() - 1;
            num_local++;
        }
    }

    for(unsigned int i=0; i<_ext_drivers.size(); i++){
        ext_drivers.push_back(_ext_drivers[i]);
#if LOG_LEVEL > 0
        ext_drivers_dc.push_back(std::make_unique<galapagos::done_clean> (&done, &mutex, logger));
#else
        ext_drivers_dc.push_back(std::make_unique<galapagos::done_clean> (&done, &mutex));
#endif
	    ext_drivers[i]->init(ext_drivers_dc[i].get(), &packets_in_flight, &mutex_packets_in_flight);

    }

}

#if LOG_LEVEL > 0
template<class T>
galapagos::node<T>::node(std::vector <std::string>   _kern_info_table, std::string  _my_address, std::vector <galapagos::external_driver <T> *> _ext_drivers, std::shared_ptr<spdlog::logger> _logger)
:my_router_dc(&done, &mutex, _logger),
my_router(_kern_info_table, _my_address, &my_router_dc, &mutex_packets_in_flight, &packets_in_flight, _logger)
{

    logger = _logger;
    prepare(_kern_info_table,_my_address,_ext_drivers);



}
#endif

template<class T>
galapagos::node<T>::node(std::vector <std::string>   _kern_info_table, std::string  _my_address, std::vector <galapagos::external_driver <T> *> _ext_drivers)
:my_router_dc(&done, &mutex),
my_router(_kern_info_table, _my_address, &my_router_dc, &mutex_packets_in_flight, &packets_in_flight)
{
    prepare(_kern_info_table, _my_address, _ext_drivers);

}
    
    
template<class T>
void galapagos::node<T>::add_kernel(short id, void (*func)(short , interface <T> *, interface <T> *)){

     int index = dest_to_kern_ind[id];
#if LOG_LEVEL > 0
     kernels[index] = std::make_unique<kernel<T> >(id, logger);
#else
     kernels[index] = std::make_unique<kernel<T> >(id);
#endif
     kernels[index]->set_func(func);
     my_router.add_interface_pair(kernels[index]->get_s_axis(), kernels[index]->get_m_axis());
     kernels_added++;
    #if LOG_LEVEL > 0
        logger->debug("Adding kernel, kernel count is {0:d} out of {1:d}", kernels_added, num_local);
    #endif
     if(kernels_added == num_local){
        for(unsigned int i=0; i<ext_drivers.size(); i++){
            #if LOG_LEVEL > 0
                logger->debug("Added external interface pair");
            #endif
            my_router.add_interface_pair(ext_drivers[i]->get_s_axis(), ext_drivers[i]->get_m_axis());
        }
     }
}

template<class T>
void galapagos::node<T>::start(){

    {
        std::lock_guard <std::mutex> guard(mutex);
        done = false;

    }

    for(unsigned int i=0; i<kernels.size(); i++){
        if(kernels[i] != nullptr){
            kernels[i]->start();
        }
    }
    my_router.start();
    for(unsigned int i=0; i<ext_drivers.size(); i++){
       ext_drivers[i]->start();
    }
}



template<class T>
void galapagos::node<T>::end(){
    bool cont = true;


    for(unsigned int i=0; i<kernels.size(); i++){
        kernels[i]->barrier();
    }

#if LOG_LEVEL>0
    logger->info("Kernels finished");
    logger->flush();
#endif

    int numPacketsLeft;


    do{
        {
            numPacketsLeft = my_router.num_packets();
        }

    }while(numPacketsLeft!=0);

#if LOG_LEVEL>0
    logger->info("Router finished");
    logger->flush();
#endif
    //if there are no external drivers then we know once kernels finish we are done
    if(ext_drivers.size() == 0)
        numPacketsLeft = 0;


     //get all packets that are in flight at the ports
     do{
         std::lock_guard < std::mutex> guard(mutex_packets_in_flight);
         numPacketsLeft = packets_in_flight;
     }while(numPacketsLeft!=0);

#if LOG_LEVEL>0
    logger->info("After external driver finished");
#endif

    {
        std::lock_guard <std::mutex> guard(mutex);
        done = true;
    }
#if LOG_LEVEL>0
    logger->info("Done asserted, waiting for router and drivers to finish");
#endif

    my_router_dc.wait_for_clean();
#if LOG_LEVEL>0
    logger->info("Router Destroyed");
#endif
    for(unsigned int i=0; i < ext_drivers_dc.size(); i++){
        ext_drivers_dc[i]->wait_for_clean();
#if LOG_LEVEL>0    
        logger->info("Ext Driver:{0:d} destroyed", i);
        logger->flush();
#endif
    }
}



#endif
