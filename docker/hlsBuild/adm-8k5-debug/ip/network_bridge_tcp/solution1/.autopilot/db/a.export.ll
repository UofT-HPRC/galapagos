; ModuleID = '/home/user/galapagos/hlsBuild/adm-8k5-debug/ip/network_bridge_tcp/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@wait_for_connection = internal unnamed_addr global i1 false, align 1
@waitPortStatus = internal unnamed_addr global i1 false, align 1
@t2g_write_sid_OC_V_O = internal unnamed_addr constant [18 x i8] c"t2g_write_sid.V.V\00"
@t2g_write_sid_V_V = internal global i16 0
@t2g_write_dest_OC_V_s = internal unnamed_addr constant [19 x i8] c"t2g_write_dest.V.V\00"
@t2g_write_dest_V_V = internal global i8 0
@t2g_read_sid_OC_V_OC = internal unnamed_addr constant [17 x i8] c"t2g_read_sid.V.V\00"
@t2g_read_sid_V_V = internal global i16 0
@t2g_read_dest_OC_V_O = internal unnamed_addr constant [18 x i8] c"t2g_read_dest.V.V\00"
@t2g_read_dest_V_V = internal global i8 0
@state_1 = internal unnamed_addr global i4 0, align 1
@state = internal unnamed_addr global i3 0, align 1
@src_V = internal unnamed_addr global i8 0
@sessionID_table_V = internal unnamed_addr global [256 x i32] [i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000, i32 1000]
@sessionID_fifo_OC_V_s = internal unnamed_addr constant [19 x i8] c"sessionID_fifo.V.V\00"
@sessionID_fifo_V_V = internal global i16 0
@sessionID_V_1 = internal unnamed_addr global i16 0
@sessionID_V = internal unnamed_addr global i16 0
@network_bridge_tcp_s = internal unnamed_addr constant [19 x i8] c"network_bridge_tcp\00"
@log_lut_table_ap_fixed_58_9_ap_q_mode_5_ap_o_mode_3_0_7_6_64_array_V = global [64 x i58] zeroinitializer
@log_lut_table_ap_fixed_58_9_ap_q_mode_5_ap_o_mode_3_0_4_4_16_array_V = global [16 x i58] zeroinitializer
@log_lut_table_ap_fixed_58_9_ap_q_mode_5_ap_o_mode_3_0_12_6_64_array_V = global [64 x i58] zeroinitializer
@log_lut_table_ap_fixed_34_6_ap_q_mode_5_ap_o_mode_3_0_7_6_64_array_V = global [64 x i34] zeroinitializer
@log_lut_table_ap_fixed_34_6_ap_q_mode_5_ap_o_mode_3_0_4_4_16_array_V = global [16 x i34] zeroinitializer
@log_lut_table_ap_fixed_102_12_ap_q_mode_5_ap_o_mode_3_0_7_6_64_array_V = global [64 x i102] zeroinitializer
@log_lut_table_ap_fixed_102_12_ap_q_mode_5_ap_o_mode_3_0_4_4_16_array_V = global [16 x i102] zeroinitializer
@log_lut_table_ap_fixed_102_12_ap_q_mode_5_ap_o_mode_3_0_32_6_64_array_V = global [64 x i102] zeroinitializer
@log_lut_table_ap_fixed_102_12_ap_q_mode_5_ap_o_mode_3_0_27_6_64_array_V = global [64 x i102] zeroinitializer
@log_lut_table_ap_fixed_102_12_ap_q_mode_5_ap_o_mode_3_0_22_6_64_array_V = global [64 x i102] zeroinitializer
@log_lut_table_ap_fixed_102_12_ap_q_mode_5_ap_o_mode_3_0_17_6_64_array_V = global [64 x i102] zeroinitializer
@log_lut_table_ap_fixed_102_12_ap_q_mode_5_ap_o_mode_3_0_12_6_64_array_V = global [64 x i102] zeroinitializer
@log_inverse_lut_table_0_5_64_array_V = global [64 x i6] zeroinitializer
@log0_lut_table_ap_fixed_58_9_ap_q_mode_5_ap_o_mode_3_0_float_0_5_64_array_V = global [64 x i58] zeroinitializer
@log0_lut_table_ap_fixed_102_12_ap_q_mode_5_ap_o_mode_3_0_double_0_5_64_array_V = global [64 x i102] zeroinitializer
@llvm_global_ctors_1 = appending global [2 x void ()*] [void ()* @_GLOBAL__I_a, void ()* @_GLOBAL__I_a33]
@llvm_global_ctors_0 = appending global [2 x i32] [i32 65535, i32 65535]
@listenDone = internal unnamed_addr global i1 false, align 1
@ip_table_V = global [256 x i32] zeroinitializer
@ip_fifo_OC_V_OC_V_st = internal unnamed_addr constant [12 x i8] c"ip_fifo.V.V\00"
@ip_fifo_V_V = internal global i32 0
@header_last_V = internal unnamed_addr global i1 false
@header_keep_V = internal unnamed_addr global i8 0
@header_data_V = internal unnamed_addr global i64 0
@g2t_write_sid_OC_V_O = internal unnamed_addr constant [18 x i8] c"g2t_write_sid.V.V\00"
@g2t_write_sid_V_V = internal global i16 0
@g2t_write_dest_OC_V_s = internal unnamed_addr constant [19 x i8] c"g2t_write_dest.V.V\00"
@g2t_write_dest_V_V = internal global i8 0
@g2t_read_sid_OC_V_OC = internal unnamed_addr constant [17 x i8] c"g2t_read_sid.V.V\00"
@g2t_read_sid_V_V = internal global i16 0
@g2t_read_dest_OC_V_O = internal unnamed_addr constant [18 x i8] c"g2t_read_dest.V.V\00"
@g2t_read_dest_V_V = internal global i8 0
@dest_V = internal unnamed_addr global i8 0
@currWord_last_V = internal unnamed_addr global i1 false
@currWord_keep_V = internal unnamed_addr global i8 0
@currWord_data_V = internal unnamed_addr global i64 0
@ap_fifo_str = internal unnamed_addr constant [8 x i8] c"ap_fifo\00"
@p_ZN14log0_lut_tableI8ap_fixedILi34ELi6EL9ap_q_mode5EL9ap_o_mode3ELi0EEDhLi0ELi5ELi64EE5arrayE_V = global [64 x i34] zeroinitializer
@p_str39 = private unnamed_addr constant [38 x i8] c"-bus_bundle s_axis_listen_port_status\00", align 1
@p_str38 = private unnamed_addr constant [11 x i8] c"AXI4Stream\00", align 1
@p_str37 = private unnamed_addr constant [29 x i8] c"-bus_bundle s_axis_tx_status\00", align 1
@p_str36 = private unnamed_addr constant [27 x i8] c"-bus_bundle m_axis_tx_data\00", align 1
@p_str35 = private unnamed_addr constant [31 x i8] c"-bus_bundle m_axis_tx_metadata\00", align 1
@p_str34 = private unnamed_addr constant [27 x i8] c"-bus_bundle s_axis_rx_data\00", align 1
@p_str33 = private unnamed_addr constant [31 x i8] c"-bus_bundle s_axis_rx_metadata\00", align 1
@p_str32 = private unnamed_addr constant [32 x i8] c"-bus_bundle m_axis_read_package\00", align 1
@p_str31 = private unnamed_addr constant [33 x i8] c"-bus_bundle s_axis_notifications\00", align 1
@p_str30 = private unnamed_addr constant [31 x i8] c"-bus_bundle s_axis_open_status\00", align 1
@p_str29 = private unnamed_addr constant [35 x i8] c"-bus_bundle m_axis_open_connection\00", align 1
@p_str28 = private unnamed_addr constant [38 x i8] c"-bus_bundle m_axis_listen_port_status\00", align 1
@p_str27 = private unnamed_addr constant [31 x i8] c"-bus_bundle m_axis_listen_port\00", align 1
@p_str26 = private unnamed_addr constant [37 x i8] c"-bus_bundle m_axis_txGalapagosBridge\00", align 1
@p_str25 = private unnamed_addr constant [37 x i8] c"-bus_bundle s_axis_rxGalapagosBridge\00", align 1
@p_str24 = private unnamed_addr constant [5 x i8] c"AXIS\00", align 1
@p_str23 = private unnamed_addr constant [13 x i8] c"ap_ctrl_none\00", align 1
@p_str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

