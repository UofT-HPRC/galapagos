#ifndef __GALAPAGOS_COMMON_HPP__   // if x.h hasn't been included yet...
#define __GALAPAGOS_COMMON_HPP__

#include <mutex>
#include <thread>
#include <condition_variable>

#if LOG_LEVEL > 0
#include "spdlog/spdlog.h"
#include "spdlog/sinks/basic_file_sink.h"
#endif

namespace galapagos{

    typedef struct{
       bool * done;
       std::mutex  * mutex;
    }_done_struct; //<! pointer to done that is set outside the router, routing function will stop when done is asserted and no more packets left in router

    typedef struct{
       int * num;
       std::mutex  * mutex;
    }_num_threadsafe; //<! pointer to done that is set outside the router, routing function will stop when done is asserted and no more packets left in router


    class done_clean{
        public:
#if LOG_LEVEL > 0
            done_clean(bool * _done, std::mutex * _mutex, std::shared_ptr<spdlog::logger> _logger);
#endif
            done_clean(bool * _done, std::mutex * _mutex);
	        _done_struct done_struct;
            bool is_done();
            void wait_for_clean();
            void clean();
            ~done_clean(){;}
        private:
            std::mutex mutex_clean_up;
            bool clean_status;
            std::condition_variable cv_clean_up;
#if LOG_LEVEL > 0
            std::shared_ptr<spdlog::logger> logger;
#endif
    };


    #define POWER_2(x) (1ULL << (x))

    template <class T>
    T range(short msb, short lsb, T source, size_t value){
        short size = msb - lsb + 1;
        T max_value = POWER_2(size) - 1;
        T value_bitmask = ~(max_value << lsb);

        T source_masked = source & value_bitmask;
        return source_masked | ((value & max_value) << lsb);
    }

    // this conflicts with the one below
    // template <class T>
    // T range(short bit, T source, size_t value){
    //     return range(bit, bit, source, value);
    // }

    template <class T>
    T range(short msb, short lsb, T source){
        short size = msb - lsb + 1;
        T max_value = POWER_2(size) - 1;
        return (source >> lsb) & max_value;
    }

}

#endif
