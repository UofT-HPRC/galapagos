; ModuleID = '/home/user/galapagos/hlsBuild/adm-8k5-debug/ip/raw_bridge/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@state_V_1 = internal unnamed_addr global i3 2
@state_V = internal unnamed_addr global i3 2
@raw_bridge_str = internal unnamed_addr constant [11 x i8] c"raw_bridge\00"
@llvm_global_ctors_1 = appending global [0 x void ()*] zeroinitializer
@llvm_global_ctors_0 = appending global [0 x i32] zeroinitializer
@dest_V = internal unnamed_addr global i8 0
@app_packet_in_last_V = internal unnamed_addr global i1 false
@app_packet_in_keep_V = internal unnamed_addr global i8 0
@app_packet_in_data_V = internal unnamed_addr global i64 0
@ap_fifo_str = internal unnamed_addr constant [8 x i8] c"ap_fifo\00"
@p_str2 = private unnamed_addr constant [13 x i8] c"ap_ctrl_none\00", align 1
@p_str1 = private unnamed_addr constant [11 x i8] c"AXI4Stream\00", align 1
@p_str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

define internal fastcc void @raw_to_app(i73* %from_raw_V, i89* %to_app_V) {
codeRepl:
  call void (...)* @_ssdm_op_SpecIFCore(i73* %from_raw_V, [1 x i8]* @p_str, [11 x i8]* @p_str1, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecIFCore(i89* %to_app_V, [1 x i8]* @p_str, [11 x i8]* @p_str1, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i89* %to_app_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i73* %from_raw_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecPipeline(i32 1, i32 1, i32 1, i32 0, [1 x i8]* @p_str) nounwind
  %state_V_1_load = load i3* @state_V_1, align 1
  switch i3 %state_V_1_load, label %._crit_edge72 [
    i3 2, label %0
    i3 3, label %2
  ]

; <label>:0                                       ; preds = %codeRepl
  %tmp = call i1 @_ssdm_op_NbReadReq.ap_fifo.i73P(i73* %from_raw_V, i32 1)
  br i1 %tmp, label %1, label %._crit_edge73

; <label>:1                                       ; preds = %0
  %tmp12 = call i73 @_ssdm_op_Read.ap_fifo.volatile.i73P(i73* %from_raw_V)
  %tmp_2 = call i8 @_ssdm_op_PartSelect.i8.i73.i32.i32(i73 %tmp12, i32 48, i32 55)
  store i8 %tmp_2, i8* @dest_V, align 1
  store i3 3, i3* @state_V_1, align 1
  br label %._crit_edge73

._crit_edge73:                                    ; preds = %1, %0
  br label %._crit_edge72

; <label>:2                                       ; preds = %codeRepl
  %tmp_dest_V = load i8* @dest_V, align 1
  %tmp_1 = call i1 @_ssdm_op_NbReadReq.ap_fifo.i73P(i73* %from_raw_V, i32 1)
  br i1 %tmp_1, label %3, label %._crit_edge74

; <label>:3                                       ; preds = %2
  %tmp_119 = call i73 @_ssdm_op_Read.ap_fifo.volatile.i73P(i73* %from_raw_V)
  %tmp_data_V = trunc i73 %tmp_119 to i64
  %tmp_last_V = call i1 @_ssdm_op_BitSelect.i1.i73.i32(i73 %tmp_119, i32 64)
  %tmp_keep_V = call i8 @_ssdm_op_PartSelect.i8.i73.i32.i32(i73 %tmp_119, i32 65, i32 72)
  %tmp_22 = call i89 @_ssdm_op_BitConcatenate.i89.i8.i8.i1.i8.i64(i8 %tmp_keep_V, i8 0, i1 %tmp_last_V, i8 %tmp_dest_V, i64 %tmp_data_V)
  call void @_ssdm_op_Write.ap_fifo.volatile.i89P(i89* %to_app_V, i89 %tmp_22)
  br i1 %tmp_last_V, label %4, label %._crit_edge75

; <label>:4                                       ; preds = %3
  store i3 2, i3* @state_V_1, align 1
  br label %._crit_edge75

._crit_edge75:                                    ; preds = %4, %3
  br label %._crit_edge74

._crit_edge74:                                    ; preds = %._crit_edge75, %2
  br label %._crit_edge72

._crit_edge72:                                    ; preds = %._crit_edge74, %._crit_edge73, %codeRepl
  ret void
}

define void @raw_bridge(i89* %to_app_V, i73* %from_raw_V, i89* %from_app_V, i73* %to_raw_V) {
  call void (...)* @_ssdm_op_SpecDataflowPipeline(i32 -1, [1 x i8]* @p_str) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i73* %to_raw_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i89* %from_app_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i73* %from_raw_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i89* %to_app_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecBitsMap(i73* %to_raw_V), !map !127
  call void (...)* @_ssdm_op_SpecBitsMap(i89* %from_app_V), !map !137
  call void (...)* @_ssdm_op_SpecBitsMap(i73* %from_raw_V), !map !153
  call void (...)* @_ssdm_op_SpecBitsMap(i89* %to_app_V), !map !163
  call void (...)* @_ssdm_op_SpecTopModule([11 x i8]* @raw_bridge_str) nounwind
  call void (...)* @_ssdm_op_SpecIFCore(i89* %to_app_V, [1 x i8]* @p_str, [11 x i8]* @p_str1, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecIFCore(i73* %from_raw_V, [1 x i8]* @p_str, [11 x i8]* @p_str1, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecIFCore(i89* %from_app_V, [1 x i8]* @p_str, [11 x i8]* @p_str1, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecIFCore(i73* %to_raw_V, [1 x i8]* @p_str, [11 x i8]* @p_str1, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i32 0, [13 x i8]* @p_str2, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str) nounwind
  call fastcc void @raw_to_app(i73* %from_raw_V, i89* %to_app_V)
  call fastcc void @app_to_raw(i89* %from_app_V, i73* %to_raw_V)
  ret void
}

declare i89 @llvm.part.select.i89(i89, i32, i32) nounwind readnone

declare i73 @llvm.part.select.i73(i73, i32, i32) nounwind readnone

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define internal fastcc void @app_to_raw(i89* %from_app_V, i73* %to_raw_V) {
codeRepl:
  call void (...)* @_ssdm_op_SpecIFCore(i73* %to_raw_V, [1 x i8]* @p_str, [11 x i8]* @p_str1, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecIFCore(i89* %from_app_V, [1 x i8]* @p_str, [11 x i8]* @p_str1, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i89* %from_app_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i73* %to_raw_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecPipeline(i32 1, i32 1, i32 1, i32 0, [1 x i8]* @p_str) nounwind
  %state_V_load = load i3* @state_V, align 1
  %tmp_last_V = load i1* @app_packet_in_last_V, align 1
  switch i3 %state_V_load, label %._crit_edge137 [
    i3 2, label %0
    i3 3, label %2
    i3 -4, label %3
  ]

; <label>:0                                       ; preds = %codeRepl
  %tmp = call i1 @_ssdm_op_NbReadReq.ap_fifo.i89P(i89* %from_app_V, i32 1)
  br i1 %tmp, label %1, label %._crit_edge138

; <label>:1                                       ; preds = %0
  %tmp20 = call i89 @_ssdm_op_Read.ap_fifo.volatile.i89P(i89* %from_app_V)
  %tmp_5 = trunc i89 %tmp20 to i64
  store i64 %tmp_5, i64* @app_packet_in_data_V, align 8
  %tmp_dest_V_load_new = call i8 @_ssdm_op_PartSelect.i8.i89.i32.i32(i89 %tmp20, i32 64, i32 71)
  %tmp_6 = call i1 @_ssdm_op_BitSelect.i1.i89.i32(i89 %tmp20, i32 72)
  store i1 %tmp_6, i1* @app_packet_in_last_V, align 1
  %tmp_keep_V_load_new = call i8 @_ssdm_op_PartSelect.i8.i89.i32.i32(i89 %tmp20, i32 81, i32 88)
  store i8 %tmp_keep_V_load_new, i8* @app_packet_in_keep_V, align 1
  %tmp_1 = call i73 @_ssdm_op_BitConcatenate.i73.i17.i8.i48(i17 -512, i8 %tmp_dest_V_load_new, i48 0)
  call void @_ssdm_op_Write.ap_fifo.volatile.i73P(i73* %to_raw_V, i73 %tmp_1)
  store i3 3, i3* @state_V, align 1
  br label %._crit_edge138

._crit_edge138:                                   ; preds = %1, %0
  br label %._crit_edge137

; <label>:2                                       ; preds = %codeRepl
  %tmp_tkeep_V = load i8* @app_packet_in_keep_V, align 1
  %tmp_data_V = load i64* @app_packet_in_data_V, align 8
  %tmp_2 = call i73 @_ssdm_op_BitConcatenate.i73.i8.i1.i64(i8 %tmp_tkeep_V, i1 %tmp_last_V, i64 %tmp_data_V)
  call void @_ssdm_op_Write.ap_fifo.volatile.i73P(i73* %to_raw_V, i73 %tmp_2)
  %storemerge1 = select i1 %tmp_last_V, i3 2, i3 -4
  store i3 %storemerge1, i3* @state_V, align 1
  br label %._crit_edge137

; <label>:3                                       ; preds = %codeRepl
  %tmp_3 = call i1 @_ssdm_op_NbReadReq.ap_fifo.i89P(i89* %from_app_V, i32 1)
  br i1 %tmp_3, label %4, label %._crit_edge139

; <label>:4                                       ; preds = %3
  %tmp_341 = call i89 @_ssdm_op_Read.ap_fifo.volatile.i89P(i89* %from_app_V)
  %tmp_data_V_1 = trunc i89 %tmp_341 to i64
  store i64 %tmp_data_V_1, i64* @app_packet_in_data_V, align 8
  %tmp_last_V_1 = call i1 @_ssdm_op_BitSelect.i1.i89.i32(i89 %tmp_341, i32 72)
  store i1 %tmp_last_V_1, i1* @app_packet_in_last_V, align 1
  %tmp_tkeep_V_1 = call i8 @_ssdm_op_PartSelect.i8.i89.i32.i32(i89 %tmp_341, i32 81, i32 88)
  store i8 %tmp_tkeep_V_1, i8* @app_packet_in_keep_V, align 1
  %tmp_413 = call i73 @_ssdm_op_BitConcatenate.i73.i8.i1.i64(i8 %tmp_tkeep_V_1, i1 %tmp_last_V_1, i64 %tmp_data_V_1)
  call void @_ssdm_op_Write.ap_fifo.volatile.i73P(i73* %to_raw_V, i73 %tmp_413)
  %storemerge = select i1 %tmp_last_V_1, i3 2, i3 -4
  store i3 %storemerge, i3* @state_V, align 1
  br label %._crit_edge139

._crit_edge139:                                   ; preds = %4, %3
  br label %._crit_edge137

._crit_edge137:                                   ; preds = %._crit_edge139, %2, %._crit_edge138, %codeRepl
  ret void
}

define weak void @_ssdm_op_Write.ap_fifo.volatile.i89P(i89*, i89) {
entry:
  %empty = call i89 @_autotb_FifoWrite_i89(i89* %0, i89 %1)
  ret void
}

define weak void @_ssdm_op_Write.ap_fifo.volatile.i73P(i73*, i73) {
entry:
  %empty = call i73 @_autotb_FifoWrite_i73(i73* %0, i73 %1)
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

define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

define weak i89 @_ssdm_op_Read.ap_fifo.volatile.i89P(i89*) {
entry:
  %empty = call i89 @_autotb_FifoRead_i89(i89* %0)
  ret i89 %empty
}

define weak i73 @_ssdm_op_Read.ap_fifo.volatile.i73P(i73*) {
entry:
  %empty = call i73 @_autotb_FifoRead_i73(i73* %0)
  ret i73 %empty
}

define weak i8 @_ssdm_op_PartSelect.i8.i89.i32.i32(i89, i32, i32) nounwind readnone {
entry:
  %empty = call i89 @llvm.part.select.i89(i89 %0, i32 %1, i32 %2)
  %empty_8 = trunc i89 %empty to i8
  ret i8 %empty_8
}

define weak i8 @_ssdm_op_PartSelect.i8.i73.i32.i32(i73, i32, i32) nounwind readnone {
entry:
  %empty = call i73 @llvm.part.select.i73(i73 %0, i32 %1, i32 %2)
  %empty_9 = trunc i73 %empty to i8
  ret i8 %empty_9
}

declare i64 @_ssdm_op_PartSelect.i64.i89.i32.i32(i89, i32, i32) nounwind readnone

declare i64 @_ssdm_op_PartSelect.i64.i73.i32.i32(i73, i32, i32) nounwind readnone

define weak i1 @_ssdm_op_NbReadReq.ap_fifo.i89P(i89*, i32) {
entry:
  %empty = call i1 @_autotb_FifoCanRead_i89(i89* %0)
  ret i1 %empty
}

define weak i1 @_ssdm_op_NbReadReq.ap_fifo.i73P(i73*, i32) {
entry:
  %empty = call i1 @_autotb_FifoCanRead_i73(i73* %0)
  ret i1 %empty
}

define weak i1 @_ssdm_op_BitSelect.i1.i89.i32(i89, i32) nounwind readnone {
entry:
  %empty = zext i32 %1 to i89
  %empty_10 = shl i89 1, %empty
  %empty_11 = and i89 %0, %empty_10
  %empty_12 = icmp ne i89 %empty_11, 0
  ret i1 %empty_12
}

define weak i1 @_ssdm_op_BitSelect.i1.i73.i32(i73, i32) nounwind readnone {
entry:
  %empty = zext i32 %1 to i73
  %empty_13 = shl i73 1, %empty
  %empty_14 = and i73 %0, %empty_13
  %empty_15 = icmp ne i73 %empty_14, 0
  ret i1 %empty_15
}

define weak i89 @_ssdm_op_BitConcatenate.i89.i8.i8.i1.i8.i64(i8, i8, i1, i8, i64) nounwind readnone {
entry:
  %empty = zext i8 %3 to i72
  %empty_16 = zext i64 %4 to i72
  %empty_17 = shl i72 %empty, 64
  %empty_18 = or i72 %empty_17, %empty_16
  %empty_19 = zext i1 %2 to i73
  %empty_20 = zext i72 %empty_18 to i73
  %empty_21 = shl i73 %empty_19, 72
  %empty_22 = or i73 %empty_21, %empty_20
  %empty_23 = zext i8 %1 to i81
  %empty_24 = zext i73 %empty_22 to i81
  %empty_25 = shl i81 %empty_23, 73
  %empty_26 = or i81 %empty_25, %empty_24
  %empty_27 = zext i8 %0 to i89
  %empty_28 = zext i81 %empty_26 to i89
  %empty_29 = shl i89 %empty_27, 81
  %empty_30 = or i89 %empty_29, %empty_28
  ret i89 %empty_30
}

define weak i73 @_ssdm_op_BitConcatenate.i73.i8.i1.i64(i8, i1, i64) nounwind readnone {
entry:
  %empty = zext i1 %1 to i65
  %empty_31 = zext i64 %2 to i65
  %empty_32 = shl i65 %empty, 64
  %empty_33 = or i65 %empty_32, %empty_31
  %empty_34 = zext i8 %0 to i73
  %empty_35 = zext i65 %empty_33 to i73
  %empty_36 = shl i73 %empty_34, 65
  %empty_37 = or i73 %empty_36, %empty_35
  ret i73 %empty_37
}

define weak i73 @_ssdm_op_BitConcatenate.i73.i17.i8.i48(i17, i8, i48) nounwind readnone {
entry:
  %empty = zext i8 %1 to i56
  %empty_38 = zext i48 %2 to i56
  %empty_39 = shl i56 %empty, 48
  %empty_40 = or i56 %empty_39, %empty_38
  %empty_41 = zext i17 %0 to i73
  %empty_42 = zext i56 %empty_40 to i73
  %empty_43 = shl i73 %empty_41, 56
  %empty_44 = or i73 %empty_43, %empty_42
  ret i73 %empty_44
}

declare i89 @_autotb_FifoWrite_i89(i89*, i89)

declare i73 @_autotb_FifoWrite_i73(i73*, i73)

declare i89 @_autotb_FifoRead_i89(i89*)

declare i73 @_autotb_FifoRead_i73(i73*)

declare i1 @_autotb_FifoCanRead_i89(i89*)

declare i1 @_autotb_FifoCanRead_i73(i73*)

!opencl.kernels = !{!0, !7, !9, !15, !18, !24, !27, !27, !30, !30, !36, !36, !30, !30, !39, !41, !41, !30, !42, !45, !45, !27, !27, !30, !27, !27, !30, !30, !30, !30, !30, !30, !30, !30, !30, !30, !30, !30, !30, !51, !36, !36, !53, !56, !56, !56, !30, !30, !30, !30, !59, !42, !60, !60, !62, !62, !64, !64, !66, !68, !30, !30, !30, !30, !30, !30, !30, !30, !30, !30, !30, !30, !30, !27, !27, !30, !30, !69, !69, !71, !73, !30, !30, !30, !76, !76, !78, !81, !81, !82, !41, !41, !84, !84, !86, !30, !30, !30, !88, !88, !90, !92, !94, !94, !96, !98, !98, !88, !88, !100, !101, !103, !105, !107, !107, !101, !103, !109, !111, !111, !30, !113, !115, !115, !117, !119, !30, !30, !30, !30}
!hls.encrypted.func = !{}
!llvm.map.gv = !{!120}

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
!10 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0}
!11 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none"}
!12 = metadata !{metadata !"kernel_arg_type", metadata !"hls::stream<raw_axis> &", metadata !"galapagos_interface &"}
!13 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !""}
!14 = metadata !{metadata !"kernel_arg_name", metadata !"from_raw", metadata !"to_app"}
!15 = metadata !{null, metadata !10, metadata !11, metadata !16, metadata !13, metadata !17, metadata !6}
!16 = metadata !{metadata !"kernel_arg_type", metadata !"galapagos_interface &", metadata !"hls::stream<raw_axis> &"}
!17 = metadata !{metadata !"kernel_arg_name", metadata !"from_app", metadata !"to_raw"}
!18 = metadata !{null, metadata !19, metadata !20, metadata !21, metadata !22, metadata !23, metadata !6}
!19 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0, i32 0, i32 0}
!20 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!21 = metadata !{metadata !"kernel_arg_type", metadata !"galapagos_interface &", metadata !"hls::stream<raw_axis> &", metadata !"galapagos_interface &", metadata !"hls::stream<raw_axis> &"}
!22 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !""}
!23 = metadata !{metadata !"kernel_arg_name", metadata !"to_app", metadata !"from_raw", metadata !"from_app", metadata !"to_raw"}
!24 = metadata !{null, metadata !1, metadata !2, metadata !25, metadata !4, metadata !26, metadata !6}
!25 = metadata !{metadata !"kernel_arg_type", metadata !"const struct raw_axis &"}
!26 = metadata !{metadata !"kernel_arg_name", metadata !"din"}
!27 = metadata !{null, metadata !1, metadata !2, metadata !28, metadata !4, metadata !29, metadata !6}
!28 = metadata !{metadata !"kernel_arg_type", metadata !"int"}
!29 = metadata !{metadata !"kernel_arg_name", metadata !"val"}
!30 = metadata !{null, metadata !31, metadata !32, metadata !33, metadata !34, metadata !35, metadata !6}
!31 = metadata !{metadata !"kernel_arg_addr_space"}
!32 = metadata !{metadata !"kernel_arg_access_qual"}
!33 = metadata !{metadata !"kernel_arg_type"}
!34 = metadata !{metadata !"kernel_arg_type_qual"}
!35 = metadata !{metadata !"kernel_arg_name"}
!36 = metadata !{null, metadata !1, metadata !2, metadata !37, metadata !4, metadata !38, metadata !6}
!37 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<16> &"}
!38 = metadata !{metadata !"kernel_arg_name", metadata !"op"}
!39 = metadata !{null, metadata !1, metadata !2, metadata !40, metadata !4, metadata !29, metadata !6}
!40 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<8, false> &"}
!41 = metadata !{null, metadata !1, metadata !2, metadata !40, metadata !4, metadata !38, metadata !6}
!42 = metadata !{null, metadata !10, metadata !11, metadata !43, metadata !13, metadata !44, metadata !6}
!43 = metadata !{metadata !"kernel_arg_type", metadata !"int", metadata !"int"}
!44 = metadata !{metadata !"kernel_arg_name", metadata !"Hi", metadata !"Lo"}
!45 = metadata !{null, metadata !46, metadata !47, metadata !48, metadata !49, metadata !50, metadata !6}
!46 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 0, i32 0}
!47 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none"}
!48 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<16, false>*", metadata !"int", metadata !"int"}
!49 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !""}
!50 = metadata !{metadata !"kernel_arg_name", metadata !"bv", metadata !"h", metadata !"l"}
!51 = metadata !{null, metadata !1, metadata !2, metadata !52, metadata !4, metadata !26, metadata !6}
!52 = metadata !{metadata !"kernel_arg_type", metadata !"const struct galapagos::stream_packet<64> &"}
!53 = metadata !{null, metadata !1, metadata !2, metadata !54, metadata !4, metadata !55, metadata !6}
!54 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<3> &"}
!55 = metadata !{metadata !"kernel_arg_name", metadata !"op2"}
!56 = metadata !{null, metadata !1, metadata !2, metadata !57, metadata !4, metadata !58, metadata !6}
!57 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_range_ref<64, true> &"}
!58 = metadata !{metadata !"kernel_arg_name", metadata !"ref"}
!59 = metadata !{null, metadata !1, metadata !2, metadata !37, metadata !4, metadata !55, metadata !6}
!60 = metadata !{null, metadata !46, metadata !47, metadata !61, metadata !49, metadata !50, metadata !6}
!61 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<64, true>*", metadata !"int", metadata !"int"}
!62 = metadata !{null, metadata !1, metadata !2, metadata !63, metadata !4, metadata !38, metadata !6}
!63 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<64> &"}
!64 = metadata !{null, metadata !1, metadata !2, metadata !65, metadata !4, metadata !38, metadata !6}
!65 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int<64> &"}
!66 = metadata !{null, metadata !1, metadata !2, metadata !67, metadata !4, metadata !55, metadata !6}
!67 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<1> &"}
!68 = metadata !{null, metadata !1, metadata !2, metadata !65, metadata !4, metadata !55, metadata !6}
!69 = metadata !{null, metadata !1, metadata !2, metadata !70, metadata !4, metadata !38, metadata !6}
!70 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, true> &"}
!71 = metadata !{null, metadata !1, metadata !2, metadata !72, metadata !4, metadata !55, metadata !6}
!72 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<8> &"}
!73 = metadata !{null, metadata !10, metadata !11, metadata !74, metadata !13, metadata !75, metadata !6}
!74 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, true> &", metadata !"const ap_int_base<32, true> &"}
!75 = metadata !{metadata !"kernel_arg_name", metadata !"op", metadata !"op2"}
!76 = metadata !{null, metadata !10, metadata !11, metadata !77, metadata !13, metadata !75, metadata !6}
!77 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, true> &", metadata !"int"}
!78 = metadata !{null, metadata !10, metadata !11, metadata !79, metadata !13, metadata !80, metadata !6}
!79 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<8, false> &", metadata !"int"}
!80 = metadata !{metadata !"kernel_arg_name", metadata !"op", metadata !"i_op"}
!81 = metadata !{null, metadata !1, metadata !2, metadata !28, metadata !4, metadata !38, metadata !6}
!82 = metadata !{null, metadata !10, metadata !11, metadata !83, metadata !13, metadata !75, metadata !6}
!83 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<8, false> &", metadata !"const ap_int_base<32, true> &"}
!84 = metadata !{null, metadata !1, metadata !2, metadata !85, metadata !4, metadata !38, metadata !6}
!85 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<65, true> &"}
!86 = metadata !{null, metadata !10, metadata !11, metadata !87, metadata !13, metadata !75, metadata !6}
!87 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<65, true> &", metadata !"const ap_int_base<64, false> &"}
!88 = metadata !{null, metadata !1, metadata !2, metadata !89, metadata !4, metadata !38, metadata !6}
!89 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<64, false> &"}
!90 = metadata !{null, metadata !10, metadata !11, metadata !91, metadata !13, metadata !75, metadata !6}
!91 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<65, true> &", metadata !"int"}
!92 = metadata !{null, metadata !10, metadata !11, metadata !93, metadata !13, metadata !80, metadata !6}
!93 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<64, false> &", metadata !"long"}
!94 = metadata !{null, metadata !1, metadata !2, metadata !95, metadata !4, metadata !38, metadata !6}
!95 = metadata !{metadata !"kernel_arg_type", metadata !"long"}
!96 = metadata !{null, metadata !10, metadata !11, metadata !97, metadata !13, metadata !75, metadata !6}
!97 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<64, false> &", metadata !"const ap_int_base<64, true> &"}
!98 = metadata !{null, metadata !1, metadata !2, metadata !99, metadata !4, metadata !38, metadata !6}
!99 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<64, true> &"}
!100 = metadata !{null, metadata !1, metadata !2, metadata !63, metadata !4, metadata !55, metadata !6}
!101 = metadata !{null, metadata !10, metadata !11, metadata !102, metadata !13, metadata !75, metadata !6}
!102 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<64, false> &", metadata !"const ap_int_base<64, false> &"}
!103 = metadata !{null, metadata !10, metadata !11, metadata !104, metadata !13, metadata !75, metadata !6}
!104 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<64, false> &", metadata !"int"}
!105 = metadata !{null, metadata !10, metadata !11, metadata !106, metadata !13, metadata !80, metadata !6}
!106 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<64, false> &", metadata !"ulong"}
!107 = metadata !{null, metadata !1, metadata !2, metadata !108, metadata !4, metadata !38, metadata !6}
!108 = metadata !{metadata !"kernel_arg_type", metadata !"ulong"}
!109 = metadata !{null, metadata !10, metadata !11, metadata !110, metadata !13, metadata !80, metadata !6}
!110 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<64, false> &", metadata !"uint"}
!111 = metadata !{null, metadata !1, metadata !2, metadata !112, metadata !4, metadata !38, metadata !6}
!112 = metadata !{metadata !"kernel_arg_type", metadata !"uint"}
!113 = metadata !{null, metadata !10, metadata !11, metadata !114, metadata !13, metadata !75, metadata !6}
!114 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<64, false> &", metadata !"const ap_int_base<32, false> &"}
!115 = metadata !{null, metadata !1, metadata !2, metadata !116, metadata !4, metadata !38, metadata !6}
!116 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, false> &"}
!117 = metadata !{null, metadata !1, metadata !2, metadata !52, metadata !4, metadata !118, metadata !6}
!118 = metadata !{metadata !"kernel_arg_name", metadata !""}
!119 = metadata !{null, metadata !1, metadata !2, metadata !25, metadata !4, metadata !118, metadata !6}
!120 = metadata !{metadata !121, [0 x i32]* @llvm_global_ctors_0}
!121 = metadata !{metadata !122}
!122 = metadata !{i32 0, i32 31, metadata !123}
!123 = metadata !{metadata !124}
!124 = metadata !{metadata !"llvm.global_ctors.0", metadata !125, metadata !"", i32 0, i32 31}
!125 = metadata !{metadata !126}
!126 = metadata !{i32 0, i32 0, i32 1}
!127 = metadata !{metadata !128, metadata !131, metadata !134}
!128 = metadata !{i32 0, i32 63, metadata !129}
!129 = metadata !{metadata !130}
!130 = metadata !{metadata !"to_raw.V.data.V", metadata !125, metadata !"int64", i32 0, i32 63}
!131 = metadata !{i32 64, i32 64, metadata !132}
!132 = metadata !{metadata !133}
!133 = metadata !{metadata !"to_raw.V.last.V", metadata !125, metadata !"uint1", i32 0, i32 0}
!134 = metadata !{i32 65, i32 72, metadata !135}
!135 = metadata !{metadata !136}
!136 = metadata !{metadata !"to_raw.V.tkeep.V", metadata !125, metadata !"uint8", i32 0, i32 7}
!137 = metadata !{metadata !138, metadata !141, metadata !144, metadata !147, metadata !150}
!138 = metadata !{i32 0, i32 63, metadata !139}
!139 = metadata !{metadata !140}
!140 = metadata !{metadata !"from_app.V.data.V", metadata !125, metadata !"uint64", i32 0, i32 63}
!141 = metadata !{i32 64, i32 71, metadata !142}
!142 = metadata !{metadata !143}
!143 = metadata !{metadata !"from_app.V.dest.V", metadata !125, metadata !"uint8", i32 0, i32 7}
!144 = metadata !{i32 72, i32 72, metadata !145}
!145 = metadata !{metadata !146}
!146 = metadata !{metadata !"from_app.V.last.V", metadata !125, metadata !"uint1", i32 0, i32 0}
!147 = metadata !{i32 73, i32 80, metadata !148}
!148 = metadata !{metadata !149}
!149 = metadata !{metadata !"from_app.V.id.V", metadata !125, metadata !"uint8", i32 0, i32 7}
!150 = metadata !{i32 81, i32 88, metadata !151}
!151 = metadata !{metadata !152}
!152 = metadata !{metadata !"from_app.V.keep.V", metadata !125, metadata !"uint8", i32 0, i32 7}
!153 = metadata !{metadata !154, metadata !157, metadata !160}
!154 = metadata !{i32 0, i32 63, metadata !155}
!155 = metadata !{metadata !156}
!156 = metadata !{metadata !"from_raw.V.data.V", metadata !125, metadata !"int64", i32 0, i32 63}
!157 = metadata !{i32 64, i32 64, metadata !158}
!158 = metadata !{metadata !159}
!159 = metadata !{metadata !"from_raw.V.last.V", metadata !125, metadata !"uint1", i32 0, i32 0}
!160 = metadata !{i32 65, i32 72, metadata !161}
!161 = metadata !{metadata !162}
!162 = metadata !{metadata !"from_raw.V.tkeep.V", metadata !125, metadata !"uint8", i32 0, i32 7}
!163 = metadata !{metadata !164, metadata !167, metadata !170, metadata !173, metadata !176}
!164 = metadata !{i32 0, i32 63, metadata !165}
!165 = metadata !{metadata !166}
!166 = metadata !{metadata !"to_app.V.data.V", metadata !125, metadata !"uint64", i32 0, i32 63}
!167 = metadata !{i32 64, i32 71, metadata !168}
!168 = metadata !{metadata !169}
!169 = metadata !{metadata !"to_app.V.dest.V", metadata !125, metadata !"uint8", i32 0, i32 7}
!170 = metadata !{i32 72, i32 72, metadata !171}
!171 = metadata !{metadata !172}
!172 = metadata !{metadata !"to_app.V.last.V", metadata !125, metadata !"uint1", i32 0, i32 0}
!173 = metadata !{i32 73, i32 80, metadata !174}
!174 = metadata !{metadata !175}
!175 = metadata !{metadata !"to_app.V.id.V", metadata !125, metadata !"uint8", i32 0, i32 7}
!176 = metadata !{i32 81, i32 88, metadata !177}
!177 = metadata !{metadata !178}
!178 = metadata !{metadata !"to_app.V.keep.V", metadata !125, metadata !"uint8", i32 0, i32 7}
