#include "hls_stream.h"
#include "ap_int.h"

struct ap_axis{
    ap_uint<64> data;
    ap_uint<1> last;
    ap_uint<8> keep;
};


#define STREAM 0
#define DMA 1


void dma_example(
             ap_uint<64>  * mem ,            // global memory pointer
             hls::stream<ap_axis> *stream_in,                
             hls::stream<ap_axis> *stream_out
        )            
{
#pragma HLS INTERFACE s_axilite port=return

    
#pragma HLS INTERFACE axis port=stream_in
#pragma HLS INTERFACE axis port=stream_out
#pragma HLS INTERFACE m_axi port=mem depth=1024

    ap_axis stream_packet;

    stream_out->write(stream_in->read());

    stream_packet = stream_in->read();

    int mem_addr;
    if(stream_packet.data == STREAM)
        stream_out->write(stream_in->read());
    else{
        stream_packet = stream_in->read();
        mem_addr = stream_packet.data;
        int offset = 0;
        while(!stream_packet.last){
            stream_packet = stream_in->read();
            mem[mem_addr + offset] = stream_packet.data;
	    offset++;
        }
    }
}
