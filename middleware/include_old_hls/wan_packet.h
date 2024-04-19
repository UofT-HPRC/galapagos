#ifndef GALAPAGOS_PACKET_H
#define GALAPAGOS_PACKET_H

#include "hls_stream.h"
#include "ap_int.h"
#define INTERFACE_100G
#include "wan_packet_size.h"

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

namespace galapagos{
    template <int T>
    struct stream_packet {
        ap_uint<T> data;
#ifdef PACKET_DEST_LENGTH
        ap_uint <PACKET_DEST_LENGTH> dest;
#endif
#ifdef PACKET_LAST
        ap_uint <1> last;
#endif
#ifdef PACKET_USER_LENGTH
#if PACKET_USER_LENGTH > 0
        ap_uint <PACKET_USER_LENGTH> user;
#endif
#endif
#ifdef PACKET_KEEP_LENGTH
        ap_uint <T/8> keep;
#endif
	    stream_packet() {}
    };

    template<int T>
    using interface = hls::stream<galapagos::stream_packet<T> >;
}

typedef galapagos::stream_packet<PACKET_DATA_LENGTH> galapagos_packet;
typedef hls::stream<galapagos_packet> galapagos_interface;

template<int D>
struct ap_axis_net{
	ap_uint <D> data;
    ap_uint<D/8> keep;
	ap_uint<1> last;
	ap_uint<PACKET_USER_LENGTH> user;

};

typedef ap_axis_net<PACKET_DATA_LENGTH> netStream;

// Interface to communicate with GULF-Stream
struct axis_gulfstream_t{
	ap_uint<512>		data;
	ap_uint<64>		keep;
	ap_uint<1>		last;
};
typedef hls::stream<axis_gulfstream_t> gulfstream_interface;

struct fetch_reply{
	ap_uint<32> data;//IP
	ap_uint<3> dest;//bin
};
typedef hls::stream<fetch_reply> fetch_reply_interface;

struct fetch_update{
	ap_uint<32> data;//IP
	ap_uint<3> dest;//bin
	ap_uint<PACKET_DEST_LENGTH> id; //dest of requestor
};

typedef hls::stream<fetch_update> fetch_update_interface;

struct slow_fetch_request{
    ap_uint<PACKET_DEST_LENGTH> data; //Requested Dest
    ap_uint<3> dest; //bin
};
typedef hls::stream<slow_fetch_request> slow_fetch_request_interface;

// Interface to communicate with IP Fetch
#define IP_LENGTH 32
#define RIP_ID_IP_FETCH 0
#define RIP_ID_IP_SERVER 0
#define RIP_ID_ROUTER 1
#define RIP_ID_NETWORK_BRIDGE 2
typedef ap_uint<PACKET_DEST_LENGTH>  ip_fetch_packet_t;
typedef hls::stream<ip_fetch_packet_t> ip_fetch_interface;

struct fetch_bin_reply{
	ap_uint<32> data;//ip address
	ap_uint<16> user;//how many to forward
};
typedef hls::stream<fetch_bin_reply> fetch_bin_reply_interface;

struct axis_gulfstream_extend_t{
	ap_uint<512>		data;
	ap_uint<64>         user;
	ap_uint<64>         keep;
	ap_uint<1>          last;
};
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

//inline ap_uint<PACKET_DATA_LENGTH> get_header(ap_uint<PACKET_DEST_LENGTH> _id, ap_uint<PACKET_DEST_LENGTH> _dest){
//#pragma HLS INLINE
//
//    ap_uint<PACKET_DATA_LENGTH> retVal;
//
//    retVal.range(PACKET_DATA_LENGTH - 1,PACKET_DEST_LENGTH+PACKET_DEST_LENGTH) = 0; //unused
//    retVal.range(PACKET_DEST_LENGTH+PACKET_DEST_LENGTH-1, PACKET_DEST_LENGTH) = _dest; //unused
//    retVal.range(PACKET_DEST_LENGTH-1, 0) = _id;
//
//    return retVal;
//
//}


#endif // if not CPU
#endif //GUARD
