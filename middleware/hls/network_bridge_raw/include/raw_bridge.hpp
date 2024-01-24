#ifndef RAW_BRIDGE_HPP 
#define RAW_BRIDGE_HPP

#include "ap_int.h"
#include "hls_stream.h"

#include "galapagos_packet.h"

// Old AXIS signals (Vivado HLS <2019.1)
// struct raw_axis{
// 	ap_int <64> data;
// 	ap_uint<1> last;
// 	ap_uint<8> keep;
// };
// New AXIS signals (Vitis HLS 2023.1+) <WData, WUser, WDest, WId>
typedef ap_axiu<64, 0, 0, 0> raw_axis;

void raw_bridge(
	galapagos_interface & to_app,
	hls::stream <raw_axis> & from_raw,
	galapagos_interface & from_app,
	hls::stream <raw_axis> & to_raw
);

ap_uint <64> reverseEndian64_data(ap_uint <64> X); 
ap_uint <8> reverseEndian64_keep(ap_uint <8> X); 

#endif
