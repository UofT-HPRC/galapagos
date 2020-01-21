#include "common.hpp"
#include "math.h"

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
