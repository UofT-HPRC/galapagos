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
    name myMacAddr_V \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_myMacAddr_V \
    op interface \
    ports { myMacAddr_V { I 48 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2 \
    name s_axis_data_V \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_s_axis_data_V \
    op interface \
    ports { s_axis_data_V { I 512 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3 \
    name s_axis_keep_V \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_s_axis_keep_V \
    op interface \
    ports { s_axis_keep_V { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4 \
    name s_axis_last_V \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_s_axis_last_V \
    op interface \
    ports { s_axis_last_V { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5 \
    name s_axis_valid_V \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_s_axis_valid_V \
    op interface \
    ports { s_axis_valid_V { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 6 \
    name arp_data_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_arp_data_V \
    op interface \
    ports { arp_data_V { O 336 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 7 \
    name arp_valid_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_arp_valid_V \
    op interface \
    ports { arp_valid_V { O 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 8 \
    name ip_data_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_ip_data_V \
    op interface \
    ports { ip_data_V { O 336 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 9 \
    name ip_valid_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_ip_valid_V \
    op interface \
    ports { ip_valid_V { O 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 10 \
    name payload_data_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_payload_data_V \
    op interface \
    ports { payload_data_V { O 512 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 11 \
    name payload_valid_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_payload_valid_V \
    op interface \
    ports { payload_valid_V { O 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 12 \
    name payload_last_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_payload_last_V \
    op interface \
    ports { payload_last_V { O 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 13 \
    name payload_len_data_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_payload_len_data_V \
    op interface \
    ports { payload_len_data_V { O 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 14 \
    name payload_len_valid_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_payload_len_valid_V \
    op interface \
    ports { payload_len_valid_V { O 1 vector } } \
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


