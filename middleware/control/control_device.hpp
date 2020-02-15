#ifndef control_device_hpp
#define control_device_hpp

#include "util.h"

#include<iostream>
#include<string>
using namespace  std;

#define DMA_ALIGNMENT 4096

class control_device {
    public:
        control_device(std::string);
        void * dev_read_axil(off_t ,size_t );
        void dev_write_axil(void * , off_t , size_t );
        void * dev_read_dma(off_t ,size_t );
        void dev_write_dma(void * , off_t , size_t );
    private:
        int fd_axil;
        int fd_c2h;
        int fd_h2c;
        void * map_base;
        void * get_page_map();
        bool axi_full;
        int open_device_file(std::string);
};

#endif // guard
