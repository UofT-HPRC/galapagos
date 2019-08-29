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
            void (*func_str_dest)(short, stream <T> *, stream <T> *);
            void (*func)();
            std::mutex mutex;
            bool _done;
            //void _start(void);
            std::unique_ptr <std::thread> start_ptr;
        public:
            kernel(short _id);
            kernel(short _id, stream <T> * _in, stream <T> * _out);
            ~kernel(){}
            void set_func(void (*_func)(short, stream <T> *, stream <T> *));
            void set_func(void (*_func)(stream <T> *, stream <T> *));
            void set_func(void (*_func)());
            
            //void start(void (*func)(short, stream<T> *, stream <T> *));
            //void start(void (*func)(stream<T> *, stream <T> *));
            //void start(void  (*func)());
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
            galapagos::stream <T> * _out
            ):galapagos::streaming_core<T>::streaming_core(_id, _in, _out)
    {;}
        

    template <class T> 
    galapagos::kernel<T>::kernel(
            short _id
            ):galapagos::streaming_core<T>::streaming_core(_id)
    {;}
    
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


    
    }


    //template <class T> 
    //void galapagos::kernel<T>::_start(void){

    //    if(this->func_str == nullptr && this->func != nullptr){
    //        assert(this->func != nullptr);
    //        //std::cout << "_start 1" << std::endl;
    //        this->t_vect.push_back(std::make_unique< std::thread>(this->func));
    //    }
    //    else if(this->func_str != nullptr){ 
    //        assert(this->func_str != nullptr);
    //        //std::cout << "_start 2" << std::endl;
    //        this->t_vect.push_back(std::make_unique< std::thread>(this->func_str, this->in, this->out));
    //        //std::cout << "size is " << this->t_vect.size() << std::endl;
    //    }
    //    //this->join();
    //    
    //    {
    //        std::lock_guard <std::mutex> guard(this->mutex);
    //        this->_done = true;
    //    }
    //    


    //}    


    //template <class T> 
    //bool galapagos::kernel<T>::barrier(){
    //   
    //    bool ret;

    //    {
    //        std::lock_guard <std::mutex> guard(mutex);
    //        ret = _done;
    //    }

    //    return ret;

    //}

    //template <class T> 
    //void galapagos::kernel<T>::start(void (*func)(stream <T> *, stream <T> *)){

    //    start_ptr = std::make_unique< std::thread>(func, this->in, this->out));

    //}


    //template <class T> 
    //bool galapagos::kernel<T>::barrier(){
    //    bool cont;

    //    for(unsigned int i=0; i<this->t_vect.size(); i++){
    //        cont = !(this->t_vect[i].get()->joinable());
    //        if(cont){
    //            std::cout << "NOT JOINABLE" << std::endl;
    //            return cont;
    //        }
    //    }
    //    return false;
    //    //galapagos::streaming_core<T>::barrier();
    //    std::cout << "IN KERNEL BARRIER" << std::endl;
    //}

    template <class T> 
    void galapagos::kernel<T>::barrier(){
        //std::cout << "T_VECT SIZE " << this->t_vect.size() << std::endl;

        for(unsigned int i=0; i<this->t_vect.size(); i++){
            //std::cout << "JOINING " << i << std::endl; 
            this->t_vect[i].get()->join();
            //std::cout << "JOINED " << i << std::endl; 
        } 
        
        
    }



    //template <class T> 
    //void galapagos::kernel<T>::start
    //    (void (*func)()){

    //    this->t_vect.push_back(std::make_unique< std::thread>(func));

    //}

#endif
