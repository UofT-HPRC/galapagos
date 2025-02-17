#include "hls_design_meta.h"
const Port_Property HLS_Design_Meta::port_props[]={
	Port_Property("ap_clk", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_rst", 1, hls_in, -1, "", "", 1),
	Port_Property("myIP_V", 32, hls_in, 0, "ap_none", "in_data", 1),
	Port_Property("ip_in_data_V", 336, hls_in, 1, "ap_none", "in_data", 1),
	Port_Property("ip_in_valid_V", 1, hls_in, 2, "ap_none", "in_data", 1),
	Port_Property("meta_out_src_ip_V", 32, hls_out, 3, "ap_none", "out_data", 1),
	Port_Property("meta_out_protocol_header_V", 64, hls_out, 4, "ap_none", "out_data", 1),
	Port_Property("meta_out_checksum_V", 32, hls_out, 5, "ap_none", "out_data", 1),
	Port_Property("meta_out_action_V", 2, hls_out, 6, "ap_none", "out_data", 1),
	Port_Property("arp_internal_resp_Mac_IP_V", 80, hls_out, 7, "ap_none", "out_data", 1),
	Port_Property("arp_internal_resp_valid_V", 1, hls_out, 8, "ap_none", "out_data", 1),
};
const char* HLS_Design_Meta::dut_name = "udp_ip_receive";
