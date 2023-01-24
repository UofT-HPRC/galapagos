//===============================
// AUTHOR     : Naif Tarafdar
// CREATE DATE     : April 20, 2019
//===============================

#ifndef __GALAPAGOS_NET_TCP_SESSION_HPP__   // if x.h hasn't been included yet...
#define __GALAPAGOS_NET_TCP_SESSION_HPP__

#include <cstdlib>
#include <iostream>
#include <thread>
#include <memory>
#include <utility>
#include <boost/asio.hpp>
#include "galapagos_stream.hpp"
#include "galapagos_streaming_core.hpp"
#include "galapagos_router_net.hpp"


#define NUM_FLITS_PAYLOAD 170

namespace galapagos{
    namespace net{
        namespace tcp{
            
            template<class T>
            class session: public streaming_core<T>
            {
            public:
                session(boost::asio::ip::tcp::socket _socket, 
                        boost::asio::io_context * _io_context, 
                        std::mutex * _mutex_packets_in_flight,
                        int * _packets_in_flight
                       );
                ~session(){socket.close(); 
#ifdef DEBUG
                         std::cout << "DESTROYING SOCKET" << std::endl;
#endif    
                }
                void start();
                void send(char * data, int size, short dest, short src);
                void set_id(short _id);
                bool barrier();
            private:
                void do_read();
                void do_write();
                void try_write();
                void writePacketVector(std::vector < std::vector<T> > & packetVector);
                enum { max_length = 1024 };
                char data_[max_length];
                bool read;
                bool write;
                boost::asio::ip::tcp::socket socket;
                boost::asio::io_context * io_context;
                //std::unique_ptr <galapagos::stream<T> > s_axis;
                //std::unique_ptr <galapagos::stream<T> > m_axis;
                galapagos::stream<T>  s_axis;
                galapagos::stream<T>  m_axis;
                std::mutex * mutex_packets_in_flight;
                int * packets_in_flight;
            };

            template<class T>
            class session_container {
                public:
                    session_container(
                                      std::vector <std::string> & _kernel_info_table,
                                      std::string  & my_address,
                                      bool * _done,
                                      std::mutex * _mutex,
                                      router_net_out <T> * _router_out,
                                        std::mutex * _mutex_packets_in_flight,
                                        int * _packets_in_flight
                                      );
                    session <T> * add_session(boost::asio::ip::tcp::socket _socket, boost::asio::io_context * io_context);
                    std::string get_ip_addr(short dest);
                    bool send(std::string ip_addr, char * data, int size, short dest, short src);
                    bool find(std::string _ip_addr);
                    void start();
                    bool barrier();
                private:
                    std::mutex  mutex;
                    std::vector <session<T> * > my_sessions;
                    std::vector<std::string>ip_addrs;
                    std::map<std::string, int>ip_addrs_index;
                    std::map<std::string, int>my_session_map;
                    std::vector <boost::asio::ip::tcp::socket>  sockets; 
                    router_net_out <T> * router_out;
                    std::vector <std::string> kernel_info_table;
                    std::mutex * mutex_packets_in_flight;
                    int * packets_in_flight;
                    

            };

            
        
        }//tcp namespace
    }//net namespace
}//galapagos namespace

using namespace galapagos::net::tcp;

template <class T>
session<T>::session(boost::asio::ip::tcp::socket  _socket, 
                    boost::asio::io_context * _io_context,
                    std::mutex * _mutex_packets_in_flight,
                    int * _packets_in_flight
                    
                    
                    )
    :galapagos::streaming_core<T>(-1), socket(std::move(_socket))
{

    mutex_packets_in_flight = _mutex_packets_in_flight;
    packets_in_flight = _packets_in_flight;

    
    this->in = &s_axis;
    this->out = &m_axis;
    io_context = _io_context;

    
    read = true;   
    write = true;


}


template <class T>
void session<T>::send(char * data, int size, short dest, short src){

    this->in->write(data, size, dest, src);
}


template <class T>
void session<T>::set_id(short _id){
    
    this->id= _id;


}

template <class T>
void session<T>::start()
{
    std::thread t_read(&session<T>::do_read, this);
    std::thread t_write(&session<T>::do_write, this);
    t_read.detach();
    t_write.detach();
}


template <class T>
void session<T>::do_read()
{
    int length;

    
    
    while(1){
    
        socket.wait(boost::asio::ip::tcp::socket::wait_read);
        int avail = socket.available();
        if(avail>0){

#ifdef DEBUG
            std::cout << "RECEIVED ON NETWORK " << avail << " BYTES " << std::endl;
#endif
            boost::system::error_code error;
            {
                char data[max_length];
                length = socket.read_some(boost::asio::buffer(data, avail), error);
                ap_uint <64> * header = (ap_uint<64> *)data;
                
               
                int dest = (int)header->range(31,24);
                int src = (int)header->range(23,16);
                int size = (int)header->range(15,0);
#ifdef DEBUG
                std::cout << "RECEIVED FIRST FLIT OF " << std::hex << *header << std::endl;
                std::cout << "DEST " << std::hex << dest << " SRC " << src << std::dec << " SIZE " << size << std::endl;
#endif
                this->out->write(data + sizeof(ap_uint<64>), size, dest, src);
            }
        }
    }



}


