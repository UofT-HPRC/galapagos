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
        class tcp_accept_server{
            public:
                tcp_accept_server(boost::asio::io_context * io_context, 
                              std::string my_address,
            		      short port,  
                              tcp_session_container <T> * _sessions,
		    	      std::shared_ptr <spdlog::logger> _logger
                              );
                ~tcp_accept_server(){
                                }
            private:
		std::shared_ptr <spdlog::logger> logger;
                void accept();
                boost::asio::ip::tcp::acceptor acceptor_;
                tcp_session_container <T> * sessions;
                boost::asio::io_context * _io_context;
        };
    }//net namespace
}//galapagos namespace

using namespace galapagos::net;

template<class T>
tcp_accept_server<T>::tcp_accept_server(boost::asio::io_context *io_context,
						std::string my_address, 
                                                short port,  
                                                tcp_session_container<T> * _sessions,
		    	      			std::shared_ptr <spdlog::logger> _logger
                                                )
    : acceptor_(*io_context, boost::asio::ip::tcp::endpoint(boost::asio::ip::tcp::v4(), port))
{

    _io_context = io_context;
    sessions = _sessions;
    logger = _logger; 
    
    std::thread t_accept(&tcp_accept_server<T>::accept,this);
    t_accept.detach();
}

template<class T>
void tcp_accept_server<T>::accept(){
    
    for(;;)
    {
    
    	boost::asio::ip::tcp::socket socket(*_io_context);
    	acceptor_.accept(socket);
    	sessions->add_session(std::move(socket), _io_context);
    }

}

#endif
