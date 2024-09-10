# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

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


# Native S_AXILite:
if {${::AESL::PGuard_simmodel_gen}} {
	if {[info proc ::AESL_LIB_XILADAPTER::s_axilite_gen] == "::AESL_LIB_XILADAPTER::s_axilite_gen"} {
		eval "::AESL_LIB_XILADAPTER::s_axilite_gen { \
			id 1 \
			corename PSInterface_AXILiteS_axilite \
			name PSInterface_AXILiteS_s_axi \
			ports {$port_AXILiteS} \
			op interface \
			is_flushable 0 \ 
		} "
	} else {
		puts "@W \[IMPL-110\] Cannot find AXI Lite interface model in the library. Ignored generation of AXI Lite  interface for 'AXILiteS'"
	}
}

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler PSInterface_AXILiteS_s_axi
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2 \
    name start_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_start_V \
    op interface \
    ports { start_V { O 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3 \
    name pkt_num_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_pkt_num_V \
    op interface \
    ports { pkt_num_V { O 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4 \
    name pkt_len_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_pkt_len_V \
    op interface \
    ports { pkt_len_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5 \
    name remote_ip_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_remote_ip_V \
    op interface \
    ports { remote_ip_V { O 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 6 \
    name remote_port_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_remote_port_V \
    op interface \
    ports { remote_port_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 7 \
    name local_port_V \
    type other \
    dir O \
    reset_level 0 \
    sync_rst true \
    corename dc_local_port_V \
    op interface \
    ports { local_port_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 8 \
    name tx_timeElapse_V \
    type other \
    dir I \
    reset_level 0 \
    sync_rst true \
    corename dc_tx_timeElapse_V \
    op interface \
    ports { tx_timeElapse_V { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 9 \
    name tx_done_V \
    type other \
    dir I \
    reset_level 0 \
    sync_rst true \
    corename dc_tx_done_V \
    op interface \
    ports { tx_done_V { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 10 \
    name latency_sum_V \
    type other \
    dir I \
    reset_level 0 \
    sync_rst true \
    corename dc_latency_sum_V \
    op interface \
    ports { latency_sum_V { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 11 \
    name rx_timeElapse_V \
    type other \
    dir I \
    reset_level 0 \
    sync_rst true \
    corename dc_rx_timeElapse_V \
    op interface \
    ports { rx_timeElapse_V { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 12 \
    name rx_cnt_V \
    type other \
    dir I \
    reset_level 0 \
    sync_rst true \
    corename dc_rx_cnt_V \
    op interface \
    ports { rx_cnt_V { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 13 \
    name rx_done_V \
    type other \
    dir I \
    reset_level 0 \
    sync_rst true \
    corename dc_rx_done_V \
    op interface \
    ports { rx_done_V { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 14 \
    name rx_error_V \
    type other \
    dir I \
    reset_level 0 \
    sync_rst true \
    corename dc_rx_error_V \
    op interface \
    ports { rx_error_V { I 1 vector } } \
} "
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


