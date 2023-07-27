//===============================
// AUTHOR     : Naif Tarafdar
// CREATE DATE     : April 20, 2019
//===============================


#ifndef __GALAPAGOS_STREAMING_CORE_HPP__   // if x.h hasn't been included yet...
#define __GALAPAGOS_STREAMING_CORE_HPP__

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
#include <condition_variable>


#include "galapagos_stream.hpp"
#include "galapagos_packet.h"

namespace galapagos {
template <class T> 
    class streaming_core{

        public:
            std::vector < std::unique_ptr <std::thread> > t_vect;
            stream <T>  * in;
            stream <T> * out;
            short id;
            streaming_core(short _id);
            streaming_core(short _id, stream <T> * _in, stream <T> *_out);
            ~streaming_core();        
            //virtual void start();
            //void barrier();
            //bool done();
            
    };

    
}

template <class T> 
    galapagos::streaming_core<T>::streaming_core(
            short _id,
            galapagos::stream<T>  * _in,
            galapagos::stream<T>  * _out
            )
    {

        id = _id;
        in = _in;
        if(in != nullptr)
            in->id = id;
        out = _out;
    }

    template <class T> 
    galapagos::streaming_core<T>::streaming_core(
            short _id
            )
    {
        
        id = _id;
        in = nullptr;
        out = nullptr;
    }

    template <class T> 
    galapagos::streaming_core<T>::~streaming_core(){
        ;
    }

    //template <class T> 
    //void galapagos::streaming_core<T>::start(){

    //    ;

    //}

#endif
