//===============================
// AUTHOR     : Naif Tarafdar
// CREATE DATE     : November 14, 2019
//===============================


#ifndef __GALAPAGOS_NET_UDP_HPP__   // if x.h hasn't been included yet...
#define __GALAPAGOS_NET_UDP_HPP__


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

#if LOG_LEVEL > 0
#include "spdlog/spdlog.h"
#include "spdlog/sinks/basic_file_sink.h"
#include "spdlog/fmt/bin_to_hex.h"
#endif


#include "galapagos_external_driver.hpp"

namespace galapagos{
    namespace net{
/** @brief Class udp driver  

    A software implementation of an n to one router, used by network node to arbitrade output of sessions into the node.
    Routes between input interfaces(s_axis) and an output interface(m_axis).
    @author Naif Tarafdar 
    @date April 20, 2019
    */
        template<class T>
        class udp: public galapagos::external_driver<T>{
            public:
#if LOG_LEVEL > 0
                udp(
                    short port, 
                    std::vector <std::string> kern_info_table, 
                    std::string  my_address, 
                    std::shared_ptr <spdlog::logger> _logger
                    );
#endif
                udp(
                    short port, 
                    std::vector <std::string> kern_info_table, 
                    std::string  my_address
                    );
                ~udp(){}
		//virtual functions of external_driver
                interface<T> * get_s_axis(); 
                interface<T> * get_m_axis();
		        void start(); 
	    	    void init(galapagos::done_clean *, int * _packets_in_flight, std::mutex * _mutex_packets_in_flight);
	        private:
                void prepare(
                    short port, 
                    std::vector <std::string> kern_info_table, 
                    std::string  my_address
                    );
                std::unique_ptr<boost::asio::ip::udp::socket> write_socket;
                std::unique_ptr<boost::asio::ip::udp::socket> read_socket;
		        interface <T> s_axis;
		        interface <T> m_axis;
                boost::asio::io_context io_context;
                std::unique_ptr < galapagos::done_clean > read_dc;
                std::unique_ptr < galapagos::done_clean > write_dc;
                short port;
                std::vector <std::string>  kern_info_table;
                std::string   my_address;
                void wait_for_end();
                void read();
                void write();
                std::unique_ptr<std::thread> t;
        };
        
    }//net namespace
}//galapagos namespace

#if LOG_LEVEL > 0
template<class T>
galapagos::net::udp<T>::udp(
            short _port, 
            std::vector <std::string>  _kern_info_table, 
            std::string   _my_address, 
            std::shared_ptr <spdlog::logger> _logger
            )
    	:
	galapagos::external_driver<T>(_logger),
	s_axis(std::string("udp_s_axis"), _logger),
	m_axis(std::string("udp_m_axis"), _logger)

{

    prepare(_port, _kern_info_table, _my_address);

}

#endif


template<class T>
galapagos::net::udp<T>::udp(
            short _port, 
            std::vector <std::string>  _kern_info_table, 
            std::string   _my_address
            )
    	:
	galapagos::external_driver<T>(),
	s_axis(std::string("udp_s_axis")),
	m_axis(std::string("udp_m_axis"))

{

    prepare(_port, _kern_info_table, _my_address);

}
template<class T>
void galapagos::net::udp<T>::prepare(
            short _port, 
            std::vector <std::string>  _kern_info_table, 
            std::string   _my_address 
            )
{

    port = _port;
    for(int i=0; i< _kern_info_table.size(); i++)
        kern_info_table.push_back(_kern_info_table[i]);
    my_address = _my_address;
#if LOG_LEVEL > 0
    this->logger->info("created udp");
    this->logger->debug("udp constructor with {0:d}", kern_info_table.size());
    this->logger->flush();
#endif
    io_context.run();
    
    boost::asio::ip::udp::endpoint myEndpoint;
    boost::asio::ip::address_v4 myIP;
    boost::system::error_code myError;
    myIP.from_string(my_address.c_str(), myError); 
    myEndpoint.address(myIP);
    myEndpoint.port(port);
#if LOG_LEVEL > 0    
    this->logger->info("About to read at port {0:d}", port);
    this->logger->info("About to bind to address{0}", my_address);
#endif
    boost::asio::socket_base::reuse_address option(true);
    read_socket = std::make_unique< boost::asio::ip::udp::socket> (io_context, boost::asio::ip::udp::v4());
    read_socket->set_option(option);
    read_socket->bind(boost::asio::ip::udp::endpoint(boost::asio::ip::address::from_string(my_address.c_str()), port));
#if LOG_LEVEL > 0
    this->logger->info("Created listen socket");
#endif
}

template<class T>
galapagos::interface<T> * galapagos::net::udp<T>::get_s_axis()
{
    return &s_axis;
}


template<class T>
galapagos::interface<T> * galapagos::net::udp<T>::get_m_axis()
{
    return &m_axis;
}

