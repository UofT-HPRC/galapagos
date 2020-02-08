#ifndef control_device_hpp
#define control_device_hpp

#include "util.h"

#include<iostream>
#include<string>
using namespace  std;

class control_device {
    public:
        control_device(std::string, bool);
        void * dev_read(off_t ,size_t );
        void dev_write(void * , off_t , size_t );
    private:
        int fd;
        void * get_page_map();
        bool axi_full;

};

#endif // guard
