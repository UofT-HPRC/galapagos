; ModuleID = '/home/user/galapagos/hlsBuild/adm-8k5-debug/ip/ethernet_bridge/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@state_V_1 = internal unnamed_addr global i3 0
@state_V = internal unnamed_addr global i3 0
@mac_table_V = global [256 x i48] zeroinitializer
@mac_addr_OC_V_c42_st = internal unnamed_addr constant [15 x i8] c"mac_addr.V_c42\00"
@mac_addr_OC_V_c_str = internal unnamed_addr constant [13 x i8] c"mac_addr.V_c\00"
@llvm_global_ctors_1 = appending global [1 x void ()*] [void ()* @_GLOBAL__I_a]
@llvm_global_ctors_0 = appending global [1 x i32] [i32 65535]
@ethernet_bridge_str = internal unnamed_addr constant [16 x i8] c"ethernet_bridge\00"
@eth_dst_src_V = internal unnamed_addr global i96 0
@dest_mac_address_V = internal unnamed_addr global i48 0
@dest_V = internal unnamed_addr global i8 0
@app_packet_out_last_s = internal unnamed_addr global i1 false
@app_packet_in_tkeep_s = internal unnamed_addr global i8 0
@app_packet_in_tdest_s = internal unnamed_addr global i8 0
@app_packet_in_last_V = internal unnamed_addr global i1 false
@app_packet_in_data_V = internal unnamed_addr global i64 0
@ap_fifo_str = internal unnamed_addr constant [8 x i8] c"ap_fifo\00"
@p_str3 = private unnamed_addr constant [13 x i8] c"ap_ctrl_none\00", align 1
@p_str2 = private unnamed_addr constant [11 x i8] c"AXI4Stream\00", align 1
@p_str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

declare i96 @llvm.part.select.i96(i96, i32, i32) nounwind readnone

declare i81 @llvm.part.select.i81(i81, i32, i32) nounwind readnone

declare i73 @llvm.part.select.i73(i73, i32, i32) nounwind readnone

