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


	galapagos_packet packetIn;
	galapagos_packet packetOut;

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
}

// void router(
	
//         const ap_uint<NETWORK_HEADER_LENGTH> network_table[256],
//         const ap_uint <NETWORK_HEADER_LENGTH> network_addr,
//         galapagos_interface & stream_in,
// 	galapagos_interface  & stream_out_switch,
// 	galapagos_interface  & stream_out_network

// ){
// #pragma HLS INTERFACE ap_ctrl_none port=return
// #pragma HLS INTERFACE axis register both port=stream_in
// #pragma HLS INTERFACE axis register both port=stream_out_switch
// #pragma HLS INTERFACE axis register both port=stream_out_network
// #pragma HLS INTERFACE bram port=network_table


// 	galapagos_packet packetIn;
// 	galapagos_packet packetOut;
	
//     static enum sState {TX_IDLE = 0, TX_WRITE_SWITCH, TX_WRITE_NETWORK} sinkState;
    
//     switch(sinkState){
//         case TX_IDLE: 
//             if(!stream_in.empty()){
//                 packetIn = stream_in.read();
//                 int index = packetIn.dest;
//                 ap_uint <NETWORK_HEADER_LENGTH> network_addr_in = network_table[index * 4];
//                 if(network_addr_in == network_addr){
//                     sinkState = TX_WRITE_SWITCH;
//                     stream_out_switch.write(packetIn); 
//                 }
//                 else{
//                     sinkState = TX_WRITE_NETWORK;
//                     stream_out_network.write(packetIn); 
//                 }
//             }
//             break;
//         case TX_WRITE_SWITCH:
//             if(!stream_in.empty()){
//                 packetIn = stream_in.read();
//                 if(packetIn.last)
//                     sinkState = TX_IDLE;
//                 stream_out_switch.write(packetIn);
//             }
//             break;
//         case TX_WRITE_NETWORK:
//             if(!stream_in.empty()){
//                 packetIn = stream_in.read();
//                 if(packetIn.last)
//                     sinkState = TX_IDLE;
//                 stream_out_network.write(packetIn);
//             }
//             break;
//         default:
//             sinkState = TX_IDLE;
//             break;
//     }
// }

// void router(
// 	const ap_uint<NETWORK_HEADER_LENGTH> network_table[256],
// 	const ap_uint<NETWORK_HEADER_LENGTH> network_addr,
// 	galapagos_interface& stream_in,
// 	galapagos_interface& stream_out_switch,
// 	galapagos_interface& stream_out_network

// ){
// #pragma HLS INTERFACE ap_ctrl_none port=return
// #pragma HLS INTERFACE axis port=stream_in
// #pragma HLS INTERFACE axis port=stream_out_switch
// #pragma HLS INTERFACE axis port=stream_out_network
// #pragma HLS INTERFACE bram port=network_table 

//     galapagos_packet packetIn;
//     ap_uint<NETWORK_HEADER_LENGTH> network_addr_in;
//     int index;
//     ap_uint<PACKET_USER_LENGTH> packetLen;
    
//     packetIn = stream_in.read();
    
//     index = packetIn.dest;
//     network_addr_in = network_table[index * 4];    
//     packetLen = packetIn.user;
    
    
//     for (int i=0; i<packetLen; i++) {
//         #pragma HLS pipeline ii=1
//         if (i > 0) {
//             packetIn = stream_in.read();
//         }
        
//         if (network_addr_in == network_addr)
//         {
//             stream_out_switch.write(packetIn);
//         }
//         else
//         {
//             stream_out_network.write(packetIn);
//         }
//     }
// }

// void router_verilog(

// 	const ap_uint<NETWORK_HEADER_LENGTH> network_table[256],
// 	const ap_uint<NETWORK_HEADER_LENGTH> network_addr,
// 	galapagos_interface & stream_in,
// 	galapagos_interface  & stream_out_switch,
// 	galapagos_interface  & stream_out_network

// ){
// #pragma HLS INTERFACE ap_ctrl_none port=return
// #pragma HLS INTERFACE axis port=stream_in
// #pragma HLS INTERFACE axis port=stream_out_switch
// #pragma HLS INTERFACE axis port=stream_out_network
// #pragma HLS INTERFACE bram port=network_table 

