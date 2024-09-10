#include "hls_design_meta.h"
const Port_Property HLS_Design_Meta::port_props[]={
	Port_Property("ap_clk", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_rst", 1, hls_in, -1, "", "", 1),
	Port_Property("start_V", 1, hls_in, 0, "ap_none", "in_data", 1),
	Port_Property("ready_V", 1, hls_in, 1, "ap_none", "in_data", 1),
	Port_Property("packet_num_V", 32, hls_in, 2, "ap_none", "in_data", 1),
	Port_Property("payload_len_V", 16, hls_in, 3, "ap_none", "in_data", 1),
	Port_Property("counter_out_V", 32, hls_out, 4, "ap_none", "out_data", 1),
	Port_Property("time_elapse_V", 64, hls_out, 5, "ap_none", "out_data", 1),
	Port_Property("m_axis_data_V", 512, hls_out, 6, "ap_none", "out_data", 1),
	Port_Property("m_axis_keep_V", 64, hls_out, 7, "ap_none", "out_data", 1),
	Port_Property("m_axis_last_V", 1, hls_out, 8, "ap_none", "out_data", 1),
	Port_Property("m_axis_valid_V", 1, hls_out, 9, "ap_none", "out_data", 1),
	Port_Property("done_V", 1, hls_out, 10, "ap_none", "out_data", 1),
};
const char* HLS_Design_Meta::dut_name = "payload_generator";
