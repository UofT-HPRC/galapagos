#include <stdio.h>
#include <iostream>
#include <fstream>
#include <string>
#include <math.h>
#include <hls_stream.h>
#include "ap_int.h"
#include <stdint.h>
#include "wan_packet.h"



void WAN_network_collector(
                 netStream                                      &lbTxDataIn,
				 gulfstream_interface_extend                    &lbTxDataOut,
				 netStream                                      &bin_1,
				 netStream                                      &bin_2,
				 netStream                                      &bin_3,
				 fetch_reply_interface                          &fetch_in,
                 ap_uint<8> *                                   state_out
                 );

axis_gulfstream_extend_t extender(ap_axis_net in_data, ap_uint<IP_LENGTH> ip);
ap_axis_net shrinker(axis_gulfstream_extend_t in_data);
