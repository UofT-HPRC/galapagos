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
            std::shared_ptr<spdlog::logger> logger;
        public:
            router(std::shared_ptr<spdlog::logger> _logger){logger=_logger;}
            router(bool * _done, std::mutex * _mutex, std::shared_ptr<spdlog::logger> _logger);
            router(bool * _done, std::mutex * _mutex, int num_ports, std::shared_ptr<spdlog::logger> _logger);
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
            unsigned int num_packets();
            void drain();



            virtual void route() = 0;
            virtual void start() = 0;
    };

    
}

template <class T> 
    galapagos::router<T>::router(bool * _done, std::mutex * _mutex, std::shared_ptr<spdlog::logger> _logger){


        done = _done;
        mutex = _mutex;
        logger = _logger;
        logger->info("Router Constructor");

    }



    template <class T> 
    void galapagos::router<T>::init_ports(int num_ports){

        std::stringstream ss;
        for(int i=0; i<num_ports; i++){
            s_axis.push_back(nullptr);
            m_axis.push_back(nullptr);
        }

        logger->info("Initializing Router with {0:d} ports", num_ports);
    }

    template <class T> 
    galapagos::router<T>::router(bool * _done, std::mutex * _mutex, int num_ports, std::shared_ptr<spdlog::logger> _logger){

        done = _done;
        mutex = _mutex;
        logger = _logger;

        std::stringstream ss;
        for(int i=0; i<num_ports; i++){
            s_axis.push_back(nullptr);
            m_axis.push_back(nullptr);
        }


    }

    template <class T> 
    void galapagos::router<T>::add_port(int index){
        
        s_axis[index] = std::make_unique <stream<T> > (logger);
        m_axis[index] = std::make_unique <stream<T> > (logger);



    }


    template <class T> 
    void galapagos::router<T>::add_stream(galapagos::streaming_core <T> * _gsc, int index){
        std::string str_id = std::to_string(index);
        std::string s_axis_name = "kernel_" + str_id + "_s_axis";
        std::string m_axis_name = "kernel_" + str_id + "_m_axis";
        s_axis[index] = std::make_unique <galapagos::stream <T> > (s_axis_name, logger);
        m_axis[index] = std::make_unique <galapagos::stream <T> > (m_axis_name, logger);

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

    template <class T> 
    unsigned int galapagos::router<T>::num_packets(){
    
        unsigned int num = 0;

        for(int i=0; i<s_axis.size(); i++){
            num += s_axis[i]->size();
        }
        
        for(int i=0; i<m_axis.size(); i++){
            num += m_axis[i]->size();
        }

        return num;
    }



    
    template <class T> 
    void galapagos::router<T>::drain(){

        bool cont = true;

        while(cont){

            for(int i=0; i<m_axis.size(); i++){
                if(m_axis[i]->size()>0){
                    cont = true;
                    continue;
                }
                cont=false;
            }
        }

        cont = true;
        
        while(cont){

            for(int i=0; i<s_axis.size(); i++){
                if(s_axis[i]->size()>0){
                    cont = true;
                    continue;
                }
                cont=false;
            }
        }

        cont = true;

    }

#endif
