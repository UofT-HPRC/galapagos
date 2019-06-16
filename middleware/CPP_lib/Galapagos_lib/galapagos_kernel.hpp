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

namespace galapagos {
    template <class T> 
    class kernel: public streaming_core<T>{
   

        private:
            void (*func_str)(stream <T> *, stream <T> *);
            void (*func)();
        public:
            kernel(short _id);
            kernel(short _id, stream <T> * _in, stream <T> * _out);
            ~kernel(){std::cout << "IN KERNEL DESTRUCTOR " << std::endl;}
            void set_func(void (*_func)(stream <T> *, stream <T> *));
            void set_func(void (*_func)());
            
            void start(void (*func)(stream<T> *, stream <T> *));
            void start(void  (*func)());
            void start();
            void barrier();
            
    };
}

template <class T> 
    galapagos::kernel<T>::kernel(
            short _id,
            galapagos::stream <T> * _in,
            galapagos::stream <T> * _out
            ):galapagos::streaming_core<T>::streaming_core(_id, _in, _out)
    {;}
        

    template <class T> 
    galapagos::kernel<T>::kernel(
            short _id
            ):galapagos::streaming_core<T>::streaming_core(_id)
    {;}


    template <class T> 
    void galapagos::kernel<T>::set_func(void (* _func)(stream <T>*, stream <T>*)){

        func_str = _func; 
        func = nullptr;
    }

    template <class T> 
    void galapagos::kernel<T>::set_func(void (* _func)()){

        func = _func;
        func_str = nullptr;

    }

    template <class T> 
    void galapagos::kernel<T>::start(){

        if(func_str == nullptr && func != nullptr){
            assert(func != nullptr);
            this->t_vect.push_back(std::make_unique< std::thread>(func));
        }
        else if(func_str != nullptr){ 
            assert(func_str != nullptr);
            this->t_vect.push_back(std::make_unique< std::thread>(func_str, this->in, this->out));
        }
    }    

    template <class T> 
    void galapagos::kernel<T>::start(void (*func)(stream <T> *, stream <T> *)){

        this->t_vect.push_back(std::make_unique< std::thread>(func, this->in, this->out));


    }


    template <class T> 
    void galapagos::kernel<T>::barrier(){
    

        for(unsigned int i=0; i<this->t_vect.size(); i++){
            this->t_vect[i].get()->join();
        }
        galapagos::streaming_core<T>::barrier();

    }

    template <class T> 
    void galapagos::kernel<T>::start
        (void (*func)()){

        this->t_vect.push_back(std::make_unique< std::thread>(func));

    }

#endif
