//===============================
// AUTHOR     : Naif Tarafdar
// CREATE DATE     : April 20, 2019
//===============================

#ifndef __GALAPAGOS_INTERFACE_HPP__   // if x.h hasn't been included yet...
#define __GALAPAGOS_INTERFACE_HPP__

#include <iostream>

#include <cstddef>
#include <cstring>
#include "ap_int.h"
#include "hls_stream.h"
#include "ap_utils.h"

#include <memory>
#include <mutex>
#include <condition_variable>

#include <list>
#include <iterator>

#include "common.hpp"
#include "galapagos_packet.h"


#if LOG_LEVEL > 0
#include "spdlog/spdlog.h"
#include "spdlog/sinks/basic_file_sink.h"
#include "spdlog/fmt/bin_to_hex.h"
#endif


#define JUMBO_FRAME

#ifdef JUMBO_FRAME
#define MAX_BUFFER 1124 //flits approximately of MTU size
#else
#define MAX_BUFFER 180 //flits approximately of MTU size
#endif

namespace galapagos{
    /** Struct of buffer used to store entire packets
    */
    typedef struct{
        char data[(MAX_BUFFER+1)*64];
        short dest;
        short id;
        size_t size;
    }buffer;


/** @brief Class for the Galapagos Interface.

    Threadsafe for single producer, single consumer. Gives user an interface to read/write flits and entire packets.
    Packets internally are stored in linked-list and can be spliced to other linked-lists.
    The flit interface reads from the head packet of the linked-list and writes to the tail packet.
    @author Naif Tarafdar
    @date April 20, 2019
    */
    template <class T>
    class interface{
        private:
            void prepare(std::string _name);
            std::mutex  mutex;
            std::condition_variable cv;
#if LOG_LEVEL > 0
            std::shared_ptr<spdlog::logger> logger;
#endif
            std::list <galapagos::buffer> packets;

            //needed for size
            std::mutex  write_in_prog_mutex;
            // Keeps track of in progress operations
            // In progress means that we are reading/writing a single flit from the middle
            // of a packet
            size_t write_in_prog_addr;
            size_t read_in_prog_addr;

            //Pointer to list node that are operation is in progress of
            std::list<galapagos::buffer>::iterator curr_read_it;
            galapagos::buffer curr_write;

            short write_id;
            short write_dest;
            short read_id;
            short read_dest;
            std::vector <size_t> filter_indices;
    	    char filter[MAX_BUFFER];
	        bool filter_status;
	        void filter_function(char *packet, int size);
        public:
#if LOG_LEVEL > 0            
            interface(std::string _name, std::shared_ptr<spdlog::logger> _logger);
#endif
            interface(std::string _name);
            std::string name;
            void write(galapagos::stream_packet <T> gps);
            galapagos::stream_packet<T> read();
            bool empty();
            size_t size();
            void packet_write(char * data, int size, short dest, short id);
            void packet_write_partial(char * data, int size, bool assert_last);
            char * packet_read(size_t * size, short * dest, short * id);
            void packet_read(char * mem, size_t * size, short * dest, short * id);
            char * packet_read(size_t * _size);
	        void set_filter(size_t pos, char byte);
	        short get_head_dest();

	    //used to splice into another list
    	    std::mutex * get_mutex();
            std::list <galapagos::buffer> * get_packets();
	        std::condition_variable * get_cv();
	        void splice(galapagos::interface<T> * _interface);

	    //used when writing to network socket
	        std::list<buffer>::iterator get_unsafe_head_buffer();
	        void delete_unsafe_head_buffer();
	        std::list<buffer> * get_unsafe_list();

     };

}

#if LOG_LEVEL > 0
/**Constructor for galapagos::interface
 @tparam T the type of data used within each galapagos packet (default ap_uint<64>)
 @param[in] name of stream, used for logging purposes
 @param[in] shared_ptr of logger used globally to log
*/
template <class T>
galapagos::interface<T>::interface(
                    std::string _name,
                    std::shared_ptr<spdlog::logger> _logger
        ){
    logger = _logger;
    logger->info("Making Galapagos Interface:{}", _name);
    prepare(_name);
}

#endif

template <class T>
galapagos::interface<T>::interface(
                    std::string _name
        ){
    prepare(_name);
}


