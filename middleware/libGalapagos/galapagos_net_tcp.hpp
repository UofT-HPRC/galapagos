//===============================
// AUTHOR     : Naif Tarafdar
// CREATE DATE     : April 20, 2019
//===============================


#ifndef __GALAPAGOS_NET_TCP_HPP__   // if x.h hasn't been included yet...
#define __GALAPAGOS_NET_TCP_HPP__


#include <boost/thread/locks.hpp>
#include <boost/thread/shared_mutex.hpp>
#include <cstdlib>
#include <iostream>
#include <thread>
#include <memory>
#include <utility>
#include <boost/asio.hpp>

#include "common.hpp"
#include "galapagos_interface.hpp"
#include "galapagos_n_to_one_router.hpp"
#include "galapagos_net_tcp_session.hpp"
#include "galapagos_net_tcp_accept_server.hpp"
#include "galapagos_net_tcp_server_send.hpp"

#include "spdlog/spdlog.h"
#include "spdlog/sinks/basic_file_sink.h"
#include "spdlog/fmt/bin_to_hex.h"



#include "galapagos_external_driver.hpp"

namespace galapagos{
    namespace net{
/** @brief Class tcp driver  

    A software implementation of an n to one router, used by network node to arbitrade output of sessions into the node.
    Routes between input interfaces(s_axis) and an output interface(m_axis).
    @author Naif Tarafdar 
    @date April 20, 2019
    */
        template<class T>
        class tcp: public galapagos::external_driver<T>{
            public:
                tcp(
		    short id,
                    short port, 
                    std::vector <std::string> kern_info_table, 
                    std::string  my_address, 
                    std::mutex * _done_mutex, 
                    bool * _done,
                    std::mutex * _mutex_packets_in_flight,
                    int * _packets_in_flight,
                    std::shared_ptr <spdlog::logger> _logger
                    );
                ~tcp(){}
		//virtual functions of external_driver
                interface<T> * get_s_axis(); 
                interface<T> * get_m_axis();
		void start(); 
            protected:
                boost::asio::io_context io_context;
       		tcp_session_container<T> tsc;
		interface <T> s_axis;
	    private:
		tcp_server_send<T> tss;
		tcp_accept_server<T> tas;
		n_to_one_router<T> router_out;
        };
        
	template<class T>
        class tcp_full: public tcp<T>{
            public:
                tcp_full(
		    short id,
                    short port, 
                    std::vector <std::string> kern_info_table, 
                    std::string   my_address, 
                    std::mutex * _done_mutex, 
                    bool * _done,
                    std::mutex * _mutex_packets_in_flight,
                    int * _packets_in_flight,
                    std::shared_ptr <spdlog::logger> _logger
                    );
                ~tcp_full(){}
            private:
		interface <T> s_axis;
		tcp_server_send<T> tss;
		tcp_accept_server<T> tas;
        };
        
	template<class T>
        class tcp_send: public tcp<T>{
            public:
                tcp_send(
		    short id,
                    short port, 
                    std::vector <std::string> kern_info_table, 
                    std::string   my_address, 
                    std::mutex * _done_mutex, 
                    bool * _done,
                    std::mutex * _mutex_packets_in_flight,
                    int * _packets_in_flight,
                    std::shared_ptr <spdlog::logger> _logger
                    );
                ~tcp_send(){}
	    private:
		tcp_server_send<T> tss;
        };
	
	template<class T>
        class tcp_recv: public tcp<T>{
            public:
                tcp_recv(
		    short id,
                    short port, 
                    std::vector <std::string> kern_info_table, 
                    std::string   my_address, 
                    std::mutex * _done_mutex, 
                    bool * _done,
                    std::mutex * _mutex_packets_in_flight,
                    int * _packets_in_flight,
                    std::shared_ptr <spdlog::logger> _logger
                    );
                ~tcp_recv(){}
	    private:
		tcp_accept_server<T> tas;
        };
        
    }//net namespace
}//galapagos namespace

template<class T>
galapagos::net::tcp<T>::tcp(short _id,
            short port, 
            std::vector <std::string>  kern_info_table, 
            std::string   my_address, 
            std::mutex * _done_mutex, 
            bool * _done,
            std::mutex * _mutex_packets_in_flight,
            int * _packets_in_flight,
            std::shared_ptr <spdlog::logger> _logger
            )
    	:galapagos::external_driver<T>(_done_mutex, _done, _mutex_packets_in_flight, _packets_in_flight, _logger),
	tsc(kern_info_table, my_address, _done, _done_mutex, &router_out, _mutex_packets_in_flight, _packets_in_flight, _logger),
    	router_out(_done, _done_mutex, _logger) 

{
    io_context.run();
}

template<class T>
galapagos::interface<T> * galapagos::net::tcp<T>::get_s_axis()
{
    return &s_axis;
}


template<class T>
galapagos::interface<T> * galapagos::net::tcp<T>::get_m_axis()
{
    return router_out.get_m_axis();
}


template<class T>
void galapagos::net::tcp<T>::start()
{
    router_out.start();
}


template<class T>
galapagos::net::tcp_full<T>::tcp_full(short _id,
            short port, 
            std::vector <std::string>  kern_info_table, 
            std::string   my_address, 
            std::mutex * _done_mutex, 
            bool * _done,
            std::mutex * _mutex_packets_in_flight,
            int * _packets_in_flight,
            std::shared_ptr <spdlog::logger> _logger
            )
    	:
        galapagos::net::tcp<T>(_id, port, kern_info_table, my_address, _done_mutex, _done, _mutex_packets_in_flight, _packets_in_flight, _logger),	
	tss(port, &(this->io_context), &(this->tsc), _done, _done_mutex, &(this->s_axis), _logger),
        tas(&(this->io_context), my_address, port, &(this->tsc), _logger)

{;}

template<class T>
galapagos::net::tcp_send<T>::tcp_send(short _id,
            short port, 
            std::vector <std::string>  kern_info_table, 
            std::string   my_address, 
            std::mutex * _done_mutex, 
            bool * _done,
            std::mutex * _mutex_packets_in_flight,
            int * _packets_in_flight,
            std::shared_ptr <spdlog::logger> _logger
            )
    	:
        galapagos::net::tcp<T>(_id, port, kern_info_table, my_address, _done_mutex, _done, _mutex_packets_in_flight, _packets_in_flight, _logger),	
	tss(port, &(this->io_context), &(this->tsc), _done, _done_mutex, &(this->s_axis), _logger)

{;}

template<class T>
galapagos::net::tcp_recv<T>::tcp_recv(short _id,
            short port, 
            std::vector <std::string>  kern_info_table, 
            std::string   my_address, 
            std::mutex * _done_mutex, 
            bool * _done,
            std::mutex * _mutex_packets_in_flight,
            int * _packets_in_flight,
            std::shared_ptr <spdlog::logger> _logger
            )
    	:
        galapagos::net::tcp<T>(_id, port, kern_info_table, my_address, _done_mutex, _done, _mutex_packets_in_flight, _packets_in_flight, _logger),	
        tas(&(this->io_context), my_address, port, &(this->tsc), _logger)

{;}

#endif
