#include "hls_design_meta.h"
const Port_Property HLS_Design_Meta::port_props[]={
	Port_Property("ap_clk", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_rst", 1, hls_in, -1, "", "", 1),
	Port_Property("myIP_V", 32, hls_in, 0, "ap_none", "in_data", 1),
	Port_Property("dst_ip_V", 32, hls_in, 1, "ap_none", "in_data", 1),
	Port_Property("dst_mac_V", 48, hls_in, 2, "ap_none", "in_data", 1),
	Port_Property("src_port_V", 16, hls_in, 3, "ap_none", "in_data", 1),
	Port_Property("dst_port_V", 16, hls_in, 4, "ap_none", "in_data", 1),
	Port_Property("arp_status_V", 2, hls_in, 5, "ap_none", "in_data", 1),
	Port_Property("payload_in_data_V", 512, hls_in, 6, "ap_none", "in_data", 1),
	Port_Property("payload_in_keep_V", 64, hls_in, 7, "ap_none", "in_data", 1),
	Port_Property("payload_in_valid_V", 1, hls_in, 8, "ap_none", "in_data", 1),
	Port_Property("payload_in_last_V", 1, hls_in, 9, "ap_none", "in_data", 1),
	Port_Property("payload_in_ready_V", 1, hls_out, 10, "ap_none", "out_data", 1),
	Port_Property("payload_out_data_V", 512, hls_out, 11, "ap_none", "out_data", 1),
	Port_Property("payload_out_keep_V", 64, hls_out, 12, "ap_none", "out_data", 1),
	Port_Property("payload_out_valid_V", 1, hls_out, 13, "ap_none", "out_data", 1),
	Port_Property("payload_out_last_V", 1, hls_out, 14, "ap_none", "out_data", 1),
	Port_Property("payload_out_ready_V", 1, hls_in, 15, "ap_none", "in_data", 1),
	Port_Property("action_out", 161, hls_out, 16, "ap_none", "out_data", 1),
	Port_Property("action_out_we_V", 1, hls_out, 17, "ap_none", "out_data", 1),
};
const char* HLS_Design_Meta::dut_name = "udp_ip_tx";
