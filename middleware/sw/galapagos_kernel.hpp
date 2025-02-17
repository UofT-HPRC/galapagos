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

#include "galapagos_interface.hpp"
#include "galapagos_packet.h"
#if LOG_LEVEL > 0
#include "spdlog/spdlog.h"
#include "spdlog/sinks/basic_file_sink.h"
#endif


namespace galapagos {



/** @brief Class for the Kernel wrapper 

    A software wrapper for a kernel object.
    Wraps an HLS synthesizable function and an input interfaces(s_axis) and an output interface(m_axis).
    @author Naif Tarafdar 
    @date April 20, 2019
    */
    template <class T> 
    class kernel{
        private:
	    //function pointer to kernel (should be mostly functionally portable with HLS)
            void (*func)(short, interface <T> *, interface <T> *);
            std::mutex mutex;
#if LOG_LEVEL > 0
            std::shared_ptr<spdlog::logger> logger;
#endif
	        //thread for running function pointer
	        std::unique_ptr<std::thread> t;
	        //input intereface
	        interface <T> s_axis;
	        //output interface
	        interface <T> m_axis;
	        short id;
        public:
#if LOG_LEVEL > 0
            kernel(short _id, std::shared_ptr<spdlog::logger> _logger);
#endif
            kernel(short _id);
            ~kernel(){}
            void set_func(void (*_func)(short, interface <T> *, interface <T> *));
            void start();
            void barrier();
            interface <T> * get_s_axis();    
            interface <T> * get_m_axis();    
    };
}

#if LOG_LEVEL > 0
/**Constructor for galapagos::kernel
@tparam T the type of data used within each galapagos packet (default ap_uint<64>)
@param[in] _id the dest of the kernel
@param[in] _logger of logger used globally to log
 */
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
#endif    
template <class T> 
galapagos::kernel<T>::kernel(
        short _id
        )
        :s_axis(std::string("kernel_") + std::to_string(_id) + std::string("_s_axis")),
        m_axis(std::string("kernel_") + std::to_string(_id) + std::string("_m_axis"))
{

    id = _id;

}
/**Gives kernel object function pointer of HLS synthesizable function to run
@tparam T the type of data used within each galapagos packet (default ap_uint<64>)
@param[in] _func function pointer for kernel object to store
*/
template <class T> 
void galapagos::kernel<T>::set_func(void (* _func)(short, interface <T>*, interface <T>*)){
    func = _func;
}

/**Starts function that is being pointed to by kernel
@tparam T the type of data used within each galapagos packet (default ap_uint<64>)
*/
template <class T> 
void galapagos::kernel<T>::start(){
    
   
    t = std::make_unique< std::thread>(func, id, &s_axis, &m_axis);
#if LOG_LEVEL > 0
    logger->info("Started Kernel:{0:d}", id);
#endif


}

/**Waits for function to finish executing
@tparam T the type of data used within each galapagos packet (default ap_uint<64>)
*/
template <class T> 
void galapagos::kernel<T>::barrier(){

    t.get()->join();
#if LOG_LEVEL > 0
    logger->info("Passed Barrier in  Kernel {0:d}", id);
#endif
    
}

/**Gets a pointer to the s_axis interface of the kernel
@tparam T the type of data used within each galapagos packet (default ap_uint<64>)
@returns pointer to s_axis  
*/
template <class T> 
galapagos::interface <T> * galapagos::kernel<T>::get_s_axis(){

    return &s_axis;

}

/**Gets a pointer to the m_axis interface of the kernel
@tparam T the type of data used within each galapagos packet (default ap_uint<64>)
@returns pointer to m_axis  
*/
template <class T> 
galapagos::interface <T> * galapagos::kernel<T>::get_m_axis(){

    return &m_axis;

}
#endif
