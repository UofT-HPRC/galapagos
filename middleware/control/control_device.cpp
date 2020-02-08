#include "control_device.hpp"

control_device::control_device(std::string device_name, bool _axi_full){

    if ((fd = open(device_name.c_str(), O_RDWR | O_SYNC)) == -1) FATAL;
    std::cout << "Character device " << device_name << " opened" << std::endl;

    axi_full = _axi_full;


}

void * control_device::get_page_map(){
    
    void * map_base;
    map_base = mmap(0, MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
    if (map_base == (void *) -1) FATAL;
    return map_base;
}

void *control_device::dev_read(off_t target, size_t size){
    
    void * ret_addr = malloc(size);
    
    if(!axi_full){
        void * map_base = get_page_map();
        void * virt_addr =(void *)((char *)map_base + target);
        memcpy(ret_addr, virt_addr, size);
    }
    else{
        size_t rc;
        if(target){
            rc = lseek(fd, target, SEEK_SET);
            if(rc != target) FATAL;
        }
        rc = read(fd, ret_addr, size);

    }
    return ret_addr;
    
}


void control_device::dev_write(void * data, off_t target, size_t size){


    if(!axi_full){
        void * map_base = get_page_map();
        void * virt_addr =(void *)((char *)map_base + target);
        memcpy(virt_addr, data, size);
    }
    else{
        size_t rc;
        if(target){
            rc = lseek(fd, target, SEEK_SET);
            if(rc != target) FATAL;
        }
        rc = write(fd, data, size);
    }
}



