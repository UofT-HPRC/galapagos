# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

set axilite_register_dict [dict create]
# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1 \
    name start_V \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_start_V \
    op interface \
    ports { start_V { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2 \
    name ready_V \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_ready_V \
    op interface \
    ports { ready_V { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3 \
    name packet_num_V \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_packet_num_V \
    op interface \
    ports { packet_num_V { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4 \
    name payload_len_V \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_payload_len_V \
    op interface \
    ports { payload_len_V { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5 \
    name counter_out_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_counter_out_V \
    op interface \
    ports { counter_out_V { O 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 6 \
    name time_elapse_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_time_elapse_V \
    op interface \
    ports { time_elapse_V { O 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 7 \
    name m_axis_data_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_m_axis_data_V \
    op interface \
    ports { m_axis_data_V { O 512 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 8 \
    name m_axis_keep_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_m_axis_keep_V \
    op interface \
    ports { m_axis_keep_V { O 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 9 \
    name m_axis_last_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_m_axis_last_V \
    op interface \
    ports { m_axis_last_V { O 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 10 \
    name m_axis_valid_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_m_axis_valid_V \
    op interface \
    ports { m_axis_valid_V { O 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 11 \
    name done_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_done_V \
    op interface \
    ports { done_V { O 1 vector } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -1 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


