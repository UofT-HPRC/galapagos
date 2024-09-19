# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_AXILiteS {
axil_start_V { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 16
	offset_end 23
}
axil_pkt_num_V { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 24
	offset_end 31
}
axil_pkt_len_V { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 32
	offset_end 39
}
axil_remote_ip_V { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 40
	offset_end 47
}
axil_remote_port_V { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 48
	offset_end 55
}
axil_local_port_V { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 56
	offset_end 63
}
axil_tx_timeElapse_high_V { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 64
	offset_end 71
}
axil_tx_timeElapse_low_V { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 72
	offset_end 79
}
axil_tx_done_V { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 80
	offset_end 87
}
axil_latency_sum_high_V { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 88
	offset_end 95
}
axil_latency_sum_low_V { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 96
	offset_end 103
}
axil_rx_timeElaspe_high_V { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 104
	offset_end 111
}
axil_rx_timeElaspe_low_V { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 112
	offset_end 119
}
axil_rx_done_V { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 120
	offset_end 127
}
axil_rx_error_V { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 128
	offset_end 135
}
axil_rx_curr_cnt_V { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 136
	offset_end 143
}
}
dict set axilite_register_dict AXILiteS $port_AXILiteS


