#ifndef NETWORK_BRIDGE_TCP_HPP_INCLUDED
#define NETWORK_BRIDGE_TCP_HPP_INCLUDED



#define DATA 1
#define ENVLP 0

#define C_SYNC_ENV_PACKET 0
#define C_CLR2SND_PACKET 1
#define C_DATA_PACKET 2
#define C_ASYNC_ENV_PACKET 3

#define PORT 7

#define ENVLP_SIZE 8

#define EMPTY 1000 

#include <cstddef>
#include "ap_int.h"
#include "ap_axi_sdata.h"
#include "hls_stream.h"
#include "hls_math.h"

//extern ap_uint<32> ip_table[256];


//struct ap_axis{
//
//	ap_int <64> data;
//	ap_uint <16> dest;
//	ap_uint<1> last;
//	ap_uint <8> keep;
//};




//enum galapagos_to_tcp_interface_states {G2T_WAIT_FOR_PACKET, 
//                                        G2T_WAIT_FOR_SESSION_ID, 
//                                        G2T_CREATE_NEW_SESSION, 
//                                        G2T_WRITE_PACKET_SIZE, 
//                                        G2T_WAIT_FOR_STATUS, 
//                                        G2T_WRITE_FIRST_FLIT, 
//                                        G2T_WRITE_FLIT};
//
//enum tcp_to_galapagos_interface_states {T2G_WAIT_FOR_METADATA, 
//                                        T2G_WAIT_FOR_FIRST_FLIT, 
//                                        T2G_WAIT_FOR_SESSION_ID, 
//                                        T2G_READ_FIRST_FLIT, 
//                                        T2G_WRITE_FIRST_FLIT, 
//                                        T2G_READ_WRITE_FLIT}; 
//
//
//
#include "./toe.hpp"

//
//void tcp_to_galapagos_interface(	
//                hls::stream<ap_uint<16> >& rxMetaData,
//				hls::stream<axiWord>& rxData,
//				hls::stream<axiWord>& txGalapagosBridge,
//                hls::stream<ap_uint<16> >& firewal_read_dest,
//				hls::stream<ap_uint<16> >& firewal_read_sid,
//				hls::stream<ap_uint<16> >& firewal_write_dest,
//				hls::stream<ap_uint<16> >& firewal_write_sid,
//                ap_uint<32> ip_table[256]
//			);
//
//void galapagos_to_tcp_interface(hls::stream<axiWord> & rxGalapagosBridge,
//				hls::stream<ap_int<17> >& txStatus,
//				hls::stream<appTxMeta>& txMetaData,
//				hls::stream<axiWord>& txData,
//				hls::stream<ap_uint<32> >& ip_fifo,
//				hls::stream<ap_uint<16> >& sessionID_fifo,
//				hls::stream<ap_uint<16> >& client_read_dest,
//				hls::stream<ap_uint<16> >& client_read_sid,
//				hls::stream<ap_uint<16> >& client_write_dest,
//				hls::stream<ap_uint<16> >& client_write_sid,
//                ap_uint<32> ip_table[256],
//                ap_uint<4> &state_out
//
//                );
//
//
//
//void network_bridge_tcp(
//        hls::stream<axiWord>& rxGalapagosBridge,
//		hls::stream<appTxMeta>& txMetaData,
//		hls::stream<ipTuple>& openConnection,
//		hls::stream<openStatus>& openConStatus,
//		hls::stream<ap_uint<16> >& closeConnection,
//		hls::stream<axiWord> & txData,
//		hls::stream<ap_int<17> >& txStatus,
//		hls::stream<ap_uint<16> >& listenPort,
//		hls::stream<bool>& listenPortStatus,
//		hls::stream<appNotification>& notifications,
//		hls::stream<appReadRequest>& readRequest,
//		hls::stream<ap_uint<16> >& rxMetaData,
//		hls::stream<axiWord>& rxData,
//		hls::stream<axiWord>& txGalapagosBridge 
//);


#endif