template <class T>
void galapagos::interface<T>::prepare(
                    std::string _name
        ){
    name = _name;
    read_in_prog_addr = 0;
    write_in_prog_addr = 0;
    curr_read_it = packets.end();
    filter_status = false;



}
                    
template <class T>
short galapagos::interface<T>::get_head_dest(){

    std::unique_lock<std::mutex> lock(mutex);
    return packets.begin()->dest;
}




/**Read single flit for galapagos::interface
 @tparam T the type of data used within each galapagos packet (default ap_uint<64>)
 @returns single flit of galapagos packet
 */
template <class T>
galapagos::stream_packet <T> galapagos::interface<T>::read(){


    //if not in progress get a new available buffer from beginning of list
    {
        std::unique_lock<std::mutex> lock(mutex);
        if(!read_in_prog_addr)
        {
            while (packets.empty()) {
                cv.wait(lock);
            }
            
#if LOG_LEVEL > 0            
            logger->debug("New Flit Read:{0}", name);
#endif
            curr_read_it = packets.begin();
	        read_in_prog_addr = sizeof(T);
        }
    }
    //once buffer available return flit of buffer and update address
    //
    //

    assert(curr_read_it != packets.end());

    galapagos::stream_packet <T> gps;
    memcpy((char *)&gps.data, (char *)curr_read_it->data + read_in_prog_addr, sizeof(T));

    {
        //since using read_in_prog_addr in size calc we need this to be atomic
        std::unique_lock<std::mutex> lock(mutex);
        read_in_prog_addr += sizeof(T);
    }

    gps.dest = curr_read_it->dest;
    gps.id = curr_read_it->id;
    assert(read_in_prog_addr <= (curr_read_it->size + sizeof(T)));

    if(read_in_prog_addr == (curr_read_it->size + sizeof(T))){
        std::unique_lock<std::mutex> lock(mutex);
        gps.last = 1;
        read_in_prog_addr = 0;
        packets.erase(curr_read_it);
#if LOG_LEVEL > 0
        logger->debug("Interface:{0} read last flit");
#endif
        curr_read_it = packets.end();
    }
    else{
        gps.last = 0;
    }

#if LOG_LEVEL > 0
    logger->debug("Interface:{0} read data:{1:x}, dest:{2:x}, last:{3:d}, at address:{4:d}, size of packet:{5:d}", name, gps.data, gps.dest, gps.last, read_in_prog_addr, curr_read_it->size);
#endif

    return gps;
}



/**Helper function for filtering packets
@tparam T the type of data used within each galapagos packet (default ap_uint<64>)
@param[in] gps single flit of galapagos packet to write
*/
template <class T>
void galapagos::interface<T>::filter_function(char *packet, int size){

    if(filter_status){
        bool pass = true;
	for(unsigned int i=0; i<filter_indices.size(); i++){
	    pass= pass & (filter[filter_indices[i]] == packet[filter_indices[i]]);
	    if(!pass)
	        break;
        }
        if(pass){
#if LOG_LEVEL > 0
        logger->info("FILTER********************");
        logger->info("{0}:packet:{1:n}", name, spdlog::to_hex(packet, packet+size));
#endif
	    }
    }
}

/**Write single flit for galapagos::interface
@tparam T the type of data used within each galapagos packet (default ap_uint<64>)
@param[in] gps single flit of galapagos packet to write
*/
template <class T>
void galapagos::interface<T>::write(galapagos::stream_packet <T> gps){

    //if not in progress get a new available buffer from end of list
    if(!write_in_prog_addr)
    {

#if LOG_LEVEL > 0
        logger->info("New Flit Write:{0}", name);
#endif
        std::lock_guard<std::mutex> guard(mutex);
        curr_write.dest = gps.dest;
        curr_write.id = gps.id;
    	write_in_prog_addr = sizeof(T);

    }


    //once buffer available write flit to buffer and update address
    memcpy((char *)curr_write.data + write_in_prog_addr, (char *)&gps.data, sizeof(T));

    {
        std::lock_guard<std::mutex> guard(write_in_prog_mutex);
    	write_in_prog_addr += sizeof(T);
    }

    //last flit, moving to list
    if (gps.last){

	    {
            std::lock_guard<std::mutex> guard(write_in_prog_mutex);
	        curr_write.size = write_in_prog_addr - sizeof(T);
    	    T header;
            header = galapagos::range(sizeof(T)*8 - 1, 32, 0, 0); //last = 0
    	    header = galapagos::range(31, 24, header, curr_write.dest);
            header = galapagos::range(23, 16, header, curr_write.id);
            header = galapagos::range(15, 0, header, curr_write.size/sizeof(T));
            memcpy((char *)curr_write.data, (char *)&header, sizeof(T));
	    }
        {
            std::lock_guard<std::mutex> guard(mutex);
            write_in_prog_addr = 0;
            packets.push_back(std::move(curr_write));
	        filter_function(curr_write.data, curr_write.size);
            cv.notify_one();
        }
        //once buffer pushed and available for consumption
#if LOG_LEVEL > 0
        logger->info("Interface:{0} write last flit, adding to list, with dest:{1:x}, with size:{2:d}, packets size:{3:d}", name, curr_write.dest, curr_write.size, size());
        logger->flush();
#endif
    }
    else{
#if LOG_LEVEL > 0
        logger->info("Interface:{0} write flit data:{1:x}", name, gps.data);
        logger->flush();
#endif

    }

}


