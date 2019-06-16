//===============================
// AUTHOR     : Naif Tarafdar
// CREATE DATE     : April 20, 2019
//===============================

#ifndef __GALAPAGOS_ROUTER_HPP__   // if x.h hasn't been included yet...
#define __GALAPAGOS_ROUTER_HPP__

#include <map>
#include <assert.h>
#include "galapagos_stream.hpp"
#include "galapagos_kernel.hpp"



namespace galapagos{
template <class T> 
    class router{
        protected:
            std::vector <std::unique_ptr <stream <T> >  >  s_axis;
            std::vector <std::unique_ptr <stream <T> >  >  m_axis;
            bool * done;
            std::mutex  * mutex;
            bool is_done();
        public:
            router(){;}
            router(bool * _done, std::mutex * _mutex);
            router(bool * _done, std::mutex * _mutex, int num_ports);
            ~router(){;}
            void add_port(int index);            
            void init_ports(int num_ports);
            void add_stream(streaming_core <T> * _gsc, int index);
            galapagos::stream_packet<T> read(short id);
            size_t m_size(short id);
            size_t s_size(short id);
            void write(galapagos::stream_packet<T> _gps);
            stream<T> * get_s_axis(short id);
            stream<T> * get_m_axis(short id);

            virtual void route() = 0;
            virtual void start() = 0;
    };

    
}

template <class T> 
    galapagos::router<T>::router(bool * _done, std::mutex * _mutex){


        done = _done;
        mutex = _mutex;


    }



    template <class T> 
    void galapagos::router<T>::init_ports(int num_ports){

        std::stringstream ss;
        for(int i=0; i<num_ports; i++){
            s_axis.push_back(nullptr);
            m_axis.push_back(nullptr);
        }

    }

    template <class T> 
    galapagos::router<T>::router(bool * _done, std::mutex * _mutex, int num_ports){

        done = _done;
        mutex = _mutex;

        std::stringstream ss;
        for(int i=0; i<num_ports; i++){
            s_axis.push_back(nullptr);
            m_axis.push_back(nullptr);
        }

    }

    template <class T> 
    void galapagos::router<T>::add_port(int index){
        
        s_axis[index] = std::make_unique <stream<T> > ();
        m_axis[index] = std::make_unique <stream<T> > ();



    }


    template <class T> 
    void galapagos::router<T>::add_stream(galapagos::streaming_core <T> * _gsc, int index){
        s_axis[index] = std::make_unique <galapagos::stream <T> > ();
        m_axis[index] = std::make_unique <galapagos::stream <T> > ();

        _gsc->in= s_axis[index].get(); 
        _gsc->out= m_axis[index].get(); 

    }

    template <class T> 
    galapagos::stream_packet<T> galapagos::router<T>::read(short id){

        assert(id < s_axis.size());
        return s_axis[id]->read();

    }

    template <class T> 
    size_t galapagos::router<T>::m_size(short id){
        
        assert(id < m_axis.size());
        return m_axis[id]->size();
    }

    template <class T> 
    size_t galapagos::router<T>::s_size(short id){

        
        assert(id < s_axis.size());
        return s_axis[id]->size();
    }

    template <class T> 
    void galapagos::router<T>::write(galapagos::stream_packet<T> gps){

        assert(gps.dest < m_axis.size());
        m_axis[gps.dest]->write(gps);
    }

    template <class T> 
    galapagos::stream<T> * galapagos::router<T>::get_s_axis(short id){
        return s_axis[id].get(); 
    }

    template <class T> 
    galapagos::stream<T> * galapagos::router<T>::get_m_axis(short id){
        return m_axis[id].get(); 
    }

    template <class T> 
    bool galapagos::router<T>::is_done(){

            {
                std::lock_guard<std::mutex> guard(*mutex);
                return *done;
            }

    }



#endif