declare i48 @llvm.part.select.i48(i48, i32, i32) nounwind readnone

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define internal fastcc void @ethernet_bridge.entr(i48 %mac_addr_V, i48* %mac_addr_V_out, i48* %mac_addr_V_out1) {
entry:
  call void (...)* @_ssdm_op_SpecInterface(i48* %mac_addr_V_out, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  %mac_addr_V_read = call i48 @_ssdm_op_Read.ap_auto.i48(i48 %mac_addr_V)
  call void @_ssdm_op_Write.ap_fifo.i48P(i48* %mac_addr_V_out, i48 %mac_addr_V_read)
  call void (...)* @_ssdm_op_SpecInterface(i48* %mac_addr_V_out1, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void @_ssdm_op_Write.ap_fifo.i48P(i48* %mac_addr_V_out1, i48 %mac_addr_V_read)
  ret void
}

define void @ethernet_bridge(i81* %to_app_V, i73* %from_eth_V, i81* %from_app_V, i73* %to_eth_V, i48 %mac_addr_V, i48* %observedAddress_out_V) {
  %mac_addr_V_read = call i48 @_ssdm_op_Read.ap_auto.i48(i48 %mac_addr_V)
  %mac_addr_V_c42 = alloca i48, align 8
  %mac_addr_V_c = alloca i48, align 8
  call void (...)* @_ssdm_op_SpecDataflowPipeline(i32 -1, [1 x i8]* @p_str) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i73* %to_eth_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i81* %from_app_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i73* %from_eth_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i81* %to_app_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecBitsMap(i73* %to_eth_V), !map !176
  call void (...)* @_ssdm_op_SpecBitsMap(i81* %from_app_V), !map !186
  call void (...)* @_ssdm_op_SpecBitsMap(i73* %from_eth_V), !map !199
  call void (...)* @_ssdm_op_SpecBitsMap(i81* %to_app_V), !map !209
  call void (...)* @_ssdm_op_SpecBitsMap(i48 %mac_addr_V), !map !222
  call void (...)* @_ssdm_op_SpecBitsMap(i48* %observedAddress_out_V), !map !228
  call void (...)* @_ssdm_op_SpecTopModule([16 x i8]* @ethernet_bridge_str) nounwind
  call void (...)* @_ssdm_op_SpecIFCore(i81* %to_app_V, [1 x i8]* @p_str, [11 x i8]* @p_str2, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecIFCore(i73* %from_eth_V, [1 x i8]* @p_str, [11 x i8]* @p_str2, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecIFCore(i81* %from_app_V, [1 x i8]* @p_str, [11 x i8]* @p_str2, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecIFCore(i73* %to_eth_V, [1 x i8]* @p_str, [11 x i8]* @p_str2, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i32 0, [13 x i8]* @p_str3, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str) nounwind
  %empty = call i32 (...)* @_ssdm_op_SpecChannel([13 x i8]* @mac_addr_OC_V_c_str, i32 1, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 0, i48* %mac_addr_V_c, i48* %mac_addr_V_c)
  call void (...)* @_ssdm_op_SpecInterface(i48* %mac_addr_V_c, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  %empty_13 = call i32 (...)* @_ssdm_op_SpecChannel([15 x i8]* @mac_addr_OC_V_c42_st, i32 1, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 0, i48* %mac_addr_V_c42, i48* %mac_addr_V_c42)
  call void (...)* @_ssdm_op_SpecInterface(i48* %mac_addr_V_c42, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call fastcc void @ethernet_bridge.entr(i48 %mac_addr_V_read, i48* %mac_addr_V_c, i48* %mac_addr_V_c42)
  call fastcc void @eth_to_app(i73* %from_eth_V, i81* %to_app_V, i48* nocapture %mac_addr_V_c, i48* nocapture %observedAddress_out_V)
  call fastcc void @app_to_eth(i81* %from_app_V, i73* %to_eth_V, i48* nocapture %mac_addr_V_c42)
  ret void
}

define internal fastcc void @eth_to_app(i73* %from_eth_V, i81* %to_app_V, i48* nocapture %mac_address_V, i48* nocapture %observedAddress_out_s) {
entry:
  call void (...)* @_ssdm_op_SpecIFCore(i73* %from_eth_V, [1 x i8]* @p_str, [11 x i8]* @p_str2, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecIFCore(i81* %to_app_V, [1 x i8]* @p_str, [11 x i8]* @p_str2, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i81* %to_app_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i73* %from_eth_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i48* %mac_address_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  %mac_address_V_read = call i48 @_ssdm_op_Read.ap_fifo.i48P(i48* %mac_address_V)
  call void (...)* @_ssdm_op_SpecPipeline(i32 1, i32 1, i32 1, i32 0, [1 x i8]* @p_str) nounwind
  %state_V_1_load = load i3* @state_V_1, align 1
  switch i3 %state_V_1_load, label %.exit [
    i3 0, label %0
    i3 2, label %2
    i3 3, label %4
    i3 1, label %6
  ]

; <label>:0                                       ; preds = %entry
  %tmp = call i1 @_ssdm_op_NbReadReq.ap_fifo.i73P(i73* %from_eth_V, i32 1)
  br i1 %tmp, label %1, label %.exit

; <label>:1                                       ; preds = %0
  %tmp9 = call i73 @_ssdm_op_Read.ap_fifo.volatile.i73P(i73* %from_eth_V)
  %tmp_4 = trunc i73 %tmp9 to i8
  %tmp_5 = call i8 @_ssdm_op_PartSelect.i8.i73.i32.i32(i73 %tmp9, i32 8, i32 15)
  %tmp_6 = call i8 @_ssdm_op_PartSelect.i8.i73.i32.i32(i73 %tmp9, i32 16, i32 23)
  %tmp_7 = call i8 @_ssdm_op_PartSelect.i8.i73.i32.i32(i73 %tmp9, i32 32, i32 39)
  %tmp_8 = call i8 @_ssdm_op_PartSelect.i8.i73.i32.i32(i73 %tmp9, i32 24, i32 31)
  %tmp_9 = call i8 @_ssdm_op_PartSelect.i8.i73.i32.i32(i73 %tmp9, i32 40, i32 47)
  %observedAddress_V = call i48 @_ssdm_op_BitConcatenate.i48.i8.i8.i8.i8.i8.i8(i8 %tmp_4, i8 %tmp_5, i8 %tmp_6, i8 %tmp_8, i8 %tmp_7, i8 %tmp_9)
  %tmp_i = icmp eq i48 %observedAddress_V, %mac_address_V_read
  %storemerge1_cast_i_c = select i1 %tmp_i, i3 2, i3 1
  store i3 %storemerge1_cast_i_c, i3* @state_V_1, align 1
  br label %.exit

; <label>:2                                       ; preds = %entry
  %tmp_1 = call i1 @_ssdm_op_NbReadReq.ap_fifo.i73P(i73* %from_eth_V, i32 1)
  br i1 %tmp_1, label %3, label %._crit_edge169.i

; <label>:3                                       ; preds = %2
  %tmp_116 = call i73 @_ssdm_op_Read.ap_fifo.volatile.i73P(i73* %from_eth_V)
  %tmp_s = call i8 @_ssdm_op_PartSelect.i8.i73.i32.i32(i73 %tmp_116, i32 48, i32 55)
  store i8 %tmp_s, i8* @dest_V, align 1
  store i3 3, i3* @state_V_1, align 1
  br label %._crit_edge169.i

._crit_edge169.i:                                 ; preds = %3, %2
  br label %.exit

; <label>:4                                       ; preds = %entry
  %tmp_tdest_V = load i8* @dest_V, align 1
  %tmp_2 = call i1 @_ssdm_op_NbReadReq.ap_fifo.i73P(i73* %from_eth_V, i32 1)
  %app_packet_out_last_1 = load i1* @app_packet_out_last_s, align 1
  br i1 %tmp_2, label %5, label %._crit_edge170.i

; <label>:5                                       ; preds = %4
  %tmp_223 = call i73 @_ssdm_op_Read.ap_fifo.volatile.i73P(i73* %from_eth_V)
  %tmp_last_V = call i1 @_ssdm_op_BitSelect.i1.i73.i32(i73 %tmp_223, i32 64)
  %tmp_tkeep_V = call i8 @_ssdm_op_PartSelect.i8.i73.i32.i32(i73 %tmp_223, i32 65, i32 72)
  store i1 %tmp_last_V, i1* @app_packet_out_last_s, align 8
  %tmp_11 = trunc i73 %tmp_223 to i65
  %tmp_31 = call i81 @_ssdm_op_BitConcatenate.i81.i8.i8.i65(i8 %tmp_tkeep_V, i8 %tmp_tdest_V, i65 %tmp_11)
  call void @_ssdm_op_Write.ap_fifo.volatile.i81P(i81* %to_app_V, i81 %tmp_31)
  br label %._crit_edge170.i

._crit_edge170.i:                                 ; preds = %5, %4
  %app_packet_out_last_2 = phi i1 [ %tmp_last_V, %5 ], [ %app_packet_out_last_1, %4 ]
  %storemerge2_cast_i_c = select i1 %app_packet_out_last_2, i3 0, i3 3
  store i3 %storemerge2_cast_i_c, i3* @state_V_1, align 1
  br label %.exit

; <label>:6                                       ; preds = %entry
  %tmp_3 = call i1 @_ssdm_op_NbReadReq.ap_fifo.i73P(i73* %from_eth_V, i32 1)
  br i1 %tmp_3, label %7, label %._crit_edge171.i

; <label>:7                                       ; preds = %6
  %tmp_436 = call i73 @_ssdm_op_Read.ap_fifo.volatile.i73P(i73* %from_eth_V)
  %tmp_12 = call i1 @_ssdm_op_BitSelect.i1.i73.i32(i73 %tmp_436, i32 64)
  %not_tmp_last_V_4_loa = xor i1 %tmp_12, true
  %storemerge_cast_i = zext i1 %not_tmp_last_V_4_loa to i3
  store i3 %storemerge_cast_i, i3* @state_V_1, align 1
  br label %._crit_edge171.i

._crit_edge171.i:                                 ; preds = %7, %6
  br label %.exit

.exit:                                            ; preds = %._crit_edge171.i, %._crit_edge170.i, %._crit_edge169.i, %1, %0, %entry
  %p_066_1_i = phi i48 [ undef, %._crit_edge171.i ], [ undef, %._crit_edge170.i ], [ undef, %._crit_edge169.i ], [ %observedAddress_V, %1 ], [ undef, %entry ], [ undef, %0 ]
  call void @_ssdm_op_Write.ap_auto.i48P(i48* %observedAddress_out_s, i48 %p_066_1_i)
  ret void
}

define internal fastcc void @app_to_eth(i81* %from_app_V, i73* %to_eth_V, i48* nocapture %src_mac_address_V) {
entry:
  call void (...)* @_ssdm_op_SpecIFCore(i73* %to_eth_V, [1 x i8]* @p_str, [11 x i8]* @p_str2, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecIFCore(i81* %from_app_V, [1 x i8]* @p_str, [11 x i8]* @p_str2, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i81* %from_app_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i73* %to_eth_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i48* %src_mac_address_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  %p_Repl2_s = call i48 @_ssdm_op_Read.ap_fifo.i48P(i48* %src_mac_address_V)
  call void (...)* @_ssdm_op_SpecPipeline(i32 1, i32 1, i32 1, i32 0, [1 x i8]* @p_str) nounwind
  %p_Val2_s = load i96* @eth_dst_src_V, align 8
  %state_V_load = load i3* @state_V, align 1
  %tmp_last_V = load i1* @app_packet_in_last_V, align 1
  %p_Repl2_1 = load i48* @dest_mac_address_V, align 8
  %tmp_tkeep_V = load i8* @app_packet_in_tkeep_s, align 1
  switch i3 %state_V_load, label %.exit [
    i3 0, label %0
    i3 1, label %2
    i3 2, label %3
    i3 3, label %4
    i3 -4, label %5
  ]

; <label>:0                                       ; preds = %entry
  %tmp = call i1 @_ssdm_op_NbReadReq.ap_fifo.i81P(i81* %from_app_V, i32 1)
  br i1 %tmp, label %1, label %._crit_edge348.i

; <label>:1                                       ; preds = %0
  %tmp25 = call i81 @_ssdm_op_Read.ap_fifo.volatile.i81P(i81* %from_app_V)
  %tmp_15 = trunc i81 %tmp25 to i64
  store i64 %tmp_15, i64* @app_packet_in_data_V, align 8
  %tmp_16 = call i1 @_ssdm_op_BitSelect.i1.i81.i32(i81 %tmp25, i32 64)
  store i1 %tmp_16, i1* @app_packet_in_last_V, align 8
  %tmp_tdest_V_load_new = call i8 @_ssdm_op_PartSelect.i8.i81.i32.i32(i81 %tmp25, i32 65, i32 72)
  store i8 %tmp_tdest_V_load_new, i8* @app_packet_in_tdest_s, align 1
  %tmp_tkeep_V_7_load_n = call i8 @_ssdm_op_PartSelect.i8.i81.i32.i32(i81 %tmp25, i32 73, i32 80)
  store i8 %tmp_tkeep_V_7_load_n, i8* @app_packet_in_tkeep_s, align 2
  %tmp_i = zext i8 %tmp_tdest_V_load_new to i64
  %mac_table_V_addr = getelementptr [256 x i48]* @mac_table_V, i64 0, i64 %tmp_i
  %mac_table_V_load = load i48* %mac_table_V_addr, align 8
  store i48 %mac_table_V_load, i48* @dest_mac_address_V, align 8
  store i3 1, i3* @state_V, align 1
  br label %._crit_edge348.i

._crit_edge348.i:                                 ; preds = %1, %0
  br label %.exit

; <label>:2                                       ; preds = %entry
  %p_Result_s = call i96 @_ssdm_op_BitConcatenate.i96.i48.i48(i48 %p_Repl2_1, i48 %p_Repl2_s)
  store i96 %p_Result_s, i96* @eth_dst_src_V, align 8
  %tmp_s = call i8 @_ssdm_op_PartSelect.i8.i48.i32.i32(i48 %p_Repl2_s, i32 32, i32 39)
  %tmp_1 = call i8 @_ssdm_op_PartSelect.i8.i48.i32.i32(i48 %p_Repl2_1, i32 40, i32 47)
  %tmp_2 = call i8 @_ssdm_op_PartSelect.i8.i48.i32.i32(i48 %p_Repl2_s, i32 40, i32 47)
  %tmp_13 = trunc i48 %p_Repl2_1 to i8
  %tmp_3 = call i8 @_ssdm_op_PartSelect.i8.i48.i32.i32(i48 %p_Repl2_1, i32 16, i32 23)
  %tmp_5 = call i8 @_ssdm_op_PartSelect.i8.i48.i32.i32(i48 %p_Repl2_1, i32 32, i32 39)
  %tmp_6 = call i8 @_ssdm_op_PartSelect.i8.i48.i32.i32(i48 %p_Repl2_1, i32 8, i32 15)
  %tmp_7 = call i8 @_ssdm_op_PartSelect.i8.i48.i32.i32(i48 %p_Repl2_1, i32 24, i32 31)
  %tmp_1_2 = call i73 @_ssdm_op_BitConcatenate.i73.i9.i8.i8.i8.i8.i8.i8.i8.i8(i9 -2, i8 %tmp_s, i8 %tmp_2, i8 %tmp_13, i8 %tmp_6, i8 %tmp_3, i8 %tmp_7, i8 %tmp_5, i8 %tmp_1)
  call void @_ssdm_op_Write.ap_fifo.volatile.i73P(i73* %to_eth_V, i73 %tmp_1_2)
  store i3 2, i3* @state_V, align 1
  br label %.exit

; <label>:3                                       ; preds = %entry
  %app_packet_in_tdest_1 = load i8* @app_packet_in_tdest_s, align 1
  %tmp_8 = call i8 @_ssdm_op_PartSelect.i8.i96.i32.i32(i96 %p_Val2_s, i32 24, i32 31)
  %tmp_14 = trunc i96 %p_Val2_s to i8
  %tmp_9 = call i8 @_ssdm_op_PartSelect.i8.i96.i32.i32(i96 %p_Val2_s, i32 16, i32 23)
  %tmp_10 = call i8 @_ssdm_op_PartSelect.i8.i96.i32.i32(i96 %p_Val2_s, i32 8, i32 15)
  %tmp_2_2 = call i73 @_ssdm_op_BitConcatenate.i73.i17.i8.i16.i8.i8.i8.i8(i17 -512, i8 %app_packet_in_tdest_1, i16 116, i8 %tmp_14, i8 %tmp_10, i8 %tmp_9, i8 %tmp_8)
  call void @_ssdm_op_Write.ap_fifo.volatile.i73P(i73* %to_eth_V, i73 %tmp_2_2)
  store i3 3, i3* @state_V, align 1
  br label %.exit

; <label>:4                                       ; preds = %entry
  %tmp_data_V = load i64* @app_packet_in_data_V, align 8
  %tmp_3_2 = call i73 @_ssdm_op_BitConcatenate.i73.i8.i1.i64(i8 %tmp_tkeep_V, i1 %tmp_last_V, i64 %tmp_data_V)
  call void @_ssdm_op_Write.ap_fifo.volatile.i73P(i73* %to_eth_V, i73 %tmp_3_2)
  %storemerge3_i = select i1 %tmp_last_V, i3 0, i3 -4
  store i3 %storemerge3_i, i3* @state_V, align 1
  br label %.exit

; <label>:5                                       ; preds = %entry
  %tmp_4 = call i1 @_ssdm_op_NbReadReq.ap_fifo.i81P(i81* %from_app_V, i32 1)
  br i1 %tmp_4, label %6, label %._crit_edge349.i

; <label>:6                                       ; preds = %5
  %tmp_4_1 = call i81 @_ssdm_op_Read.ap_fifo.volatile.i81P(i81* %from_app_V)
  %tmp_data_V_1 = trunc i81 %tmp_4_1 to i64
  store i64 %tmp_data_V_1, i64* @app_packet_in_data_V, align 8
  %tmp_last_V_1 = call i1 @_ssdm_op_BitSelect.i1.i81.i32(i81 %tmp_4_1, i32 64)
  store i1 %tmp_last_V_1, i1* @app_packet_in_last_V, align 8
  %tmp_tdest_V_1_load_n = call i8 @_ssdm_op_PartSelect.i8.i81.i32.i32(i81 %tmp_4_1, i32 65, i32 72)
  store i8 %tmp_tdest_V_1_load_n, i8* @app_packet_in_tdest_s, align 1
  %tmp_tkeep_V_1 = call i8 @_ssdm_op_PartSelect.i8.i81.i32.i32(i81 %tmp_4_1, i32 73, i32 80)
  store i8 %tmp_tkeep_V_1, i8* @app_packet_in_tkeep_s, align 2
  %tmp_19 = trunc i81 %tmp_4_1 to i65
  %tmp_518 = call i73 @_ssdm_op_BitConcatenate.i73.i8.i65(i8 %tmp_tkeep_V_1, i65 %tmp_19)
  call void @_ssdm_op_Write.ap_fifo.volatile.i73P(i73* %to_eth_V, i73 %tmp_518)
  %storemerge_i = select i1 %tmp_last_V_1, i3 0, i3 -4
  store i3 %storemerge_i, i3* @state_V, align 1
  br label %._crit_edge349.i

._crit_edge349.i:                                 ; preds = %6, %5
  br label %.exit

.exit:                                            ; preds = %._crit_edge349.i, %4, %3, %2, %._crit_edge348.i, %entry
  ret void
}

define weak void @_ssdm_op_Write.ap_fifo.volatile.i81P(i81*, i81) {
entry:
  %empty = call i81 @_autotb_FifoWrite_i81(i81* %0, i81 %1)
  ret void
}

define weak void @_ssdm_op_Write.ap_fifo.volatile.i73P(i73*, i73) {
entry:
  %empty = call i73 @_autotb_FifoWrite_i73(i73* %0, i73 %1)
  ret void
}

define weak void @_ssdm_op_Write.ap_fifo.i48P(i48*, i48) {
entry:
  %empty = call i48 @_autotb_FifoWrite_i48(i48* %0, i48 %1)
  ret void
}

define weak void @_ssdm_op_Write.ap_auto.i48P(i48*, i48) {
entry:
  store i48 %1, i48* %0
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

define weak i48 @_ssdm_op_Read.ap_fifo.i48P(i48*) {
entry:
  %empty = call i48 @_autotb_FifoRead_i48(i48* %0)
  ret i48 %empty
}

define weak i48 @_ssdm_op_Read.ap_auto.i48(i48) {
entry:
  ret i48 %0
}

define weak i8 @_ssdm_op_PartSelect.i8.i96.i32.i32(i96, i32, i32) nounwind readnone {
entry:
  %empty = call i96 @llvm.part.select.i96(i96 %0, i32 %1, i32 %2)
  %empty_14 = trunc i96 %empty to i8
  ret i8 %empty_14
}

define weak i8 @_ssdm_op_PartSelect.i8.i81.i32.i32(i81, i32, i32) nounwind readnone {
entry:
  %empty = call i81 @llvm.part.select.i81(i81 %0, i32 %1, i32 %2)
  %empty_15 = trunc i81 %empty to i8
  ret i8 %empty_15
}

define weak i8 @_ssdm_op_PartSelect.i8.i73.i32.i32(i73, i32, i32) nounwind readnone {
entry:
  %empty = call i73 @llvm.part.select.i73(i73 %0, i32 %1, i32 %2)
  %empty_16 = trunc i73 %empty to i8
  ret i8 %empty_16
}

define weak i8 @_ssdm_op_PartSelect.i8.i48.i32.i32(i48, i32, i32) nounwind readnone {
entry:
  %empty = call i48 @llvm.part.select.i48(i48 %0, i32 %1, i32 %2)
  %empty_17 = trunc i48 %empty to i8
  ret i8 %empty_17
}

declare i65 @_ssdm_op_PartSelect.i65.i81.i32.i32(i81, i32, i32) nounwind readnone

declare i65 @_ssdm_op_PartSelect.i65.i73.i32.i32(i73, i32, i32) nounwind readnone

declare i64 @_ssdm_op_PartSelect.i64.i81.i32.i32(i81, i32, i32) nounwind readnone

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

define weak i1 @_ssdm_op_BitSelect.i1.i81.i32(i81, i32) nounwind readnone {
entry:
  %empty = zext i32 %1 to i81
  %empty_18 = shl i81 1, %empty
  %empty_19 = and i81 %0, %empty_18
  %empty_20 = icmp ne i81 %empty_19, 0
  ret i1 %empty_20
}

define weak i1 @_ssdm_op_BitSelect.i1.i73.i32(i73, i32) nounwind readnone {
entry:
  %empty = zext i32 %1 to i73
  %empty_21 = shl i73 1, %empty
  %empty_22 = and i73 %0, %empty_21
  %empty_23 = icmp ne i73 %empty_22, 0
  ret i1 %empty_23
}

define weak i96 @_ssdm_op_BitConcatenate.i96.i48.i48(i48, i48) nounwind readnone {
entry:
  %empty = zext i48 %0 to i96
  %empty_24 = zext i48 %1 to i96
  %empty_25 = shl i96 %empty, 48
  %empty_26 = or i96 %empty_25, %empty_24
  ret i96 %empty_26
}

define weak i81 @_ssdm_op_BitConcatenate.i81.i8.i8.i65(i8, i8, i65) nounwind readnone {
entry:
  %empty = zext i8 %1 to i73
  %empty_27 = zext i65 %2 to i73
  %empty_28 = shl i73 %empty, 65
  %empty_29 = or i73 %empty_28, %empty_27
  %empty_30 = zext i8 %0 to i81
  %empty_31 = zext i73 %empty_29 to i81
  %empty_32 = shl i81 %empty_30, 73
  %empty_33 = or i81 %empty_32, %empty_31
  ret i81 %empty_33
}

define weak i73 @_ssdm_op_BitConcatenate.i73.i9.i8.i8.i8.i8.i8.i8.i8.i8(i9, i8, i8, i8, i8, i8, i8, i8, i8) nounwind readnone {
entry:
  %empty = zext i8 %7 to i16
  %empty_34 = zext i8 %8 to i16
  %empty_35 = shl i16 %empty, 8
  %empty_36 = or i16 %empty_35, %empty_34
  %empty_37 = zext i8 %6 to i24
  %empty_38 = zext i16 %empty_36 to i24
  %empty_39 = shl i24 %empty_37, 16
  %empty_40 = or i24 %empty_39, %empty_38
  %empty_41 = zext i8 %5 to i32
  %empty_42 = zext i24 %empty_40 to i32
  %empty_43 = shl i32 %empty_41, 24
  %empty_44 = or i32 %empty_43, %empty_42
  %empty_45 = zext i8 %4 to i40
  %empty_46 = zext i32 %empty_44 to i40
  %empty_47 = shl i40 %empty_45, 32
  %empty_48 = or i40 %empty_47, %empty_46
  %empty_49 = zext i8 %3 to i48
  %empty_50 = zext i40 %empty_48 to i48
  %empty_51 = shl i48 %empty_49, 40
  %empty_52 = or i48 %empty_51, %empty_50
  %empty_53 = zext i8 %2 to i56
  %empty_54 = zext i48 %empty_52 to i56
  %empty_55 = shl i56 %empty_53, 48
  %empty_56 = or i56 %empty_55, %empty_54
  %empty_57 = zext i8 %1 to i64
  %empty_58 = zext i56 %empty_56 to i64
  %empty_59 = shl i64 %empty_57, 56
  %empty_60 = or i64 %empty_59, %empty_58
  %empty_61 = zext i9 %0 to i73
  %empty_62 = zext i64 %empty_60 to i73
  %empty_63 = shl i73 %empty_61, 64
  %empty_64 = or i73 %empty_63, %empty_62
  ret i73 %empty_64
}

define weak i73 @_ssdm_op_BitConcatenate.i73.i8.i65(i8, i65) nounwind readnone {
entry:
  %empty = zext i8 %0 to i73
  %empty_65 = zext i65 %1 to i73
  %empty_66 = shl i73 %empty, 65
  %empty_67 = or i73 %empty_66, %empty_65
  ret i73 %empty_67
}

define weak i73 @_ssdm_op_BitConcatenate.i73.i8.i1.i64(i8, i1, i64) nounwind readnone {
entry:
  %empty = zext i1 %1 to i65
  %empty_68 = zext i64 %2 to i65
  %empty_69 = shl i65 %empty, 64
  %empty_70 = or i65 %empty_69, %empty_68
  %empty_71 = zext i8 %0 to i73
  %empty_72 = zext i65 %empty_70 to i73
  %empty_73 = shl i73 %empty_71, 65
  %empty_74 = or i73 %empty_73, %empty_72
  ret i73 %empty_74
}

define weak i73 @_ssdm_op_BitConcatenate.i73.i17.i8.i16.i8.i8.i8.i8(i17, i8, i16, i8, i8, i8, i8) nounwind readnone {
entry:
  %empty = zext i8 %5 to i16
  %empty_75 = zext i8 %6 to i16
  %empty_76 = shl i16 %empty, 8
  %empty_77 = or i16 %empty_76, %empty_75
  %empty_78 = zext i8 %4 to i24
  %empty_79 = zext i16 %empty_77 to i24
  %empty_80 = shl i24 %empty_78, 16
  %empty_81 = or i24 %empty_80, %empty_79
  %empty_82 = zext i8 %3 to i32
  %empty_83 = zext i24 %empty_81 to i32
  %empty_84 = shl i32 %empty_82, 24
  %empty_85 = or i32 %empty_84, %empty_83
  %empty_86 = zext i16 %2 to i48
  %empty_87 = zext i32 %empty_85 to i48
  %empty_88 = shl i48 %empty_86, 32
  %empty_89 = or i48 %empty_88, %empty_87
  %empty_90 = zext i8 %1 to i56
  %empty_91 = zext i48 %empty_89 to i56
  %empty_92 = shl i56 %empty_90, 48
  %empty_93 = or i56 %empty_92, %empty_91
  %empty_94 = zext i17 %0 to i73
  %empty_95 = zext i56 %empty_93 to i73
  %empty_96 = shl i73 %empty_94, 56
  %empty_97 = or i73 %empty_96, %empty_95
  ret i73 %empty_97
}

define weak i48 @_ssdm_op_BitConcatenate.i48.i8.i8.i8.i8.i8.i8(i8, i8, i8, i8, i8, i8) nounwind readnone {
entry:
  %empty = zext i8 %4 to i16
  %empty_98 = zext i8 %5 to i16
  %empty_99 = shl i16 %empty, 8
  %empty_100 = or i16 %empty_99, %empty_98
  %empty_101 = zext i8 %3 to i24
  %empty_102 = zext i16 %empty_100 to i24
  %empty_103 = shl i24 %empty_101, 16
  %empty_104 = or i24 %empty_103, %empty_102
  %empty_105 = zext i8 %2 to i32
  %empty_106 = zext i24 %empty_104 to i32
  %empty_107 = shl i32 %empty_105, 24
  %empty_108 = or i32 %empty_107, %empty_106
  %empty_109 = zext i8 %1 to i40
  %empty_110 = zext i32 %empty_108 to i40
  %empty_111 = shl i40 %empty_109, 32
  %empty_112 = or i40 %empty_111, %empty_110
  %empty_113 = zext i8 %0 to i48
  %empty_114 = zext i40 %empty_112 to i48
  %empty_115 = shl i48 %empty_113, 40
  %empty_116 = or i48 %empty_115, %empty_114
  ret i48 %empty_116
}

declare i81 @_autotb_FifoWrite_i81(i81*, i81)

declare i73 @_autotb_FifoWrite_i73(i73*, i73)

declare i48 @_autotb_FifoWrite_i48(i48*, i48)

declare i81 @_autotb_FifoRead_i81(i81*)

declare i73 @_autotb_FifoRead_i73(i73*)

declare i48 @_autotb_FifoRead_i48(i48*)

declare i1 @_autotb_FifoCanRead_i81(i81*)

declare i1 @_autotb_FifoCanRead_i73(i73*)

declare void @_GLOBAL__I_a() nounwind section ".text.startup"

!opencl.kernels = !{!0, !7, !9, !15, !21, !27, !27, !30, !30, !36, !36, !36, !30, !39, !39, !30, !30, !30, !41, !41, !30, !30, !43, !46, !46, !52, !55, !55, !30, !56, !59, !59, !63, !63, !30, !64, !63, !63, !30, !30, !67, !67, !67, !30, !30, !30, !30, !63, !63, !30, !30, !69, !69, !69, !30, !30, !41, !41, !71, !74, !76, !76, !30, !30, !30, !78, !78, !78, !30, !80, !80, !30, !82, !82, !30, !30, !41, !41, !84, !86, !86, !63, !63, !30, !30, !67, !67, !67, !30, !56, !88, !88, !30, !30, !30, !30, !30, !30, !90, !90, !30, !92, !30, !93, !95, !95, !97, !97, !97, !30, !30, !30, !99, !100, !102, !97, !97, !97, !104, !56, !105, !105, !107, !107, !30, !109, !109, !111, !113, !30, !30, !30, !30, !30, !30, !30, !63, !63, !30, !30, !80, !80, !114, !116, !30, !30, !119, !119, !121, !41, !41, !124, !55, !55, !126, !126, !128, !30, !30, !30, !130, !130, !132, !134, !136, !136, !138, !140, !140, !130, !130, !142, !143, !145, !147, !149, !149, !143, !145, !151, !153, !153, !155, !157, !157, !159, !161, !30, !30, !30, !30, !30, !30, !30, !30, !30, !30}
!hls.encrypted.func = !{}
!llvm.map.gv = !{!162, !169}

!0 = metadata !{null, metadata !1, metadata !2, metadata !3, metadata !4, metadata !5, metadata !6}
!1 = metadata !{metadata !"kernel_arg_addr_space", i32 0}
!2 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none"}
!3 = metadata !{metadata !"kernel_arg_type", metadata !"ap_uint<64>"}
!4 = metadata !{metadata !"kernel_arg_type_qual", metadata !""}
!5 = metadata !{metadata !"kernel_arg_name", metadata !"X"}
!6 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!7 = metadata !{null, metadata !1, metadata !2, metadata !8, metadata !4, metadata !5, metadata !6}
!8 = metadata !{metadata !"kernel_arg_type", metadata !"ap_uint<8>"}
!9 = metadata !{null, metadata !10, metadata !11, metadata !12, metadata !13, metadata !14, metadata !6}
!10 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0, i32 0, i32 1}
!11 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!12 = metadata !{metadata !"kernel_arg_type", metadata !"hls::stream<eth_axis> &", metadata !"hls::stream<app_axis> &", metadata !"ap_uint<48>", metadata !"ap_uint<48>*"}
!13 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !""}
!14 = metadata !{metadata !"kernel_arg_name", metadata !"from_eth", metadata !"to_app", metadata !"mac_address", metadata !"observedAddress_out"}
!15 = metadata !{null, metadata !16, metadata !17, metadata !18, metadata !19, metadata !20, metadata !6}
!16 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0, i32 0}
!17 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none"}
!18 = metadata !{metadata !"kernel_arg_type", metadata !"hls::stream<app_axis> &", metadata !"hls::stream<eth_axis> &", metadata !"ap_int<48>"}
!19 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !""}
!20 = metadata !{metadata !"kernel_arg_name", metadata !"from_app", metadata !"to_eth", metadata !"src_mac_address"}
!21 = metadata !{null, metadata !22, metadata !23, metadata !24, metadata !25, metadata !26, metadata !6}
!22 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0, i32 0, i32 0, i32 0, i32 1}
!23 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!24 = metadata !{metadata !"kernel_arg_type", metadata !"hls::stream<app_axis> &", metadata !"hls::stream<eth_axis> &", metadata !"hls::stream<app_axis> &", metadata !"hls::stream<eth_axis> &", metadata !"ap_uint<48>", metadata !"ap_uint<48>*"}
!25 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"const", metadata !""}
!26 = metadata !{metadata !"kernel_arg_name", metadata !"to_app", metadata !"from_eth", metadata !"from_app", metadata !"to_eth", metadata !"mac_addr", metadata !"observedAddress_out"}
!27 = metadata !{null, metadata !1, metadata !2, metadata !28, metadata !4, metadata !29, metadata !6}
!28 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<48> &"}
!29 = metadata !{metadata !"kernel_arg_name", metadata !"op"}
!30 = metadata !{null, metadata !31, metadata !32, metadata !33, metadata !34, metadata !35, metadata !6}
!31 = metadata !{metadata !"kernel_arg_addr_space"}
!32 = metadata !{metadata !"kernel_arg_access_qual"}
!33 = metadata !{metadata !"kernel_arg_type"}
!34 = metadata !{metadata !"kernel_arg_type_qual"}
!35 = metadata !{metadata !"kernel_arg_name"}
!36 = metadata !{null, metadata !1, metadata !2, metadata !37, metadata !4, metadata !38, metadata !6}
!37 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_concat_ref<48, struct ap_int_base<48, true, true>, 16, struct ap_int_base<16, false, true> > &"}
!38 = metadata !{metadata !"kernel_arg_name", metadata !"ref"}
!39 = metadata !{null, metadata !1, metadata !2, metadata !40, metadata !4, metadata !29, metadata !6}
!40 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<48, true> &"}
!41 = metadata !{null, metadata !1, metadata !2, metadata !42, metadata !4, metadata !29, metadata !6}
!42 = metadata !{metadata !"kernel_arg_type", metadata !"int"}
!43 = metadata !{null, metadata !1, metadata !2, metadata !44, metadata !4, metadata !45, metadata !6}
!44 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<16, false> &"}
!45 = metadata !{metadata !"kernel_arg_name", metadata !"a2"}
!46 = metadata !{null, metadata !47, metadata !48, metadata !49, metadata !50, metadata !51, metadata !6}
!47 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0}
!48 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none"}
!49 = metadata !{metadata !"kernel_arg_type", metadata !"struct ap_int_base<48, true, true> &", metadata !"struct ap_int_base<16, false, true> &"}
!50 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !""}
!51 = metadata !{metadata !"kernel_arg_name", metadata !"bv1", metadata !"bv2"}
!52 = metadata !{null, metadata !1, metadata !2, metadata !53, metadata !4, metadata !54, metadata !6}
!53 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<8, false> &"}
!54 = metadata !{metadata !"kernel_arg_name", metadata !"val"}
!55 = metadata !{null, metadata !1, metadata !2, metadata !53, metadata !4, metadata !29, metadata !6}
!56 = metadata !{null, metadata !47, metadata !48, metadata !57, metadata !50, metadata !58, metadata !6}
!57 = metadata !{metadata !"kernel_arg_type", metadata !"int", metadata !"int"}
!58 = metadata !{metadata !"kernel_arg_name", metadata !"Hi", metadata !"Lo"}
!59 = metadata !{null, metadata !60, metadata !17, metadata !61, metadata !19, metadata !62, metadata !6}
!60 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 0, i32 0}
!61 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<16, false>*", metadata !"int", metadata !"int"}
!62 = metadata !{metadata !"kernel_arg_name", metadata !"bv", metadata !"h", metadata !"l"}
!63 = metadata !{null, metadata !1, metadata !2, metadata !42, metadata !4, metadata !54, metadata !6}
!64 = metadata !{null, metadata !1, metadata !2, metadata !65, metadata !4, metadata !66, metadata !6}
!65 = metadata !{metadata !"kernel_arg_type", metadata !"const struct eth_axis &"}
!66 = metadata !{metadata !"kernel_arg_name", metadata !"din"}
!67 = metadata !{null, metadata !1, metadata !2, metadata !68, metadata !4, metadata !38, metadata !6}
!68 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_range_ref<96, false> &"}
!69 = metadata !{null, metadata !1, metadata !2, metadata !70, metadata !4, metadata !38, metadata !6}
!70 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_concat_ref<48, struct ap_int_base<48, false, true>, 48, struct ap_int_base<48, true, true> > &"}
!71 = metadata !{null, metadata !1, metadata !2, metadata !72, metadata !4, metadata !73, metadata !6}
!72 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<96> &"}
!73 = metadata !{metadata !"kernel_arg_name", metadata !"op2"}
!74 = metadata !{null, metadata !1, metadata !2, metadata !75, metadata !4, metadata !45, metadata !6}
!75 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<48, true> &"}
!76 = metadata !{null, metadata !47, metadata !48, metadata !77, metadata !50, metadata !51, metadata !6}
!77 = metadata !{metadata !"kernel_arg_type", metadata !"struct ap_int_base<48, false, true> &", metadata !"struct ap_int_base<48, true, true> &"}
!78 = metadata !{null, metadata !1, metadata !2, metadata !79, metadata !4, metadata !38, metadata !6}
!79 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_concat_ref<32, struct ap_int_base<32, true, true>, 16, struct ap_int_base<16, true, true> > &"}
!80 = metadata !{null, metadata !1, metadata !2, metadata !81, metadata !4, metadata !29, metadata !6}
!81 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, true> &"}
!82 = metadata !{null, metadata !1, metadata !2, metadata !83, metadata !4, metadata !29, metadata !6}
!83 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<16, true> &"}
!84 = metadata !{null, metadata !1, metadata !2, metadata !85, metadata !4, metadata !45, metadata !6}
!85 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<16, true> &"}
!86 = metadata !{null, metadata !47, metadata !48, metadata !87, metadata !50, metadata !51, metadata !6}
!87 = metadata !{metadata !"kernel_arg_type", metadata !"struct ap_int_base<32, true, true> &", metadata !"struct ap_int_base<16, true, true> &"}
!88 = metadata !{null, metadata !60, metadata !17, metadata !89, metadata !19, metadata !62, metadata !6}
!89 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<96, false>*", metadata !"int", metadata !"int"}
!90 = metadata !{null, metadata !1, metadata !2, metadata !91, metadata !4, metadata !29, metadata !6}
!91 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int<48> &"}
!92 = metadata !{null, metadata !1, metadata !2, metadata !28, metadata !4, metadata !73, metadata !6}
!93 = metadata !{null, metadata !1, metadata !2, metadata !94, metadata !4, metadata !66, metadata !6}
!94 = metadata !{metadata !"kernel_arg_type", metadata !"const struct app_axis &"}
!95 = metadata !{null, metadata !1, metadata !2, metadata !96, metadata !4, metadata !29, metadata !6}
!96 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<16> &"}
!97 = metadata !{null, metadata !1, metadata !2, metadata !98, metadata !4, metadata !38, metadata !6}
!98 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_range_ref<64, true> &"}
!99 = metadata !{null, metadata !1, metadata !2, metadata !96, metadata !4, metadata !73, metadata !6}
!100 = metadata !{null, metadata !1, metadata !2, metadata !101, metadata !4, metadata !73, metadata !6}
!101 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<3> &"}
!102 = metadata !{null, metadata !1, metadata !2, metadata !103, metadata !4, metadata !73, metadata !6}
!103 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<48, false> &"}
!104 = metadata !{null, metadata !1, metadata !2, metadata !91, metadata !4, metadata !73, metadata !6}
!105 = metadata !{null, metadata !60, metadata !17, metadata !106, metadata !19, metadata !62, metadata !6}
!106 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<64, true>*", metadata !"int", metadata !"int"}
!107 = metadata !{null, metadata !1, metadata !2, metadata !108, metadata !4, metadata !29, metadata !6}
!108 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<64> &"}
!109 = metadata !{null, metadata !1, metadata !2, metadata !110, metadata !4, metadata !29, metadata !6}
!110 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int<64> &"}
!111 = metadata !{null, metadata !1, metadata !2, metadata !112, metadata !4, metadata !73, metadata !6}
!112 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<1> &"}
!113 = metadata !{null, metadata !1, metadata !2, metadata !110, metadata !4, metadata !73, metadata !6}
!114 = metadata !{null, metadata !1, metadata !2, metadata !115, metadata !4, metadata !73, metadata !6}
!115 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<8> &"}
!116 = metadata !{null, metadata !47, metadata !48, metadata !117, metadata !50, metadata !118, metadata !6}
!117 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, true> &", metadata !"const ap_int_base<32, true> &"}
!118 = metadata !{metadata !"kernel_arg_name", metadata !"op", metadata !"op2"}
!119 = metadata !{null, metadata !47, metadata !48, metadata !120, metadata !50, metadata !118, metadata !6}
!120 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, true> &", metadata !"int"}
!121 = metadata !{null, metadata !47, metadata !48, metadata !122, metadata !50, metadata !123, metadata !6}
!122 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<8, false> &", metadata !"int"}
!123 = metadata !{metadata !"kernel_arg_name", metadata !"op", metadata !"i_op"}
!124 = metadata !{null, metadata !47, metadata !48, metadata !125, metadata !50, metadata !118, metadata !6}
!125 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<8, false> &", metadata !"const ap_int_base<32, true> &"}
!126 = metadata !{null, metadata !1, metadata !2, metadata !127, metadata !4, metadata !29, metadata !6}
!127 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<65, true> &"}
!128 = metadata !{null, metadata !47, metadata !48, metadata !129, metadata !50, metadata !118, metadata !6}
!129 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<65, true> &", metadata !"const ap_int_base<64, false> &"}
!130 = metadata !{null, metadata !1, metadata !2, metadata !131, metadata !4, metadata !29, metadata !6}
!131 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<64, false> &"}
!132 = metadata !{null, metadata !47, metadata !48, metadata !133, metadata !50, metadata !118, metadata !6}
!133 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<65, true> &", metadata !"int"}
!134 = metadata !{null, metadata !47, metadata !48, metadata !135, metadata !50, metadata !123, metadata !6}
!135 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<64, false> &", metadata !"long"}
!136 = metadata !{null, metadata !1, metadata !2, metadata !137, metadata !4, metadata !29, metadata !6}
!137 = metadata !{metadata !"kernel_arg_type", metadata !"long"}
!138 = metadata !{null, metadata !47, metadata !48, metadata !139, metadata !50, metadata !118, metadata !6}
!139 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<64, false> &", metadata !"const ap_int_base<64, true> &"}
!140 = metadata !{null, metadata !1, metadata !2, metadata !141, metadata !4, metadata !29, metadata !6}
!141 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<64, true> &"}
!142 = metadata !{null, metadata !1, metadata !2, metadata !108, metadata !4, metadata !73, metadata !6}
!143 = metadata !{null, metadata !47, metadata !48, metadata !144, metadata !50, metadata !118, metadata !6}
!144 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<64, false> &", metadata !"const ap_int_base<64, false> &"}
!145 = metadata !{null, metadata !47, metadata !48, metadata !146, metadata !50, metadata !118, metadata !6}
!146 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<64, false> &", metadata !"int"}
!147 = metadata !{null, metadata !47, metadata !48, metadata !148, metadata !50, metadata !123, metadata !6}
!148 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<64, false> &", metadata !"ulong"}
!149 = metadata !{null, metadata !1, metadata !2, metadata !150, metadata !4, metadata !29, metadata !6}
!150 = metadata !{metadata !"kernel_arg_type", metadata !"ulong"}
!151 = metadata !{null, metadata !47, metadata !48, metadata !152, metadata !50, metadata !123, metadata !6}
!152 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<64, false> &", metadata !"uint"}
!153 = metadata !{null, metadata !1, metadata !2, metadata !154, metadata !4, metadata !29, metadata !6}
!154 = metadata !{metadata !"kernel_arg_type", metadata !"uint"}
!155 = metadata !{null, metadata !47, metadata !48, metadata !156, metadata !50, metadata !118, metadata !6}
!156 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<64, false> &", metadata !"const ap_int_base<32, false> &"}
!157 = metadata !{null, metadata !1, metadata !2, metadata !158, metadata !4, metadata !29, metadata !6}
!158 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, false> &"}
!159 = metadata !{null, metadata !1, metadata !2, metadata !94, metadata !4, metadata !160, metadata !6}
!160 = metadata !{metadata !"kernel_arg_name", metadata !""}
!161 = metadata !{null, metadata !1, metadata !2, metadata !65, metadata !4, metadata !160, metadata !6}
!162 = metadata !{metadata !163, [256 x i48]* @mac_table_V}
!163 = metadata !{metadata !164}
!164 = metadata !{i32 0, i32 47, metadata !165}
!165 = metadata !{metadata !166}
!166 = metadata !{metadata !"mac_table.V", metadata !167, metadata !"uint48", i32 0, i32 47}
!167 = metadata !{metadata !168}
!168 = metadata !{i32 0, i32 255, i32 1}
!169 = metadata !{metadata !170, [1 x i32]* @llvm_global_ctors_0}
!170 = metadata !{metadata !171}
!171 = metadata !{i32 0, i32 31, metadata !172}
!172 = metadata !{metadata !173}
!173 = metadata !{metadata !"llvm.global_ctors.0", metadata !174, metadata !"", i32 0, i32 31}
!174 = metadata !{metadata !175}
!175 = metadata !{i32 0, i32 0, i32 1}
!176 = metadata !{metadata !177, metadata !180, metadata !183}
!177 = metadata !{i32 0, i32 63, metadata !178}
!178 = metadata !{metadata !179}
!179 = metadata !{metadata !"to_eth.V.data.V", metadata !174, metadata !"int64", i32 0, i32 63}
!180 = metadata !{i32 64, i32 64, metadata !181}
!181 = metadata !{metadata !182}
!182 = metadata !{metadata !"to_eth.V.last.V", metadata !174, metadata !"uint1", i32 0, i32 0}
!183 = metadata !{i32 65, i32 72, metadata !184}
!184 = metadata !{metadata !185}
!185 = metadata !{metadata !"to_eth.V.tkeep.V", metadata !174, metadata !"uint8", i32 0, i32 7}
!186 = metadata !{metadata !187, metadata !190, metadata !193, metadata !196}
!187 = metadata !{i32 0, i32 63, metadata !188}
!188 = metadata !{metadata !189}
!189 = metadata !{metadata !"from_app.V.data.V", metadata !174, metadata !"int64", i32 0, i32 63}
!190 = metadata !{i32 64, i32 64, metadata !191}
!191 = metadata !{metadata !192}
!192 = metadata !{metadata !"from_app.V.last.V", metadata !174, metadata !"uint1", i32 0, i32 0}
!193 = metadata !{i32 65, i32 72, metadata !194}
!194 = metadata !{metadata !195}
!195 = metadata !{metadata !"from_app.V.tdest.V", metadata !174, metadata !"uint8", i32 0, i32 7}
!196 = metadata !{i32 73, i32 80, metadata !197}
!197 = metadata !{metadata !198}
!198 = metadata !{metadata !"from_app.V.tkeep.V", metadata !174, metadata !"uint8", i32 0, i32 7}
!199 = metadata !{metadata !200, metadata !203, metadata !206}
!200 = metadata !{i32 0, i32 63, metadata !201}
!201 = metadata !{metadata !202}
!202 = metadata !{metadata !"from_eth.V.data.V", metadata !174, metadata !"int64", i32 0, i32 63}
!203 = metadata !{i32 64, i32 64, metadata !204}
!204 = metadata !{metadata !205}
!205 = metadata !{metadata !"from_eth.V.last.V", metadata !174, metadata !"uint1", i32 0, i32 0}
!206 = metadata !{i32 65, i32 72, metadata !207}
!207 = metadata !{metadata !208}
!208 = metadata !{metadata !"from_eth.V.tkeep.V", metadata !174, metadata !"uint8", i32 0, i32 7}
!209 = metadata !{metadata !210, metadata !213, metadata !216, metadata !219}
!210 = metadata !{i32 0, i32 63, metadata !211}
!211 = metadata !{metadata !212}
!212 = metadata !{metadata !"to_app.V.data.V", metadata !174, metadata !"int64", i32 0, i32 63}
!213 = metadata !{i32 64, i32 64, metadata !214}
!214 = metadata !{metadata !215}
!215 = metadata !{metadata !"to_app.V.last.V", metadata !174, metadata !"uint1", i32 0, i32 0}
!216 = metadata !{i32 65, i32 72, metadata !217}
!217 = metadata !{metadata !218}
!218 = metadata !{metadata !"to_app.V.tdest.V", metadata !174, metadata !"uint8", i32 0, i32 7}
!219 = metadata !{i32 73, i32 80, metadata !220}
!220 = metadata !{metadata !221}
!221 = metadata !{metadata !"to_app.V.tkeep.V", metadata !174, metadata !"uint8", i32 0, i32 7}
!222 = metadata !{metadata !223}
!223 = metadata !{i32 0, i32 47, metadata !224}
!224 = metadata !{metadata !225}
!225 = metadata !{metadata !"mac_addr.V", metadata !226, metadata !"uint48", i32 0, i32 47}
!226 = metadata !{metadata !227}
!227 = metadata !{i32 0, i32 0, i32 0}
!228 = metadata !{metadata !229}
!229 = metadata !{i32 0, i32 47, metadata !230}
!230 = metadata !{metadata !231}
!231 = metadata !{metadata !"observedAddress_out.V", metadata !174, metadata !"uint48", i32 0, i32 47}
