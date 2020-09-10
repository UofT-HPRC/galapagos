#pragma once

#include <cstddef>
#include "ap_int.h"
#include "ap_axi_sdata.h"
#include "hls_stream.h"
#include "hls_math.h"

#ifndef __SYNTHESIS__
#define PORT 11213
#else
#define PORT 7
#endif

struct axiWord
{
    ap_uint<64>		data;
    ap_uint<8>		keep;
    ap_uint<1>		last;
    axiWord() {}
    axiWord(ap_uint<64>	 data, ap_uint<8> keep, ap_uint<1> last)
        :data(data), keep(keep), last(last) {}
};

struct appNotification
{
	ap_uint<16>			sessionID;
	ap_uint<16>			length;
	ap_uint<32>			ipAddress;
	ap_uint<16>			dstPort;
	bool				closed;
	appNotification() {}
	appNotification(ap_uint<16> id, ap_uint<16> len, ap_uint<32> addr, ap_uint<16> port)
				:sessionID(id), length(len), ipAddress(addr), dstPort(port), closed(false) {}
	appNotification(ap_uint<16> id, bool closed)
				:sessionID(id), length(0), ipAddress(0),  dstPort(0), closed(closed) {}
	appNotification(ap_uint<16> id, ap_uint<32> addr, ap_uint<16> port, bool closed)
				:sessionID(id), length(0), ipAddress(addr),  dstPort(port), closed(closed) {}
	appNotification(ap_uint<16> id, ap_uint<16> len, ap_uint<32> addr, ap_uint<16> port, bool closed)
			:sessionID(id), length(len), ipAddress(addr), dstPort(port), closed(closed) {}
};

struct udpMeta
{
    ap_uint<16> src_port;
    ap_uint<32> src_ip;
    ap_uint<16> dst_port;
    ap_uint<32> dst_ip;
    udpMeta()
        :src_port(0), src_ip(0), dst_port(0), dst_ip(0) {}
    udpMeta(ap_uint<16> s_port, ap_uint<32> s_ip, ap_uint<16> d_port, ap_uint<32> d_ip)
        :src_port(s_port), src_ip(s_ip), dst_port(d_port), dst_ip(d_ip) {}
};


// void network_bridge_udp(
//     stream<ap_uint<16> >& listenPort,
// 	stream<bool>& listenPortStatus,
//     stream<axiWord> &rxGalapagosBridge,
//     stream<udpMeta> &rxMetadata,
//     stream<axiWord> &txGalapagosBridge,
//     stream<ap_uint<16> >& txLength,
//     stream<udpMeta> &txMetadata
// );
