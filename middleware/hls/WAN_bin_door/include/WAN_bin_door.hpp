#include <stdio.h>
#include <iostream>
#include <fstream>
#include <string>
#include <math.h>
#include <hls_stream.h>
#include "ap_int.h"
#include <stdint.h>
#include "wan_packet.h"

typedef ap_axis<512, 0, 0, 0> axiWord512;


void WAN_bin_door(
    netStream         &bin_in,
		gulfstream_interface_extend 		&lbTxDataOut,
		fetch_bin_reply_interface &fetch_in,
    ap_uint<8> * state_out
                 );

axis_gulfstream_extend_t extender(ap_axis_net in_data, ap_uint<IP_LENGTH> ip);