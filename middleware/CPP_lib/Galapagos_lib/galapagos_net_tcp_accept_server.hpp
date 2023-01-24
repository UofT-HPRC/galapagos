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
#include "galapagos_stream.hpp"
#include "galapagos_router.hpp"

#include "galapagos_net_tcp_session.hpp"

namespace galapagos{
    namespace net{
        namespace tcp{

            template<class T>
            class accept_server{
                public:
                    accept_server(boost::asio::io_context * io_context, 
                                  std::string my_address,
				  short port,  
                                  session_container <T> * _sessions
                                  );
                    ~accept_server(){
                                    }
                private:
                    void accept();
                    void do_accept();
                    boost::asio::ip::tcp::acceptor acceptor_;
                    session_container <T> * sessions;
                    boost::asio::io_context * _io_context;
                    int num_id;
            };
        }//tcp namespace
    }//net namespace
}//galapagos namespace

using namespace galapagos::net::tcp;

template<class T>
accept_server<T>::accept_server(boost::asio::io_context *io_context,
						std::string my_address, 
                                                short port,  
                                                session_container<T> * _sessions
                                                )
    : acceptor_(*io_context, boost::asio::ip::tcp::endpoint(boost::asio::ip::tcp::v4(), port))
//    : acceptor_(*io_context, boost::asio::ip::tcp::endpoint(boost::asio::ip::address::from_string(my_address), port))
{

    _io_context = io_context;
    sessions = _sessions;
    
    
    std::thread t_accept(&accept_server<T>::accept,this);
    t_accept.detach();
}

template<class T>
void accept_server<T>::accept(){

    do_accept();

}

template<class T>
void accept_server<T>::do_accept()
{

    for(;;)
    {
            
       
#ifdef OLD
        try{
            sessions->add_session(acceptor_.accept(), _io_context);
        }
        catch (const std::exception& e)
        {
            std::cout << "SOCKET CLOSED THATS WHY THIS NO CLEAN " << std::endl;

        }
#else
        boost::asio::ip::tcp::socket socket(*_io_context);
        acceptor_.accept(socket);
        sessions->add_session(std::move(socket), _io_context);

#endif


    }

//TODO: add async mode

#ifdef ASYNC 
    acceptor_.async_accept(
        [this](boost::system::error_code ec, boost::asio::ip::tcp::socket socket)
        {
        if (!ec)
        {
            galapagos::net::tcp::session * sess = sessions->add_session(std::move(socket), _io_context);
        }

        do_accept();
        });
#endif
}



#endif
