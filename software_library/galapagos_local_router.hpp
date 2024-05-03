//===============================
// AUTHOR     : Naif Tarafdar
// CREATE DATE     : April 20, 2019
//===============================


#ifndef __GALAPAGOS_LOCAL_ROUTER_HPP__   // if x.h hasn't been included yet...
#define __GALAPAGOS_LOCAL_ROUTER_HPP__


#include <map>
#include <assert.h>
#include "common.hpp"
#include <mutex>
#include <condition_variable>
#include "galapagos_interface.hpp"

/**external port indices
* all external ports, , currently just have network but can be more (e.g PCIe)
*/
enum ext_port{NETWORK_EXT_INDEX};


namespace galapagos{

/** @brief Class for the local_router

    A software implementation of the node router, routing packets by dest sidechannel.
    Routes between input interfaces(s_axis) and an output interface(m_axis).
    @author Naif Tarafdar
    @date April 20, 2019
    */
    template<class T>
    class local_router{
        private:
#if LOG_LEVEL > 0            
            std::shared_ptr<spdlog::logger> logger;
#endif
    	    std::vector < std::string > kern_info_table;  //!< Stores table indexed by dest, to the node addresses
            std::string my_address; //!< my node address
            std::vector <galapagos::interface<T> * > ext_interfaces;
            std::vector <int > ext_interfaces_indices;

	        std::unique_ptr <std::thread> t; //!< runs local routing function
            std::map <int, int> dest_to_kern_ind; //!< map of dest to index on router
            int num_local; //!< number of kernels on this node



	        typedef struct{
	    	    std::mutex * mutex_packets_in_flight;
            	int * packets_in_flight;
	        }_in_flight_struct; //!< keep track of packets in flight that have left router but not yet consumed externally
	        _in_flight_struct in_flight_struct;

	        std::vector <galapagos::interface <T> *  >  s_axis_ptr; //<! array storing pointers to the input ports of the router
            std::vector <galapagos::interface <T> *  >  m_axis_ptr; //<! array storing pointers to the output ports of the router
            
            void prepare(std::vector <std::string>  _kern_info_table,
                        std::string _my_address,
                        galapagos::done_clean * _dc,
                        std::mutex * _mutex_packets_in_flight,
                        int * _packets_in_flight
                        );




        public:
#if LOG_LEVEL > 0
            local_router(std::vector <std::string>  _kern_info_table,
                        std::string _my_address,
                        galapagos::done_clean * _dc,
                        std::mutex * _mutex_packets_in_flight,
                        int * _packets_in_flight,
                        std::shared_ptr<spdlog::logger> _logger
                        );
#endif
            local_router(std::vector <std::string>  _kern_info_table,
                        std::string _my_address,
                        galapagos::done_clean * _dc,
                        std::mutex * _mutex_packets_in_flight,
                        int * _packets_in_flight
                        );


            void route(); //!< routing function, can be overridden for different routers
            void add_interface_pair(interface <T> * _s_axis, interface <T> * _m_axis); //!< adds a pair of axis interfaces to the router
            void start(); //!< starts the routing function
            unsigned int num_packets(); //!< returns current number of packets within the router
	        done_clean * dc;
            ~local_router();
    };


}

#if LOG_LEVEL>0
/**Local Router constructor
@tparam T the type of data used within each galapagos packet (default ap_uint<64>)
@param[in] _kern_info_table table storing mapping of kernel dests to node addresses
@param[in] _my_address the node address belonging to this local router
@param[in] _done indicates if the local node has finished processing, tells the routing function to finish routing
@param[in] _mutex mutex associated with _done
@param[in] _mutex_packets_in_flight mutex associated with packets_in_flight
@param[in] _packets_in_flight stores how many packets have left the router to be consumed by external drivers
@param[in] _logger shared pointer to logger
*/
template <class T>
galapagos::local_router<T>::local_router(std::vector <std::string>  _kern_info_table,
                                    std::string _my_address,
                                    galapagos::done_clean * _dc,
                                    std::mutex * _mutex_packets_in_flight,
                                    int * _packets_in_flight,
                                    std::shared_ptr<spdlog::logger> _logger
                                    )
{
    logger = _logger;
    prepare(_kern_info_table, _my_address, _dc, _mutex_packets_in_flight, _packets_in_flight);
    logger->info("Created Router Node with Local Address:{0}, {1:d} local nodes", my_address, num_local);

}
#endif

template <class T>
galapagos::local_router<T>::local_router(std::vector <std::string>  _kern_info_table,
                                    std::string _my_address,
                                    galapagos::done_clean * _dc,
                                    std::mutex * _mutex_packets_in_flight,
                                    int * _packets_in_flight
                                    )
{

    prepare(_kern_info_table, _my_address, _dc, _mutex_packets_in_flight, _packets_in_flight);


}

