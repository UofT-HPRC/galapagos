#include "galapagos_packet.h"

using gp = galapagos::stream_packet<64>;

void hello_world(hls::stream<gp> *out) {
	#pragma HLS INTERFACE axis register both port=out
	#pragma HLS INTERFACE ap_ctrl_none port=return
	
	gp tmp;

	tmp.dest = 2;
	tmp.data = 0xFEEDBADBEEF2BABE;
	tmp.id = 1;
	tmp.last = 1;
	tmp.keep = 0xFFFF;

	if(!out->full()) out->write(tmp);

	
}