//HARDCODED FOR 64 BIT 
template <class T>
void makePacketVector(std::vector< std::vector<T> > & packetVector, std::vector<T> &_payload, int dest, int src){

    T header;


    std::vector <T> test;
    header.range(63,32) = 0; //last = 0
    header.range(31,24) = dest;
    header.range(23,16) = src;
    header.range(15,0) = NUM_FLITS_PAYLOAD * 8;

    int index = 0;
    for(int i=0; i<_payload.size(); i++){
        if (i%NUM_FLITS_PAYLOAD == 0){
            test.push_back(header);
            packetVector.push_back(test);
            index++;
        }
        packetVector[index-1].push_back(_payload[i]);
    }

    packetVector[index-1][0].range(63,32)= 1; //last = 1
    packetVector[index-1][0].range(15,0) = packetVector[index-1].size()*8;


}

    
template <class T>
void session<T>::writePacketVector(std::vector < std::vector<T> > &packetVector)
{
    
    for(int i=0; i<packetVector.size(); i++){
        boost::asio::write(socket, boost::asio::buffer(packetVector[i].data(), packetVector[i].size()*8));
#ifdef DEBUG
        std::cout << "PACKET NUMBER " << i << std::endl;
        for(int j=0; j<packetVector[i].size() ;j++){
            std::cout << "FLIT " << j << " WRITTEN TO SOCKET " << std::hex << packetVector[i][j] << std::endl;
        }
#endif

    }
    std::cout << std::dec;


}


template <class T>
void session<T>::try_write()
{
    
    int dest_src;
    int dest, src;
    std::vector <T> vect_in = this->in->read(&dest, &src);

    std::vector < std::vector <T> > packetVector;
    makePacketVector(packetVector, vect_in, dest, src);
    writePacketVector(packetVector);


    (*packets_in_flight)-=vect_in.size();
#ifdef DEBUG
    std::cout << "PACKETS IN FLIGHT " << *packets_in_flight << std::endl;
#endif


}

template <class T>
void session<T>::do_write()
{


    //while(write){
    while(1){
       
      
        mutex_packets_in_flight->lock();
        if(!this->in->empty()){
            try{
                try_write();

            }
            catch(std::exception& e)
            {
                std::cout << "ERROR " << std::endl;
                try_write();
            }
        }
        mutex_packets_in_flight->unlock();
    }

}

template <class T>
bool session<T>::barrier()
{

    if(s_axis.size()>0){
        return true;
    }
    if(m_axis.size()>0){
        return true;
    }
    

}

template <class T>
session_container<T>::session_container(
                                        std::vector <std::string> & _kernel_info_table,
                                        std::string & my_address,
                                        bool * _done,
                                        std::mutex * _mutex,
                                        galapagos::router_net_out <T> * _router_out,
                                        std::mutex * _mutex_packets_in_flight,
                                        int * _packets_in_flight
        ){


    router_out = _router_out;
    mutex_packets_in_flight = _mutex_packets_in_flight;
    packets_in_flight = _packets_in_flight;
    std::vector<std::string>::iterator it;

    for(unsigned int i=0; i<_kernel_info_table.size(); i++){
        kernel_info_table.push_back(_kernel_info_table[i]);
        if(_kernel_info_table[i] != my_address){
            it=std::find(ip_addrs.begin(), ip_addrs.end(), _kernel_info_table[i]);
            if(it == ip_addrs.end()){
                ip_addrs.push_back(_kernel_info_table[i]);
                ip_addrs_index[_kernel_info_table[i]] = ip_addrs.size() -1;
            }
        }
    }

    router_out->start();
}


template <class T>
void session_container<T>::start(){
    for(int i=0; i<my_sessions.size(); i++){
        my_sessions[i]->start();
    }
}

template <class T>
bool session_container<T>::barrier(){
    bool cont = false;
    
    for(int i=0; i<my_sessions.size(); i++){
        
        if(my_sessions[i]->barrier()){
            cont = true;
            break;
        }
    }
    return cont;
}




template <class T>
galapagos::net::tcp::session <T> * session_container<T>::add_session(boost::asio::ip::tcp::socket  _socket, boost::asio::io_context * io_context){


    //get mutex
    std::lock_guard <std::mutex> lock(mutex);
    
    std::string ip_addr = _socket.remote_endpoint().address().to_string();
    my_sessions.push_back((new session<T>(std::move(_socket), io_context, mutex_packets_in_flight, packets_in_flight)));
    my_session_map[ip_addr] = my_sessions.size()-1;

    my_sessions[my_sessions.size()-1]->set_id(ip_addrs_index[ip_addr]);
    router_out->add_socket(my_sessions[my_sessions.size()-1]);
    my_sessions[my_sessions.size()-1]->start();
    return my_sessions[my_sessions.size()-1];

}

template <class T>
bool session_container<T>::find(std::string _ip_addr){


    std::map<std::string, int>::iterator it;
    it = my_session_map.find(_ip_addr);

    if(it == my_session_map.end())
        return false;
    else 
        return true;

}

template <class T>
std::string session_container<T>::get_ip_addr(short dest){


    return kernel_info_table[dest];

}


template <class T>
bool session_container<T>::send(std::string ip_addr, char * data, int size, short dest, short src){


    if(!find(ip_addr))
        return false;

    my_sessions[my_session_map[ip_addr]]->send(data, size, dest, src);
    //my_sessions[my_session_map[ip_addr]].send(data, size, dest);

    return true;
}



#endif