template <class T>
void galapagos::local_router<T>::prepare(std::vector <std::string>  _kern_info_table,
                                    std::string _my_address,
                                    galapagos::done_clean * _dc,
                                    std::mutex * _mutex_packets_in_flight,
                                    int * _packets_in_flight
                                    )
{
    dc = _dc;

    in_flight_struct.mutex_packets_in_flight = _mutex_packets_in_flight;
    in_flight_struct.packets_in_flight = _packets_in_flight;

    my_address = _my_address;
    num_local = 0;


    //stores table, and keeps track of how many of the kernels are local within the node
    for(unsigned int i=0; i<_kern_info_table.size(); i++){
        kern_info_table.push_back(_kern_info_table[i]);

        if(_kern_info_table[i] == _my_address){
            dest_to_kern_ind[i] = num_local;
            num_local++;
        }
    }



}

/**Adds a pair of streaming interfaces to the router
@tparam T the type of data used within each galapagos packet (default ap_uint<64>)
@param[in] _s_axis input of kernel
@param[out] _m_axis output of kernel
*/
template <class T>
void galapagos::local_router<T>::add_interface_pair(galapagos::interface <T> * _s_axis, galapagos::interface <T> * _m_axis){

    s_axis_ptr.push_back(_s_axis);
    m_axis_ptr.push_back(_m_axis);

}




/**Starts the routing function
@tparam T the type of data used within each galapagos packet (default ap_uint<64>)
*/
template <class T>
void galapagos::local_router<T>::start(){
#if LOG_LEVEL > 0
    logger->info("Starting Router Node with Local Address:{0}", my_address);
#endif
    t=std::make_unique<std::thread>(&galapagos::local_router<T>::route, this);
    t->detach();

}


/**Routing function
Round robins through the m_axis (the outputs of all kernels and external drivers). Reads header_dest of interface and splices into correct s_axis based off dest. This keeps running until the done is asserted externally.
@tparam T the type of data used within each galapagos packet (default ap_uint<64>)
*/
template <class T>
void galapagos::local_router<T>::route(){

#if LOG_LEVEL > 0
    logger->debug("in routing function, circling through {0:d} kernels", m_axis_ptr.size());
#endif


    do{
        for(unsigned int i=0; i<m_axis_ptr.size(); i++){
            galapagos::interface <T> * _m_axis = m_axis_ptr[i];
            if(!_m_axis->empty()){
                short head_dest = _m_axis->get_head_dest();
#if LOG_LEVEL > 0
                logger->debug("Node Routing Packet with dest:{0:x}", head_dest);
                logger->debug("Node Routing to net address:{0}, my_address is {1}", kern_info_table[head_dest], my_address);
#endif

                if (kern_info_table[head_dest] == my_address)
                {
#if LOG_LEVEL > 0
                    logger->debug("Node Routing Locally to index:{0:d}", dest_to_kern_ind[head_dest]);
#endif
		            s_axis_ptr[dest_to_kern_ind[head_dest]]->splice(_m_axis);
                }//if (kern_info_table[head_dest] == my_address)
                else
                {//currently only external routing is to network
#if LOG_LEVEL > 0
		            logger->debug("Node routing to network address {0}", kern_info_table[head_dest]);
                    logger->flush();
#endif
		            std::lock_guard <std::mutex> guard(*in_flight_struct.mutex_packets_in_flight);
		            s_axis_ptr[num_local + NETWORK_EXT_INDEX]->splice(_m_axis);
                    (*(in_flight_struct.packets_in_flight))++;
                }//else
            }//if(!_m_axis->empty())
        }//for

    }while(!dc->is_done());

    dc->clean();
}



/**Returns number of packets within router
@tparam T the type of data used within each galapagos packet (default ap_uint<64>)
@returns number of packets within router
*/
template <class T>
unsigned int galapagos::local_router<T>::num_packets(){

        unsigned int num = 0;
        static bool found_s = false;
        static bool found_m = false;
        for(unsigned int i=0; i<s_axis_ptr.size(); i++){
            int local_size = s_axis_ptr[i]->size();
            if(local_size>0 && !found_s){
#if LOG_LEVEL > 0
                logger->debug("s_axis_{0:d} has {1:d} packets", i, local_size);
#endif
                found_s = true;
            }
            num+= local_size;
        }

        //exclude packets for in flight
        for(unsigned int i=0; i<m_axis_ptr.size(); i++){
            int local_size = m_axis_ptr[i]->size();
            if(local_size>0 && !found_m){
#if LOG_LEVEL > 0
                logger->debug("M_axis_{0:d} has {1:d} packets", i, local_size);
#endif
                found_m = true;
            }
            num+= local_size;
        }

        return num;


}

/**Local router destructor
@tparam T the type of data used within each galapagos packet (default ap_uint<64>)
*/
template <class T>
galapagos::local_router<T>::~local_router(){

#if LOG_LEVEL > 0
    logger->info("In local router destructor");
#endif

}

#endif
