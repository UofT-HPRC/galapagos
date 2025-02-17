#include "hls_design_meta.h"
const Port_Property HLS_Design_Meta::port_props[]={
	Port_Property("ap_clk", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_rst", 1, hls_in, -1, "", "", 1),
	Port_Property("eth_arp_in_data_V", 512, hls_in, 0, "ap_none", "in_data", 1),
	Port_Property("eth_arp_in_keep_V", 64, hls_in, 1, "ap_none", "in_data", 1),
	Port_Property("eth_arp_in_valid_V", 1, hls_in, 2, "ap_none", "in_data", 1),
	Port_Property("eth_arp_in_last_V", 1, hls_in, 3, "ap_none", "in_data", 1),
	Port_Property("arp_ready_V", 1, hls_out, 4, "ap_none", "out_data", 1),
	Port_Property("eth_ip_in_data_V", 512, hls_in, 5, "ap_none", "in_data", 1),
	Port_Property("eth_ip_in_keep_V", 64, hls_in, 6, "ap_none", "in_data", 1),
	Port_Property("eth_ip_in_valid_V", 1, hls_in, 7, "ap_none", "in_data", 1),
	Port_Property("eth_ip_in_last_V", 1, hls_in, 8, "ap_none", "in_data", 1),
	Port_Property("ip_ready_V", 1, hls_out, 9, "ap_none", "out_data", 1),
	Port_Property("eth_out_data_V", 512, hls_out, 10, "ap_none", "out_data", 1),
	Port_Property("eth_out_keep_V", 64, hls_out, 11, "ap_none", "out_data", 1),
	Port_Property("eth_out_valid_V", 1, hls_out, 12, "ap_none", "out_data", 1),
	Port_Property("eth_out_last_V", 1, hls_out, 13, "ap_none", "out_data", 1),
	Port_Property("eth_out_ready_V", 1, hls_in, 14, "ap_none", "in_data", 1),
};
const char* HLS_Design_Meta::dut_name = "ether_protocol_assembler";
