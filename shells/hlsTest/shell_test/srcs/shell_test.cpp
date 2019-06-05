#include "shell_test.h"

#define MODE_STREAM 1
#define MODE_NOT 2
#define MODE_WRITE_0 3
#define MODE_WRITE_1 4

void shell_test(
    long long* mem_0, // global memory pointer
    long long* mem_1,
    hls::stream<ap_axis>* stream_in,                
    hls::stream<ap_axis>* stream_out,
    volatile int mode,
    volatile int address,
    volatile char dest
){

    #pragma HLS INTERFACE axis port=stream_in
    #pragma HLS INTERFACE axis port=stream_out
    #pragma HLS INTERFACE m_axi port=mem_0 depth=8
    #pragma HLS INTERFACE m_axi port=mem_1 depth=8
    #pragma HLS INTERFACE s_axilite port=mode bundle=ctrl_bus
    #pragma HLS INTERFACE s_axilite port=dest bundle=ctrl_bus
    #pragma HLS INTERFACE s_axilite port=address bundle=ctrl_bus
    #pragma HLS INTERFACE ap_ctrl_none port=return

    ap_axis stream_packet;
    int mem_addr;
    int offset;

    static ap_uint<3> state = 0;

    switch(state){
        case 0:{
            while(stream_in->empty());
            state = mode + 1;
            break;
        }
        case MODE_STREAM:{
            do{
                stream_packet = stream_in->read();
                stream_packet.dest = dest;
                stream_out->write(stream_packet);
            } while(!stream_packet.last);
            state = 0;
            break;
        }
        case MODE_NOT:{
            do{
                stream_packet = stream_in->read();
                stream_packet.data = ~stream_packet.data;
                stream_packet.dest = dest;
                stream_out->write(stream_packet);
            } while(!stream_packet.last);
            state = 0;
            break;
        }
        case MODE_WRITE_0:{
            stream_packet = stream_in->read();
            mem_0[address] = stream_packet.data(31,0);
            state = 0;
            break;
        }
        case MODE_WRITE_1:{
            stream_packet = stream_in->read();
            mem_1[address] = stream_packet.data(31,0);
            state = 0;
            break;
        }
        default:{
            state = 0;
        }
    }
}
