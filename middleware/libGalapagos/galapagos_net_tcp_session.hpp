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
#include "galapagos_interface.hpp"

#include "common.hpp"



namespace galapagos{
    namespace net{
	 
/** @brief Class for the tcp_session 

    TCP session, individual session per each kernel not within this node. 
    Contains an interface in, and interface out
    @author Naif Tarafdar 
    @date April 20, 2019
    */
	template<class T>
    	class tcp_session
    	{
    	public:
    	    tcp_session(boost::asio::ip::tcp::socket _socket, 
    	            boost::asio::io_context * _io_context, 
    	            std::mutex * _mutex_packets_in_flight,
    	            int * _packets_in_flight,
                    bool * _done, 
                    std::mutex *_mutex, 
		    short _id,
		    std::shared_ptr <spdlog::logger> _logger
    	           );
    	    ~tcp_session(){socket.close();}
    	    void start();
	    interface <T>*  get_m_axis();
	    interface <T>*  get_s_axis();
	    short my_id;
    	private:
    	    void do_read();
    	    void do_write();
	    bool is_done();
    	    enum { max_length = MAX_BUFFER };
    	    boost::asio::ip::tcp::socket socket;
    	    boost::asio::io_context * io_context;
    	    interface<T>  s_axis;
    	    interface<T>  m_axis;
	    _num_threadsafe packets_in_flight;
	    _done_struct done_struct;
            std::shared_ptr<spdlog::logger> logger;
    	};

/** @brief Class for the session_container. Addressable by dest. 

    Vector of sessions, addressable by dest. Contains helping functions that can help address sessions by ip_addrs. Allows user to send data into session and has router to arbitrate from m_axis of each session to the output.
    @author Naif Tarafdar 
    @date April 20, 2019
    */
        template<class T>
        class tcp_session_container {
            public:
                tcp_session_container(
                                  std::vector <std::string> & _kernel_info_table,
                                  std::string  & my_address,
                                  bool * _done,
                                  std::mutex * _mutex,
                                  n_to_one_router <T> * _router_out,
                                  std::mutex * _mutex_packets_in_flight,
                                  int * _packets_in_flight, 
		    		  std::shared_ptr <spdlog::logger> _logger
                                  );
                void add_session(boost::asio::ip::tcp::socket _socket, boost::asio::io_context * io_context);
                std::string get_ip_addr(short dest);
                bool send(std::string ip_addr, char * data, int size, short dest, short src);
                bool find(std::string _ip_addr);
                void start();
                bool barrier();
		interface<T> * get_s_axis(std::string ip_addr);
            private:
                std::mutex  mutex;
                std::vector <tcp_session<T> * > my_sessions;
                std::vector<std::string>ip_addrs;
                std::map<std::string, int>ip_addrs_index;
                std::map<std::string, int>my_session_map;
                std::vector <boost::asio::ip::tcp::socket>  sockets; 
                n_to_one_router <T> * router_out;
                std::vector <std::string> kernel_info_table;
                _num_threadsafe packets_in_flight;
                _done_struct done_struct;
                std::shared_ptr<spdlog::logger> logger;

        };
        
    }//net namespace
}//galapagos namespace

using namespace galapagos::net;

/**Constructor for galapagos::net::tcp_session
@tparam T the type of data used within each galapagos packet (default ap_uint<64>)
@param[in] _socket tcp socket that has been made and moved into session 
@param[in] _io_context pointer to io_context needed to communicate over socket
@param[in] _mutex_packets_in_flight mutex associated with packets_in_flight
@param[in] _packets_in_flight stores how many packets have left the router to be consumed by external drivers 
@param[in] _done pointer to boolean that indicates node is done processing all local kernels 
@param[in] _done_mutex mutex managing _done pointer
@param[in] shared_ptr of logger used globally to log
*/
template <class T>
tcp_session<T>::tcp_session(boost::asio::ip::tcp::socket  _socket, 
                    boost::asio::io_context * _io_context,
                    std::mutex * _mutex_packets_in_flight,
                    int * _packets_in_flight,
                    bool * _done, 
                    std::mutex *_mutex,
		    short _id,
		    std::shared_ptr <spdlog::logger> _logger
                    )
    :socket(std::move(_socket)),
s_axis(std::string("tcp_session_") + std::to_string(_id) + std::string("_s_axis"), _logger),
m_axis(std::string("tcp_session_") + std::to_string(_id) + std::string("_m_axis"), _logger)
{

    packets_in_flight.mutex = _mutex_packets_in_flight;
    packets_in_flight.num = _packets_in_flight;
    
    io_context = _io_context;
    
    done_struct.done = _done;
    done_struct.mutex = _mutex;
    logger = _logger;
    my_id = _id;
    logger->info("Created tcp_session:{0:d}", my_id); 

}

template <class T>
galapagos::interface<T> * tcp_session<T>::get_s_axis()
{
    return &s_axis;
}


template <class T>
galapagos::interface<T> * tcp_session<T>::get_m_axis()
{
    return &m_axis;
}



/**Starts the tcp session read and write functions
@tparam T the type of data used within each galapagos packet (default ap_uint<64>)
*/
template <class T>
void tcp_session<T>::start()
{
    std::thread t_read(&tcp_session<T>::do_read, this);
    std::thread t_write(&tcp_session<T>::do_write, this);
    t_read.detach();
    t_write.detach();
    logger->info("Started tcp_session:{0:d}", my_id); 
}


