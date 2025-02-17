#include "hls_design_meta.h"
const Port_Property HLS_Design_Meta::port_props[]={
	Port_Property("ap_clk", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_rst", 1, hls_in, -1, "", "", 1),
	Port_Property("payload_in_data_V", 512, hls_in, 0, "ap_none", "in_data", 1),
	Port_Property("payload_in_valid_V", 1, hls_in, 1, "ap_none", "in_data", 1),
	Port_Property("payload_in_last_V", 1, hls_in, 2, "ap_none", "in_data", 1),
	Port_Property("payload_length_data_V", 16, hls_in, 3, "ap_none", "in_data", 1),
	Port_Property("payload_length_valid_V", 1, hls_in, 4, "ap_none", "in_data", 1),
	Port_Property("payload_out_data_V", 512, hls_out, 5, "ap_none", "out_data", 1),
	Port_Property("payload_out_keep_V", 64, hls_out, 6, "ap_none", "out_data", 1),
	Port_Property("payload_out_valid_V", 1, hls_out, 7, "ap_none", "out_data", 1),
	Port_Property("payload_out_last_V", 1, hls_out, 8, "ap_none", "out_data", 1),
	Port_Property("checksum_data_V", 32, hls_out, 9, "ap_none", "out_data", 1),
	Port_Property("checksum_valid_V", 1, hls_out, 10, "ap_none", "out_data", 1),
};
const char* HLS_Design_Meta::dut_name = "payload_checksum";
