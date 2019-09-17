//===============================
// AUTHOR     : Naif Tarafdar
// CREATE DATE     : April 20, 2019
//===============================


#ifndef __GALAPAGOS_KERNEL_HPP__   // if x.h hasn't been included yet...
#define __GALAPAGOS_KERNEL_HPP__

#include <cstddef>
#include <cstring>
#include "ap_int.h"
#include "hls_stream.h"
#include "ap_utils.h"

#include <algorithm>
#include <memory>
#include <thread>
#include <queue>
#include <mutex>

// #define CPU
#include "galapagos_interface.hpp"
#include "galapagos_packet.h"
#include "spdlog/spdlog.h"
#include "spdlog/sinks/basic_file_sink.h"

namespace galapagos {
/*
 *Kernel wrapper used within Galapagos
 *
 *@tparam T the type of data used within each galapagos packet (default ap_uint<64>)
 *
 *
 *
 */
    template <class T> 
    class kernel{
        private:
	    //function pointer to kernel (should be mostly functionally portable with HLS)
            void (*func)(short, interface <T> *, interface <T> *);
            std::mutex mutex;
            std::shared_ptr<spdlog::logger> logger;
	    //thread for running function pointer
	    std::unique_ptr<std::thread> t;
	    //input intereface
	    interface <T> s_axis;
	    //output interface
	    interface <T> m_axis;
	    short id;
        public:
            kernel(short _id, std::shared_ptr<spdlog::logger> _logger);
            ~kernel(){}
            void set_func(void (*_func)(short, interface <T> *, interface <T> *));
            void start();
            void barrier();
            interface <T> * get_s_axis();    
            interface <T> * get_m_axis();    
    };
}

template <class T> 
galapagos::kernel<T>::kernel(
        short _id,
        std::shared_ptr<spdlog::logger> _logger):
        s_axis(std::string("kernel_") + std::to_string(_id) + std::string("_s_axis"), _logger),
        m_axis(std::string("kernel_") + std::to_string(_id) + std::string("_m_axis"), _logger)
{

    logger = _logger;
    id = _id;
    logger->info("Created Kernel:{0:d}", _id);

}
    
template <class T> 
void galapagos::kernel<T>::set_func(void (* _func)(short, interface <T>*, interface <T>*)){
    func = _func;
}

    
template <class T> 
void galapagos::kernel<T>::start(){
    
   
    t = std::make_unique< std::thread>(func, id, &s_axis, &m_axis);
    logger->info("Started Kernel:{0:d}", id);


}


template <class T> 
void galapagos::kernel<T>::barrier(){

    t.get()->join();
    logger->info("Passed Barrier in  Kernel {0:d}", id);
    
    
}

template <class T> 
galapagos::interface <T> * galapagos::kernel<T>::get_s_axis(){

    return &s_axis;

}

template <class T> 
galapagos::interface <T> * galapagos::kernel<T>::get_m_axis(){

    return &m_axis;

}
#endif
