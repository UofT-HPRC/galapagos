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
    name action \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_action \
    op interface \
    ports { action { I 65 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2 \
    name action_valid_V \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_action_valid_V \
    op interface \
    ports { action_valid_V { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3 \
    name action_empty_V \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_action_empty_V \
    op interface \
    ports { action_empty_V { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4 \
    name action_re_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_action_re_V \
    op interface \
    ports { action_re_V { O 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5 \
    name payload_in_data_V \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_payload_in_data_V \
    op interface \
    ports { payload_in_data_V { I 512 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 6 \
    name payload_in_keep_V \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_payload_in_keep_V \
    op interface \
    ports { payload_in_keep_V { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 7 \
    name payload_in_valid_V \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_payload_in_valid_V \
    op interface \
    ports { payload_in_valid_V { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 8 \
    name payload_in_last_V \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_payload_in_last_V \
    op interface \
    ports { payload_in_last_V { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 9 \
    name payload_ready_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_payload_ready_V \
    op interface \
    ports { payload_ready_V { O 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 10 \
    name payload_out_data_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_payload_out_data_V \
    op interface \
    ports { payload_out_data_V { O 512 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 11 \
    name payload_out_keep_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_payload_out_keep_V \
    op interface \
    ports { payload_out_keep_V { O 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 12 \
    name payload_out_valid_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_payload_out_valid_V \
    op interface \
    ports { payload_out_valid_V { O 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 13 \
    name payload_out_last_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_payload_out_last_V \
    op interface \
    ports { payload_out_last_V { O 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 14 \
    name src_ip_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_src_ip_V \
    op interface \
    ports { src_ip_V { O 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 15 \
    name src_port_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_src_port_V \
    op interface \
    ports { src_port_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 16 \
    name dst_port_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_dst_port_V \
    op interface \
    ports { dst_port_V { O 16 vector } } \
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


