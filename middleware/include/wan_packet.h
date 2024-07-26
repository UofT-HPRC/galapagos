#ifndef GALAPAGOS_PACKET_H
#define GALAPAGOS_PACKET_H

#include "hls_stream.h"
#include "ap_int.h"
#define INTERFACE_100G
#include "wan_packet_size.h"
#include "ap_axi_sdata.h"

#define WAN_SRC_PORT            9001
#define FETCH_DEST_ADDRESS      9001

#if(PACKET_DATA_LENGTH == 64)
#define KEEP_ALL 0xff
#elif(PACKET_DATA_LENGTH == 512)
#define KEEP_ALL 0xffffffffffffffff
#endif

#ifdef CPU

namespace galapagos{
    template <typename T>
    struct stream_packet {
        T data;
#ifdef PACKET_DEST_LENGTH
        ap_uint <PACKET_DEST_LENGTH> dest;
#endif
#ifdef PACKET_LAST
        ap_uint <1> last;
#endif
#ifdef PACKET_USER_LENGTH
        ap_uint <PACKET_USER_LENGTH> user;
#endif
#ifdef PACKET_KEEP_LENGTH
        ap_uint <PACKET_KEEP_LENGTH> keep;
#endif
    };
}

typedef galapagos::stream_packet <ap_uint<PACKET_DATA_LENGTH> > galapagos_packet;


#define BYTESPERCYCLE 8
#define ID_LENGTH 8
#define DEST_LENGTH 8
#define MAX_SIZE 4096
#define MAX_LENGTH_BITS 16

#else //CPU

#define IP_LENGTH 32
#define RIP_ID_IP_FETCH 0
#define RIP_ID_IP_SERVER 0
#define RIP_ID_ROUTER 1
#define RIP_ID_NETWORK_BRIDGE 2

// New AXIS signals (Vitis HLS 2023.1+) <WData, WUser, WDest, WId>
typedef ap_axis<PACKET_DATA_LENGTH, PACKET_USER_LENGTH, PACKET_DEST_LENGTH, PACKET_DEST_LENGTH> galapagos_packet;
typedef hls::stream<galapagos_packet> galapagos_interface;

typedef ap_axis<PACKET_DATA_LENGTH, PACKET_USER_LENGTH, 0, 0> ap_axis_net;
typedef hls::stream<ap_axis_net> netStream;

typedef ap_axis<PACKET_DATA_LENGTH, 0, 0, 0> axis_gulfstream_t;
typedef hls::stream<axis_gulfstream_t> gulfstream_interface;

typedef ap_axis<32, 0, 3, 0> fetch_reply;
typedef hls::stream<fetch_reply> fetch_reply_interface;

typedef ap_axis<32, 0, 3, PACKET_DEST_LENGTH> fetch_update;
typedef hls::stream<fetch_update> fetch_update_interface;

typedef ap_axis<PACKET_DEST_LENGTH, 0, 3, 0> slow_fetch_request;
typedef hls::stream<slow_fetch_request> slow_fetch_request_interface;

typedef ap_axis<PACKET_DEST_LENGTH, 0, 0, 0> ip_fetch_packet_t;
typedef hls::stream<ip_fetch_packet_t> ip_fetch_interface;

typedef ap_axis<32, 16, 0, 0> fetch_bin_reply;
typedef hls::stream<fetch_bin_reply> fetch_bin_reply_interface;

typedef ap_axis<512, 64, 0, 0> axis_gulfstream_extend_t;
typedef hls::stream<axis_gulfstream_extend_t> gulfstream_interface_extend;

inline ap_uint<PACKET_DATA_LENGTH> get_header(ap_uint<PACKET_DEST_LENGTH> _dest, ap_uint<PACKET_USER_LENGTH> _size){
#pragma HLS INLINE

    ap_uint<PACKET_DATA_LENGTH> retVal;

    retVal.range(PACKET_DATA_LENGTH - 1,PACKET_DEST_LENGTH+PACKET_DEST_LENGTH+PACKET_USER_LENGTH) = 0; //unused
    retVal.range(PACKET_DEST_LENGTH+PACKET_DEST_LENGTH+PACKET_USER_LENGTH-1, PACKET_DEST_LENGTH+PACKET_USER_LENGTH) = _dest; //unused
    retVal.range(PACKET_DEST_LENGTH+PACKET_USER_LENGTH-1, PACKET_USER_LENGTH) = 0;
    //retVal.range(PACKET_USER_LENGTH - 1, 0) = _size << 3; //length in bytes
    retVal.range(PACKET_USER_LENGTH - 1, 0) = _size; //length in words

    return retVal;

}

#endif // if not CPU
#endif //GUARD