template <class T>
std::list<galapagos::buffer>::iterator galapagos::interface<T>::get_unsafe_head_buffer(){

    return packets.begin();

}

template <class T>
std::list<galapagos::buffer> * galapagos::interface<T>::get_unsafe_list(){

    return &packets;

}

template <class T>
void galapagos::interface<T>::delete_unsafe_head_buffer(){

    packets.erase(packets.begin());

}

/**Gets number of packets in list, plus if any packets are being written in progress
@tparam T the type of data used within each galapagos packet (default ap_uint<64>)
@returns size of buffer in head of list
*/
template <class T>
size_t galapagos::interface<T>::size(){
    size_t ret;
    std::lock_guard<std::mutex> guard(mutex);

    ret = packets.size();
    //std::lock_guard<std::mutex> _guard(write_in_prog_mutex);
    //if(write_in_prog_addr>0)
    //ret++;

    return ret;
}



/**Executes a packet write, this function is not portable between CPU and FPGA. Please be careful to rewrite CPU functions to use an individual flit write when porting to HLS
@tparam T the type of data used within each galapagos packet (default ap_uint<64>)
@param[in] data buffer to be written
@param[in] size size of buffer
*/
template <class T>
void galapagos::interface<T>::packet_write(char * data, int size, short dest, short id){

#if LOG_LEVEL > 0
    logger->debug("Start Stream {0} batch_write (CPU only)", name);
#endif
    //size must be divisible by 8
//    assert(size % 8 == 0);

    //data must fit in MTU
    assert((size) <= (MAX_BUFFER));

    curr_write.size = size * sizeof(T);
    //curr_write.size = size;
    curr_write.dest = dest;
    curr_write.id = id;


    T header;
    // header.range(sizeof(T)*8-1,32) = 0; //last = 0
    // header.range(31,24) = dest;
    // header.range(23,16) = id;
    // header.range(15,0) = size;
    header = galapagos::range(sizeof(T)*8 - 1, 32, 0, 0); //last = 0
    header = galapagos::range(31, 24, header, dest);
    header = galapagos::range(23, 16, header, id);
    header = galapagos::range(15, 0, header, size);


    memcpy((char *)curr_write.data, &header, sizeof(T));
    memcpy((char *)curr_write.data + sizeof(T), (char *)data, size * sizeof(T));

    

    std::lock_guard<std::mutex> guard(mutex);
    packets.push_back(std::move(curr_write));
    cv.notify_one();

    filter_function(data, size);
#if LOG_LEVEL > 0
    logger->debug("Stream {0} batch_write (CPU only) of {1:d} bytes, size of packets is{2:d}", name, size*sizeof(T), packets.size());
#endif
}

