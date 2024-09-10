#include "hls_design_meta.h"
const Port_Property HLS_Design_Meta::port_props[]={
	Port_Property("ap_clk", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_rst", 1, hls_in, -1, "", "", 1),
	Port_Property("myMacAddr_V", 48, hls_in, 0, "ap_none", "in_data", 1),
	Port_Property("s_axis_data_V", 512, hls_in, 1, "ap_none", "in_data", 1),
	Port_Property("s_axis_keep_V", 64, hls_in, 2, "ap_none", "in_data", 1),
	Port_Property("s_axis_last_V", 1, hls_in, 3, "ap_none", "in_data", 1),
	Port_Property("s_axis_valid_V", 1, hls_in, 4, "ap_none", "in_data", 1),
	Port_Property("arp_data_V", 336, hls_out, 5, "ap_none", "out_data", 1),
	Port_Property("arp_valid_V", 1, hls_out, 6, "ap_none", "out_data", 1),
	Port_Property("ip_data_V", 336, hls_out, 7, "ap_none", "out_data", 1),
	Port_Property("ip_valid_V", 1, hls_out, 8, "ap_none", "out_data", 1),
	Port_Property("payload_data_V", 512, hls_out, 9, "ap_none", "out_data", 1),
	Port_Property("payload_valid_V", 1, hls_out, 10, "ap_none", "out_data", 1),
	Port_Property("payload_last_V", 1, hls_out, 11, "ap_none", "out_data", 1),
	Port_Property("payload_len_data_V", 16, hls_out, 12, "ap_none", "out_data", 1),
	Port_Property("payload_len_valid_V", 1, hls_out, 13, "ap_none", "out_data", 1),
};
const char* HLS_Design_Meta::dut_name = "ether_protocol_spliter";
