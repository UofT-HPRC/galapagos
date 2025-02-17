#ifndef GALAPAGOS_PACKET_H
#define GALAPAGOS_PACKET_H

#include "hls_stream.h"
#include "ap_int.h"
#include "packet_size.h"



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
#ifdef PACKET_DEST_LENGTH
        ap_uint <PACKET_DEST_LENGTH> id;
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
    template <typename T>
    struct stream_packet {
        T data;
#ifdef PACKET_DEST_LENGTH
        ap_uint <PACKET_DEST_LENGTH> dest;
#endif
#ifdef PACKET_LAST
        ap_uint <1> last;
#endif
#ifdef PACKET_DEST_LENGTH
        ap_uint <PACKET_DEST_LENGTH> id;
#endif
#ifdef PACKET_USER_LENGTH
        ap_uint <PACKET_USER_LENGTH> user;
#endif
#ifdef PACKET_KEEP_LENGTH
        ap_uint <PACKET_KEEP_LENGTH> keep;
#endif
	    stream_packet() {}
    };

    template<typename T>
    using interface = hls::stream<galapagos::stream_packet<T> >;
}

typedef galapagos::stream_packet<ap_uint<PACKET_DATA_LENGTH> >  galapagos_packet;

typedef hls::stream<galapagos_packet> galapagos_interface;

inline ap_uint<PACKET_DATA_LENGTH> get_header(ap_uint<PACKET_DEST_LENGTH> _id, ap_uint<PACKET_DEST_LENGTH> _dest, ap_uint<PACKET_USER_LENGTH> _size){
#pragma HLS INLINE

    ap_uint<PACKET_DATA_LENGTH> retVal;

    retVal.range(PACKET_DATA_LENGTH - 1,PACKET_DEST_LENGTH+PACKET_DEST_LENGTH+PACKET_USER_LENGTH) = 0; //unused
    retVal.range(PACKET_DEST_LENGTH+PACKET_DEST_LENGTH+PACKET_USER_LENGTH-1, PACKET_DEST_LENGTH+PACKET_USER_LENGTH) = _dest; //unused
    retVal.range(PACKET_DEST_LENGTH+PACKET_USER_LENGTH-1, PACKET_USER_LENGTH) = _id;
    //retVal.range(PACKET_USER_LENGTH - 1, 0) = _size << 3; //length in bytes
    retVal.range(PACKET_USER_LENGTH - 1, 0) = _size; //length in bytes

    return retVal;

}

#endif // if not CPU


#endif //GUARD