//     galapagos_packet packetIn;
//     static galapagos_packet packet_first;
//     static ap_uint <NETWORK_HEADER_LENGTH> network_addr_in;
// 	static enum sState {TX_IDLE = 0, TX_FIRST_PACKET, TX_PACKET} sinkstate;
	
//     switch(sinkstate){
//         case TX_IDLE:
//             if(!stream_in.empty())
//             {
//                 packet_first = stream_in.read();
//                 ap_uint<PACKET_DEST_LENGTH> index = packet_first.dest;
//                 network_addr_in = network_table[index];
//                 sinkstate = TX_FIRST_PACKET;
//             }
//             break;
            
//         case TX_FIRST_PACKET:
//             if(network_addr_in == network_addr)
//             {
// 				stream_out_switch.write(packet_first);
// 			}
// 			else
// 			{
// 				stream_out_network.write(packet_first);
// 			}
			
// 			if (packet_first.last)
// 			{
//                 sinkstate = TX_IDLE;
//             }
//             else
//             {
//                 sinkstate = TX_PACKET;
//             }
//             break;
            
//         case TX_PACKET:
//             if (!stream_in.empty())
//             {
//                 packetIn = stream_in.read();
                
//                 if (network_addr_in == network_addr)
//                 {
//                     stream_out_switch.write(packetIn);
//                 }
//                 else
//                 {
//                     stream_out_network.write(packetIn);
//                 }
                
//                 if (packetIn.last)
// 			    {
//                     sinkstate = TX_IDLE;
//                 }
//                 else
//                 {
//                     sinkstate = TX_PACKET;
//                 }
//             }
//             break;
            
//         default:
//             sinkstate = TX_IDLE;
//             break;
//     }
    
    
// }


// void router_backup(

// 	const ap_uint<NETWORK_HEADER_LENGTH> network_table[256],
// 	const ap_uint <NETWORK_HEADER_LENGTH> network_addr,
// 	galapagos_interface & stream_in,
// 	galapagos_interface  & stream_out_switch,
// 	galapagos_interface  & stream_out_network
// 	//volatile ap_uint<NETWORK_HEADER_LENGTH> * addr_out

// ){
// #pragma HLS INTERFACE ap_ctrl_none port=return
// #pragma HLS INTERFACE axis  port=stream_in
// #pragma HLS INTERFACE axis  port=stream_out_switch
// #pragma HLS INTERFACE axis  port=stream_out_network
// #pragma HLS INTERFACE bram port=network_table

// galapagos_packet packetIn;
// galapagos_packet packetOut;

// 	 static enum sState {TX_IDLE = 0, TX_WRITE_SWITCH, TX_WRITE_NETWORK} sinkState;

// 	 switch(sinkState){
// 		 case TX_IDLE:
// 			 if(!stream_in.empty()){
// 				 packetIn = stream_in.read();
// 				 int index = packetIn.dest;
// 				 ap_uint <NETWORK_HEADER_LENGTH> network_addr_in = network_table[index * 4];
// 				 //*addr_out = network_addr_in;
// 				 if(network_addr_in == network_addr){
// 					 sinkState = TX_WRITE_SWITCH;
// 					 stream_out_switch.write(packetIn);
// 				 }
// 				 else{
// 					 sinkState = TX_WRITE_NETWORK;
// 					 stream_out_network.write(packetIn);
// 				 }
// 			 }
// 			 break;
// 		 case TX_WRITE_SWITCH:
// 			 if(!stream_in.empty()){
// 				 packetIn = stream_in.read();
// 				 if(packetIn.last)
// 					 sinkState = TX_IDLE;
// 				 stream_out_switch.write(packetIn);
// 			 }
// 			 break;
// 		 case TX_WRITE_NETWORK:
// 			 if(!stream_in.empty()){
// 				 packetIn = stream_in.read();
// 				 if(packetIn.last)
// 					 sinkState = TX_IDLE;
// 				 stream_out_network.write(packetIn);
// 			 }
// 			 break;
// 		 default:
// 			 sinkState = TX_IDLE;
// 			 break;
// 	 }

// }
