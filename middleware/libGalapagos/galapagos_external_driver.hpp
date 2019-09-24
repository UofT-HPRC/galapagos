//===============================
// AUTHOR     : Naif Tarafdar
// CREATE DATE     : September 24, 2019
//===============================

#ifndef __GALAPAGOS_EXTERNAL_DRIVER_HPP__   // if x.h hasn't been included yet...
#define __GALAPAGOS_EXTERNAL_DRIVER_HPP__
        
namespace galapagos{
    template<class T>
    class external_driver{
        public:
            external_driver(
                std::mutex * _done_mutex, 
                bool * _done,
                std::mutex * _mutex_packets_in_flight,
                int * _packets_in_flight,
                std::shared_ptr <spdlog::logger> _logger
                );
            ~external_driver(){}
            virtual interface<T> * get_s_axis() = 0; 
            virtual interface<T> * get_m_axis() = 0;
	    virtual void start() = 0;

	protected: 
	    _done_struct done_struct;
	    _num_threadsafe packets_in_flight;
            std::shared_ptr <spdlog::logger> logger;
	    
    };
}//galapagos namespace


template<class T>
galapagos::external_driver<T>::external_driver(
    std::mutex * _done_mutex, 
    bool * _done,
    std::mutex * _mutex_packets_in_flight,
    int * _packets_in_flight,
    std::shared_ptr <spdlog::logger> _logger
    ){

    done_struct.mutex = _done_mutex;    
    done_struct.done = _done;    
    logger = _logger;
    packets_in_flight.num = _packets_in_flight;
    packets_in_flight.mutex = _mutex_packets_in_flight;

}
#endif
