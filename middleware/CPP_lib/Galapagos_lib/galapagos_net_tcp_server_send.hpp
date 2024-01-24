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
#include "galapagos_stream.hpp"
#include "galapagos_router.hpp"

#include "galapagos_net_tcp_session.hpp"

namespace galapagos{
    namespace net{
        namespace tcp{
            
            template <class T>
            class server_send: public streaming_core<T>{
                public:
                    server_send(short _port, boost::asio::io_context * _io_context,
                            session_container <T> * _sessions,
                            bool * _done,
                            std::mutex * _done_mutex,
                            galapagos::stream <T> * from_node,
                            std::mutex * _mutex_packets_in_flight,
                            int * _packets_in_flight
                            );
                    ~server_send(){
                                  }
                    void send_new(std::string ip_addr, int dest, int src);
                private:
                    void send_loop();
                    std::mutex * mutex;
                    bool * done;
                    short port;
                    boost::asio::io_context * io_context;
                    boost::asio::io_context io_context_local;
                    session_container <T> * sessions;
                    std::unique_ptr <std::thread> t_send;
                    std::mutex * mutex_packets_in_flight;
                    int * packets_in_flight;





            };

        };
    }//net namespace
}//galapagos namespace


template <class T>
            server_send<T>::server_send(short _port, 
                                    boost::asio::io_context * _io_context, 
                                    session_container <T> * _sessions,
                                    bool * _done,
                                    std::mutex * _done_mutex,
                                    galapagos::stream <T> * from_node,
                                    std::mutex * _mutex_packets_in_flight,
                                    int * _packets_in_flight
                    
            ):galapagos::streaming_core<T>(0, from_node, nullptr)

            {

                done = _done;
                mutex = _done_mutex;
                port = _port;
                io_context = _io_context;
                sessions = _sessions;

                mutex_packets_in_flight = _mutex_packets_in_flight;
                packets_in_flight = _packets_in_flight;

                t_send = std::make_unique<std::thread>(&server_send::send_loop,this);
                t_send->detach();
            }



            template <class T>
            void server_send<T>::send_loop(){

#ifdef EXTRA_PRINT
                std::cout << " IN SEND LOOP " << std::endl;
#endif
                int dest, src;
                while(1){
                    
                    {
                        std::lock_guard<std::mutex> guard(*mutex);
                        if(*done){
                            break;
                        }
                    }
                    

                    galapagos::stream_packet<T> gps;

                    int data;
                    
                    if(this->in != nullptr){
                        if(this->in->try_peak(gps)){

                            data = (int)gps.data;
                            dest = (int)gps.dest;
                            src = (int)gps.id;
                            std::string ip_addr = sessions->get_ip_addr(dest);
                            bool session_found = sessions->find(ip_addr);
                            if (!session_found){
                                send_new(ip_addr, dest, src);

                            }
                            else{
                                std::vector<T> data_vect = this->in->read(&dest, &src);
                                sessions->send(ip_addr, (char *)data_vect.data(), data_vect.size()*8, dest, src);

                            }


                        }
                    }
                    //else{
                    //    ;
                    //    std::cout << "UNLOCKING IN FLIGHT 3" << std::endl;
                    //    mutex_packets_in_flight->unlock();

                    //}
  //                  std::cout << "UNLOCKING IN FLIGHT 3" << std::endl;
                    //mutex_packets_in_flight->unlock();

                }

            }

            
            template <class T>
            void server_send<T>::send_new(std::string ip_addr, int dest, int src){
                
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
#ifdef EXTRA_PRINT
                    std::cout << "ADDING SESSION THIS IS CLIENT " << std::endl;
#endif
                    sessions->add_session(std::move(s), &io_context_local);
                    std::vector<T> data_vect = this->in->read(&dest, &src);
                    //(*packets_in_flight)+=data_vect.size();
                    //std::cout << "UNLOCKING IN FLIGHT 1" << std::endl;
                    //mutex_packets_in_flight->unlock();
                    sessions->send(ip_addr, (char *)data_vect.data(), data_vect.size() * 8, dest, src);
                
                }
                catch(const boost::system::system_error& ex){
                    send_successful = false;
                }
                }
            }


#endif
