#include <stdio.h>
#include <iostream>
#include <fstream>
#include <string>
#include <math.h>
#include <hls_stream.h>
#include "ap_int.h"
#include <stdint.h>
#include "wan_packet.h"


void WAN_network_dispatch(hls::stream<netStream> &rxGalapagosBridge, hls::stream<netStream> &lbTxDataOut, ip_fetch_interface& fetch_out, ap_uint<8> * state_out);
