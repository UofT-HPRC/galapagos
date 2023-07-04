# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 347 \
    name N_pipe_in_2_V_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_N_pipe_in_2_V_V \
    op interface \
    ports { N_pipe_in_2_V_V_dout { I 32 vector } N_pipe_in_2_V_V_empty_n { I 1 bit } N_pipe_in_2_V_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 348 \
    name N_pipe_out_3_V_V \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_N_pipe_out_3_V_V \
    op interface \
    ports { N_pipe_out_3_V_V_din { O 32 vector } N_pipe_out_3_V_V_full_n { I 1 bit } N_pipe_out_3_V_V_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 349 \
    name a_in_1_2_V_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_a_in_1_2_V_V \
    op interface \
    ports { a_in_1_2_V_V_dout { I 256 vector } a_in_1_2_V_V_empty_n { I 1 bit } a_in_1_2_V_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 350 \
    name a_in_2_2_V_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_a_in_2_2_V_V \
    op interface \
    ports { a_in_2_2_V_V_dout { I 256 vector } a_in_2_2_V_V_empty_n { I 1 bit } a_in_2_2_V_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 351 \
    name a_in_3_2_V_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_a_in_3_2_V_V \
    op interface \
    ports { a_in_3_2_V_V_dout { I 256 vector } a_in_3_2_V_V_empty_n { I 1 bit } a_in_3_2_V_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 352 \
    name a_in_4_2_V_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_a_in_4_2_V_V \
    op interface \
    ports { a_in_4_2_V_V_dout { I 256 vector } a_in_4_2_V_V_empty_n { I 1 bit } a_in_4_2_V_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 353 \
    name b_in_1_2_V_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_b_in_1_2_V_V \
    op interface \
    ports { b_in_1_2_V_V_dout { I 256 vector } b_in_1_2_V_V_empty_n { I 1 bit } b_in_1_2_V_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 354 \
    name b_in_2_2_V_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_b_in_2_2_V_V \
    op interface \
    ports { b_in_2_2_V_V_dout { I 256 vector } b_in_2_2_V_V_empty_n { I 1 bit } b_in_2_2_V_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 355 \
    name b_out_1_3_V_V \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_b_out_1_3_V_V \
    op interface \
    ports { b_out_1_3_V_V_din { O 256 vector } b_out_1_3_V_V_full_n { I 1 bit } b_out_1_3_V_V_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 356 \
    name b_out_2_3_V_V \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_b_out_2_3_V_V \
    op interface \
    ports { b_out_2_3_V_V_din { O 256 vector } b_out_2_3_V_V_full_n { I 1 bit } b_out_2_3_V_V_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 357 \
    name c_in_1_2_V_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_c_in_1_2_V_V \
    op interface \
    ports { c_in_1_2_V_V_dout { I 32 vector } c_in_1_2_V_V_empty_n { I 1 bit } c_in_1_2_V_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 358 \
    name c_in_2_2_V_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_c_in_2_2_V_V \
    op interface \
    ports { c_in_2_2_V_V_dout { I 32 vector } c_in_2_2_V_V_empty_n { I 1 bit } c_in_2_2_V_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 359 \
    name c_out_1_3_V_V \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_c_out_1_3_V_V \
    op interface \
    ports { c_out_1_3_V_V_din { O 32 vector } c_out_1_3_V_V_full_n { I 1 bit } c_out_1_3_V_V_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 360 \
    name c_out_2_3_V_V \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_c_out_2_3_V_V \
    op interface \
    ports { c_out_2_3_V_V_din { O 32 vector } c_out_2_3_V_V_full_n { I 1 bit } c_out_2_3_V_V_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_done { O 1 bit } ap_idle { O 1 bit } ap_continue { I 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
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
    id -3 \
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


