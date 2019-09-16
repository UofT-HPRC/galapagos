#ifndef GALAPAGOS_PACKET_H
#define GALAPAGOS_PACKET_H

#include "hls_stream.h"
#include "ap_int.h"
#include "packet_size.h"

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

typedef galapagos::stream_packet <ap_uint<64> > galapagos_packet;

#else

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
#ifdef PACKET_DEST_LENGTH  
        ap_uint <PACKET_DEST_LENGTH> id;
#endif   
#ifdef PACKET_USER_LENGTH  
        ap_uint <PACKET_USER_LENGTH> user;
#endif   
#ifdef PACKET_KEEP_LENGTH  
        ap_uint <T/8> keep;
#endif   
	    stream_packet() {}
    };
}

typedef galapagos::stream_packet<64>  galapagos_packet;
typedef hls::stream<galapagos::stream_packet<64> > galapagos_interface;

#endif // if not CPU 

#endif //GUARD
