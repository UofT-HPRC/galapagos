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


namespace galapagos{
    namespace net{
/** @brief Class tcp driver  

    A software implementation of an n to one router, used by network node to arbitrade output of sessions into the node.
    Routes between input interfaces(s_axis) and an output interface(m_axis).
    @author Naif Tarafdar 
    @date April 20, 2019
    */
        template<class T>
        class tcp{
            public:
                tcp(
		    short id,
                    short port, 
                    std::vector <std::string> &kern_info_table, 
                    std::string  & my_address, 
                    std::mutex * _done_mutex, 
                    bool * _done,
                    std::mutex * _mutex_packets_in_flight,
                    int * _packets_in_flight,
                    std::shared_ptr <spdlog::logger> _logger
                    );
                ~tcp(){}
                interface<T> * get_s_axis(); 
                interface<T> * get_m_axis(); 
            private:
                boost::asio::io_context io_context;
            	std::shared_ptr <spdlog::logger> logger;
       		tcp_session_container<T> tsc;
		tcp_server_send<T> tss;
		tcp_accept_server<T> tas;
		n_to_one_router<T> router_out;
		_done_struct done_struct;
        };
    }//net namespace
}//galapagos namespace

template<class T>
galapagos::net::tcp<T>::tcp(short _id,
            short port, 
            std::vector <std::string>  &kern_info_table, 
            std::string  & my_address, 
            std::mutex * _done_mutex, 
            bool * _done,
            std::mutex * _mutex_packets_in_flight,
            int * _packets_in_flight,
            std::shared_ptr <spdlog::logger> _logger
            )
    	:tsc(kern_info_table, my_address, _done, _done_mutex, &router_out, _mutex_packets_in_flight, _packets_in_flight, _logger),
    	tss(port, &io_context, &tsc, _done, _done_mutex, _logger),
        tas(&io_context, my_address, port, &tsc, _logger),
    	router_out(_done, _done_mutex, _logger) 

{

    done_struct.mutex = _done_mutex;    
    done_struct.done = _done;    
    logger = _logger;

    io_context.run();
}

template<class T>
galapagos::interface<T> * galapagos::net::tcp<T>::get_s_axis()
{
    return tss.get_s_axis();
}


template<class T>
galapagos::interface<T> * galapagos::net::tcp<T>::get_m_axis()
{
    return router_out.get_m_axis();
}


#endif
