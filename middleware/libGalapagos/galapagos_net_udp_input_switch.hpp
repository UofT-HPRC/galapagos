//===============================
// AUTHOR     : Naif Tarafdar
// CREATE DATE     : April 20, 2019
//===============================

#ifndef __GALAPAGOS_NET_TCP_ACCEPT_SERVER_HPP__   // if x.h hasn't been included yet...
#define __GALAPAGOS_NET_TCP_ACCEPT_SERVER_HPP

#include <cstdlib>
#include <iostream>
#include <thread>
#include <memory>
#include <utility>
#include <boost/asio.hpp>
#include "galapagos_n_to_one_router.hpp"
#include "galapagos_net_tcp_session.hpp"

#include "galapagos_packet.h"
#include "spdlog/spdlog.h"
#include "spdlog/sinks/basic_file_sink.h"

namespace galapagos{
    namespace net{

        template<class T>
        class udp_input_switch{
            public:
                tcp_accept_server(boost::asio::io_context * io_context, 
                              std::string my_address,
            		          short port,  
                              udp_session_container <T> * _sessions,
		    	              std::shared_ptr <spdlog::logger> _logger
                              );
                ~tcp_accept_server(){
                                }
            private:
		        std::shared_ptr <spdlog::logger> logger;
                void accept();
                boost::asio::ip::udp::socket socket_;
                tcp_session_container <T> * sessions;
                boost::asio::io_context * _io_context;
        };
    }//net namespace
}//galapagos namespace

using namespace galapagos::net;

template<class T>
udp_input_switch<T>::udp_input_switch(boost::asio::io_context *io_context,
						                std::string _my_address, 
                                        short _port,  
                                        udp_session_container<T> * _sessions,
                                        done_clean * _dc,
		    	      			        std::shared_ptr <spdlog::logger> _logger
                                        )
    : socket_(*io_context, boost::asio::ip::udp::endpoint(boost::asio::ip::udp::v4(), port))
{

    _io_context = io_context;
    sessions = _sessions;
    logger = _logger; 
    dc = _dc;


    std::thread t_read(&udp_input_switch<T>::read,this);
    t_read.detach();
}

template<class T>
void tcp_accept_server<T>::read(){
   
    do{
        udp::endpoint sender_endpoint;
        size_t length = sock.receive_from(
                asio::buffer(data, max_length), sender_endpoint
                )


    }while(!dc->is_done());


}

#endif
