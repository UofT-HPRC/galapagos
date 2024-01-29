
#define INTERFACE_100G
#include <cstddef>
#include <cstring>
#include <fstream>
#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#ifdef CPU
#include "../packet_size.h"
#include "../galapagos_interface.hpp"
#else
#include "galapagos_packet.h"
#endif
#include "kern.hpp"


void kern_send(short id, 
        galapagos_interface * in, 
        galapagos_interface  * out
        )
{


#pragma HLS INTERFACE axis register both port=out
#pragma HLS INTERFACE axis register both port=in
    

    for (int i=0; i<N; i++){
        T data_array[F];
        for(int j=0; j<F; j++){
            for(int k=0; k<PACKET_DATA_LENGTH/8; k++){
                data_array[j]((k+1)*8-1,k*8) = k; //packs data to lower half of flit
            }
            #ifdef CPU
            std::cout<< "Sending Flit " << std::hex << data_array[j] << std::dec << std::endl;
            #endif
        }
	    #ifdef CPU
        out->packet_write((char *)data_array, F, id+1, id);
        #else
        for(int i=0; i<F; i++){
            galapagos_packet data;
            data.dest = id+1;
            data.keep = KEEP_ALL;
            data.last = (i == (F-1));
            data.data = data_array[i];
            out->write(data);
        }
        #endif

    
    }

    for(int i=0; i<N; i++){
        size_t size;
        short dest, id;
	    #ifdef CPU
        T * data_array = (T *)in->packet_read(&size, &dest, &id);
        #endif
        
        #ifdef CPU
        for(int i=0; i<F; i++){
            std::cout<< "Loopback Flit " << std::hex << data_array[i] << std::dec << std::endl;
        }
        #endif

    }

}


void kern_loopback(short id, 
        galapagos_interface * in, 
        galapagos_interface  * out
        )
{


#pragma HLS INTERFACE axis register both port=out
#pragma HLS INTERFACE axis register both port=in
   

    for(int i=0; i<N; i++){
        size_t size;
        short dest, src_id;
	    #ifdef CPU
        T * data_array = (T *)in->packet_read(&size, &dest, &id);
        #endif

        for(int j=0; j<F; j++){
            #ifdef CPU
            std::cout<< "Received Flit " << std::hex << data_array[j] << std::dec << std::endl;
            data_array[j]++;
            #else
            galapagos_packet data;
            data = in->read();
            ap_uint<16> sender;
            sender = data.id;
            data.id = id;
            data.dest = sender;
            out->write(data);
            #endif
        }
	    
	    #ifdef CPU
        out->packet_write((char *)data_array, F, id, id-1);
        #endif

        
    }

}
