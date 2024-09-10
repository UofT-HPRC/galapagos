#include "hls_design_meta.h"
const Port_Property HLS_Design_Meta::port_props[]={
	Port_Property("ap_clk", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_rst", 1, hls_in, -1, "", "", 1),
	Port_Property("action", 65, hls_in, 0, "ap_none", "in_data", 1),
	Port_Property("action_valid_V", 1, hls_in, 1, "ap_none", "in_data", 1),
	Port_Property("action_empty_V", 1, hls_in, 2, "ap_none", "in_data", 1),
	Port_Property("action_re_V", 1, hls_out, 3, "ap_none", "out_data", 1),
	Port_Property("payload_in_data_V", 512, hls_in, 4, "ap_none", "in_data", 1),
	Port_Property("payload_in_keep_V", 64, hls_in, 5, "ap_none", "in_data", 1),
	Port_Property("payload_in_valid_V", 1, hls_in, 6, "ap_none", "in_data", 1),
	Port_Property("payload_in_last_V", 1, hls_in, 7, "ap_none", "in_data", 1),
	Port_Property("payload_ready_V", 1, hls_out, 8, "ap_none", "out_data", 1),
	Port_Property("payload_out_data_V", 512, hls_out, 9, "ap_none", "out_data", 1),
	Port_Property("payload_out_keep_V", 64, hls_out, 10, "ap_none", "out_data", 1),
	Port_Property("payload_out_valid_V", 1, hls_out, 11, "ap_none", "out_data", 1),
	Port_Property("payload_out_last_V", 1, hls_out, 12, "ap_none", "out_data", 1),
	Port_Property("src_ip_V", 32, hls_out, 13, "ap_none", "out_data", 1),
	Port_Property("src_port_V", 16, hls_out, 14, "ap_none", "out_data", 1),
	Port_Property("dst_port_V", 16, hls_out, 15, "ap_none", "out_data", 1),
};
const char* HLS_Design_Meta::dut_name = "action_excecutor";