define internal fastcc void @tcp_to_galapagos_int(i16* %rxMetaData_V_V, i73* %rxData_V, i73* %txGalapagosBridge_V) {
entry:
  call void (...)* @_ssdm_op_SpecIFCore(i73* %rxData_V, [1 x i8]* @p_str, [5 x i8]* @p_str24, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [27 x i8]* @p_str34)
  call void (...)* @_ssdm_op_SpecIFCore(i16* %rxMetaData_V_V, [1 x i8]* @p_str, [5 x i8]* @p_str24, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [31 x i8]* @p_str33)
  call void (...)* @_ssdm_op_SpecIFCore(i73* %txGalapagosBridge_V, [1 x i8]* @p_str, [5 x i8]* @p_str24, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [37 x i8]* @p_str26)
  call void (...)* @_ssdm_op_SpecInterface(i16* %rxMetaData_V_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i73* %rxData_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i73* %txGalapagosBridge_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i8* @t2g_read_dest_V_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i16* @t2g_read_sid_V_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i8* @t2g_write_dest_V_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i16* @t2g_write_sid_V_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecPipeline(i32 1, i32 1, i32 1, i32 0, [1 x i8]* @p_str) nounwind
  %state_load = load i3* @state, align 1
  switch i3 %state_load, label %tcp_to_galapagos_interface.exit [
    i3 0, label %0
    i3 1, label %2
    i3 2, label %4
    i3 3, label %6
    i3 -4, label %7
    i3 -3, label %8
  ]

; <label>:0                                       ; preds = %entry
  %tmp = call i1 @_ssdm_op_NbReadReq.ap_fifo.i16P(i16* %rxMetaData_V_V, i32 1)
  br i1 %tmp, label %1, label %._crit_edge6.i

; <label>:1                                       ; preds = %0
  %tmp_V_2 = call i16 @_ssdm_op_Read.ap_fifo.volatile.i16P(i16* %rxMetaData_V_V)
  store i16 %tmp_V_2, i16* @sessionID_V_1, align 2
  store i3 1, i3* @state, align 1
  br label %._crit_edge6.i

._crit_edge6.i:                                   ; preds = %1, %0
  br label %tcp_to_galapagos_interface.exit

; <label>:2                                       ; preds = %entry
  %tmp_1 = call i1 @_ssdm_op_NbReadReq.ap_fifo.i73P(i73* %rxData_V, i32 1)
  br i1 %tmp_1, label %3, label %._crit_edge7.i

; <label>:3                                       ; preds = %2
  %tmp14 = call i73 @_ssdm_op_Read.ap_fifo.volatile.i73P(i73* %rxData_V)
  %p_Val2_s = trunc i73 %tmp14 to i64
  store i64 %p_Val2_s, i64* @currWord_data_V, align 8
  %tmp_keep_V_1_load_ne = call i8 @_ssdm_op_PartSelect.i8.i73.i32.i32(i73 %tmp14, i32 64, i32 71)
  store i8 %tmp_keep_V_1_load_ne, i8* @currWord_keep_V, align 8
  %tmp_5 = call i1 @_ssdm_op_BitSelect.i1.i73.i32(i73 %tmp14, i32 72)
  store i1 %tmp_5, i1* @currWord_last_V, align 1
  %tmp_V_3 = call i8 @_ssdm_op_PartSelect.i8.i73.i32.i32(i73 %tmp14, i32 16, i32 23)
  store i8 %tmp_V_3, i8* @src_V, align 1
  call void @_ssdm_op_Write.ap_fifo.volatile.i8P(i8* @t2g_read_dest_V_V, i8 %tmp_V_3)
  store i3 2, i3* @state, align 1
  %tmp_V_7_0 = call i16 @_ssdm_op_Read.ap_fifo.volatile.i16P(i16* %rxMetaData_V_V)
  br label %._crit_edge7.i

._crit_edge7.i:                                   ; preds = %3, %2
  br label %tcp_to_galapagos_interface.exit

; <label>:4                                       ; preds = %entry
  %tmp_2 = call i1 @_ssdm_op_NbReadReq.ap_fifo.i16P(i16* @t2g_read_sid_V_V, i32 1)
  br i1 %tmp_2, label %5, label %._crit_edge8.i

; <label>:5                                       ; preds = %4
  %tmp_V_4 = call i16 @_ssdm_op_Read.ap_fifo.volatile.i16P(i16* @t2g_read_sid_V_V)
  %tmp_i = icmp eq i16 %tmp_V_4, 1000
  %storemerge_i = select i1 %tmp_i, i3 3, i3 -4
  store i3 %storemerge_i, i3* @state, align 1
  br label %._crit_edge8.i

._crit_edge8.i:                                   ; preds = %5, %4
  br label %tcp_to_galapagos_interface.exit

; <label>:6                                       ; preds = %entry
  %tmp_V = load i8* @src_V, align 1
  call void @_ssdm_op_Write.ap_fifo.volatile.i8P(i8* @t2g_write_dest_V_V, i8 %tmp_V)
  %tmp_V_1 = load i16* @sessionID_V_1, align 2
  call void @_ssdm_op_Write.ap_fifo.volatile.i16P(i16* @t2g_write_sid_V_V, i16 %tmp_V_1)
  store i3 -4, i3* @state, align 1
  br label %tcp_to_galapagos_interface.exit

; <label>:7                                       ; preds = %entry
  %tmp_data_V = load i64* @currWord_data_V, align 8
  %tmp_keep_V = load i8* @currWord_keep_V, align 8
  %tmp_last_V = load i1* @currWord_last_V, align 1
  %tmp_11 = call i73 @_ssdm_op_BitConcatenate.i73.i1.i8.i64(i1 %tmp_last_V, i8 %tmp_keep_V, i64 %tmp_data_V)
  call void @_ssdm_op_Write.ap_fifo.volatile.i73P(i73* %txGalapagosBridge_V, i73 %tmp_11)
  store i3 -3, i3* @state, align 1
  br label %tcp_to_galapagos_interface.exit

; <label>:8                                       ; preds = %entry
  br i1 undef, label %9, label %10

; <label>:9                                       ; preds = %8
  store i3 0, i3* @state, align 1
  br label %12

; <label>:10                                      ; preds = %8
  %tmp_3 = call i1 @_ssdm_op_NbReadReq.ap_fifo.i73P(i73* %rxData_V, i32 1)
  br i1 %tmp_3, label %11, label %._crit_edge9.i

; <label>:11                                      ; preds = %10
  %tmp_227 = call i73 @_ssdm_op_Read.ap_fifo.volatile.i73P(i73* %rxData_V)
  call void @_ssdm_op_Write.ap_fifo.volatile.i73P(i73* %txGalapagosBridge_V, i73 %tmp_227)
  br label %._crit_edge9.i

._crit_edge9.i:                                   ; preds = %11, %10
  br label %12

; <label>:12                                      ; preds = %._crit_edge9.i, %9
  br label %tcp_to_galapagos_interface.exit

tcp_to_galapagos_interface.exit:                  ; preds = %12, %7, %6, %._crit_edge8.i, %._crit_edge7.i, %._crit_edge6.i, %entry
  ret void
}

define internal fastcc void @sessionID_table_stea() nounwind uwtable {
entry:
  call void (...)* @_ssdm_op_SpecInterface(i8* @g2t_read_dest_V_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i16* @g2t_read_sid_V_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i8* @g2t_write_dest_V_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i16* @g2t_write_sid_V_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i8* @t2g_read_dest_V_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i16* @t2g_read_sid_V_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i8* @t2g_write_dest_V_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i16* @t2g_write_sid_V_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecPipeline(i32 1, i32 1, i32 1, i32 0, [1 x i8]* @p_str) nounwind
  %tmp = call i1 @_ssdm_op_NbReadReq.ap_fifo.i8P(i8* @t2g_read_dest_V_V, i32 1) nounwind
  br i1 %tmp, label %0, label %1

; <label>:0                                       ; preds = %entry
  %tmp_V = call i8 @_ssdm_op_Read.ap_fifo.volatile.i8P(i8* @t2g_read_dest_V_V) nounwind
  %tmp_i = zext i8 %tmp_V to i64
  %sessionID_table_V_ad = getelementptr [256 x i32]* @sessionID_table_V, i64 0, i64 %tmp_i
  %sessionID_table_V_lo = load i32* %sessionID_table_V_ad, align 4
  %tmp_V_5 = trunc i32 %sessionID_table_V_lo to i16
  call void @_ssdm_op_Write.ap_fifo.volatile.i16P(i16* @t2g_read_sid_V_V, i16 %tmp_V_5) nounwind
  br label %sessionID_table_steaming.exit

; <label>:1                                       ; preds = %entry
  %tmp_4 = call i1 @_ssdm_op_NbReadReq.ap_fifo.i8P(i8* @t2g_write_dest_V_V, i32 1) nounwind
  br i1 %tmp_4, label %2, label %._crit_edge1.i

; <label>:2                                       ; preds = %1
  %tmp_5 = call i1 @_ssdm_op_NbReadReq.ap_fifo.i16P(i16* @t2g_write_sid_V_V, i32 1) nounwind
  br i1 %tmp_5, label %3, label %._crit_edge1.i

; <label>:3                                       ; preds = %2
  %tmp_V_6 = call i8 @_ssdm_op_Read.ap_fifo.volatile.i8P(i8* @t2g_write_dest_V_V) nounwind
  %tmp_8_i = zext i8 %tmp_V_6 to i64
  %tmp_V_7 = call i16 @_ssdm_op_Read.ap_fifo.volatile.i16P(i16* @t2g_write_sid_V_V) nounwind
  %p_1_i = zext i16 %tmp_V_7 to i32
  %sessionID_table_V_ad_1 = getelementptr [256 x i32]* @sessionID_table_V, i64 0, i64 %tmp_8_i
  store i32 %p_1_i, i32* %sessionID_table_V_ad_1, align 4
  br label %9

._crit_edge1.i:                                   ; preds = %2, %1
  %tmp_6 = call i1 @_ssdm_op_NbReadReq.ap_fifo.i8P(i8* @g2t_read_dest_V_V, i32 1) nounwind
  br i1 %tmp_6, label %4, label %5

; <label>:4                                       ; preds = %._crit_edge1.i
  %tmp_V_8 = call i8 @_ssdm_op_Read.ap_fifo.volatile.i8P(i8* @g2t_read_dest_V_V) nounwind
  %tmp_9_i = zext i8 %tmp_V_8 to i64
  %sessionID_table_V_ad_2 = getelementptr [256 x i32]* @sessionID_table_V, i64 0, i64 %tmp_9_i
  %sessionID_table_V_lo_1 = load i32* %sessionID_table_V_ad_2, align 4
  %tmp_V_9 = trunc i32 %sessionID_table_V_lo_1 to i16
  call void @_ssdm_op_Write.ap_fifo.volatile.i16P(i16* @g2t_read_sid_V_V, i16 %tmp_V_9) nounwind
  br label %8

; <label>:5                                       ; preds = %._crit_edge1.i
  %tmp_7 = call i1 @_ssdm_op_NbReadReq.ap_fifo.i8P(i8* @g2t_write_dest_V_V, i32 1) nounwind
  br i1 %tmp_7, label %6, label %._crit_edge3.i

; <label>:6                                       ; preds = %5
  %tmp_8 = call i1 @_ssdm_op_NbReadReq.ap_fifo.i16P(i16* @g2t_write_sid_V_V, i32 1) nounwind
  br i1 %tmp_8, label %7, label %._crit_edge3.i

; <label>:7                                       ; preds = %6
  %tmp_V_10 = call i8 @_ssdm_op_Read.ap_fifo.volatile.i8P(i8* @g2t_write_dest_V_V) nounwind
  %tmp_11_i = zext i8 %tmp_V_10 to i64
  %tmp_V_11 = call i16 @_ssdm_op_Read.ap_fifo.volatile.i16P(i16* @g2t_write_sid_V_V) nounwind
  %p_3_i = zext i16 %tmp_V_11 to i32
  %sessionID_table_V_ad_3 = getelementptr [256 x i32]* @sessionID_table_V, i64 0, i64 %tmp_11_i
  store i32 %p_3_i, i32* %sessionID_table_V_ad_3, align 4
  br label %._crit_edge3.i

._crit_edge3.i:                                   ; preds = %7, %6, %5
  br label %8

; <label>:8                                       ; preds = %._crit_edge3.i, %4
  br label %9

; <label>:9                                       ; preds = %8, %3
  br label %sessionID_table_steaming.exit

sessionID_table_steaming.exit:                    ; preds = %9, %0
  ret void
}

define internal fastcc void @open_port(i16* %listenPort_V_V, i1* %listenPortStatus_V, i81* %notifications_V, i32* %readRequest_V) {
  call void (...)* @_ssdm_op_SpecIFCore(i32* %readRequest_V, [1 x i8]* @p_str, [5 x i8]* @p_str24, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [32 x i8]* @p_str32)
  call void (...)* @_ssdm_op_SpecIFCore(i81* %notifications_V, [1 x i8]* @p_str, [5 x i8]* @p_str24, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [33 x i8]* @p_str31)
  call void (...)* @_ssdm_op_SpecIFCore(i1* %listenPortStatus_V, [1 x i8]* @p_str, [5 x i8]* @p_str24, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [38 x i8]* @p_str28)
  call void (...)* @_ssdm_op_SpecIFCore(i16* %listenPort_V_V, [1 x i8]* @p_str, [5 x i8]* @p_str24, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [31 x i8]* @p_str27)
  call void (...)* @_ssdm_op_SpecInterface(i16* %listenPort_V_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i1* %listenPortStatus_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i81* %notifications_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i32* %readRequest_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecPipeline(i32 1, i32 1, i32 1, i32 0, [1 x i8]* @p_str) nounwind
  %listenDone_load = load i1* @listenDone, align 1
  %waitPortStatus_load = load i1* @waitPortStatus, align 1
  %brmerge = or i1 %listenDone_load, %waitPortStatus_load
  br i1 %brmerge, label %._crit_edge, label %1

; <label>:1                                       ; preds = %0
  call void @_ssdm_op_Write.ap_fifo.volatile.i16P(i16* %listenPort_V_V, i16 7)
  store i1 true, i1* @waitPortStatus, align 1
  br label %4

._crit_edge:                                      ; preds = %0
  br i1 %waitPortStatus_load, label %2, label %._crit_edge22

; <label>:2                                       ; preds = %._crit_edge
  %tmp = call i1 @_ssdm_op_NbReadReq.ap_fifo.i1P(i1* %listenPortStatus_V, i32 1)
  br i1 %tmp, label %3, label %._crit_edge22

; <label>:3                                       ; preds = %2
  %tmp_11 = call i1 @_ssdm_op_Read.ap_fifo.volatile.i1P(i1* %listenPortStatus_V)
  store i1 %tmp_11, i1* @listenDone, align 1
  store i1 false, i1* @waitPortStatus, align 1
  br label %._crit_edge22

._crit_edge22:                                    ; preds = %3, %2, %._crit_edge
  br label %4

; <label>:4                                       ; preds = %._crit_edge22, %1
  %tmp_2 = call i1 @_ssdm_op_NbReadReq.ap_fifo.i81P(i81* %notifications_V, i32 1)
  br i1 %tmp_2, label %5, label %._crit_edge24

; <label>:5                                       ; preds = %4
  %tmp1 = call i81 @_ssdm_op_Read.ap_fifo.volatile.i81P(i81* %notifications_V)
  %tmp_length_V = call i16 @_ssdm_op_PartSelect.i16.i81.i32.i32(i81 %tmp1, i32 16, i32 31)
  %tmp_s = icmp eq i16 %tmp_length_V, 0
  br i1 %tmp_s, label %._crit_edge25, label %6

; <label>:6                                       ; preds = %5
  %tmp_1 = trunc i81 %tmp1 to i32
  call void @_ssdm_op_Write.ap_fifo.volatile.i32P(i32* %readRequest_V, i32 %tmp_1)
  br label %._crit_edge25

._crit_edge25:                                    ; preds = %6, %5
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge25, %4
  ret void
}

define internal fastcc void @open_connections(i48* %openConnection_V, i17* %openConStatus_V) {
entry:
  call void (...)* @_ssdm_op_SpecIFCore(i17* %openConStatus_V, [1 x i8]* @p_str, [5 x i8]* @p_str24, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [31 x i8]* @p_str30)
  call void (...)* @_ssdm_op_SpecIFCore(i48* %openConnection_V, [1 x i8]* @p_str, [5 x i8]* @p_str24, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [35 x i8]* @p_str29)
  call void (...)* @_ssdm_op_SpecInterface(i48* %openConnection_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i17* %openConStatus_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i32* @ip_fifo_V_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i16* @sessionID_fifo_V_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecPipeline(i32 1, i32 1, i32 1, i32 0, [1 x i8]* @p_str) nounwind
  %tmp = call i1 @_ssdm_op_NbReadReq.ap_fifo.i32P(i32* @ip_fifo_V_V, i32 1)
  %wait_for_connection_s = load i1* @wait_for_connection, align 1
  %tmp_not_i = xor i1 %tmp, true
  %brmerge_i = or i1 %wait_for_connection_s, %tmp_not_i
  br i1 %brmerge_i, label %._crit_edge.i, label %0

; <label>:0                                       ; preds = %entry
  %tmp_V_12 = call i32 @_ssdm_op_Read.ap_fifo.volatile.i32P(i32* @ip_fifo_V_V)
  %tmp1 = call i48 @_ssdm_op_BitConcatenate.i48.i16.i32(i16 7, i32 %tmp_V_12)
  call void @_ssdm_op_Write.ap_fifo.volatile.i48P(i48* %openConnection_V, i48 %tmp1)
  store i1 true, i1* @wait_for_connection, align 1
  br label %open_connections.exit

._crit_edge.i:                                    ; preds = %entry
  br i1 %wait_for_connection_s, label %1, label %._crit_edge10.i

; <label>:1                                       ; preds = %._crit_edge.i
  %tmp_13 = call i1 @_ssdm_op_NbReadReq.ap_fifo.i17P(i17* %openConStatus_V, i32 1)
  br i1 %tmp_13, label %2, label %._crit_edge10.i

; <label>:2                                       ; preds = %1
  %tmp_1 = call i17 @_ssdm_op_Read.ap_fifo.volatile.i17P(i17* %openConStatus_V)
  %tmp_V = trunc i17 %tmp_1 to i16
  store i1 false, i1* @wait_for_connection, align 1
  call void @_ssdm_op_Write.ap_fifo.volatile.i16P(i16* @sessionID_fifo_V_V, i16 %tmp_V)
  br label %._crit_edge10.i

._crit_edge10.i:                                  ; preds = %2, %1, %._crit_edge.i
  br label %open_connections.exit

open_connections.exit:                            ; preds = %._crit_edge10.i, %0
  ret void
}

define void @network_bridge_tcp(i73* %rxGalapagosBridge_V, i32* %txMetaData_V, i48* %openConnection_V, i17* %openConStatus_V, i73* %txData_V, i17* %txStatus_V_V, i16* %listenPort_V_V, i1* %listenPortStatus_V, i81* %notifications_V, i32* %readRequest_V, i16* %rxMetaData_V_V, i73* %rxData_V, i73* %txGalapagosBridge_V, i4* %state_out_V, i64* %header_out_V, i16* %size_out_V, i16* %sessionID_out_V) {
codeRepl:
  call void (...)* @_ssdm_op_SpecDataflowPipeline(i32 -1, [1 x i8]* @p_str) nounwind
  %empty = call i32 (...)* @_ssdm_op_SpecChannel([18 x i8]* @g2t_read_dest_OC_V_O, i32 1, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 1, i8* @g2t_read_dest_V_V, i8* @g2t_read_dest_V_V)
  call void (...)* @_ssdm_op_SpecInterface(i8* @g2t_read_dest_V_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  %empty_11 = call i32 (...)* @_ssdm_op_SpecChannel([17 x i8]* @g2t_read_sid_OC_V_OC, i32 1, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 1, i16* @g2t_read_sid_V_V, i16* @g2t_read_sid_V_V)
  call void (...)* @_ssdm_op_SpecInterface(i16* @g2t_read_sid_V_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  %empty_12 = call i32 (...)* @_ssdm_op_SpecChannel([19 x i8]* @g2t_write_dest_OC_V_s, i32 1, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 1, i8* @g2t_write_dest_V_V, i8* @g2t_write_dest_V_V)
  call void (...)* @_ssdm_op_SpecInterface(i8* @g2t_write_dest_V_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  %empty_13 = call i32 (...)* @_ssdm_op_SpecChannel([18 x i8]* @g2t_write_sid_OC_V_O, i32 1, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 1, i16* @g2t_write_sid_V_V, i16* @g2t_write_sid_V_V)
  call void (...)* @_ssdm_op_SpecInterface(i16* @g2t_write_sid_V_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  %empty_14 = call i32 (...)* @_ssdm_op_SpecChannel([12 x i8]* @ip_fifo_OC_V_OC_V_st, i32 1, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 1, i32* @ip_fifo_V_V, i32* @ip_fifo_V_V)
  call void (...)* @_ssdm_op_SpecInterface(i32* @ip_fifo_V_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  %empty_15 = call i32 (...)* @_ssdm_op_SpecChannel([19 x i8]* @sessionID_fifo_OC_V_s, i32 1, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 1, i16* @sessionID_fifo_V_V, i16* @sessionID_fifo_V_V)
  call void (...)* @_ssdm_op_SpecInterface(i16* @sessionID_fifo_V_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  %empty_16 = call i32 (...)* @_ssdm_op_SpecChannel([18 x i8]* @t2g_read_dest_OC_V_O, i32 1, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 1, i8* @t2g_read_dest_V_V, i8* @t2g_read_dest_V_V)
  call void (...)* @_ssdm_op_SpecInterface(i8* @t2g_read_dest_V_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  %empty_17 = call i32 (...)* @_ssdm_op_SpecChannel([17 x i8]* @t2g_read_sid_OC_V_OC, i32 1, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 1, i16* @t2g_read_sid_V_V, i16* @t2g_read_sid_V_V)
  call void (...)* @_ssdm_op_SpecInterface(i16* @t2g_read_sid_V_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  %empty_18 = call i32 (...)* @_ssdm_op_SpecChannel([19 x i8]* @t2g_write_dest_OC_V_s, i32 1, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 1, i8* @t2g_write_dest_V_V, i8* @t2g_write_dest_V_V)
  call void (...)* @_ssdm_op_SpecInterface(i8* @t2g_write_dest_V_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  %empty_19 = call i32 (...)* @_ssdm_op_SpecChannel([18 x i8]* @t2g_write_sid_OC_V_O, i32 1, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 1, i16* @t2g_write_sid_V_V, i16* @t2g_write_sid_V_V)
  call void (...)* @_ssdm_op_SpecInterface(i16* @t2g_write_sid_V_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i73* %txGalapagosBridge_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i73* %rxData_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i16* %rxMetaData_V_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i32* %readRequest_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i81* %notifications_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i1* %listenPortStatus_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i16* %listenPort_V_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i17* %txStatus_V_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i73* %txData_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i17* %openConStatus_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i48* %openConnection_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i32* %txMetaData_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i73* %rxGalapagosBridge_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecBitsMap(i73* %txGalapagosBridge_V), !map !235
  call void (...)* @_ssdm_op_SpecBitsMap(i73* %rxData_V), !map !247
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %readRequest_V), !map !257
  call void (...)* @_ssdm_op_SpecBitsMap(i81* %notifications_V), !map !264
  call void (...)* @_ssdm_op_SpecBitsMap(i73* %txData_V), !map !280
  call void (...)* @_ssdm_op_SpecBitsMap(i17* %openConStatus_V), !map !290
  call void (...)* @_ssdm_op_SpecBitsMap(i48* %openConnection_V), !map !297
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %txMetaData_V), !map !304
  call void (...)* @_ssdm_op_SpecBitsMap(i73* %rxGalapagosBridge_V), !map !311
  call void (...)* @_ssdm_op_SpecBitsMap(i17* %txStatus_V_V), !map !321
  call void (...)* @_ssdm_op_SpecBitsMap(i16* %listenPort_V_V), !map !325
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %listenPortStatus_V), !map !329
  call void (...)* @_ssdm_op_SpecBitsMap(i16* %rxMetaData_V_V), !map !333
  call void (...)* @_ssdm_op_SpecBitsMap(i4* %state_out_V), !map !337
  call void (...)* @_ssdm_op_SpecBitsMap(i64* %header_out_V), !map !341
  call void (...)* @_ssdm_op_SpecBitsMap(i16* %size_out_V), !map !345
  call void (...)* @_ssdm_op_SpecBitsMap(i16* %sessionID_out_V), !map !349
  call void (...)* @_ssdm_op_SpecTopModule([19 x i8]* @network_bridge_tcp_s) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32 0, [13 x i8]* @p_str23, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str) nounwind
  call void (...)* @_ssdm_op_SpecDataflowPipeline(i32 -1, [1 x i8]* @p_str) nounwind
  call void (...)* @_ssdm_op_SpecIFCore(i73* %rxGalapagosBridge_V, [1 x i8]* @p_str, [5 x i8]* @p_str24, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [37 x i8]* @p_str25)
  call void (...)* @_ssdm_op_SpecIFCore(i73* %txGalapagosBridge_V, [1 x i8]* @p_str, [5 x i8]* @p_str24, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [37 x i8]* @p_str26)
  call void (...)* @_ssdm_op_SpecIFCore(i16* %listenPort_V_V, [1 x i8]* @p_str, [5 x i8]* @p_str24, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [31 x i8]* @p_str27)
  call void (...)* @_ssdm_op_SpecIFCore(i1* %listenPortStatus_V, [1 x i8]* @p_str, [5 x i8]* @p_str24, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [38 x i8]* @p_str28)
  call void (...)* @_ssdm_op_SpecIFCore(i48* %openConnection_V, [1 x i8]* @p_str, [5 x i8]* @p_str24, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [35 x i8]* @p_str29)
  call void (...)* @_ssdm_op_SpecIFCore(i17* %openConStatus_V, [1 x i8]* @p_str, [5 x i8]* @p_str24, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [31 x i8]* @p_str30)
  call void (...)* @_ssdm_op_SpecIFCore(i81* %notifications_V, [1 x i8]* @p_str, [5 x i8]* @p_str24, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [33 x i8]* @p_str31)
  call void (...)* @_ssdm_op_SpecIFCore(i32* %readRequest_V, [1 x i8]* @p_str, [5 x i8]* @p_str24, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [32 x i8]* @p_str32)
  call void (...)* @_ssdm_op_SpecIFCore(i16* %rxMetaData_V_V, [1 x i8]* @p_str, [5 x i8]* @p_str24, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [31 x i8]* @p_str33)
  call void (...)* @_ssdm_op_SpecIFCore(i73* %rxData_V, [1 x i8]* @p_str, [5 x i8]* @p_str24, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [27 x i8]* @p_str34)
  call void (...)* @_ssdm_op_SpecIFCore(i32* %txMetaData_V, [1 x i8]* @p_str, [5 x i8]* @p_str24, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [31 x i8]* @p_str35)
  call void (...)* @_ssdm_op_SpecIFCore(i73* %txData_V, [1 x i8]* @p_str, [5 x i8]* @p_str24, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [27 x i8]* @p_str36)
  call void (...)* @_ssdm_op_SpecIFCore(i17* %txStatus_V_V, [1 x i8]* @p_str, [5 x i8]* @p_str24, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [29 x i8]* @p_str37)
  call void (...)* @_ssdm_op_SpecIFCore(i16* %listenPort_V_V, [1 x i8]* @p_str, [11 x i8]* @p_str38, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [31 x i8]* @p_str27)
  call void (...)* @_ssdm_op_SpecIFCore(i1* %listenPortStatus_V, [1 x i8]* @p_str, [11 x i8]* @p_str38, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [38 x i8]* @p_str39)
  call fastcc void @galapagos_to_tcp_int(i73* %rxGalapagosBridge_V, i17* %txStatus_V_V, i32* %txMetaData_V, i73* %txData_V, i4* nocapture %state_out_V, i64* nocapture %header_out_V, i16* nocapture %size_out_V, i16* nocapture %sessionID_out_V)
  call fastcc void @open_connections(i48* %openConnection_V, i17* %openConStatus_V)
  call fastcc void @open_port(i16* %listenPort_V_V, i1* %listenPortStatus_V, i81* %notifications_V, i32* %readRequest_V)
  call fastcc void @tcp_to_galapagos_int(i16* %rxMetaData_V_V, i73* %rxData_V, i73* %txGalapagosBridge_V)
  call fastcc void @sessionID_table_stea() nounwind uwtable
  ret void
}

declare i81 @llvm.part.select.i81(i81, i32, i32) nounwind readnone

declare i73 @llvm.part.select.i73(i73, i32, i32) nounwind readnone

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define internal fastcc void @galapagos_to_tcp_int(i73* %rxGalapagosBridge_V, i17* %txStatus_V_V, i32* %txMetaData_V, i73* %txData_V, i4* nocapture %state_out_V, i64* nocapture %header_out_V, i16* nocapture %size_out_V, i16* nocapture %sessionID_out_V) {
entry:
  call void (...)* @_ssdm_op_SpecIFCore(i17* %txStatus_V_V, [1 x i8]* @p_str, [5 x i8]* @p_str24, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [29 x i8]* @p_str37)
  call void (...)* @_ssdm_op_SpecIFCore(i73* %txData_V, [1 x i8]* @p_str, [5 x i8]* @p_str24, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [27 x i8]* @p_str36)
  call void (...)* @_ssdm_op_SpecIFCore(i32* %txMetaData_V, [1 x i8]* @p_str, [5 x i8]* @p_str24, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [31 x i8]* @p_str35)
  call void (...)* @_ssdm_op_SpecIFCore(i73* %rxGalapagosBridge_V, [1 x i8]* @p_str, [5 x i8]* @p_str24, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [37 x i8]* @p_str25)
  call void (...)* @_ssdm_op_SpecInterface(i73* %rxGalapagosBridge_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i32* %txMetaData_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i73* %txData_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i17* %txStatus_V_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i8* @g2t_read_dest_V_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i16* @g2t_read_sid_V_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i8* @g2t_write_dest_V_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i16* @g2t_write_sid_V_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i32* @ip_fifo_V_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i16* @sessionID_fifo_V_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecPipeline(i32 1, i32 1, i32 1, i32 0, [1 x i8]* @p_str) nounwind
  %state_1_load = load i4* @state_1, align 1
  call void @_ssdm_op_Write.ap_auto.i4P(i4* %state_out_V, i4 %state_1_load)
  %p_Val2_s = load i64* @header_data_V, align 8
  %tmp_V_15 = load i8* @dest_V, align 1
  %txMetaDataWord_sessi = load i16* @sessionID_V, align 2
  switch i4 %state_1_load, label %galapagos_to_tcp_interface.exit [
    i4 0, label %0
    i4 1, label %2
    i4 2, label %5
    i4 3, label %7
    i4 4, label %8
    i4 5, label %10
    i4 6, label %11
    i4 7, label %12
    i4 -8, label %14
  ]

; <label>:0                                       ; preds = %entry
  %tmp = call i1 @_ssdm_op_NbReadReq.ap_fifo.i73P(i73* %rxGalapagosBridge_V, i32 1)
  br i1 %tmp, label %1, label %._crit_edge22.i

; <label>:1                                       ; preds = %0
  %tmp27 = call i73 @_ssdm_op_Read.ap_fifo.volatile.i73P(i73* %rxGalapagosBridge_V)
  %p_Val2_1 = trunc i73 %tmp27 to i64
  store i64 %p_Val2_1, i64* @header_data_V, align 8
  %tmp_keep_V_4_load_ne = call i8 @_ssdm_op_PartSelect.i8.i73.i32.i32(i73 %tmp27, i32 64, i32 71)
  store i8 %tmp_keep_V_4_load_ne, i8* @header_keep_V, align 8
  store i1 true, i1* @header_last_V, align 1
  %tmp_V = call i8 @_ssdm_op_PartSelect.i8.i73.i32.i32(i73 %tmp27, i32 24, i32 31)
  store i8 %tmp_V, i8* @dest_V, align 1
  call void @_ssdm_op_Write.ap_fifo.volatile.i8P(i8* @g2t_read_dest_V_V, i8 %tmp_V)
  store i4 1, i4* @state_1, align 1
  call void @_ssdm_op_Write.ap_auto.i64P(i64* %header_out_V, i64 %p_Val2_1)
  br label %._crit_edge22.i

._crit_edge22.i:                                  ; preds = %1, %0
  br label %galapagos_to_tcp_interface.exit

; <label>:2                                       ; preds = %entry
  %tmp_16 = call i1 @_ssdm_op_NbReadReq.ap_fifo.i16P(i16* @g2t_read_sid_V_V, i32 1)
  br i1 %tmp_16, label %3, label %._crit_edge23.i

; <label>:3                                       ; preds = %2
  %tmp_V_13 = call i16 @_ssdm_op_Read.ap_fifo.volatile.i16P(i16* @g2t_read_sid_V_V)
  store i16 %tmp_V_13, i16* @sessionID_V, align 2
  %tmp_i = icmp eq i16 %tmp_V_13, 1000
  br i1 %tmp_i, label %4, label %._crit_edge24.i

; <label>:4                                       ; preds = %3
  %tmp_21_i = zext i8 %tmp_V_15 to i64
  %ip_table_V_addr = getelementptr [256 x i32]* @ip_table_V, i64 0, i64 %tmp_21_i
  %tmp_V_18 = load i32* %ip_table_V_addr, align 4
  call void @_ssdm_op_Write.ap_fifo.volatile.i32P(i32* @ip_fifo_V_V, i32 %tmp_V_18)
  br label %._crit_edge24.i

._crit_edge24.i:                                  ; preds = %4, %3
  %storemerge2_i = phi i2 [ -2, %4 ], [ -1, %3 ]
  %storemerge2_cast_i = zext i2 %storemerge2_i to i4
  store i4 %storemerge2_cast_i, i4* @state_1, align 1
  br label %._crit_edge23.i

._crit_edge23.i:                                  ; preds = %._crit_edge24.i, %2
  br label %galapagos_to_tcp_interface.exit

; <label>:5                                       ; preds = %entry
  %tmp_17 = call i1 @_ssdm_op_NbReadReq.ap_fifo.i16P(i16* @sessionID_fifo_V_V, i32 1)
  br i1 %tmp_17, label %6, label %._crit_edge25.i

; <label>:6                                       ; preds = %5
  %tmp_V_14 = call i16 @_ssdm_op_Read.ap_fifo.volatile.i16P(i16* @sessionID_fifo_V_V)
  store i16 %tmp_V_14, i16* @sessionID_V, align 2
  call void @_ssdm_op_Write.ap_fifo.volatile.i16P(i16* @g2t_write_sid_V_V, i16 %tmp_V_14)
  call void @_ssdm_op_Write.ap_fifo.volatile.i8P(i8* @g2t_write_dest_V_V, i8 %tmp_V_15)
  store i4 3, i4* @state_1, align 1
  br label %._crit_edge25.i

._crit_edge25.i:                                  ; preds = %6, %5
  br label %galapagos_to_tcp_interface.exit

; <label>:7                                       ; preds = %entry
  %size_V = trunc i64 %p_Val2_s to i16
  %size_V_1 = add i16 8, %size_V
  call void @_ssdm_op_Write.ap_auto.i16P(i16* %size_out_V, i16 %size_V_1)
  call void @_ssdm_op_Write.ap_auto.i16P(i16* %sessionID_out_V, i16 %txMetaDataWord_sessi)
  %tmp_1 = call i32 @_ssdm_op_BitConcatenate.i32.i16.i16(i16 8, i16 %txMetaDataWord_sessi)
  call void @_ssdm_op_Write.ap_fifo.volatile.i32P(i32* %txMetaData_V, i32 %tmp_1)
  store i4 4, i4* @state_1, align 1
  br label %galapagos_to_tcp_interface.exit

; <label>:8                                       ; preds = %entry
  %tmp_19 = call i1 @_ssdm_op_NbReadReq.ap_fifo.i17P(i17* %txStatus_V_V, i32 1)
  br i1 %tmp_19, label %9, label %._crit_edge26.i

; <label>:9                                       ; preds = %8
  %tmp_V_16 = call i17 @_ssdm_op_Read.ap_fifo.volatile.i17P(i17* %txStatus_V_V)
  %tmp_24 = call i1 @_ssdm_op_BitSelect.i1.i17.i32(i17 %tmp_V_16, i32 16)
  %storemerge1_cast_i_c = select i1 %tmp_24, i4 3, i4 5
  store i4 %storemerge1_cast_i_c, i4* @state_1, align 1
  br label %._crit_edge26.i

._crit_edge26.i:                                  ; preds = %9, %8
  br label %galapagos_to_tcp_interface.exit

; <label>:10                                      ; preds = %entry
  %tmp_keep_V = load i8* @header_keep_V, align 8
  %tmp_last_V = load i1* @header_last_V, align 1
  %tmp_2 = call i73 @_ssdm_op_BitConcatenate.i73.i1.i8.i64(i1 %tmp_last_V, i8 %tmp_keep_V, i64 %p_Val2_s)
  call void @_ssdm_op_Write.ap_fifo.volatile.i73P(i73* %txData_V, i73 %tmp_2)
  store i4 6, i4* @state_1, align 1
  br label %galapagos_to_tcp_interface.exit

; <label>:11                                      ; preds = %entry
  %size_V_3 = trunc i64 %p_Val2_s to i16
  call void @_ssdm_op_Write.ap_auto.i16P(i16* %size_out_V, i16 %size_V_3)
  call void @_ssdm_op_Write.ap_auto.i16P(i16* %sessionID_out_V, i16 %txMetaDataWord_sessi)
  %tmp_3 = call i32 @_ssdm_op_BitConcatenate.i32.i16.i16(i16 %size_V_3, i16 %txMetaDataWord_sessi)
  call void @_ssdm_op_Write.ap_fifo.volatile.i32P(i32* %txMetaData_V, i32 %tmp_3)
  store i4 7, i4* @state_1, align 1
  br label %galapagos_to_tcp_interface.exit

; <label>:12                                      ; preds = %entry
  %tmp_21 = call i1 @_ssdm_op_NbReadReq.ap_fifo.i17P(i17* %txStatus_V_V, i32 1)
  br i1 %tmp_21, label %13, label %._crit_edge27.i

; <label>:13                                      ; preds = %12
  %tmp_V_17 = call i17 @_ssdm_op_Read.ap_fifo.volatile.i17P(i17* %txStatus_V_V)
  %tmp_25 = call i1 @_ssdm_op_BitSelect.i1.i17.i32(i17 %tmp_V_17, i32 16)
  %storemerge_i = select i1 %tmp_25, i4 6, i4 -8
  store i4 %storemerge_i, i4* @state_1, align 1
  br label %._crit_edge27.i

._crit_edge27.i:                                  ; preds = %13, %12
  br label %galapagos_to_tcp_interface.exit

; <label>:14                                      ; preds = %entry
  %tmp_22 = call i1 @_ssdm_op_NbReadReq.ap_fifo.i73P(i73* %rxGalapagosBridge_V, i32 1)
  br i1 %tmp_22, label %15, label %._crit_edge28.i

; <label>:15                                      ; preds = %14
  %tmp_4 = call i73 @_ssdm_op_Read.ap_fifo.volatile.i73P(i73* %rxGalapagosBridge_V)
  %tmp_last_V_1 = call i1 @_ssdm_op_BitSelect.i1.i73.i32(i73 %tmp_4, i32 72)
  call void @_ssdm_op_Write.ap_fifo.volatile.i73P(i73* %txData_V, i73 %tmp_4)
  br i1 %tmp_last_V_1, label %16, label %._crit_edge29.i

; <label>:16                                      ; preds = %15
  store i4 0, i4* @state_1, align 1
  br label %._crit_edge29.i

._crit_edge29.i:                                  ; preds = %16, %15
  br label %._crit_edge28.i

._crit_edge28.i:                                  ; preds = %._crit_edge29.i, %14
  br label %galapagos_to_tcp_interface.exit

galapagos_to_tcp_interface.exit:                  ; preds = %._crit_edge28.i, %._crit_edge27.i, %11, %10, %._crit_edge26.i, %7, %._crit_edge25.i, %._crit_edge23.i, %._crit_edge22.i, %entry
  ret void
}

define weak void @_ssdm_op_Write.ap_fifo.volatile.i8P(i8*, i8) {
entry:
  %empty = call i8 @_autotb_FifoWrite_i8(i8* %0, i8 %1)
  ret void
}

define weak void @_ssdm_op_Write.ap_fifo.volatile.i73P(i73*, i73) {
entry:
  %empty = call i73 @_autotb_FifoWrite_i73(i73* %0, i73 %1)
  ret void
}

define weak void @_ssdm_op_Write.ap_fifo.volatile.i48P(i48*, i48) {
entry:
  %empty = call i48 @_autotb_FifoWrite_i48(i48* %0, i48 %1)
  ret void
}

define weak void @_ssdm_op_Write.ap_fifo.volatile.i32P(i32*, i32) {
entry:
  %empty = call i32 @_autotb_FifoWrite_i32(i32* %0, i32 %1)
  ret void
}

define weak void @_ssdm_op_Write.ap_fifo.volatile.i16P(i16*, i16) {
entry:
  %empty = call i16 @_autotb_FifoWrite_i16(i16* %0, i16 %1)
  ret void
}

define weak void @_ssdm_op_Write.ap_auto.i64P(i64*, i64) {
entry:
  store i64 %1, i64* %0
  ret void
}

define weak void @_ssdm_op_Write.ap_auto.i4P(i4*, i4) {
entry:
  store i4 %1, i4* %0
  ret void
}

define weak void @_ssdm_op_Write.ap_auto.i16P(i16*, i16) {
entry:
  store i16 %1, i16* %0
  ret void
}

define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

define weak void @_ssdm_op_SpecPipeline(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecInterface(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecIFCore(...) {
entry:
  ret void
}

define weak void @_ssdm_op_SpecDataflowPipeline(...) nounwind {
entry:
  ret void
}

define weak i32 @_ssdm_op_SpecChannel(...) {
entry:
  ret i32 0
}

define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

define weak i8 @_ssdm_op_Read.ap_fifo.volatile.i8P(i8*) {
entry:
  %empty = call i8 @_autotb_FifoRead_i8(i8* %0)
  ret i8 %empty
}

define weak i81 @_ssdm_op_Read.ap_fifo.volatile.i81P(i81*) {
entry:
  %empty = call i81 @_autotb_FifoRead_i81(i81* %0)
  ret i81 %empty
}

define weak i73 @_ssdm_op_Read.ap_fifo.volatile.i73P(i73*) {
entry:
  %empty = call i73 @_autotb_FifoRead_i73(i73* %0)
  ret i73 %empty
}

define weak i32 @_ssdm_op_Read.ap_fifo.volatile.i32P(i32*) {
entry:
  %empty = call i32 @_autotb_FifoRead_i32(i32* %0)
  ret i32 %empty
}

define weak i1 @_ssdm_op_Read.ap_fifo.volatile.i1P(i1*) {
entry:
  %empty = call i1 @_autotb_FifoRead_i1(i1* %0)
  ret i1 %empty
}

define weak i17 @_ssdm_op_Read.ap_fifo.volatile.i17P(i17*) {
entry:
  %empty = call i17 @_autotb_FifoRead_i17(i17* %0)
  ret i17 %empty
}

define weak i16 @_ssdm_op_Read.ap_fifo.volatile.i16P(i16*) {
entry:
  %empty = call i16 @_autotb_FifoRead_i16(i16* %0)
  ret i16 %empty
}

define weak i8 @_ssdm_op_PartSelect.i8.i73.i32.i32(i73, i32, i32) nounwind readnone {
entry:
  %empty = call i73 @llvm.part.select.i73(i73 %0, i32 %1, i32 %2)
  %empty_20 = trunc i73 %empty to i8
  ret i8 %empty_20
}

declare i64 @_ssdm_op_PartSelect.i64.i73.i32.i32(i73, i32, i32) nounwind readnone

declare i32 @_ssdm_op_PartSelect.i32.i81.i32.i32(i81, i32, i32) nounwind readnone

define weak i16 @_ssdm_op_PartSelect.i16.i81.i32.i32(i81, i32, i32) nounwind readnone {
entry:
  %empty = call i81 @llvm.part.select.i81(i81 %0, i32 %1, i32 %2)
  %empty_21 = trunc i81 %empty to i16
  ret i16 %empty_21
}

declare i16 @_ssdm_op_PartSelect.i16.i64.i32.i32(i64, i32, i32) nounwind readnone

declare i16 @_ssdm_op_PartSelect.i16.i32.i32.i32(i32, i32, i32) nounwind readnone

declare i16 @_ssdm_op_PartSelect.i16.i17.i32.i32(i17, i32, i32) nounwind readnone

define weak i1 @_ssdm_op_NbReadReq.ap_fifo.i8P(i8*, i32) {
entry:
  %empty = call i1 @_autotb_FifoCanRead_i8(i8* %0)
  ret i1 %empty
}

define weak i1 @_ssdm_op_NbReadReq.ap_fifo.i81P(i81*, i32) {
entry:
  %empty = call i1 @_autotb_FifoCanRead_i81(i81* %0)
  ret i1 %empty
}

define weak i1 @_ssdm_op_NbReadReq.ap_fifo.i73P(i73*, i32) {
entry:
  %empty = call i1 @_autotb_FifoCanRead_i73(i73* %0)
  ret i1 %empty
}

define weak i1 @_ssdm_op_NbReadReq.ap_fifo.i32P(i32*, i32) {
entry:
  %empty = call i1 @_autotb_FifoCanRead_i32(i32* %0)
  ret i1 %empty
}

define weak i1 @_ssdm_op_NbReadReq.ap_fifo.i1P(i1*, i32) {
entry:
  %empty = call i1 @_autotb_FifoCanRead_i1(i1* %0)
  ret i1 %empty
}

define weak i1 @_ssdm_op_NbReadReq.ap_fifo.i17P(i17*, i32) {
entry:
  %empty = call i1 @_autotb_FifoCanRead_i17(i17* %0)
  ret i1 %empty
}

define weak i1 @_ssdm_op_NbReadReq.ap_fifo.i16P(i16*, i32) {
entry:
  %empty = call i1 @_autotb_FifoCanRead_i16(i16* %0)
  ret i1 %empty
}

define weak i1 @_ssdm_op_BitSelect.i1.i73.i32(i73, i32) nounwind readnone {
entry:
  %empty = zext i32 %1 to i73
  %empty_22 = shl i73 1, %empty
  %empty_23 = and i73 %0, %empty_22
  %empty_24 = icmp ne i73 %empty_23, 0
  ret i1 %empty_24
}

define weak i1 @_ssdm_op_BitSelect.i1.i17.i32(i17, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i17
  %empty_25 = shl i17 1, %empty
  %empty_26 = and i17 %0, %empty_25
  %empty_27 = icmp ne i17 %empty_26, 0
  ret i1 %empty_27
}

define weak i73 @_ssdm_op_BitConcatenate.i73.i1.i8.i64(i1, i8, i64) nounwind readnone {
entry:
  %empty = zext i8 %1 to i72
  %empty_28 = zext i64 %2 to i72
  %empty_29 = shl i72 %empty, 64
  %empty_30 = or i72 %empty_29, %empty_28
  %empty_31 = zext i1 %0 to i73
  %empty_32 = zext i72 %empty_30 to i73
  %empty_33 = shl i73 %empty_31, 72
  %empty_34 = or i73 %empty_33, %empty_32
  ret i73 %empty_34
}

define weak i48 @_ssdm_op_BitConcatenate.i48.i16.i32(i16, i32) nounwind readnone {
entry:
  %empty = zext i16 %0 to i48
  %empty_35 = zext i32 %1 to i48
  %empty_36 = shl i48 %empty, 32
  %empty_37 = or i48 %empty_36, %empty_35
  ret i48 %empty_37
}

define weak i32 @_ssdm_op_BitConcatenate.i32.i16.i16(i16, i16) nounwind readnone {
entry:
  %empty = zext i16 %0 to i32
  %empty_38 = zext i16 %1 to i32
  %empty_39 = shl i32 %empty, 16
  %empty_40 = or i32 %empty_39, %empty_38
  ret i32 %empty_40
}

declare i8 @_autotb_FifoWrite_i8(i8*, i8)

declare i73 @_autotb_FifoWrite_i73(i73*, i73)

declare i48 @_autotb_FifoWrite_i48(i48*, i48)

declare i32 @_autotb_FifoWrite_i32(i32*, i32)

declare i16 @_autotb_FifoWrite_i16(i16*, i16)

declare i81 @_autotb_FifoRead_i81(i81*)

declare i8 @_autotb_FifoRead_i8(i8*)

declare i73 @_autotb_FifoRead_i73(i73*)

declare i32 @_autotb_FifoRead_i32(i32*)

declare i17 @_autotb_FifoRead_i17(i17*)

declare i16 @_autotb_FifoRead_i16(i16*)

declare i1 @_autotb_FifoRead_i1(i1*)

declare i1 @_autotb_FifoCanRead_i81(i81*)

declare i1 @_autotb_FifoCanRead_i8(i8*)

declare i1 @_autotb_FifoCanRead_i73(i73*)

declare i1 @_autotb_FifoCanRead_i32(i32*)

declare i1 @_autotb_FifoCanRead_i17(i17*)

declare i1 @_autotb_FifoCanRead_i16(i16*)

declare i1 @_autotb_FifoCanRead_i1(i1*)

declare void @_GLOBAL__I_a33() nounwind section ".text.startup"

declare void @_GLOBAL__I_a() nounwind section ".text.startup"

!opencl.kernels = !{!0, !7, !13, !19, !25, !31, !37, !37, !37, !37, !43, !43, !43, !43, !49, !55, !55, !37, !60, !37, !37, !37, !37, !37, !37, !63, !66, !60, !68, !68, !68, !37, !37, !37, !37, !37, !71, !73, !75, !78, !78, !84, !86, !89, !37, !92, !94, !37, !37, !37, !96, !98, !60, !100, !68, !68, !68, !37, !102, !37, !37, !104, !106, !98, !60, !108, !111, !113, !115, !37, !117, !37, !119, !37, !37, !121, !121, !37, !37, !37, !122, !37, !124, !124, !37, !37, !126, !126, !37, !37, !124, !124, !127, !127, !37, !37, !124, !124, !124, !124, !37, !37, !75, !129, !124, !124, !37, !37, !131, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !133, !37, !37, !37, !37, !37, !37, !134, !134, !37, !37}
!hls.encrypted.func = !{}
!llvm.map.gv = !{!137, !144, !151, !156, !161, !166, !171, !176, !181, !186, !191, !196, !201, !206, !211, !216, !223, !230}

!0 = metadata !{null, metadata !1, metadata !2, metadata !3, metadata !4, metadata !5, metadata !6}
!1 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0}
!2 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!3 = metadata !{metadata !"kernel_arg_type", metadata !"stream<ap_uint<8> > &", metadata !"stream<ap_uint<16> > &", metadata !"stream<ap_uint<8> > &", metadata !"stream<ap_uint<16> > &", metadata !"stream<ap_uint<8> > &", metadata !"stream<ap_uint<16> > &", metadata !"stream<ap_uint<8> > &", metadata !"stream<ap_uint<16> > &"}
!4 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !""}
!5 = metadata !{metadata !"kernel_arg_name", metadata !"t2g_read_dest", metadata !"t2g_read_sid", metadata !"t2g_write_dest", metadata !"t2g_write_sid", metadata !"g2t_read_dest", metadata !"g2t_read_sid", metadata !"g2t_write_dest", metadata !"g2t_write_sid"}
!6 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!7 = metadata !{null, metadata !8, metadata !9, metadata !10, metadata !11, metadata !12, metadata !6}
!8 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0, i32 0, i32 0}
!9 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!10 = metadata !{metadata !"kernel_arg_type", metadata !"stream<ap_uint<16> > &", metadata !"stream<_Bool> &", metadata !"stream<struct appNotification> &", metadata !"stream<struct appReadRequest> &"}
!11 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !""}
!12 = metadata !{metadata !"kernel_arg_name", metadata !"listenPort", metadata !"listenPortStatus", metadata !"notifications", metadata !"readRequest"}
!13 = metadata !{null, metadata !14, metadata !15, metadata !16, metadata !17, metadata !18, metadata !6}
!14 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0}
!15 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!16 = metadata !{metadata !"kernel_arg_type", metadata !"stream<ap_uint<16> > &", metadata !"stream<struct axiWord> &", metadata !"stream<struct axiWord> &", metadata !"stream<ap_uint<8> > &", metadata !"stream<ap_uint<16> > &", metadata !"stream<ap_uint<8> > &", metadata !"stream<ap_uint<16> > &"}
!17 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !""}
!18 = metadata !{metadata !"kernel_arg_name", metadata !"rxMetaData", metadata !"rxData", metadata !"txGalapagosBridge", metadata !"read_dest", metadata !"read_sid", metadata !"write_dest", metadata !"write_sid"}
!19 = metadata !{null, metadata !20, metadata !21, metadata !22, metadata !23, metadata !24, metadata !6}
!20 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0, i32 0, i32 0, i32 0}
!21 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!22 = metadata !{metadata !"kernel_arg_type", metadata !"stream<ap_uint<32> > &", metadata !"stream<struct ipTuple> &", metadata !"stream<struct openStatus> &", metadata !"stream<ap_uint<16> > &", metadata !"stream<ap_uint<16> > &"}
!23 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !"", metadata !""}
!24 = metadata !{metadata !"kernel_arg_name", metadata !"ip_fifo", metadata !"openConnection", metadata !"openConStatus", metadata !"closeConnection", metadata !"sessionID_fifo"}
!25 = metadata !{null, metadata !26, metadata !27, metadata !28, metadata !29, metadata !30, metadata !6}
!26 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1, i32 1, i32 1, i32 1}
!27 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!28 = metadata !{metadata !"kernel_arg_type", metadata !"stream<struct axiWord> &", metadata !"stream<ap_int<17> > &", metadata !"stream<struct appTxMeta> &", metadata !"stream<struct axiWord> &", metadata !"stream<ap_uint<32> > &", metadata !"stream<ap_uint<16> > &", metadata !"stream<ap_uint<8> > &", metadata !"stream<ap_uint<16> > &", metadata !"stream<ap_uint<8> > &", metadata !"stream<ap_uint<16> > &", metadata !"ap_uint<4>*", metadata !"ap_uint<64>*", metadata !"ap_uint<16>*", metadata !"ap_uint<16>*"}
!29 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !""}
!30 = metadata !{metadata !"kernel_arg_name", metadata !"rxGalapagosBridge", metadata !"txStatus", metadata !"txMetaData", metadata !"txData", metadata !"ip_fifo", metadata !"sessionID_fifo", metadata !"read_dest", metadata !"read_sid", metadata !"write_dest", metadata !"write_sid", metadata !"state_out", metadata !"header_out", metadata !"size_out", metadata !"sessionID_out"}
!31 = metadata !{null, metadata !32, metadata !33, metadata !34, metadata !35, metadata !36, metadata !6}
!32 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1, i32 1, i32 1, i32 1}
!33 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!34 = metadata !{metadata !"kernel_arg_type", metadata !"stream<struct axiWord> &", metadata !"stream<struct appTxMeta> &", metadata !"stream<struct ipTuple> &", metadata !"stream<struct openStatus> &", metadata !"stream<struct axiWord> &", metadata !"stream<ap_int<17> > &", metadata !"stream<ap_uint<16> > &", metadata !"stream<_Bool> &", metadata !"stream<struct appNotification> &", metadata !"stream<struct appReadRequest> &", metadata !"stream<ap_uint<16> > &", metadata !"stream<struct axiWord> &", metadata !"stream<struct axiWord> &", metadata !"ap_uint<4>*", metadata !"ap_uint<64>*", metadata !"ap_uint<16>*", metadata !"ap_uint<16>*"}
!35 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !""}
!36 = metadata !{metadata !"kernel_arg_name", metadata !"rxGalapagosBridge", metadata !"txMetaData", metadata !"openConnection", metadata !"openConStatus", metadata !"txData", metadata !"txStatus", metadata !"listenPort", metadata !"listenPortStatus", metadata !"notifications", metadata !"readRequest", metadata !"rxMetaData", metadata !"rxData", metadata !"txGalapagosBridge", metadata !"state_out", metadata !"header_out", metadata !"size_out", metadata !"sessionID_out"}
!37 = metadata !{null, metadata !38, metadata !39, metadata !40, metadata !41, metadata !42, metadata !6}
!38 = metadata !{metadata !"kernel_arg_addr_space"}
!39 = metadata !{metadata !"kernel_arg_access_qual"}
!40 = metadata !{metadata !"kernel_arg_type"}
!41 = metadata !{metadata !"kernel_arg_type_qual"}
!42 = metadata !{metadata !"kernel_arg_name"}
!43 = metadata !{null, metadata !44, metadata !45, metadata !46, metadata !47, metadata !48, metadata !6}
!44 = metadata !{metadata !"kernel_arg_addr_space", i32 1}
!45 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none"}
!46 = metadata !{metadata !"kernel_arg_type", metadata !"char*"}
!47 = metadata !{metadata !"kernel_arg_type_qual", metadata !"const"}
!48 = metadata !{metadata !"kernel_arg_name", metadata !"name"}
!49 = metadata !{null, metadata !50, metadata !51, metadata !52, metadata !53, metadata !54, metadata !6}
!50 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0}
!51 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none"}
!52 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<17, true> &", metadata !"int"}
!53 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !""}
!54 = metadata !{metadata !"kernel_arg_name", metadata !"op", metadata !"op2"}
!55 = metadata !{null, metadata !56, metadata !45, metadata !57, metadata !58, metadata !59, metadata !6}
!56 = metadata !{metadata !"kernel_arg_addr_space", i32 0}
!57 = metadata !{metadata !"kernel_arg_type", metadata !"int"}
!58 = metadata !{metadata !"kernel_arg_type_qual", metadata !""}
!59 = metadata !{metadata !"kernel_arg_name", metadata !"op"}
!60 = metadata !{null, metadata !56, metadata !45, metadata !61, metadata !58, metadata !62, metadata !6}
!61 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, true> &"}
!62 = metadata !{metadata !"kernel_arg_name", metadata !"op2"}
!63 = metadata !{null, metadata !56, metadata !45, metadata !64, metadata !58, metadata !65, metadata !6}
!64 = metadata !{metadata !"kernel_arg_type", metadata !"const struct appTxMeta &"}
!65 = metadata !{metadata !"kernel_arg_name", metadata !"din"}
!66 = metadata !{null, metadata !50, metadata !51, metadata !67, metadata !53, metadata !54, metadata !6}
!67 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<16, false> &", metadata !"int"}
!68 = metadata !{null, metadata !56, metadata !45, metadata !69, metadata !58, metadata !70, metadata !6}
!69 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_range_ref<64, false> &"}
!70 = metadata !{metadata !"kernel_arg_name", metadata !"ref"}
!71 = metadata !{null, metadata !56, metadata !45, metadata !72, metadata !58, metadata !65, metadata !6}
!72 = metadata !{metadata !"kernel_arg_type", metadata !"const struct ap_uint<32> &"}
!73 = metadata !{null, metadata !56, metadata !45, metadata !74, metadata !58, metadata !62, metadata !6}
!74 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<16, false> &"}
!75 = metadata !{null, metadata !50, metadata !51, metadata !76, metadata !53, metadata !77, metadata !6}
!76 = metadata !{metadata !"kernel_arg_type", metadata !"int", metadata !"int"}
!77 = metadata !{metadata !"kernel_arg_name", metadata !"Hi", metadata !"Lo"}
!78 = metadata !{null, metadata !79, metadata !80, metadata !81, metadata !82, metadata !83, metadata !6}
!79 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 0, i32 0}
!80 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none"}
!81 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<64, false>*", metadata !"int", metadata !"int"}
!82 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !""}
!83 = metadata !{metadata !"kernel_arg_name", metadata !"bv", metadata !"h", metadata !"l"}
!84 = metadata !{null, metadata !56, metadata !45, metadata !85, metadata !58, metadata !62, metadata !6}
!85 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<4> &"}
!86 = metadata !{null, metadata !56, metadata !45, metadata !87, metadata !58, metadata !88, metadata !6}
!87 = metadata !{metadata !"kernel_arg_type", metadata !"struct openStatus &"}
!88 = metadata !{metadata !"kernel_arg_name", metadata !"dout"}
!89 = metadata !{null, metadata !56, metadata !45, metadata !90, metadata !58, metadata !91, metadata !6}
!90 = metadata !{metadata !"kernel_arg_type", metadata !"const struct openStatus &"}
!91 = metadata !{metadata !"kernel_arg_name", metadata !""}
!92 = metadata !{null, metadata !56, metadata !45, metadata !93, metadata !58, metadata !65, metadata !6}
!93 = metadata !{metadata !"kernel_arg_type", metadata !"const struct ipTuple &"}
!94 = metadata !{null, metadata !56, metadata !45, metadata !95, metadata !58, metadata !62, metadata !6}
!95 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<16> &"}
!96 = metadata !{null, metadata !56, metadata !45, metadata !97, metadata !58, metadata !65, metadata !6}
!97 = metadata !{metadata !"kernel_arg_type", metadata !"const struct axiWord &"}
!98 = metadata !{null, metadata !50, metadata !51, metadata !99, metadata !53, metadata !54, metadata !6}
!99 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<16, false> &", metadata !"int"}
!100 = metadata !{null, metadata !56, metadata !45, metadata !101, metadata !58, metadata !65, metadata !6}
!101 = metadata !{metadata !"kernel_arg_type", metadata !"const struct ap_uint<8> &"}
!102 = metadata !{null, metadata !56, metadata !45, metadata !103, metadata !58, metadata !62, metadata !6}
!103 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<64> &"}
!104 = metadata !{null, metadata !56, metadata !45, metadata !105, metadata !58, metadata !88, metadata !6}
!105 = metadata !{metadata !"kernel_arg_type", metadata !"struct ap_uint<16> &"}
!106 = metadata !{null, metadata !56, metadata !45, metadata !107, metadata !58, metadata !65, metadata !6}
!107 = metadata !{metadata !"kernel_arg_type", metadata !"const struct appReadRequest &"}
!108 = metadata !{null, metadata !50, metadata !51, metadata !109, metadata !53, metadata !110, metadata !6}
!109 = metadata !{metadata !"kernel_arg_type", metadata !"std::ostream &", metadata !"const ap_int_base<16, false> &"}
!110 = metadata !{metadata !"kernel_arg_name", metadata !"os", metadata !"x"}
!111 = metadata !{null, metadata !50, metadata !51, metadata !112, metadata !53, metadata !110, metadata !6}
!112 = metadata !{metadata !"kernel_arg_type", metadata !"std::ostream &", metadata !"const ap_int_base<32, false> &"}
!113 = metadata !{null, metadata !56, metadata !45, metadata !114, metadata !58, metadata !88, metadata !6}
!114 = metadata !{metadata !"kernel_arg_type", metadata !"struct appNotification &"}
!115 = metadata !{null, metadata !56, metadata !45, metadata !116, metadata !58, metadata !91, metadata !6}
!116 = metadata !{metadata !"kernel_arg_type", metadata !"const struct appNotification &"}
!117 = metadata !{null, metadata !56, metadata !45, metadata !118, metadata !58, metadata !88, metadata !6}
!118 = metadata !{metadata !"kernel_arg_type", metadata !"_Bool &"}
!119 = metadata !{null, metadata !56, metadata !45, metadata !120, metadata !58, metadata !62, metadata !6}
!120 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<32> &"}
!121 = metadata !{null, metadata !56, metadata !45, metadata !120, metadata !58, metadata !59, metadata !6}
!122 = metadata !{null, metadata !56, metadata !45, metadata !123, metadata !58, metadata !65, metadata !6}
!123 = metadata !{metadata !"kernel_arg_type", metadata !"const struct ap_uint<16> &"}
!124 = metadata !{null, metadata !56, metadata !45, metadata !57, metadata !58, metadata !125, metadata !6}
!125 = metadata !{metadata !"kernel_arg_name", metadata !"val"}
!126 = metadata !{null, metadata !56, metadata !45, metadata !95, metadata !58, metadata !59, metadata !6}
!127 = metadata !{null, metadata !56, metadata !45, metadata !128, metadata !58, metadata !125, metadata !6}
!128 = metadata !{metadata !"kernel_arg_type", metadata !"long"}
!129 = metadata !{null, metadata !56, metadata !45, metadata !130, metadata !58, metadata !62, metadata !6}
!130 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<8> &"}
!131 = metadata !{null, metadata !56, metadata !45, metadata !132, metadata !58, metadata !62, metadata !6}
!132 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<1> &"}
!133 = metadata !{null, metadata !56, metadata !45, metadata !97, metadata !58, metadata !91, metadata !6}
!134 = metadata !{null, metadata !50, metadata !51, metadata !135, metadata !53, metadata !136, metadata !6}
!135 = metadata !{metadata !"kernel_arg_type", metadata !"ap_uint<16>", metadata !"ap_uint<16>"}
!136 = metadata !{metadata !"kernel_arg_name", metadata !"id", metadata !"len"}
!137 = metadata !{metadata !138, [64 x i58]* @log_lut_table_ap_fixed_58_9_ap_q_mode_5_ap_o_mode_3_0_7_6_64_array_V}
!138 = metadata !{metadata !139}
!139 = metadata !{i32 0, i32 57, metadata !140}
!140 = metadata !{metadata !141}
!141 = metadata !{metadata !"log_lut_table<ap_fixed<58, 9, (ap_q_mode)5, (ap_o_mode)3, 0>, 7, 6, 64>::array.V", metadata !142, metadata !"int58", i32 0, i32 57}
!142 = metadata !{metadata !143}
!143 = metadata !{i32 0, i32 63, i32 1}
!144 = metadata !{metadata !145, [16 x i58]* @log_lut_table_ap_fixed_58_9_ap_q_mode_5_ap_o_mode_3_0_4_4_16_array_V}
!145 = metadata !{metadata !146}
!146 = metadata !{i32 0, i32 57, metadata !147}
!147 = metadata !{metadata !148}
!148 = metadata !{metadata !"log_lut_table<ap_fixed<58, 9, (ap_q_mode)5, (ap_o_mode)3, 0>, 4, 4, 16>::array.V", metadata !149, metadata !"int58", i32 0, i32 57}
!149 = metadata !{metadata !150}
!150 = metadata !{i32 0, i32 15, i32 1}
!151 = metadata !{metadata !152, [64 x i58]* @log_lut_table_ap_fixed_58_9_ap_q_mode_5_ap_o_mode_3_0_12_6_64_array_V}
!152 = metadata !{metadata !153}
!153 = metadata !{i32 0, i32 57, metadata !154}
!154 = metadata !{metadata !155}
!155 = metadata !{metadata !"log_lut_table<ap_fixed<58, 9, (ap_q_mode)5, (ap_o_mode)3, 0>, 12, 6, 64>::array.V", metadata !142, metadata !"int58", i32 0, i32 57}
!156 = metadata !{metadata !157, [64 x i34]* @log_lut_table_ap_fixed_34_6_ap_q_mode_5_ap_o_mode_3_0_7_6_64_array_V}
!157 = metadata !{metadata !158}
!158 = metadata !{i32 0, i32 33, metadata !159}
!159 = metadata !{metadata !160}
!160 = metadata !{metadata !"log_lut_table<ap_fixed<34, 6, (ap_q_mode)5, (ap_o_mode)3, 0>, 7, 6, 64>::array.V", metadata !142, metadata !"int34", i32 0, i32 33}
!161 = metadata !{metadata !162, [16 x i34]* @log_lut_table_ap_fixed_34_6_ap_q_mode_5_ap_o_mode_3_0_4_4_16_array_V}
!162 = metadata !{metadata !163}
!163 = metadata !{i32 0, i32 33, metadata !164}
!164 = metadata !{metadata !165}
!165 = metadata !{metadata !"log_lut_table<ap_fixed<34, 6, (ap_q_mode)5, (ap_o_mode)3, 0>, 4, 4, 16>::array.V", metadata !149, metadata !"int34", i32 0, i32 33}
!166 = metadata !{metadata !167, [64 x i102]* @log_lut_table_ap_fixed_102_12_ap_q_mode_5_ap_o_mode_3_0_7_6_64_array_V}
!167 = metadata !{metadata !168}
!168 = metadata !{i32 0, i32 101, metadata !169}
!169 = metadata !{metadata !170}
!170 = metadata !{metadata !"log_lut_table<ap_fixed<102, 12, (ap_q_mode)5, (ap_o_mode)3, 0>, 7, 6, 64>::array.V", metadata !142, metadata !"int102", i32 0, i32 101}
!171 = metadata !{metadata !172, [16 x i102]* @log_lut_table_ap_fixed_102_12_ap_q_mode_5_ap_o_mode_3_0_4_4_16_array_V}
!172 = metadata !{metadata !173}
!173 = metadata !{i32 0, i32 101, metadata !174}
!174 = metadata !{metadata !175}
!175 = metadata !{metadata !"log_lut_table<ap_fixed<102, 12, (ap_q_mode)5, (ap_o_mode)3, 0>, 4, 4, 16>::array.V", metadata !149, metadata !"int102", i32 0, i32 101}
!176 = metadata !{metadata !177, [64 x i102]* @log_lut_table_ap_fixed_102_12_ap_q_mode_5_ap_o_mode_3_0_32_6_64_array_V}
!177 = metadata !{metadata !178}
!178 = metadata !{i32 0, i32 101, metadata !179}
!179 = metadata !{metadata !180}
!180 = metadata !{metadata !"log_lut_table<ap_fixed<102, 12, (ap_q_mode)5, (ap_o_mode)3, 0>, 32, 6, 64>::array.V", metadata !142, metadata !"int102", i32 0, i32 101}
!181 = metadata !{metadata !182, [64 x i102]* @log_lut_table_ap_fixed_102_12_ap_q_mode_5_ap_o_mode_3_0_27_6_64_array_V}
!182 = metadata !{metadata !183}
!183 = metadata !{i32 0, i32 101, metadata !184}
!184 = metadata !{metadata !185}
!185 = metadata !{metadata !"log_lut_table<ap_fixed<102, 12, (ap_q_mode)5, (ap_o_mode)3, 0>, 27, 6, 64>::array.V", metadata !142, metadata !"int102", i32 0, i32 101}
!186 = metadata !{metadata !187, [64 x i102]* @log_lut_table_ap_fixed_102_12_ap_q_mode_5_ap_o_mode_3_0_22_6_64_array_V}
!187 = metadata !{metadata !188}
!188 = metadata !{i32 0, i32 101, metadata !189}
!189 = metadata !{metadata !190}
!190 = metadata !{metadata !"log_lut_table<ap_fixed<102, 12, (ap_q_mode)5, (ap_o_mode)3, 0>, 22, 6, 64>::array.V", metadata !142, metadata !"int102", i32 0, i32 101}
!191 = metadata !{metadata !192, [64 x i102]* @log_lut_table_ap_fixed_102_12_ap_q_mode_5_ap_o_mode_3_0_17_6_64_array_V}
!192 = metadata !{metadata !193}
!193 = metadata !{i32 0, i32 101, metadata !194}
!194 = metadata !{metadata !195}
!195 = metadata !{metadata !"log_lut_table<ap_fixed<102, 12, (ap_q_mode)5, (ap_o_mode)3, 0>, 17, 6, 64>::array.V", metadata !142, metadata !"int102", i32 0, i32 101}
!196 = metadata !{metadata !197, [64 x i102]* @log_lut_table_ap_fixed_102_12_ap_q_mode_5_ap_o_mode_3_0_12_6_64_array_V}
!197 = metadata !{metadata !198}
!198 = metadata !{i32 0, i32 101, metadata !199}
!199 = metadata !{metadata !200}
!200 = metadata !{metadata !"log_lut_table<ap_fixed<102, 12, (ap_q_mode)5, (ap_o_mode)3, 0>, 12, 6, 64>::array.V", metadata !142, metadata !"int102", i32 0, i32 101}
!201 = metadata !{metadata !202, [64 x i6]* @log_inverse_lut_table_0_5_64_array_V}
!202 = metadata !{metadata !203}
!203 = metadata !{i32 0, i32 5, metadata !204}
!204 = metadata !{metadata !205}
!205 = metadata !{metadata !"log_inverse_lut_table<0, 5, 64>::array.V", metadata !142, metadata !"uint6", i32 0, i32 5}
!206 = metadata !{metadata !207, [64 x i58]* @log0_lut_table_ap_fixed_58_9_ap_q_mode_5_ap_o_mode_3_0_float_0_5_64_array_V}
!207 = metadata !{metadata !208}
!208 = metadata !{i32 0, i32 57, metadata !209}
!209 = metadata !{metadata !210}
!210 = metadata !{metadata !"log0_lut_table<ap_fixed<58, 9, (ap_q_mode)5, (ap_o_mode)3, 0>, float, 0, 5, 64>::array.V", metadata !142, metadata !"int58", i32 0, i32 57}
!211 = metadata !{metadata !212, [64 x i102]* @log0_lut_table_ap_fixed_102_12_ap_q_mode_5_ap_o_mode_3_0_double_0_5_64_array_V}
!212 = metadata !{metadata !213}
!213 = metadata !{i32 0, i32 101, metadata !214}
!214 = metadata !{metadata !215}
!215 = metadata !{metadata !"log0_lut_table<ap_fixed<102, 12, (ap_q_mode)5, (ap_o_mode)3, 0>, double, 0, 5, 64>::array.V", metadata !142, metadata !"int102", i32 0, i32 101}
!216 = metadata !{metadata !217, [2 x i32]* @llvm_global_ctors_0}
!217 = metadata !{metadata !218}
!218 = metadata !{i32 0, i32 31, metadata !219}
!219 = metadata !{metadata !220}
!220 = metadata !{metadata !"llvm.global_ctors.0", metadata !221, metadata !"", i32 0, i32 31}
!221 = metadata !{metadata !222}
!222 = metadata !{i32 0, i32 1, i32 1}
!223 = metadata !{metadata !224, [256 x i32]* @ip_table_V}
!224 = metadata !{metadata !225}
!225 = metadata !{i32 0, i32 31, metadata !226}
!226 = metadata !{metadata !227}
!227 = metadata !{metadata !"ip_table.V", metadata !228, metadata !"uint32", i32 0, i32 31}
!228 = metadata !{metadata !229}
!229 = metadata !{i32 0, i32 255, i32 1}
!230 = metadata !{metadata !231, [64 x i34]* @p_ZN14log0_lut_tableI8ap_fixedILi34ELi6EL9ap_q_mode5EL9ap_o_mode3ELi0EEDhLi0ELi5ELi64EE5arrayE_V}
!231 = metadata !{metadata !232}
!232 = metadata !{i32 0, i32 33, metadata !233}
!233 = metadata !{metadata !234}
!234 = metadata !{metadata !"_ZN14log0_lut_tableI8ap_fixedILi34ELi6EL9ap_q_mode5EL9ap_o_mode3ELi0EEDhLi0ELi5ELi64EE5arrayE.V", metadata !142, metadata !"int34", i32 0, i32 33}
!235 = metadata !{metadata !236, metadata !241, metadata !244}
!236 = metadata !{i32 0, i32 63, metadata !237}
!237 = metadata !{metadata !238}
!238 = metadata !{metadata !"txGalapagosBridge.V.data.V", metadata !239, metadata !"uint64", i32 0, i32 63}
!239 = metadata !{metadata !240}
!240 = metadata !{i32 0, i32 0, i32 1}
!241 = metadata !{i32 64, i32 71, metadata !242}
!242 = metadata !{metadata !243}
!243 = metadata !{metadata !"txGalapagosBridge.V.keep.V", metadata !239, metadata !"uint8", i32 0, i32 7}
!244 = metadata !{i32 72, i32 72, metadata !245}
!245 = metadata !{metadata !246}
!246 = metadata !{metadata !"txGalapagosBridge.V.last.V", metadata !239, metadata !"uint1", i32 0, i32 0}
!247 = metadata !{metadata !248, metadata !251, metadata !254}
!248 = metadata !{i32 0, i32 63, metadata !249}
!249 = metadata !{metadata !250}
!250 = metadata !{metadata !"rxData.V.data.V", metadata !239, metadata !"uint64", i32 0, i32 63}
!251 = metadata !{i32 64, i32 71, metadata !252}
!252 = metadata !{metadata !253}
!253 = metadata !{metadata !"rxData.V.keep.V", metadata !239, metadata !"uint8", i32 0, i32 7}
!254 = metadata !{i32 72, i32 72, metadata !255}
!255 = metadata !{metadata !256}
!256 = metadata !{metadata !"rxData.V.last.V", metadata !239, metadata !"uint1", i32 0, i32 0}
!257 = metadata !{metadata !258, metadata !261}
!258 = metadata !{i32 0, i32 15, metadata !259}
!259 = metadata !{metadata !260}
!260 = metadata !{metadata !"readRequest.V.sessionID.V", metadata !239, metadata !"uint16", i32 0, i32 15}
!261 = metadata !{i32 16, i32 31, metadata !262}
!262 = metadata !{metadata !263}
!263 = metadata !{metadata !"readRequest.V.length.V", metadata !239, metadata !"uint16", i32 0, i32 15}
!264 = metadata !{metadata !265, metadata !268, metadata !271, metadata !274, metadata !277}
!265 = metadata !{i32 0, i32 15, metadata !266}
!266 = metadata !{metadata !267}
!267 = metadata !{metadata !"notifications.V.sessionID.V", metadata !239, metadata !"uint16", i32 0, i32 15}
!268 = metadata !{i32 16, i32 31, metadata !269}
!269 = metadata !{metadata !270}
!270 = metadata !{metadata !"notifications.V.length.V", metadata !239, metadata !"uint16", i32 0, i32 15}
!271 = metadata !{i32 32, i32 63, metadata !272}
!272 = metadata !{metadata !273}
!273 = metadata !{metadata !"notifications.V.ipAddress.V", metadata !239, metadata !"uint32", i32 0, i32 31}
!274 = metadata !{i32 64, i32 79, metadata !275}
!275 = metadata !{metadata !276}
!276 = metadata !{metadata !"notifications.V.dstPort.V", metadata !239, metadata !"uint16", i32 0, i32 15}
!277 = metadata !{i32 80, i32 80, metadata !278}
!278 = metadata !{metadata !279}
!279 = metadata !{metadata !"notifications.V.closed", metadata !239, metadata !"bool", i32 0, i32 0}
!280 = metadata !{metadata !281, metadata !284, metadata !287}
!281 = metadata !{i32 0, i32 63, metadata !282}
!282 = metadata !{metadata !283}
!283 = metadata !{metadata !"txData.V.data.V", metadata !239, metadata !"uint64", i32 0, i32 63}
!284 = metadata !{i32 64, i32 71, metadata !285}
!285 = metadata !{metadata !286}
!286 = metadata !{metadata !"txData.V.keep.V", metadata !239, metadata !"uint8", i32 0, i32 7}
!287 = metadata !{i32 72, i32 72, metadata !288}
!288 = metadata !{metadata !289}
!289 = metadata !{metadata !"txData.V.last.V", metadata !239, metadata !"uint1", i32 0, i32 0}
!290 = metadata !{metadata !291, metadata !294}
!291 = metadata !{i32 0, i32 15, metadata !292}
!292 = metadata !{metadata !293}
!293 = metadata !{metadata !"openConStatus.V.sessionID.V", metadata !239, metadata !"uint16", i32 0, i32 15}
!294 = metadata !{i32 16, i32 16, metadata !295}
!295 = metadata !{metadata !296}
!296 = metadata !{metadata !"openConStatus.V.success", metadata !239, metadata !"bool", i32 0, i32 0}
!297 = metadata !{metadata !298, metadata !301}
!298 = metadata !{i32 0, i32 31, metadata !299}
!299 = metadata !{metadata !300}
!300 = metadata !{metadata !"openConnection.V.ip_address.V", metadata !239, metadata !"uint32", i32 0, i32 31}
!301 = metadata !{i32 32, i32 47, metadata !302}
!302 = metadata !{metadata !303}
!303 = metadata !{metadata !"openConnection.V.ip_port.V", metadata !239, metadata !"uint16", i32 0, i32 15}
!304 = metadata !{metadata !305, metadata !308}
!305 = metadata !{i32 0, i32 15, metadata !306}
!306 = metadata !{metadata !307}
!307 = metadata !{metadata !"txMetaData.V.sessionID.V", metadata !239, metadata !"uint16", i32 0, i32 15}
!308 = metadata !{i32 16, i32 31, metadata !309}
!309 = metadata !{metadata !310}
!310 = metadata !{metadata !"txMetaData.V.length.V", metadata !239, metadata !"uint16", i32 0, i32 15}
!311 = metadata !{metadata !312, metadata !315, metadata !318}
!312 = metadata !{i32 0, i32 63, metadata !313}
!313 = metadata !{metadata !314}
!314 = metadata !{metadata !"rxGalapagosBridge.V.data.V", metadata !239, metadata !"uint64", i32 0, i32 63}
!315 = metadata !{i32 64, i32 71, metadata !316}
!316 = metadata !{metadata !317}
!317 = metadata !{metadata !"rxGalapagosBridge.V.keep.V", metadata !239, metadata !"uint8", i32 0, i32 7}
!318 = metadata !{i32 72, i32 72, metadata !319}
!319 = metadata !{metadata !320}
!320 = metadata !{metadata !"rxGalapagosBridge.V.last.V", metadata !239, metadata !"uint1", i32 0, i32 0}
!321 = metadata !{metadata !322}
!322 = metadata !{i32 0, i32 16, metadata !323}
!323 = metadata !{metadata !324}
!324 = metadata !{metadata !"txStatus.V.V", metadata !239, metadata !"int17", i32 0, i32 16}
!325 = metadata !{metadata !326}
!326 = metadata !{i32 0, i32 15, metadata !327}
!327 = metadata !{metadata !328}
!328 = metadata !{metadata !"listenPort.V.V", metadata !239, metadata !"uint16", i32 0, i32 15}
!329 = metadata !{metadata !330}
!330 = metadata !{i32 0, i32 0, metadata !331}
!331 = metadata !{metadata !332}
!332 = metadata !{metadata !"listenPortStatus.V", metadata !239, metadata !"bool", i32 0, i32 0}
!333 = metadata !{metadata !334}
!334 = metadata !{i32 0, i32 15, metadata !335}
!335 = metadata !{metadata !336}
!336 = metadata !{metadata !"rxMetaData.V.V", metadata !239, metadata !"uint16", i32 0, i32 15}
!337 = metadata !{metadata !338}
!338 = metadata !{i32 0, i32 3, metadata !339}
!339 = metadata !{metadata !340}
!340 = metadata !{metadata !"state_out.V", metadata !239, metadata !"uint4", i32 0, i32 3}
!341 = metadata !{metadata !342}
!342 = metadata !{i32 0, i32 63, metadata !343}
!343 = metadata !{metadata !344}
!344 = metadata !{metadata !"header_out.V", metadata !239, metadata !"uint64", i32 0, i32 63}
!345 = metadata !{metadata !346}
!346 = metadata !{i32 0, i32 15, metadata !347}
!347 = metadata !{metadata !348}
!348 = metadata !{metadata !"size_out.V", metadata !239, metadata !"uint16", i32 0, i32 15}
!349 = metadata !{metadata !350}
!350 = metadata !{i32 0, i32 15, metadata !351}
!351 = metadata !{metadata !352}
!352 = metadata !{metadata !"sessionID_out.V", metadata !239, metadata !"uint16", i32 0, i32 15}