/**Reads from socket and writes to session output
@tparam T the type of data used within each galapagos packet (default ap_uint<64>)
*/
template <class T>
void tcp_session<T>::do_read()
{
    int length;
    
    do{
    
        socket.wait(boost::asio::ip::tcp::socket::wait_read);
        int avail = socket.available();
        if(avail>0){
            boost::system::error_code error;
            {
                char data[MAX_BUFFER];
                length = socket.read_some(boost::asio::buffer(data, avail), error);
                T * header = (T *)data;
                int dest = (int)header->range(31,24);
                int id = (int)header->range(23,16);
                int size = (int)header->range(15,0);
            	m_axis.packet_write(data + sizeof(T), size, dest, id);
            }
        }
    }while(!is_done());



}

/**Returns if node is done
@tparam T the type of data used within each galapagos packet (default ap_uint<64>)
@returns if node is done 
*/
template <class T> 
bool tcp_session<T>::is_done(){
    
    std::lock_guard<std::mutex> guard(*done_struct.mutex);
    return *done_struct.done;
}


/**Reads from input and writes to socket
@tparam T the type of data used within each galapagos packet (default ap_uint<64>)
*/
template <class T>
void tcp_session<T>::do_write()
{

    do{
        packets_in_flight.mutex->lock();
        if(!s_axis.empty()){
            try{
        	std::lock_guard<std::mutex> guard(*s_axis.get_mutex());
        	boost::asio::write(socket, boost::asio::buffer(s_axis.get_unsafe_head_buffer()->data, s_axis.get_unsafe_head_buffer()->size + sizeof(T)));
		
            }
            catch(std::exception& e)
            {
                std::cout << "ERROR " << std::endl;
        	boost::asio::write(socket, boost::asio::buffer(s_axis.get_unsafe_head_buffer()->data, s_axis.get_unsafe_head_buffer()->size + sizeof(T)));
            }
        }
        *packets_in_flight.num = *packets_in_flight.num - 1;
        packets_in_flight.mutex->unlock();
    }while(!is_done());

}


/**Constructor for galapagos::net::tcp_session_container
@tparam T the type of data used within each galapagos packet (default ap_uint<64>)
@param[in] _kern_info_table stores node addresses of all kernels indexed by dest 
@param[in] my_address node network address 
@param[in] _done pointer to boolean that indicates node is done processing all local kernels 
@param[in] _done_mutex mutex managing _done pointer
@param[in] _router_out pointer to router that gets output of all sessions and arbitrates to connection 
@param[in] _mutex_packets_in_flight mutex associated with packets_in_flight
@param[in] _packets_in_flight stores how many packets have left the router to be consumed by external drivers 
@param[in] shared_ptr of logger used globally to log
*/
template <class T>
tcp_session_container<T>::tcp_session_container(
                                        std::vector <std::string> & _kernel_info_table,
                                        std::string & my_address,
                                        bool * _done,
                                        std::mutex * _mutex,
                                        galapagos::n_to_one_router <T> * _router_out,
                                        std::mutex * _mutex_packets_in_flight,
                                        int * _packets_in_flight,
		    		  	std::shared_ptr <spdlog::logger> _logger
        ){

    _logger->info("tcp_session_container constructor");
    _logger->flush();

    router_out = _router_out;
    packets_in_flight.mutex = _mutex_packets_in_flight;
    packets_in_flight.num = _packets_in_flight;
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

    done_struct.done = _done;
    done_struct.mutex = _mutex;
}




/**Adds a new session of a particular socket 
@tparam T the type of data used within each galapagos packet (default ap_uint<64>)
@param[in] _socket tcp socket that has been made and moved into session 
@param[in] _io_context pointer to io_context needed to communicate over socket
*/
template <class T>
void tcp_session_container<T>::add_session(boost::asio::ip::tcp::socket  _socket, boost::asio::io_context * io_context){

    std::lock_guard <std::mutex> lock(mutex);
    
    std::string ip_addr = _socket.remote_endpoint().address().to_string();
    my_sessions.push_back((new tcp_session<T>(std::move(_socket), io_context, packets_in_flight.mutex, packets_in_flight.num, done_struct.done, done_struct.mutex, my_sessions.size(), logger)));
    my_session_map[ip_addr] = my_sessions.size()-1;

    router_out->add_s_axis(my_sessions[my_sessions.size()-1]->get_s_axis());
    my_sessions[my_sessions.size()-1]->start();

}

/**Checks if a session exists with ip_addr 
@tparam T the type of data used within each galapagos packet (default ap_uint<64>)
@returns if session with ip_addr exists 
*/
template <class T>
bool tcp_session_container<T>::find(std::string _ip_addr){


    std::map<std::string, int>::iterator it;
    it = my_session_map.find(_ip_addr);

    if(it == my_session_map.end())
        return false;
    else 
        return true;

}

/**Gets ip_addr of kern dest 
@tparam T the type of data used within each galapagos packet (default ap_uint<64>)
@returns ip_addr 
*/
template <class T>
std::string tcp_session_container<T>::get_ip_addr(short dest){

    return kernel_info_table[dest];

}


/**Gets input interface of a session 
@tparam T the type of data used within each galapagos packet (default ap_uint<64>)
@param[in] ip_addr session indexed by ip_addr 
@returns pointer of input interface 
*/
template <class T>
galapagos::interface<T> * tcp_session_container<T>::get_s_axis(std::string ip_addr){
    
    return my_sessions[my_session_map[ip_addr]]->get_s_axis();

}


#endif
