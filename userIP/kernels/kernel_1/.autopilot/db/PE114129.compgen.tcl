# This script segment is generated automatically by AutoPilot

set id 52
set name kernel_1_am_addmul_24s_24s_8s_32_1_1
set corename simcore_am
set op am
set stage_num 1
set max_latency -1
set registered_input 1
set in0_width 24
set in0_signed 1
set in1_width 24
set in1_signed 1
set in2_width 8
set in2_signed 1
set out_width 32
set exp (i0+i1)*i2
set arg_lists {i0 {24 1 +} i1 {24 1 +} s {25 1 +} i2 {8 1 +} p {32 1 +} c_expval {c} acc {0} }
set TrueReset 0
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_am] == "ap_gen_simcore_am"} {
eval "ap_gen_simcore_am { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    true_reset ${TrueReset} \
    stage_num ${stage_num} \
    max_latency ${max_latency} \
    registered_input ${registered_input} \
    in0_width ${in0_width} \
    in0_signed ${in0_signed} \
    in1_width ${in1_width} \
    in1_signed ${in1_signed} \
    in2_width ${in2_width} \
    in2_signed ${in2_signed} \
    out_width ${out_width} \
    exp ${exp} \
    arg_lists {${arg_lists}} \
}"
} else {
puts "@W \[IMPL-100\] Cannot find ap_gen_simcore_am, check your AutoPilot builtin lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ${name}
}


set op am
set corename DSP48
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_dsp48] == "::AESL_LIB_VIRTEX::xil_gen_dsp48"} {
eval "::AESL_LIB_VIRTEX::xil_gen_dsp48 { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    true_reset ${TrueReset} \
    stage_num ${stage_num} \
    max_latency ${max_latency} \
    registered_input ${registered_input} \
    in0_width ${in0_width} \
    in0_signed ${in0_signed} \
    in1_width ${in1_width} \
    in1_signed ${in1_signed} \
    in2_width ${in2_width} \
    in2_signed ${in2_signed} \
    out_width ${out_width} \
    exp ${exp} \
    arg_lists {${arg_lists}} \
}"
} else {
puts "@W \[IMPL-101\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_dsp48, check your platform lib"
}
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 117 \
    name N_pipe_in_V_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_N_pipe_in_V_V \
    op interface \
    ports { N_pipe_in_V_V_dout { I 32 vector } N_pipe_in_V_V_empty_n { I 1 bit } N_pipe_in_V_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 118 \
    name N_pipe_out_V_V7 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_N_pipe_out_V_V7 \
    op interface \
    ports { N_pipe_out_V_V7_din { O 32 vector } N_pipe_out_V_V7_full_n { I 1 bit } N_pipe_out_V_V7_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 119 \
    name a_in_1_V_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_a_in_1_V_V \
    op interface \
    ports { a_in_1_V_V_dout { I 256 vector } a_in_1_V_V_empty_n { I 1 bit } a_in_1_V_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 120 \
    name a_in_2_V_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_a_in_2_V_V \
    op interface \
    ports { a_in_2_V_V_dout { I 256 vector } a_in_2_V_V_empty_n { I 1 bit } a_in_2_V_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 121 \
    name a_in_3_V_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_a_in_3_V_V \
    op interface \
    ports { a_in_3_V_V_dout { I 256 vector } a_in_3_V_V_empty_n { I 1 bit } a_in_3_V_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 122 \
    name a_in_4_V_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_a_in_4_V_V \
    op interface \
    ports { a_in_4_V_V_dout { I 256 vector } a_in_4_V_V_empty_n { I 1 bit } a_in_4_V_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 123 \
    name b_in_1_V_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_b_in_1_V_V \
    op interface \
    ports { b_in_1_V_V_dout { I 256 vector } b_in_1_V_V_empty_n { I 1 bit } b_in_1_V_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 124 \
    name b_in_2_V_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_b_in_2_V_V \
    op interface \
    ports { b_in_2_V_V_dout { I 256 vector } b_in_2_V_V_empty_n { I 1 bit } b_in_2_V_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 125 \
    name b_out_1_V_V33 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_b_out_1_V_V33 \
    op interface \
    ports { b_out_1_V_V33_din { O 256 vector } b_out_1_V_V33_full_n { I 1 bit } b_out_1_V_V33_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 126 \
    name b_out_2_V_V39 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_b_out_2_V_V39 \
    op interface \
    ports { b_out_2_V_V39_din { O 256 vector } b_out_2_V_V39_full_n { I 1 bit } b_out_2_V_V39_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 127 \
    name c_out_1_V_V55 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_c_out_1_V_V55 \
    op interface \
    ports { c_out_1_V_V55_din { O 32 vector } c_out_1_V_V55_full_n { I 1 bit } c_out_1_V_V55_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 128 \
    name c_out_2_V_V60 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_c_out_2_V_V60 \
    op interface \
    ports { c_out_2_V_V60_din { O 32 vector } c_out_2_V_V60_full_n { I 1 bit } c_out_2_V_V60_write { O 1 bit } } \
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


