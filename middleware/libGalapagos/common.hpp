#ifndef __GALAPAGOS_COMMON_HPP__   // if x.h hasn't been included yet...
#define __GALAPAGOS_COMMON_HPP__

#include "spdlog/spdlog.h"
#include "spdlog/sinks/basic_file_sink.h"

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
            done_clean(bool * _done, std::mutex * _mutex, std::shared_ptr<spdlog::logger> _logger);
	        _done_struct done_struct;
            bool is_done();
            void wait_for_clean();
            void clean();
            ~done_clean(){;}
        private:
            std::mutex mutex_clean_up;
            bool clean_status;
            std::condition_variable cv_clean_up;
            std::shared_ptr<spdlog::logger> logger;

    };

}


galapagos::done_clean::done_clean(
                                    bool * _done,
                                    std::mutex * _mutex,
                                    std::shared_ptr<spdlog::logger> _logger
                                    )
{
    done_struct.done = _done;
    done_struct.mutex = _mutex;
    clean_status = false;
    logger = _logger;
}



bool galapagos::done_clean::is_done(){
    std::lock_guard<std::mutex> guard(*done_struct.mutex);
    return *done_struct.done;
}

void galapagos::done_clean::wait_for_clean(){

    
    std::unique_lock<std::mutex> lock(mutex_clean_up);
    logger->info("In wait_for clean");
    logger->flush();
    while(!clean_status)
         cv_clean_up.wait(lock);
    logger->info("after wait_for clean");
    logger->flush();
}

void galapagos::done_clean::clean(){

    {
        std::unique_lock<std::mutex> lock(mutex_clean_up);
        clean_status = true;
    }
    cv_clean_up.notify_one();

}

#endif
