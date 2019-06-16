//===============================
// AUTHOR     : Naif Tarafdar
// CREATE DATE     : April 20, 2019
//===============================


#ifndef __GALAPAGOS_NET_TCP_HPP__   // if x.h hasn't been included yet...
#define __GALAPAGOS_NET_TCP_HPP__


#include <cstdlib>
#include <iostream>
#include <thread>
#include <memory>
#include <utility>
#include <boost/asio.hpp>
#include "galapagos_stream.hpp"
#include "galapagos_router.hpp"


#include "galapagos_net_tcp_session.hpp"
#include "galapagos_net_tcp_accept_server.hpp"
#include "galapagos_net_tcp_server_send.hpp"




//https://stackoverflow.com/questions/52146630/is-there-a-way-to-explicitly-destroy-all-handlers-pending-on-a-given-boostasio

typedef struct Hack : boost::asio::io_context { 
    using boost::asio::io_context::shutdown;
} ioc;


using namespace std::chrono_literals;

struct Handler {
        void operator()(boost::system::error_code ec) { std::cout << "Handler invoked: " << ec.message() << std::endl; }
        struct Instance { // logging only unique instance to avoid noise of moved handlers
            Instance()  { std::cout << "Created handler instance"   << std::endl; }
            ~Instance() { std::cout << "Destroyed handler instance" << std::endl; }
        };
        std::unique_ptr<Instance> _instance = std::make_unique<Instance>();
};


namespace galapagos{
    namespace net{
        namespace tcp{
            template<class T>
            class tcp: public streaming_core<T>{
                public:
                    tcp(short id,
                        short port, 
                        std::vector <std::string> &kernel_info_table, 
                        std::string  & my_address, 
                        galapagos::stream <T>* in, 
                        galapagos::stream <T>* out, 
                        std::mutex * _done_mutex, 
                        bool * _done,
                        bool enabled);
                    void stop();
                    void start();
                    void test();
                private:
                    //boost::asio::io_context io_context;
                    ioc io_context;
                    std::unique_ptr<session_container <T> > sc_ptr;
                    std::unique_ptr<server_send <T> > ss_ptr;
                    std::unique_ptr<accept_server <T> > as_ptr;
                    galapagos::stream<T> * from_node; 
                    galapagos::stream<T> * from_sessions;
                    std::unique_ptr<galapagos::stream <T> > to_sessions;
                    std::unique_ptr <std::thread> t_context;
                    void test_func();
                    void run_context();
                    std::mutex * mutex;
                    bool * done;
                    std::unique_ptr<router_net_out <T> > router_out;
    
            };

            
        }//tcp namespace
    }//net namespace
}//galapagos namespace

template<class T>
            galapagos::net::tcp::tcp<T>::tcp(short _id,
                        short port, 
                        std::vector <std::string>  &kernel_info_table, 
                        std::string  & my_address, 
                        galapagos::stream <T> * _from_node, 
                        galapagos::stream <T> * _from_sessions, 
                        std::mutex * _done_mutex, 
                        bool * _done,
                        bool enabled):
                galapagos::streaming_core<T>(_id,  _from_node, _from_sessions)

            {

                mutex = _done_mutex;
                done = _done;
                from_sessions = _from_sessions;
                router_out = std::make_unique<galapagos::router_net_out<T> >(kernel_info_table, from_sessions, done, mutex, my_address);

                sc_ptr = std::make_unique<galapagos::net::tcp::session_container <T> >(kernel_info_table, my_address, _done, _done_mutex, router_out.get());
                ss_ptr = std::make_unique<galapagos::net::tcp::server_send <T> >(port, &io_context, sc_ptr.get(), _done, _done_mutex, _from_node); 
                if(enabled){
                    as_ptr = std::make_unique<galapagos::net::tcp::accept_server <T> >(&io_context, port, sc_ptr.get());
                }
                io_context.run();

            }


            template<class T>
            void galapagos::net::tcp::tcp<T>::start(){

                ;
            }

            template<class T>
            void galapagos::net::tcp::tcp<T>::run_context(){

                io_context.run();
            }


            template<class T>
            void galapagos::net::tcp::tcp<T>::test(){

                
                std::thread test(&galapagos::net::tcp::tcp<T>::test_func, this); 
                test.join();


            }

            template<class T>
            void galapagos::net::tcp::tcp<T>::test_func(){

                std::vector<T> vect;

                int dest;
                
                if((from_sessions->size() == 0)){
                    vect = from_sessions->read(&dest);
                    std::cout << "size of test is " << vect.size() << std::endl;
                    std::string test = (char *)vect.data();
                    std::cout << "test is " << test << std::endl;
                }



            }




            template<class T>
            void galapagos::net::tcp::tcp<T>::stop(){


                {
                    boost::asio::high_resolution_timer tim(io_context, 2s);
                    tim.async_wait(Handler{});

                    std::this_thread::sleep_for(500ms);

                    io_context.stop();
                }
                t_context->join(); 

            }



#endif
