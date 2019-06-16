//===============================
// AUTHOR     : Naif Tarafdar
// CREATE DATE     : April 20, 2019
//===============================

#ifndef __GALAPAGOS_STREAM_HPP__   // if x.h hasn't been included yet...
#define __GALAPAGOS_STREAM_HPP__

#include <cstddef>
#include <cstring>
#include "ap_int.h"
#include "hls_stream.h"
#include "ap_utils.h"

// #define CPU

#ifdef CPU
#include <memory>
#include <mutex>
#include <condition_variable>
#endif

#include "galapagos_packet.h"



#ifdef CPU
namespace galapagos{
    template <class T> 
    class stream{
         
        private:
            
            std::mutex  mutex;
            std::unique_ptr < std::queue <galapagos::stream_packet <T> > > _stream;
            std::condition_variable cv;
        public:
            stream();
            //stream(std::string _name);
            //std::vector<ap_uint<64> > read(size_t *size, short * dest);
            void write(char * buffer, int size, short  dest);
            bool try_read(galapagos::stream_packet<T> &gp);
            bool try_peak(galapagos::stream_packet<T> &gp);
            void write(galapagos::stream_packet <T> gps);
            //std::vector<ap_uint<PACKET_DATA_LENGTH> > read(int * dest);
            std::vector< T > read(int * dest);
            galapagos::stream_packet<T> read();
            bool empty();
            size_t size();
            short id;
            void lock();
            void unlock();
    //        std::string name;
    };
}

//template <class T> 
//using galapagos_stream = galapagos::stream <T>;
//
typedef galapagos::stream <ap_uint <PACKET_DATA_LENGTH> > galapagos_stream;
typedef galapagos::stream <float> galapagos_stream_float;
typedef galapagos::stream <double> galapagos_stream_double;
#else            


typedef hls::stream <galapagos_stream_packet> galapagos_stream;
typedef hls::stream<galapagos_packet <float> > galapagos_stream_float;
typedef hls::stream<galapagos_packet <double> > galapagos_stream_double;
//template <class T>
//struct galapagos_stream_float{
//    hls::stream<galapagos_packet <T> > _stream;
//    galapagos_packet <T> read(){
//        return _stream.read();
//    }
//    void write(galapagos_packet <T> gp){
//        _stream.write(gp);
//    }
//    size_t size(){
//        return _stream.size();
//    }
//
//};

//struct galapagos_stream:: public hls::stream<galapagos_packet <T> >  {
//};

//template <class T> 
//typedef hls::stream <galapagos_packet <T> >  galapagos_stream;

// template <class T> 
// galapagos::stream<T>::stream(hls::stream <galapagos::stream_packet <T> > * __stream){
//     stream = __stream;
// }

// template <class T> 
// galapagos::stream_packet<T> galapagos::stream<T>::read(){
//     return _stream->read();
// }

// template <class T> 
// void galapagos::stream<T>::write(galapagos::stream_packet<T> gps){
   
//     _stream->write(gps);

// }

// template <class T> 
// size_t galapagos::stream<T>::size(){
//     size_t ret; 
//     ret = _stream->size();
//     return ret;
// }

// template <class T> 
// size_t galapagos::stream<T>::empty(){
//     bool ret; 
//     ret = _stream->empty();
//     return ret;
// }

#endif // CPU

template <class T> 
    galapagos::stream<T>::stream(){
        _stream = std::make_unique<std::queue <galapagos::stream_packet <T> > >();
    }


    template <class T> 
    galapagos::stream_packet <T> galapagos::stream<T>::read(){
        
        galapagos::stream_packet <T> gps;

        std::unique_lock<std::mutex> lock(mutex);
        while (_stream->empty()) {
            cv.wait(lock);
                                    //  This 'while' loop is equal to
        }
        gps = std::move(_stream->front());
        _stream->pop();

        return gps;
    }


    template <class T> 
    void galapagos::stream<T>::write(galapagos::stream_packet <T> gps){
        
        {
            std::lock_guard<std::mutex> guard(mutex);
            _stream->push(std::move(gps));
        }
        if (gps.last){
            cv.notify_one();
        }

    }


    template <class T> 
    bool galapagos::stream<T>::try_read(galapagos::stream_packet<T> & gp){

        std::lock_guard<std::mutex> guard(mutex);
        if(_stream->empty())
            return false;

        gp = std::move(_stream->front());
        _stream->pop();
        return true;
    }

    template <class T>
    bool galapagos::stream<T>::try_peak(galapagos::stream_packet<T>& gp){

        std::lock_guard<std::mutex> guard(mutex);
        if(_stream->empty())
            return false;

        gp = std::move(_stream->front());
        return true;
    }

    template <class T>
    void galapagos::stream<T>::lock(){
        mutex.lock();
    }

    template <class T>
    void galapagos::stream<T>::unlock(){
        mutex.unlock();
    }

    template <class T> 
    size_t galapagos::stream<T>::size(){
        size_t ret; 
        std::lock_guard<std::mutex> guard(mutex);
        ret = _stream->size();
        return ret;
    }


    template <class T> 
    bool galapagos::stream<T>::empty(){
        bool ret; 
        std::lock_guard<std::mutex> guard(mutex);
        ret = _stream->empty();
        return ret;
    }


    template <class T> 
    std::vector< T > galapagos::stream<T>::read(int * dest){


        std::vector< T > vect;
        ap_uint <1> last = 0;
        galapagos::stream_packet <T> gps;


        while(!last){
        std::unique_lock<std::mutex> lock(mutex);
        while (_stream->empty()) {
            cv.wait(lock);
        }
        gps = std::move(_stream->front());
        _stream->pop();
        last = gps.last;
        vect.push_back(gps.data);
        }


        *dest = gps.dest;
        return vect;
    }


    template <class T> 
    void galapagos::stream<T>::write(char * buffer, int size, short dest){

        
        T * data = (T *)buffer;
        {
        std::lock_guard<std::mutex> guard(mutex);
    #ifdef DEBUG
        std::cout << "NUM GALAPAGOS PACKETS IN RECV " << size/8 << std::endl;
    #endif
    #ifdef TEST
            assert(size == 80);
    #endif
        
        for(int i=0; i<(size/8); i++){
            galapagos::stream_packet <T> gps;
            gps.data = data[i];
            gps.dest = dest;
            if(i!=((size/8)-1))
                gps.last = 0;
            else{
                gps.last = 1;
    #ifdef TEST
            assert(i == 9);
    #endif


    #ifdef DEBUG
                std::cout<< " writing last" << std::endl;
    #endif
            }

        _stream->push(std::move(gps));
        }
        }
        cv.notify_one();
    }

#endif
