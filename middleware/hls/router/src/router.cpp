//===============================
// AUTHOR     : Naif Tarafdar
// CREATE DATE     : June 20, 2018
//===============================

#include "galapagos_packet.h"
#include "ap_int.h"
#include "hls_stream.h"
#include "ap_utils.h"

#include "router.hpp"




void router(
	
        const ap_uint<NETWORK_HEADER_LENGTH> network_table[256],
        const ap_uint <NETWORK_HEADER_LENGTH> network_addr,
        galapagos_interface & stream_in,
	galapagos_interface  & stream_out_switch,
	galapagos_interface  & stream_out_network,
        volatile ap_uint<NETWORK_HEADER_LENGTH> * addr_out,
        volatile int * state_out

){
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS INTERFACE axis register both port=stream_in
#pragma HLS INTERFACE axis register both port=stream_out_switch
#pragma HLS INTERFACE axis register both port=stream_out_network
#pragma HLS INTERFACE bram port=network_table
#pragma HLS PIPELINE II=1


	galapagos_packet packetIn;
	galapagos_packet packetOut;

	//bool inFPGA = false;
	
        static enum sState {TX_IDLE = 0, TX_WRITE_SWITCH, TX_WRITE_NETWORK} sinkState;
        
        switch(sinkState){
            case TX_IDLE: 
                if(!stream_in.empty()){
                    packetIn = stream_in.read();
                    int index = packetIn.dest;
                    ap_uint <NETWORK_HEADER_LENGTH> network_addr_in = network_table[index * 4];
                    *addr_out = network_addr_in;
                    if(network_addr_in == network_addr){
                        sinkState = TX_WRITE_SWITCH;
                        stream_out_switch.write(packetIn); 
                    }
                    else{
                        sinkState = TX_WRITE_NETWORK;
                        stream_out_network.write(packetIn); 
                    }
                }
                break;
            case TX_WRITE_SWITCH:
                if(!stream_in.empty()){
                    packetIn = stream_in.read();
                    if(packetIn.last)
                        sinkState = TX_IDLE;
                    stream_out_switch.write(packetIn);
                }
                break;
            case TX_WRITE_NETWORK:
                if(!stream_in.empty()){
                    packetIn = stream_in.read();
                    if(packetIn.last)
                        sinkState = TX_IDLE;
                    stream_out_network.write(packetIn);
                }
                break;
            default:
                sinkState = TX_IDLE;
                break;
        }

        *state_out = (int)sinkState;


//	if(!stream_in.empty()){
//		packetIn = stream_in.read();
//
//                packetOut.data = packetIn.data;
//                packetOut.last = packetIn.last;
//                packetOut.keep = packetIn.keep;
//                packetOut.dest = packetIn.dest;
//                packetOut.id = packetIn.id;
//#ifdef PACKET_USER_LENGTH
//#if PACKET_USER_LENGTH > 0
//                packetOut.user = packetIn.user;
//#endif
//#endif
//        network_addr_in = network_table[packetIn.dest];
//        *addr_out = network_addr_in;
//        inFPGA = (network_addr == network_addr_in);
//        
//        if(inFPGA){
//        	stream_out_switch.write(packetOut);
//        }
//        else{
//        	stream_out_network.write(packetOut);
//        }
//	}


}
