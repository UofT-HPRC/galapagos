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

#if LOG_LEVEL > 0
#include "spdlog/spdlog.h"
#include "spdlog/sinks/basic_file_sink.h"
#include "spdlog/fmt/bin_to_hex.h"
#endif


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
#if LOG_LEVEL>0
                tcp(
                    short port, 
                    std::vector <std::string> kern_info_table, 
                    std::string  my_address, 
                    std::shared_ptr <spdlog::logger> _logger
                    );
#endif
                tcp(
                    short port, 
                    std::vector <std::string> kern_info_table, 
                    std::string  my_address 
                    );
                ~tcp(){}
		//virtual functions of external_driver
                interface<T> * get_s_axis(); 
                interface<T> * get_m_axis();
		        void start(); 
	    	    void init(galapagos::done_clean *, int * _packets_in_flight, std::mutex * _mutex_packets_in_flight);
                std::unique_ptr<std::thread> t;
	        private:
		        interface <T> s_axis;
                boost::asio::io_context io_context;
       		    std::unique_ptr < tcp_session_container<T> > tsc;
                std::unique_ptr < galapagos::done_clean > tsc_dc;
		        std::unique_ptr < tcp_server_send<T> > tss;
                std::unique_ptr < galapagos::done_clean > tss_dc;
		        std::unique_ptr < tcp_accept_server<T> > tas;
		        std::unique_ptr< galapagos::n_to_one_router<T> > router_out;
                std::unique_ptr < galapagos::done_clean > router_out_dc;
                short port;
                std::vector <std::string>  kern_info_table;
                std::string   my_address;
                void wait_for_end();
        };
        
        
    }//net namespace
}//galapagos namespace

#if LOG_LEVEL > 0
template<class T>
galapagos::net::tcp<T>::tcp(
            short _port, 
            std::vector <std::string>  _kern_info_table, 
            std::string   _my_address, 
            std::shared_ptr <spdlog::logger> _logger
            )
    	:
	galapagos::external_driver<T>(_logger),
	s_axis(std::string("tcp_s_axis"), _logger)

{

    port = _port;
    for(unsigned int i=0; i< _kern_info_table.size(); i++)
        kern_info_table.push_back(_kern_info_table[i]);
    my_address = _my_address;

    this->logger->info("created tcp");
    this->logger->debug("tcp constructor with {0:d}", kern_info_table.size());
    this->logger->flush();
    io_context.run();
}
#endif

template<class T>
galapagos::net::tcp<T>::tcp(
            short _port, 
            std::vector <std::string>  _kern_info_table, 
            std::string   _my_address
            )
    	:
	galapagos::external_driver<T>(),
	s_axis(std::string("tcp_s_axis"))

{

    port = _port;
    for(unsigned int i=0; i< _kern_info_table.size(); i++)
        kern_info_table.push_back(_kern_info_table[i]);
    my_address = _my_address;
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
    return router_out->get_m_axis();
}

template<class T>
void galapagos::net::tcp<T>::wait_for_end()
{

    
    router_out_dc->wait_for_clean();
#if LOG_LEVEL > 0
    this->logger->info("tcp router out destroyed");
#endif
    tss_dc->wait_for_clean();
#if LOG_LEVEL > 0
    this->logger->info("tcp server send destroyed");
#endif
    tsc_dc->wait_for_clean();
#if LOG_LEVEL > 0
    this->logger->info("tcp session container destroyed");
    this->logger->flush();
#endif
    this->dc->clean();
#if LOG_LEVEL > 0
    this->logger->info("clean tcp");
    this->logger->flush();
#endif
}



template<class T>
void galapagos::net::tcp<T>::start()
{
#if LOG_LEVEL > 0
    this->logger->info("tcp started");
    this->logger->flush();
#endif
    router_out->start();
    tss->start();
}

template<class T>
void galapagos::net::tcp<T>::init(
                    galapagos::done_clean * _dc,
					int * _packets_in_flight,
					std::mutex * _mutex_packets_in_flight
					)
{
    this->dc = _dc;
    this->packets_in_flight.num = _packets_in_flight;
    this->packets_in_flight.mutex = _mutex_packets_in_flight;

#if LOG_LEVEL > 0
    router_out_dc = std::make_unique< galapagos::done_clean> (this->dc->done_struct.done, this->dc->done_struct.mutex, this->logger); 
    router_out = std::make_unique< galapagos::n_to_one_router<T> > (router_out_dc.get(), this->logger);
    
    tsc_dc = std::make_unique< galapagos::done_clean> (this->dc->done_struct.done, this->dc->done_struct.mutex, this->logger); 
    tsc = std::make_unique< galapagos::net::tcp_session_container<T> > (kern_info_table, my_address, tsc_dc.get(), router_out.get(), this->packets_in_flight.mutex, this->packets_in_flight.num, this->logger);
    
    tss_dc = std::make_unique< galapagos::done_clean> (this->dc->done_struct.done, this->dc->done_struct.mutex, this->logger); 
    tss = std::make_unique< galapagos::net::tcp_server_send<T> > (port, &io_context, tsc.get(), tss_dc.get(), &(this->s_axis), this->logger);
    tas = std::make_unique< galapagos::net::tcp_accept_server<T> > (&io_context, my_address, port, tsc.get(), this->logger);
    
#else
    router_out_dc = std::make_unique< galapagos::done_clean> (this->dc->done_struct.done, this->dc->done_struct.mutex); 
    router_out = std::make_unique< galapagos::n_to_one_router<T> > (router_out_dc.get());
    
    tsc_dc = std::make_unique< galapagos::done_clean> (this->dc->done_struct.done, this->dc->done_struct.mutex); 
    tsc = std::make_unique< galapagos::net::tcp_session_container<T> > (kern_info_table, my_address, tsc_dc.get(), router_out.get(), this->packets_in_flight.mutex, this->packets_in_flight.num);
    
    tss_dc = std::make_unique< galapagos::done_clean> (this->dc->done_struct.done, this->dc->done_struct.mutex); 
    tss = std::make_unique< galapagos::net::tcp_server_send<T> > (port, &io_context, tsc.get(), tss_dc.get(), &(this->s_axis));
    tas = std::make_unique< galapagos::net::tcp_accept_server<T> > (&io_context, my_address, port, tsc.get());
#endif
    t=std::make_unique<std::thread>(&galapagos::net::tcp<T>::wait_for_end, this);
    t->detach();
}




#endif
