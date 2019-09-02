//===============================
// AUTHOR     : Naif Tarafdar
// CREATE DATE     : April 20, 2019
//===============================

#ifndef __GALAPAGOS_STREAM_HPP__   // if x.h hasn't been included yet...
#define __GALAPAGOS_STREAM_HPP__

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

#include "galapagos_packet.h"
#include "spdlog/spdlog.h"
#include "spdlog/sinks/basic_file_sink.h"

#define MAX_BUFFER 180 //flits approximately of MTU size 

namespace galapagos{
    /* Struct of buffer used to store entire packets
    *
    */
    typedef struct{
        char data[MAX_BUFFER*8];
        short dest;
        short id;
        size_t size;
    }buffer;




/*
 *Stream used within Galapagos
 *
 *@tparam T the type of data used within each galapagos packet (default ap_uint<64>)
 *
 *
 *
 */
    template <class T> 
    class stream{
        private:
            
            std::mutex  mutex;
            std::condition_variable cv;
            std::shared_ptr<spdlog::logger> logger;
            std::string name;
            std::list <galapagos::buffer> packets;
        
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
        public:
            stream(std::string _name, std::shared_ptr<spdlog::logger> _logger);
            void write(galapagos::stream_packet <T> gps);
            galapagos::stream_packet<T> read();
            bool empty();
            size_t size();
            void batch_write(char * data, int size, short dest, short id);
            char * batch_read(size_t * size, short * dest, short * id);
    };

}

typedef galapagos::stream <ap_uint <PACKET_DATA_LENGTH> > galapagos_stream;

/*
 *Constructor for galapagos::stream
 *
 *@tparam T the type of data used within each galapagos packet (default ap_uint<64>)
 *@param[in] name of stream, used for logging purposes
 *@param[in] shared_ptr of logger used globally to log
 *
 */

template <class T> 
galapagos::stream<T>::stream(
                    std::string _name,        
                    std::shared_ptr<spdlog::logger> _logger
        ){
    name = _name;
    logger = _logger;
    logger->info("Making stream {0}", name);
    read_in_prog_addr = 0;
    write_in_prog_addr = 0;
    curr_read_it = packets.end();
}


/*
 * Read single flit for galapagos::stream
 *
 *@tparam T the type of data used within each galapagos packet (default ap_uint<64>)
 *@returns single flit of galapagos packet
 *
 */

template <class T> 
galapagos::stream_packet <T> galapagos::stream<T>::read(){
   

    //if not in progress get a new available buffer from beginning of list
    {
        std::unique_lock<std::mutex> lock(mutex);
        if(!read_in_prog_addr)
        {
            while (packets.empty()) {
                cv.wait(lock);
            }
            logger->debug("New Stream Read:{0}", name); 
            curr_read_it = packets.begin();

        }
        else{
            logger->debug("In Prog Stream Read:{0}", name); 
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
    assert(read_in_prog_addr < curr_read_it->size);

    if(read_in_prog_addr == (curr_read_it->size - 1)){
        std::unique_lock<std::mutex> lock(mutex);
        gps.last = 1;
        read_in_prog_addr = 0;
        packets.erase(curr_read_it);
        curr_read_it = packets.end();
    }
    else{
        gps.last = 0;

    }

    logger->debug("Stream {0} read data:{1:x}, dest{2:x}, last{3:d}", name, gps.data, gps.dest, gps.last); 

    return gps;
}

/*
 * Write single flit for galapagos::stream
 *
 *@tparam T the type of data used within each galapagos packet (default ap_uint<64>)
 *@param[in] gps single flit of galapagos packet to write
 *
 */
template <class T> 
void galapagos::stream<T>::write(galapagos::stream_packet <T> gps){
    
    //if not in progress get a new available buffer from end of list
    if(!write_in_prog_addr)
    {
        logger->debug("New Stream Write:{0}", name); 
        std::lock_guard<std::mutex> guard(mutex);
        curr_write.dest = gps.dest;
        curr_write.id = gps.id;
    }
    else{
        logger->debug("In Prog Stream Write:{0}", name); 
    }
        
    
    //once buffer available write flit to buffer and update address
    memcpy((char *)curr_write.data + write_in_prog_addr, (char *)&gps.data, sizeof(T));
    write_in_prog_addr += sizeof(T);
    logger->debug("Stream {0} write data:{1:x}, dest{2:x}", name, gps.data, gps.dest); 
   
    //last flit, moving to list
    if (gps.last){
        curr_write.size = write_in_prog_addr +1;
        {
            std::lock_guard<std::mutex> guard(mutex);
            write_in_prog_addr = 0;
            packets.push_back(std::move(curr_write)); 
            cv.notify_one();
        }
        //once buffer pushed and available for consumption
        logger->debug("Stream {0} write last flit, adding to list", name); 
    }

}


/*
 *Get size of an available buffer to read 
 *
 *@tparam T the type of data used within each galapagos packet (default ap_uint<64>)
 *@returns size of buffer in head of list
 *
 */
template <class T> 
size_t galapagos::stream<T>::size(){
    size_t ret; 
    std::lock_guard<std::mutex> guard(mutex);
    //list empty return 0
    if(!packets.size())
        ret = 0;
    else{
        ret = (packets.begin()->size - read_in_prog_addr)/8;
    }
    return ret;
}



/*
 * Executes a batch write, this function is not portable between CPU and FPGA
 * Please be careful to rewrite CPU functions to use an individual flit write when porting
 * to HLS
 *
 *
 *@tparam T the type of data used within each galapagos packet (default ap_uint<64>)
 *@param[in] data buffer to be written
 *@param[in] size size of buffer
 *
 */
template <class T> 
void galapagos::stream<T>::batch_write(char * data, int size, short dest, short id){

    //size must be divisible by 8
    assert(size % 8 == 0);

    //data must fit in MTU
    assert(size <= (MAX_BUFFER*8));
    
        
    curr_write.dest = dest;
    curr_write.id = id;
    memcpy((char *)curr_write.data, (char *)data, size);
    
    std::lock_guard<std::mutex> guard(mutex);
    packets.push_back(std::move(curr_write)); 
    cv.notify_one();
        
    logger->debug("Stream {0} batch_write (CPU only) of {1:d} bytes", name, size); 
}

/*
 * Executes a batch read, this function is not portable between CPU and FPGA
 * Please be careful to rewrite CPU functions to use an individual flit write when porting
 * to HLS
 *
 *
 *@tparam T the type of data used within each galapagos packet (default ap_uint<64>)
 *@param[out] _size size of buffer
 *@param[out] _dest dest of buffer
 *@param[out] _id id of buffer
 *@returns buffer pointing to batch of data 
 *
 */
template <class T> 
char * galapagos::stream<T>::batch_read(size_t * _size, short * _dest, short * _id){

    char * ret;
    {
        std::unique_lock<std::mutex> lock(mutex);
        if(!read_in_prog_addr)
        {
            while (packets.empty()) {
                cv.wait(lock);
            }
            logger->debug("New Stream Read:{0}", name); 
            curr_read_it = packets.begin();

        }
    }

    size_t buff_size = curr_read_it->size;
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

/*
 *Get if buffer is empty
 *
 *@tparam T the type of data used within each galapagos packet (default ap_uint<64>)
 *@returns bool representing if buffer is empty
 *
 *
 */
template <class T> 
bool galapagos::stream<T>::empty(){
    bool ret = (size()==0);
    return ret;
}

#endif
