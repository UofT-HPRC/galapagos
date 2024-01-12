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
#if LOG_LEVEL>0
            external_driver(
                std::shared_ptr <spdlog::logger> _logger
                );
#endif
            external_driver(){;}
            ~external_driver(){;}
	        virtual void init(done_clean * _dc, int * _packets_in_flight, std::mutex * _mutex_packets_in_flight) = 0;
            virtual interface<T> * get_s_axis() = 0; 
            virtual interface<T> * get_m_axis() = 0;
	        virtual void start() = 0;

	protected: 
        done_clean * dc;
	    _num_threadsafe packets_in_flight;
#if LOG_LEVEL>0
        std::shared_ptr <spdlog::logger> logger;
#endif
	    
    };
}//galapagos namespace

#if LOG_LEVEL>0
template<class T>
galapagos::external_driver<T>::external_driver(
    std::shared_ptr <spdlog::logger> _logger
    ){

    logger = _logger;

}
#endif

#endif
