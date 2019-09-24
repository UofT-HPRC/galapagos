//===============================
// AUTHOR     : Naif Tarafdar
// CREATE DATE     : April 20, 2019
//===============================

#ifndef __GALAPAGOS_NET_TCP_SERVER_SEND_HPP__   // if x.h hasn't been included yet...
#define __GALAPAGOS_NET_TCP_SERVER_SEND_HPP__

#include <cstdlib>
#include <iostream>
#include <thread>
#include <memory>
#include <utility>
#include <boost/asio.hpp>


#include "galapagos_interface.hpp"
#include "galapagos_net_tcp_session.hpp"

#include "spdlog/spdlog.h"
#include "spdlog/sinks/basic_file_sink.h"
#include "spdlog/fmt/bin_to_hex.h"

namespace galapagos{
    namespace net{

/** @brief Class for the tcp_server_send, responsible for sending packets to sessions.

    Runs as daemon in background, with an s_axis interface. If receives something on s_axis, then checks to see if a session exists, if it does then writes into s_axis of session, else creates a new session and then writes into s_axis of that session.
    @author Naif Tarafdar 
    @date April 20, 2019
    */
        template <class T> 
        class tcp_server_send{
	    public:
	        tcp_server_send(short _port, boost::asio::io_context * _io_context,
	                tcp_session_container <T> * _sessions,
	                bool * _done,
	                std::mutex * _done_mutex,
			interface <T> * _s_axis,
			std::shared_ptr <spdlog::logger> _logger
	                );
	        ~tcp_server_send(){;}
	        void send_new(std::string ip_addr);
	    private:
	        short port;
	        void send_loop();
	        boost::asio::io_context * io_context;
	        boost::asio::io_context io_context_local;
	        tcp_session_container <T> * sessions;
	        std::unique_ptr <std::thread> t_send;

                std::shared_ptr<spdlog::logger> logger;
		_done_struct done_struct;	
		bool is_done();
		interface <T> * s_axis;
	};

    }//net namespace
}//galapagos namespace

using namespace galapagos::net;

/**Constructor for galapagos::net::tcp_server_send
@tparam T the type of data used within each galapagos packet (default ap_uint<64>)
@param[in] _port port number for tcp server listening to packets 
@param[in] _io_context pointer to io_context needed to communicate over socket
@param[in] _done pointer to boolean that indicates node is done processing all local kernels 
@param[in] _done_mutex mutex managing _done pointer
@param[in] _mutex_packets_in_flight mutex associated with packets_in_flight
@param[in] _packets_in_flight stores how many packets have left the router to be consumed by external drivers 
@param[in] shared_ptr of logger used globally to log
*/
template <class T>
tcp_server_send<T>::tcp_server_send(short _port, 
                        boost::asio::io_context * _io_context, 
                        tcp_session_container <T> * _sessions,
                        bool * _done,
                        std::mutex * _done_mutex,
			interface <T> * _s_axis,
			std::shared_ptr <spdlog::logger> _logger
        
)
{

    done_struct.done = _done;
    done_struct.mutex = _done_mutex;
    port = _port;
    io_context = _io_context;
    sessions = _sessions;

    s_axis = _s_axis;
    t_send = std::make_unique<std::thread>(&tcp_server_send::send_loop,this);
    t_send->detach();
    logger->info("Created tcp_server_send");
}


/**Returns if node is done 
@tparam T the type of data used within each galapagos packet (default ap_uint<64>)
@returns if the node is done 
*/
template <class T>
bool tcp_server_send<T>::is_done(){


    std::lock_guard<std::mutex> guard(done_struct.mutex);
    return *done_struct.done;

}

/**Reads from input and writes to session 
@tparam T the type of data used within each galapagos packet (default ap_uint<64>)
*/
template <class T>
void tcp_server_send<T>::send_loop(){

    do{
        if(s_axis->empty()){
	    short dest = s_axis->get_head_dest();
    	    logger->debug("tcp_server_send, in send loop, sending buffer  to dest{0:d}", dest);
            std::string ip_addr = sessions->get_ip_addr(dest);
            bool session_found = sessions->find(ip_addr);
            if (!session_found){
                send_new(ip_addr);
            }
            else{
	        sessions->get_s_axis(ip_addr)->splice(s_axis);		
            }
        }

    }while(!is_done());

}


/**Creates a TCP session before sending data to session 
@tparam T the type of data used within each galapagos packet (default ap_uint<64>)
@param[in] ip_addr address to create session
*/
template <class T>
void tcp_server_send<T>::send_new(std::string ip_addr){
    
    boost::asio::ip::tcp::socket s(io_context_local);
    boost::asio::ip::tcp::resolver resolver(io_context_local);
    std::ostringstream convert;
    convert << port;
    std::string port_str = convert.str();
    bool send_successful = false;

    while(!send_successful){
    	try{
    	    boost::asio::connect(s, resolver.resolve((char *)ip_addr.c_str(), (char *)port_str.c_str()));
    	    send_successful = true;
    	    sessions->add_session(std::move(s), &io_context_local);
    	    logger->debug("tcp_server_send, send_new created socket");
	    sessions->get_s_axis(ip_addr)->splice(s_axis);		
    	}
    	catch(const boost::system::system_error& ex){
    	    send_successful = false;
    	}
    }
}


#endif
