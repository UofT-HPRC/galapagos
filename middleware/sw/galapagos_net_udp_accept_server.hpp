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

#if LOG_LEVEL > 0
#include "galapagos_packet.h"
#include "spdlog/spdlog.h"
#include "spdlog/sinks/basic_file_sink.h"
#endif

namespace galapagos{
    namespace net{

        template<class T>
        class tcp_accept_server{
            public:
#if LOG_LEVEL > 0
                tcp_accept_server(boost::asio::io_context * io_context, 
                              std::string my_address,
            		          short port,  
                              tcp_session_container <T> * _sessions,
		    	              std::shared_ptr <spdlog::logger> _logger
                              );
#endif
                tcp_accept_server(boost::asio::io_context * io_context, 
                              std::string my_address,
            		          short port,  
                              tcp_session_container <T> * _sessions
                              );
                ~tcp_accept_server(){}
            private:
#if LOG_LEVEL > 0
	        	std::shared_ptr <spdlog::logger> logger;
#endif
                void prepare(
                    boost::asio::io_context *io_context,
                    std::string my_address, 
                    short port,  
                    tcp_session_container<T> * _sessions
                );
                void accept();
                boost::asio::ip::tcp::acceptor acceptor_;
                tcp_session_container <T> * sessions;
                boost::asio::io_context * _io_context;
        };
    }//net namespace
}//galapagos namespace

using namespace galapagos::net;


#if LOG_LEVEL > 0
template<class T>
tcp_accept_server<T>::tcp_accept_server(boost::asio::io_context *io_context,
						                std::string my_address, 
                                        short port,  
                                        tcp_session_container<T> * _sessions,
	        	    	      			std::shared_ptr <spdlog::logger> _logger
                                                )
    : acceptor_(*io_context, boost::asio::ip::tcp::endpoint(boost::asio::ip::tcp::v4(), port))
{
    logger = _logger;
    prepare(io_context, my_address, port, _sessions);

}

#endif

template<class T>
tcp_accept_server<T>::tcp_accept_server(boost::asio::io_context *io_context,
						                std::string my_address, 
                                        short port,  
                                        tcp_session_container<T> * _sessions
                                                )
    : acceptor_(*io_context, boost::asio::ip::tcp::endpoint(boost::asio::ip::tcp::v4(), port))
{

    prepare(io_context, my_address, port, _sessions);
}

template<class T>
void tcp_accept_server<T>::prepare(boost::asio::io_context *io_context,
						      std::string my_address, 
                              short port,  
                              tcp_session_container<T> * _sessions
                             )
{

    _io_context = io_context;
    sessions = _sessions;
    
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
