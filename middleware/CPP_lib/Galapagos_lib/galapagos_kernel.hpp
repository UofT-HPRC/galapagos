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
#include "galapagos_stream.hpp"
#include "galapagos_streaming_core.hpp"
#include "galapagos_packet.h"
#include "spdlog/spdlog.h"
#include "spdlog/sinks/basic_file_sink.h"

namespace galapagos {
    template <class T> 
    class kernel: public streaming_core<T>{
   

        private:
            void (*func_str)(stream <T> *, stream <T> *);
            void (*func_str_dest)(short, stream <T> *, stream <T> *);
            void (*func)();
            std::mutex mutex;
            bool _done;
            std::shared_ptr<spdlog::logger> logger;
        public:
            kernel(short _id, std::shared_ptr<spdlog::logger> _logger);
            kernel(short _id, stream <T> * _in, stream <T> * _out, std::shared_ptr<spdlog::logger> _logger);
            ~kernel(){}
            void set_func(void (*_func)(short, stream <T> *, stream <T> *));
            void set_func(void (*_func)(stream <T> *, stream <T> *));
            void set_func(void (*_func)());
            void write(streamBuf);
            galapagos_stream_packet read(galapagos_stream_packet gp);
            void start();
            void join();
            void barrier();
            bool done();
            
    };
}

    
    
    
    template <class T> 
    galapagos::kernel<T>::kernel(
            short _id,
            galapagos::stream <T> * _in,
            galapagos::stream <T> * _out,
            std::shared_ptr<spdlog::logger> _logger
            ):galapagos::streaming_core<T>::streaming_core(_id, _in, _out)
    {
        

        logger = _logger;
        logger->info("Created Kernel {0:d}", _id);

    }
        

    template <class T> 
    galapagos::kernel<T>::kernel(
            short _id,
            std::shared_ptr<spdlog::logger> _logger
            ):galapagos::streaming_core<T>::streaming_core(_id)
    {
    
        logger = _logger;
        logger->info("Created Kernel {0:d}", _id);
    
    }
    
    template <class T> 
    void galapagos::kernel<T>::set_func(void (* _func)(short, stream <T>*, stream <T>*)){
        func_str_dest = _func;
        func_str = nullptr; 
        func = nullptr;
    }


    template <class T> 
    void galapagos::kernel<T>::set_func(void (* _func)(stream <T>*, stream <T>*)){
        func_str_dest = nullptr;
        func_str = _func; 
        func = nullptr;
    }

    template <class T> 
    void galapagos::kernel<T>::set_func(void (* _func)()){

        func_str_dest = nullptr;
        func = _func;
        func_str = nullptr;

    }
    
    template <class T> 
    void galapagos::kernel<T>::start(){
        
        {
            std::lock_guard <std::mutex> guard(mutex);
            _done = false;
        }
       
       

        if(this->func!=nullptr){
            assert(this->func != nullptr);
            this->t_vect.push_back(std::make_unique< std::thread>(this->func));
        }
        else if(this->func_str!=nullptr){
            assert(this->func_str != nullptr);
            this->t_vect.push_back(std::make_unique< std::thread>(this->func_str, this->in, this->out));
        }
        else if(this->func_str_dest!=nullptr){
            assert(this->func_str_dest != nullptr);
            this->t_vect.push_back(std::make_unique< std::thread>(this->func_str_dest, this->id, this->in, this->out));
        }

        logger->info("Started Kernel {0:d}", this->id);

    
    }


    template <class T> 
    void galapagos::kernel<T>::barrier(){

        for(unsigned int i=0; i<this->t_vect.size(); i++){
            this->t_vect[i].get()->join();
        } 
        
        
    }


#endif
