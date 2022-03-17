#include "galapagos_packet.h"

using gp = galapagos::stream_packet<64>;

void world(hls::stream<gp> *in) {
	#pragma HLS INTERFACE axis register both port=in
	#pragma HLS INTERFACE ap_ctrl_none port=return
	
	gp tmp;
	if (!in->empty()) in->read(tmp);
}