/**Executes a partial packet write (the regular write should be called prior to initialize), this function is not portable between CPU and FPGA. Please be careful to rewrite CPU functions to use an individual flit write when porting to HLS
@tparam T the type of data used within each galapagos packet (default ap_uint<64>)
@param[in] data buffer to be written
@param[in] size size of buffer
*/
template <class T>
void galapagos::interface<T>::packet_write_partial(char * data, int size, bool assert_last){

#if LOG_LEVEL > 0
    logger->debug("Start Stream {0} batch_write (CPU only)", name);
#endif
    //size must be divisible by 8
//    assert(size % 8 == 0);

    //data must fit in MTU
    assert((size) <= (MAX_BUFFER));

    
    //curr_write.size = size;
    // curr_write.dest = dest;
    // curr_write.id = id;

    //once buffer available write flit to buffer and update address
    memcpy((char *)curr_write.data + write_in_prog_addr, data, size*sizeof(T));

    {
        std::lock_guard<std::mutex> guard(write_in_prog_mutex);
    	write_in_prog_addr += size * sizeof(T);
    }

    //last flit, moving to list
    if (assert_last){

	    {
            std::lock_guard<std::mutex> guard(write_in_prog_mutex);
	        curr_write.size = write_in_prog_addr - sizeof(T);
    	    T header;
            header = galapagos::range(sizeof(T)*8 - 1, 32, 0, 0); //last = 0
    	    header = galapagos::range(31, 24, header, curr_write.dest);
            header = galapagos::range(23, 16, header, curr_write.id);
            header = galapagos::range(15, 0, header, curr_write.size/sizeof(T));
            memcpy((char *)curr_write.data, (char *)&header, sizeof(T));
	    }
        {
            std::lock_guard<std::mutex> guard(mutex);
            write_in_prog_addr = 0;
            packets.push_back(std::move(curr_write));
	        filter_function(curr_write.data, curr_write.size);
            cv.notify_one();
            #if LOG_LEVEL > 0
            logger->debug("Stream {0} last partial_batch_write (CPU only) of {1:d} bytes, size of packets is{2:d}", name, size*sizeof(T), packets.size());
            #endif
        }
    }

    #if LOG_LEVEL > 0
    else{
        logger->debug("Stream {0} partial_batch_write (CPU only) of {1:d} bytes, size of packets is{2:d}", name, size*sizeof(T), packets.size());
    }
    #endif
}

/**Executes a packet read, this function is not portable between CPU and FPGA. Please be careful to rewrite CPU functions to use an individual flit write when porting to HLS
@tparam T the type of data used within each galapagos packet (default ap_uint<64>)
@param[out] _size size of buffer
@param[out] _dest dest of buffer
@param[out] _id id of buffer
@returns buffer pointing to batch of data
*/
template <class T>
char * galapagos::interface<T>::packet_read(size_t * _size, short * _dest, short * _id){

    char * ret;
    {
        std::unique_lock<std::mutex> lock(mutex);
        if(!read_in_prog_addr)
        {
            while (packets.empty()) {
                cv.wait(lock);
            }
#if LOG_LEVEL > 0
            logger->debug("New Stream Read:{0}", name);
#endif
            curr_read_it = packets.begin();
	        read_in_prog_addr = sizeof(T);
        }
    }

    size_t buff_size = curr_read_it->size - read_in_prog_addr + sizeof(T);

    *_dest = curr_read_it->dest;
    *_id = curr_read_it->id;
    *_size = buff_size;

    ret = (char *)malloc(buff_size);
    memcpy((char *)ret, (char *)curr_read_it->data + read_in_prog_addr, buff_size);
    {
        std::unique_lock<std::mutex> lock(mutex);
        read_in_prog_addr = 0;
        packets.erase(curr_read_it);
        curr_read_it = packets.end();
    }
    return ret;
}

/**Executes a packet read, this function is not portable between CPU and FPGA. Please be careful to rewrite CPU functions to use an individual flit write when porting to HLS
@tparam T the type of data used within each galapagos packet (default ap_uint<64>)
@param[in] mem memory to store read data in. No bounds checking (memory must be large enough to hold data)
@param[out] _size size of buffer
@param[out] _dest dest of buffer
@param[out] _id id of buffer
@returns buffer pointing to batch of data
*/
template <class T>
void galapagos::interface<T>::packet_read(char * mem, size_t * _size, short * _dest, short * _id){

    char * ret;
    {
        std::unique_lock<std::mutex> lock(mutex);
        if(!read_in_prog_addr)
        {
            while (packets.empty()) {
                cv.wait(lock);
            }
#if LOG_LEVEL > 0
            logger->debug("New Stream Read:{0}", name);
#endif
            curr_read_it = packets.begin();
	        read_in_prog_addr = sizeof(T);
        }
    }

    size_t buff_size = curr_read_it->size - read_in_prog_addr + sizeof(T);
    *_dest = curr_read_it->dest;
    *_id = curr_read_it->id;
    *_size = buff_size;

    // ret = (char *)malloc(buff_size);
    memcpy((char *)mem, (char *)curr_read_it->data + read_in_prog_addr, buff_size);
    {
        std::unique_lock<std::mutex> lock(mutex);
        read_in_prog_addr = 0;
        packets.erase(curr_read_it);
        curr_read_it = packets.end();
    }
    // return ret;
}

