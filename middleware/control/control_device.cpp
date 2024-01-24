#include "control_device.hpp"


int control_device::open_device_file(std::string file_name){
   
    int fd;
    if ((fd = open(file_name.c_str(), O_RDWR | O_SYNC)) == -1) FATAL;
    std::cout << "Character device " << file_name << " opened" << std::endl;


    return fd;

}

control_device::control_device(std::string device_name, bool _logging, int _offset_ctrl, int _offset_dma){


    std::string dev_name_axil = device_name + "_user";
    std::string dev_name_h2c = device_name + "_h2c_0";
    std::string dev_name_c2h = device_name + "_c2h_0";
    fd_axil = open_device_file(dev_name_axil);
    fd_c2h = open_device_file(dev_name_c2h);
    fd_h2c = open_device_file(dev_name_h2c);
    
    map_base = mmap(0, MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd_axil, 0);
    if (map_base == (void *) -1) FATAL;
    logging=_logging;
    offset_ctrl = _offset_ctrl;
    offset_dma = _offset_dma;

}

void *control_device::dev_read_axil(off_t target, size_t size){

    void * ret_addr = malloc(size);
    void * virt_addr =(void *)((char *)map_base + target + offset_ctrl);
    memcpy(ret_addr, virt_addr, size);
    return ret_addr;
}


void *control_device::dev_read_dma(off_t target, size_t size){
    

    size_t rc;
   
    void * ret_addr = aligned_alloc(DMA_ALIGNMENT, size+DMA_ALIGNMENT);

    if(target){
        rc = lseek(fd_c2h, target + offset_dma, SEEK_SET);
        if(rc != target) FATAL;
    }
    rc = read(fd_c2h, ret_addr, size);

    return ret_addr;
    
}

void control_device::dev_write_axil(void * data, off_t target, size_t size){
    
    void * virt_addr =(void *)((char *)map_base + target + offset_ctrl);
    memcpy(virt_addr, data, size);


}


void control_device::dev_write_dma(void * data, off_t target, size_t size){


    void * data_aligned = aligned_alloc(DMA_ALIGNMENT, size+DMA_ALIGNMENT);
    memcpy(data_aligned, data, size);
    
    size_t rc;
    if(target){
        rc = lseek(fd_h2c, target + offset_dma, SEEK_SET);
        if(rc != target) FATAL;
    }
    rc = write(fd_h2c, data_aligned, size);

}



