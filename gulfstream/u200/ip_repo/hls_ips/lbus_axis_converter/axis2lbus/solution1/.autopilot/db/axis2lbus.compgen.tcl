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
    id 2 \
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
    id 3 \
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
    id 4 \
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
    id 5 \
    name lbus_0_data_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_lbus_0_data_V \
    op interface \
    ports { lbus_0_data_V { O 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 6 \
    name lbus_1_data_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_lbus_1_data_V \
    op interface \
    ports { lbus_1_data_V { O 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 7 \
    name lbus_2_data_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_lbus_2_data_V \
    op interface \
    ports { lbus_2_data_V { O 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 8 \
    name lbus_3_data_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_lbus_3_data_V \
    op interface \
    ports { lbus_3_data_V { O 128 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 9 \
    name lbus_0_ena_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_lbus_0_ena_V \
    op interface \
    ports { lbus_0_ena_V { O 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 10 \
    name lbus_1_ena_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_lbus_1_ena_V \
    op interface \
    ports { lbus_1_ena_V { O 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 11 \
    name lbus_2_ena_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_lbus_2_ena_V \
    op interface \
    ports { lbus_2_ena_V { O 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 12 \
    name lbus_3_ena_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_lbus_3_ena_V \
    op interface \
    ports { lbus_3_ena_V { O 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 13 \
    name lbus_0_sop_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_lbus_0_sop_V \
    op interface \
    ports { lbus_0_sop_V { O 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 14 \
    name lbus_1_sop_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_lbus_1_sop_V \
    op interface \
    ports { lbus_1_sop_V { O 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 15 \
    name lbus_2_sop_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_lbus_2_sop_V \
    op interface \
    ports { lbus_2_sop_V { O 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 16 \
    name lbus_3_sop_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_lbus_3_sop_V \
    op interface \
    ports { lbus_3_sop_V { O 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 17 \
    name lbus_0_eop_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_lbus_0_eop_V \
    op interface \
    ports { lbus_0_eop_V { O 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 18 \
    name lbus_1_eop_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_lbus_1_eop_V \
    op interface \
    ports { lbus_1_eop_V { O 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 19 \
    name lbus_2_eop_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_lbus_2_eop_V \
    op interface \
    ports { lbus_2_eop_V { O 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 20 \
    name lbus_3_eop_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_lbus_3_eop_V \
    op interface \
    ports { lbus_3_eop_V { O 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 21 \
    name lbus_0_err_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_lbus_0_err_V \
    op interface \
    ports { lbus_0_err_V { O 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 22 \
    name lbus_1_err_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_lbus_1_err_V \
    op interface \
    ports { lbus_1_err_V { O 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 23 \
    name lbus_2_err_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_lbus_2_err_V \
    op interface \
    ports { lbus_2_err_V { O 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 24 \
    name lbus_3_err_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_lbus_3_err_V \
    op interface \
    ports { lbus_3_err_V { O 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 25 \
    name lbus_0_mty_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_lbus_0_mty_V \
    op interface \
    ports { lbus_0_mty_V { O 4 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 26 \
    name lbus_1_mty_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_lbus_1_mty_V \
    op interface \
    ports { lbus_1_mty_V { O 4 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 27 \
    name lbus_2_mty_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_lbus_2_mty_V \
    op interface \
    ports { lbus_2_mty_V { O 4 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 28 \
    name lbus_3_mty_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_lbus_3_mty_V \
    op interface \
    ports { lbus_3_mty_V { O 4 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 29 \
    name lbus_ready_V \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_lbus_ready_V \
    op interface \
    ports { lbus_ready_V { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 30 \
    name axis_ready_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_axis_ready_V \
    op interface \
    ports { axis_ready_V { O 1 vector } } \
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