/**Executes a packet read, this function is not portable between CPU and FPGA. Please be careful to rewrite CPU functions to use an individual flit write when porting to HLS
@tparam T the type of data used within each galapagos packet (default ap_uint<64>)
@param[out] _size size of buffer
@returns buffer pointing to batch of data
*/
template <class T>
char * galapagos::interface<T>::packet_read(size_t * _size){

    char * ret;
    {
        std::unique_lock<std::mutex> lock(mutex);
        if(!read_in_prog_addr)
        {
            while (packets.empty()) {
                cv.wait(lock);
            }
#if LOG_LEVEL > 0
            logger->debug("New Stream Read:{0}", name);
#endif
            curr_read_it = packets.begin();
	        read_in_prog_addr = sizeof(T);
        }
    }

    size_t buff_size = curr_read_it->size - read_in_prog_addr + sizeof(T);
    *_size = buff_size;

    ret = (char *)malloc(buff_size);
    memcpy((char *)ret, (char *)curr_read_it->data + read_in_prog_addr, buff_size);
    {
        std::unique_lock<std::mutex> lock(mutex);
        read_in_prog_addr = 0;
        packets.erase(curr_read_it);
        curr_read_it = packets.end();
    }
    return ret;
}

/**Get if buffer is empty
@tparam T the type of data used within each galapagos packet (default ap_uint<64>)
@returns bool representing if buffer is empty
*/
template <class T>
bool galapagos::interface<T>::empty(){
    bool ret = (size()==0);
    return ret;
}

/**Set a filter for logging when streaming out on the packet level
@tparam pos postion of byte in packet to check
@tparam byte actual byte value
*/
template <class T>
void galapagos::interface<T>::set_filter(size_t pos, char byte){
    filter_status = true;
    assert(pos < MAX_BUFFER);
    filter[pos] = byte;
    filter_indices.push_back(pos);
    assert(filter_indices.size() <= MAX_BUFFER);
}



/**Get pointer to mutex, needed to splice
@returns pointer to mutex for list
*/
template <class T>
std::mutex * galapagos::interface<T>::get_mutex(){
    return &mutex;
}

/**Get pointer to list of packets, needed to splice
@returns pointer to list of packets
*/
template <class T>
std::list <galapagos::buffer> * galapagos::interface<T>::get_packets(){
    return &packets;
}


/**Get pointer to list of cv, needed to splice
@returns pointer to list of packets
*/
template <class T>
std::condition_variable * galapagos::interface<T>::get_cv(){
    return &cv;
}

/**Splices last element of _interface->packets into beginning of packets. The splice moves pointer and should be O(1)
@tparam _interface is the interface which we are reading from
*/
template <class T>
void galapagos::interface<T>::splice(galapagos::interface<T> * _interface){

#if LOG_LEVEL > 0
    logger->debug("Start Spliced from {0} to {1}", _interface->name, name);
#endif
    {
        std::unique_lock<std::mutex> _lock(*(_interface->get_mutex()));
    	while (_interface->get_packets()->empty()) {
    		_interface->get_cv()->wait(_lock);
    	}
    }
    std::unique_lock<std::mutex> _lock(*(_interface->get_mutex()));
    std::list <galapagos::buffer>::iterator _it = _interface->get_packets()->begin();
    //_it--;

    //at this point we have safely got last element of other interface
    std::unique_lock<std::mutex> lock(mutex);
    packets.splice(packets.end(), *(_interface->get_packets()), _it);
    cv.notify_one();

    _it = packets.end();
    _it--;
#if LOG_LEVEL > 0
    logger->debug("Spliced from {0} to {1} of size {2:d}", _interface->name, name, _it->size);
#endif
}

typedef galapagos::interface <ap_uint<PACKET_DATA_LENGTH> > galapagos_interface;
// typedef galapagos::interface <T> galapagos_interface;
#endif
