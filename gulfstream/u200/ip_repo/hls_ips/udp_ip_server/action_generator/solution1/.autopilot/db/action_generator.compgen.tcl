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
    name meta_in_src_ip_V \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_meta_in_src_ip_V \
    op interface \
    ports { meta_in_src_ip_V { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2 \
    name meta_in_protocol_header_V \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_meta_in_protocol_header_V \
    op interface \
    ports { meta_in_protocol_header_V { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3 \
    name meta_in_checksum_V \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_meta_in_checksum_V \
    op interface \
    ports { meta_in_checksum_V { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4 \
    name meta_in_action_V \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_meta_in_action_V \
    op interface \
    ports { meta_in_action_V { I 2 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5 \
    name payload_cksum_data_V \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_payload_cksum_data_V \
    op interface \
    ports { payload_cksum_data_V { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 6 \
    name payload_cksum_valid_V \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_payload_cksum_valid_V \
    op interface \
    ports { payload_cksum_valid_V { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 7 \
    name action_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_action_out \
    op interface \
    ports { action_out { O 65 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 8 \
    name action_out_valid_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_action_out_valid_V \
    op interface \
    ports { action_out_valid_V { O 1 vector } } \
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


