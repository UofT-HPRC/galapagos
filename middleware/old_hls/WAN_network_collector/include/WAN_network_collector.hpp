#include <stdio.h>
#include <iostream>
#include <fstream>
#include <string>
#include <math.h>
#include <hls_stream.h>
#include "ap_int.h"
#include <stdint.h>
#include "wan_packet.h"

struct axiWord512{
	ap_uint<512>		data;
	ap_uint<64>		keep;
	ap_uint<1>		last;
};



void WAN_network_collector(
                 hls::stream<axiWord512>         &lbTxDataIn,
				 hls::stream<axiWord512> 		&lbTxDataOut,
				 hls::stream<axiWord512> 		&bin_1,
				 hls::stream<axiWord512> 		&bin_2,
				 hls::stream<axiWord512> 		&bin_3,
				 fetch_reply_interface &fetch_in,
                 ap_uint<8> * state_out
                 );

axis_gulfstream_extend_t extender(netStream in_data, ap_uint<IP_LENGTH> ip);
netStream shrinker(axis_gulfstream_extend_t in_data);