template<class T>
void galapagos::net::udp<T>::wait_for_end()
{

    write_dc->wait_for_clean();
    read_dc->wait_for_clean();
    this->dc->clean();
#if LOG_LEVEL > 0
    this->logger->info("clean udp");
    this->logger->flush();
#endif
}



template<class T>
void galapagos::net::udp<T>::start()
{
#if LOG_LEVEL > 0
    this->logger->info("udp started");
    this->logger->flush();
#endif
    std::thread t_read(&udp<T>::read,this);
    t_read.detach();
    std::thread t_write(&udp<T>::write,this);
    t_write.detach();
}


template<class T>
void galapagos::net::udp<T>::read(){
  
#if LOG_LEVEL > 0
    this->logger->debug("udp read function started");
#endif
    do{
        if(read_socket->available() > 0){
        boost::asio::ip::udp::endpoint sender_endpoint;
        char data[(MAX_BUFFER+1)*sizeof(T)];
        T * header = (T *)data;



        size_t length = read_socket->receive_from(
                        boost::asio::buffer((char *)data, (MAX_BUFFER+1)*sizeof(T)), sender_endpoint
                        );
        std::string recv_addr = sender_endpoint.address().to_string();
#if LOG_LEVEL > 0
        this->logger->debug("udp_read from net address {0}", recv_addr);
#endif
        // int dest = (int)header->range(31,24);
        // int id = (int)header->range(23,16);
        // int size = (int)header->range(15,0);
        int dest = galapagos::range(31, 24, *header);
        int id = galapagos::range(23, 16, *header);
        int size = galapagos::range(15, 0, *header);
        
#if LOG_LEVEL > 0
        this->logger->debug ("udp_read, size is {0:d}, max_size is {1:d}", size, (MAX_BUFFER+1));
#endif
        m_axis.packet_write(data+sizeof(T), size, dest, id);
        }
    }while(!this->dc->is_done());
    
    read_dc->clean();

}



template<class T>
void galapagos::net::udp<T>::write(){


#if LOG_LEVEL > 0
    this->logger->debug("udp write function started");
#endif
    do{
        std::lock_guard<std::mutex> guard0(*this->packets_in_flight.mutex);
        if(!s_axis.empty()){
#if LOG_LEVEL > 0
            this->logger->debug("about to write to udp socket");
#endif
            std::lock_guard<std::mutex> guard1(*s_axis.get_mutex());
            boost::asio::ip::udp::endpoint myEndpoint;
            boost::asio::ip::address_v4 targetIP;
            boost::system::error_code myError;
            targetIP.from_string(kern_info_table[s_axis.get_unsafe_head_buffer()->dest].c_str(), myError); 
            myEndpoint.address(targetIP);
            myEndpoint.port(port);
            
            boost::asio::ip::udp::socket socket(io_context);
            boost::asio::ip::udp::endpoint remote_endpoint = boost::asio::ip::udp::endpoint(boost::asio::ip::address::from_string(kern_info_table[s_axis.get_unsafe_head_buffer()->dest].c_str()), port);
            socket.open(boost::asio::ip::udp::v4()); 
            boost::system::error_code err;
            auto sent = socket.send_to(boost::asio::buffer(s_axis.get_unsafe_head_buffer()->data, s_axis.get_unsafe_head_buffer()->size + sizeof(T)), remote_endpoint, 0, err);
            socket.close();

            
#if LOG_LEVEL > 0
            this->logger->debug("udp sent{0:d} to ip_addr {1}", sent, kern_info_table[s_axis.get_unsafe_head_buffer()->dest].c_str());
            this->logger->debug("wrote {0:d} to udp socket at dest {1:d}", s_axis.get_unsafe_head_buffer()->size, s_axis.get_unsafe_head_buffer()->dest);
#endif
            s_axis.delete_unsafe_head_buffer();	
            *this->packets_in_flight.num = *this->packets_in_flight.num - 1;
        }


    }while(!this->dc->is_done());

    write_dc->clean();

}



template<class T>
void galapagos::net::udp<T>::init(
                    galapagos::done_clean * _dc,
					int * _packets_in_flight,
					std::mutex * _mutex_packets_in_flight
					)
{
    this->dc = _dc;
    this->packets_in_flight.num = _packets_in_flight;
    this->packets_in_flight.mutex = _mutex_packets_in_flight;
    
    #if LOG_LEVEL > 0
    read_dc = std::make_unique< galapagos::done_clean> (this->dc->done_struct.done, this->dc->done_struct.mutex, this->logger); 
    write_dc = std::make_unique< galapagos::done_clean> (this->dc->done_struct.done, this->dc->done_struct.mutex, this->logger); 
    #else
    read_dc = std::make_unique< galapagos::done_clean> (this->dc->done_struct.done, this->dc->done_struct.mutex); 
    write_dc = std::make_unique< galapagos::done_clean> (this->dc->done_struct.done, this->dc->done_struct.mutex); 
    #endif

    t=std::make_unique<std::thread>(&galapagos::net::udp<T>::wait_for_end, this);
    t->detach();
}



#endif
