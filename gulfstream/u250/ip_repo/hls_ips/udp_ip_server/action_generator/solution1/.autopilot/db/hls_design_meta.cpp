#include "hls_design_meta.h"
const Port_Property HLS_Design_Meta::port_props[]={
	Port_Property("ap_clk", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_rst", 1, hls_in, -1, "", "", 1),
	Port_Property("meta_in_src_ip_V", 32, hls_in, 0, "ap_none", "in_data", 1),
	Port_Property("meta_in_protocol_header_V", 64, hls_in, 1, "ap_none", "in_data", 1),
	Port_Property("meta_in_checksum_V", 32, hls_in, 2, "ap_none", "in_data", 1),
	Port_Property("meta_in_action_V", 2, hls_in, 3, "ap_none", "in_data", 1),
	Port_Property("payload_cksum_data_V", 32, hls_in, 4, "ap_none", "in_data", 1),
	Port_Property("payload_cksum_valid_V", 1, hls_in, 5, "ap_none", "in_data", 1),
	Port_Property("action_out", 65, hls_out, 6, "ap_none", "out_data", 1),
	Port_Property("action_out_valid_V", 1, hls_out, 7, "ap_none", "out_data", 1),
};
const char* HLS_Design_Meta::dut_name = "action_generator";
