#ifndef __GALAPAGOS_COMMON_HPP__   // if x.h hasn't been included yet...
#define __GALAPAGOS_COMMON_HPP__

namespace galapagos{

    typedef struct{
       bool * done;
       std::mutex  * mutex;
    }_done_struct; //<! pointer to done that is set outside the router, routing function will stop when done is asserted and no more packets left in router

    typedef struct{
       int * num;
       std::mutex  * mutex;
    }_num_threadsafe; //<! pointer to done that is set outside the router, routing function will stop when done is asserted and no more packets left in router

}

#endif
