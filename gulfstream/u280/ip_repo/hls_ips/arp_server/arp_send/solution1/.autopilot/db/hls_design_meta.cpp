#include "hls_design_meta.h"
const Port_Property HLS_Design_Meta::port_props[]={
	Port_Property("ap_clk", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_rst", 1, hls_in, -1, "", "", 1),
	Port_Property("myMac_V", 48, hls_in, 0, "ap_none", "in_data", 1),
	Port_Property("myIP_V", 32, hls_in, 1, "ap_none", "in_data", 1),
	Port_Property("gateway_V", 32, hls_in, 2, "ap_none", "in_data", 1),
	Port_Property("netmask_V", 32, hls_in, 3, "ap_none", "in_data", 1),
	Port_Property("arptable_addr_V", 8, hls_out, 4, "ap_none", "out_data", 1),
	Port_Property("arptable_data_V", 80, hls_in, 5, "ap_none", "in_data", 1),
	Port_Property("call_for_responce_Mac_IP_V", 80, hls_in, 6, "ap_none", "in_data", 1),
	Port_Property("call_for_responce_valid_V", 1, hls_in, 7, "ap_none", "in_data", 1),
	Port_Property("lookup_req_V", 32, hls_in, 8, "ap_none", "in_data", 1),
	Port_Property("lookup_result_V", 48, hls_out, 9, "ap_none", "out_data", 1),
	Port_Property("arp_status_V", 2, hls_out, 10, "ap_none", "out_data", 1),
	Port_Property("arp_out_data_V", 512, hls_out, 11, "ap_none", "out_data", 1),
	Port_Property("arp_out_keep_V", 64, hls_out, 12, "ap_none", "out_data", 1),
	Port_Property("arp_out_last_V", 1, hls_out, 13, "ap_none", "out_data", 1),
	Port_Property("arp_out_valid_V", 1, hls_out, 14, "ap_none", "out_data", 1),
	Port_Property("arp_out_ready_V", 1, hls_in, 15, "ap_none", "in_data", 1),
};
const char* HLS_Design_Meta::dut_name = "arp_send";
