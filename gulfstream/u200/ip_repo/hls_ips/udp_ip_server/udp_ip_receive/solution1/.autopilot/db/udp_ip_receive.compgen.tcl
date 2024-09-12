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
    name myIP_V \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_myIP_V \
    op interface \
    ports { myIP_V { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2 \
    name ip_in_data_V \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_ip_in_data_V \
    op interface \
    ports { ip_in_data_V { I 336 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3 \
    name ip_in_valid_V \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_ip_in_valid_V \
    op interface \
    ports { ip_in_valid_V { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4 \
    name meta_out_src_ip_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_meta_out_src_ip_V \
    op interface \
    ports { meta_out_src_ip_V { O 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5 \
    name meta_out_protocol_header_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_meta_out_protocol_header_V \
    op interface \
    ports { meta_out_protocol_header_V { O 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 6 \
    name meta_out_checksum_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_meta_out_checksum_V \
    op interface \
    ports { meta_out_checksum_V { O 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 7 \
    name meta_out_action_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_meta_out_action_V \
    op interface \
    ports { meta_out_action_V { O 2 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 8 \
    name arp_internal_resp_Mac_IP_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_arp_internal_resp_Mac_IP_V \
    op interface \
    ports { arp_internal_resp_Mac_IP_V { O 80 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 9 \
    name arp_internal_resp_valid_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_arp_internal_resp_valid_V \
    op interface \
    ports { arp_internal_resp_valid_V { O 1 vector } } \
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


