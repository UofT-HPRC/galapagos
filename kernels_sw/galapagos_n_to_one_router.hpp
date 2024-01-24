//===============================
// AUTHOR     : Naif Tarafdar
// CREATE DATE     : April 20, 2019
//===============================


#ifndef __GALAPAGOS_N_TO_ONE_ROUTER_HPP__   // if x.h hasn't been included yet...
#define __GALAPAGOS_N_TO_ONE_ROUTER_HPP__


#include "common.hpp"

/**external port indices
* all external ports, , currently just have network but can be more (e.g PCIe)
*/


namespace galapagos{

/** @brief Class for the n_to_one_router 

    A software implementation of an n to one router, used by network node to arbitrade output of sessions into the node.
    Routes between input interfaces(s_axis) and an output interface(m_axis).
    @author Naif Tarafdar 
    @date April 20, 2019
    */
    template<class T>
    class n_to_one_router{
        private:
#if LOG_LEVEL > 0        
            std::shared_ptr<spdlog::logger> logger;
#endif
		
	        _done_struct done_struct;            

	        std::vector <interface <T> *  >  s_axis_ptr; //<! array storing pointers to the input ports of the router
	        interface <T> m_axis;
	        std::mutex s_axis_mutex;
	        std::unique_ptr <std::thread> t;
        public:
#if LOG_LEVEL > 0        
            n_to_one_router(
                        done_clean * _dc,
                        std::shared_ptr<spdlog::logger> _logger
                        );
#endif
            n_to_one_router(done_clean * _dc);

            void route(); //!< routing function, can be overridden for different routers
            void add_s_axis(interface <T> * _s_axis); //!< adds a pair of axis interfaces to the router
            void start(); //!< starts the routing function
            unsigned int num_packets(); //!< returns current number of packets within the router
            ~n_to_one_router();
	    interface <T> * get_m_axis();
            done_clean * dc;
    };
    

}


#if LOG_LEVEL > 0
/**N to one Router constructor
@tparam T the type of data used within each galapagos packet (default ap_uint<64>)
@param[in] _done indicates if the local node has finished processing, tells the routing function to finish routing
@param[in] _mutex mutex associated with _done
@param[in] _logger shared pointer to logger 
*/
template <class T> 
galapagos::n_to_one_router<T>::n_to_one_router(
                                    done_clean * _dc,
                                    std::shared_ptr<spdlog::logger> _logger
                                    )
:m_axis(std::string("tcp_m_axis"), _logger)
{
    dc = _dc;
    logger = _logger;
    logger->info("Created n to one router");
    
}
#endif

template <class T> 
galapagos::n_to_one_router<T>::n_to_one_router(
                                    done_clean * _dc
                                    )
:m_axis(std::string("tcp_m_axis"))
{
    dc = _dc;
    
}

/**Adds a new interface to the list of inputs
@tparam T the type of data used within each galapagos packet (default ap_uint<64>)
@param[in] _s_axis interface to add to list
*/
template <class T> 
void galapagos::n_to_one_router<T>::add_s_axis(galapagos::interface<T> * _s_axis){

    std::lock_guard<std::mutex> lock(s_axis_mutex);
    s_axis_ptr.push_back(_s_axis);

}

/**Starts the routing function
@tparam T the type of data used within each galapagos packet (default ap_uint<64>)
*/
template <class T> 
void galapagos::n_to_one_router<T>::start(){
#if LOG_LEVEL > 0
    logger->info("Starting Router Node");
#endif
    t=std::make_unique<std::thread>(&galapagos::n_to_one_router<T>::route, this); 
    t->detach();
     
}


/**Routing function
Round robins through the m_axis (the outputs of all kernels and external drivers). Reads header_dest of interface and splices into correct s_axis based off dest. This keeps running until the done is asserted externally.
@tparam T the type of data used within each galapagos packet (default ap_uint<64>)
*/
template <class T> 
void galapagos::n_to_one_router<T>::route(){

    do{
        std::lock_guard<std::mutex> lock(s_axis_mutex);
	    for(unsigned int i=0; i<s_axis_ptr.size(); i++){
            galapagos::interface <T> * _s_axis = s_axis_ptr[i];
            if(!_s_axis->empty()){
		        m_axis.splice(_s_axis);
            }//if(!_s_axis->empty())
        }//for
    }while(!dc->is_done());

    dc->clean();
}



/**Returns number of packets within router 
@tparam T the type of data used within each galapagos packet (default ap_uint<64>)
@returns number of packets within router
*/
template <class T> 
unsigned int galapagos::n_to_one_router<T>::num_packets(){

    unsigned int num = 0;
    
    for(int i=0; i<s_axis_ptr.size(); i++){
        num += s_axis_ptr[i]->size();
    }
    
    num += m_axis.size(); 
    
    return num;


}

/**n to one destructor
@tparam T the type of data used within each galapagos packet (default ap_uint<64>)
*/
template <class T> 
galapagos::n_to_one_router<T>::~n_to_one_router(){;}


template<class T>
galapagos::interface <T> * galapagos::n_to_one_router<T>::get_m_axis()
{
    return &m_axis;
}

#endif
