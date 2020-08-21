; ModuleID = '/home/user/galapagos/hlsBuild/adm-8k5-debug/ip/galapagos_bridge/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@llvm_global_ctors_1 = appending global [0 x void ()*] zeroinitializer
@llvm_global_ctors_0 = appending global [0 x i32] zeroinitializer
@galapagos_bridge_str = internal unnamed_addr constant [17 x i8] c"galapagos_bridge\00"
@ap_fifo_str = internal unnamed_addr constant [8 x i8] c"ap_fifo\00"
@p_str99 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str98 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str97 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str96 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str95 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str94 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str93 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str92 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str91 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str9 = private unnamed_addr constant [23 x i8] c"-bus_bundle s_axis_n2G\00", align 1
@p_str8 = private unnamed_addr constant [23 x i8] c"-bus_bundle m_axis_n2G\00", align 1
@p_str7 = private unnamed_addr constant [23 x i8] c"-bus_bundle s_axis_g2N\00", align 1
@p_str6 = private unnamed_addr constant [23 x i8] c"-bus_bundle m_axis_g2N\00", align 1
@p_str5 = private unnamed_addr constant [11 x i8] c"AXI4Stream\00", align 1
@p_str4 = private unnamed_addr constant [13 x i8] c"ap_ctrl_none\00", align 1
@p_str3 = private unnamed_addr constant [15 x i8] c"write_n2G_loop\00", align 1
@p_str2 = private unnamed_addr constant [10 x i8] c"read_loop\00", align 1
@p_str114 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str113 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str112 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str111 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str110 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str109 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str108 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str107 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str106 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str105 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str104 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str103 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str102 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str101 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str100 = internal unnamed_addr constant [1 x i8] zeroinitializer
@p_str10 = private unnamed_addr constant [7 x i8] c"RAM_1P\00", align 1
@p_str1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@p_str = private unnamed_addr constant [11 x i8] c"write_loop\00", align 1

define internal fastcc void @n2G(i73* %input_V, i89* %output_V) {
codeRepl:
  call void (...)* @_ssdm_op_SpecIFCore(i73* %input_V, [1 x i8]* @p_str1, [11 x i8]* @p_str5, [1 x i8]* @p_str1, i32 -1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [23 x i8]* @p_str9)
  call void (...)* @_ssdm_op_SpecIFCore(i89* %output_V, [1 x i8]* @p_str1, [11 x i8]* @p_str5, [1 x i8]* @p_str1, i32 -1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [23 x i8]* @p_str8)
  call void (...)* @_ssdm_op_SpecInterface(i73* %input_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str103, i32 0, i32 0, [1 x i8]* @p_str104, [1 x i8]* @p_str105, [1 x i8]* @p_str106, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str107, [1 x i8]* @p_str108)
  call void (...)* @_ssdm_op_SpecInterface(i89* %output_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str109, i32 0, i32 0, [1 x i8]* @p_str110, [1 x i8]* @p_str111, [1 x i8]* @p_str112, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str113, [1 x i8]* @p_str114)
  %tmp = call i73 @_ssdm_op_Read.ap_fifo.volatile.i73P(i73* %input_V)
  %tmp_id_V = call i8 @_ssdm_op_PartSelect.i8.i73.i32.i32(i73 %tmp, i32 16, i32 23)
  %tmp_dest_V = call i8 @_ssdm_op_PartSelect.i8.i73.i32.i32(i73 %tmp, i32 24, i32 31)
  br label %0

; <label>:0                                       ; preds = %2, %codeRepl
  %i = phi i10 [ 0, %codeRepl ], [ %i_1, %2 ]
  %tmp_1 = call i1 @_ssdm_op_BitSelect.i1.i10.i32(i10 %i, i32 9)
  %empty = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 1, i64 512, i64 256)
  %i_1 = add i10 %i, 1
  br i1 %tmp_1, label %.loopexit, label %1

; <label>:1                                       ; preds = %0
  call void (...)* @_ssdm_op_SpecLoopName([15 x i8]* @p_str3) nounwind
  %tmp_3 = call i32 (...)* @_ssdm_op_SpecRegionBegin([15 x i8]* @p_str3)
  call void (...)* @_ssdm_op_SpecPipeline(i32 1, i32 1, i32 1, i32 0, [1 x i8]* @p_str1) nounwind
  %tmp_116 = call i73 @_ssdm_op_Read.ap_fifo.volatile.i73P(i73* %input_V)
  %tmp_data_V = trunc i73 %tmp_116 to i64
  %tmp_keep_V = call i8 @_ssdm_op_PartSelect.i8.i73.i32.i32(i73 %tmp_116, i32 64, i32 71)
  %tmp_last_V = call i1 @_ssdm_op_BitSelect.i1.i73.i32(i73 %tmp_116, i32 72)
  %tmp_2 = call i89 @_ssdm_op_BitConcatenate.i89.i8.i8.i1.i8.i64(i8 %tmp_keep_V, i8 %tmp_id_V, i1 %tmp_last_V, i8 %tmp_dest_V, i64 %tmp_data_V)
  call void @_ssdm_op_Write.ap_fifo.volatile.i89P(i89* %output_V, i89 %tmp_2)
  br i1 %tmp_last_V, label %.loopexit, label %2

; <label>:2                                       ; preds = %1
  %empty_12 = call i32 (...)* @_ssdm_op_SpecRegionEnd([15 x i8]* @p_str3, i32 %tmp_3)
  br label %0

.loopexit:                                        ; preds = %0, %1
  ret void
}

declare i73 @llvm.part.set.i73.i72(i73, i72, i32, i32) nounwind readnone

declare i89 @llvm.part.select.i89(i89, i32, i32) nounwind readnone

declare i73 @llvm.part.select.i73(i73, i32, i32) nounwind readnone

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

define void @galapagos_bridge(i89* %g2N_input_V, i73* %g2N_output_V, [512 x i64]* %buffer_storage_A_V, [512 x i64]* %buffer_storage_B_V, i73* %n2G_input_V, i89* %n2G_output_V) {
  %src_stream_V_V = alloca i8, align 1
  %dest_stream_V_V = alloca i8, align 1
  %length_stream_V_V = alloca i16, align 2
  call void (...)* @_ssdm_op_SpecDataflowPipeline(i32 -1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i89* %n2G_output_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str109, i32 0, i32 0, [1 x i8]* @p_str110, [1 x i8]* @p_str111, [1 x i8]* @p_str112, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str113, [1 x i8]* @p_str114)
  call void (...)* @_ssdm_op_SpecInterface(i73* %n2G_input_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str103, i32 0, i32 0, [1 x i8]* @p_str104, [1 x i8]* @p_str105, [1 x i8]* @p_str106, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str107, [1 x i8]* @p_str108)
  call void (...)* @_ssdm_op_SpecInterface(i73* %g2N_output_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str97, i32 0, i32 0, [1 x i8]* @p_str98, [1 x i8]* @p_str99, [1 x i8]* @p_str100, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str101, [1 x i8]* @p_str102)
  call void (...)* @_ssdm_op_SpecInterface(i89* %g2N_input_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str91, i32 0, i32 0, [1 x i8]* @p_str92, [1 x i8]* @p_str93, [1 x i8]* @p_str94, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str95, [1 x i8]* @p_str96)
  call void (...)* @_ssdm_op_SpecBitsMap(i89* %n2G_output_V), !map !96
  call void (...)* @_ssdm_op_SpecBitsMap(i73* %n2G_input_V), !map !112
  call void (...)* @_ssdm_op_SpecBitsMap(i73* %g2N_output_V), !map !122
  call void (...)* @_ssdm_op_SpecBitsMap(i89* %g2N_input_V), !map !132
  call void (...)* @_ssdm_op_SpecBitsMap([512 x i64]* %buffer_storage_A_V), !map !148
  call void (...)* @_ssdm_op_SpecBitsMap([512 x i64]* %buffer_storage_B_V), !map !154
  call void (...)* @_ssdm_op_SpecTopModule([17 x i8]* @galapagos_bridge_str) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32 0, [13 x i8]* @p_str4, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecIFCore(i73* %g2N_output_V, [1 x i8]* @p_str1, [11 x i8]* @p_str5, [1 x i8]* @p_str1, i32 -1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [23 x i8]* @p_str6)
  call void (...)* @_ssdm_op_SpecIFCore(i89* %g2N_input_V, [1 x i8]* @p_str1, [11 x i8]* @p_str5, [1 x i8]* @p_str1, i32 -1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [23 x i8]* @p_str7)
  call void (...)* @_ssdm_op_SpecIFCore(i89* %n2G_output_V, [1 x i8]* @p_str1, [11 x i8]* @p_str5, [1 x i8]* @p_str1, i32 -1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [23 x i8]* @p_str8)
  call void (...)* @_ssdm_op_SpecIFCore(i73* %n2G_input_V, [1 x i8]* @p_str1, [11 x i8]* @p_str5, [1 x i8]* @p_str1, i32 -1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [23 x i8]* @p_str9)
  call void (...)* @_ssdm_op_SpecMemCore([512 x i64]* %buffer_storage_A_V, [1 x i8]* @p_str1, [7 x i8]* @p_str10, [1 x i8]* @p_str1, i32 -1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1)
  call void (...)* @_ssdm_op_SpecMemCore([512 x i64]* %buffer_storage_B_V, [1 x i8]* @p_str1, [7 x i8]* @p_str10, [1 x i8]* @p_str1, i32 -1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1)
  call fastcc void @g2N_ingress(i89* %g2N_input_V, [512 x i64]* nocapture %buffer_storage_A_V, i16* %length_stream_V_V, i8* %dest_stream_V_V, i8* %src_stream_V_V)
  call fastcc void @g2N_egress(i73* %g2N_output_V, [512 x i64]* nocapture %buffer_storage_B_V, i16* %length_stream_V_V, i8* %dest_stream_V_V, i8* %src_stream_V_V)
  call fastcc void @n2G(i73* %n2G_input_V, i89* %n2G_output_V)
  ret void
}

define internal fastcc void @g2N_ingress(i89* %input_V, [512 x i64]* nocapture %buffer_storage_V, i16* %length_stream_V_V, i8* %dest_stream_V_V, i8* %src_stream_V_V) {
  call void (...)* @_ssdm_op_SpecMemCore([512 x i64]* %buffer_storage_V, [1 x i8]* @p_str1, [7 x i8]* @p_str10, [1 x i8]* @p_str1, i32 -1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1)
  call void (...)* @_ssdm_op_SpecIFCore(i89* %input_V, [1 x i8]* @p_str1, [11 x i8]* @p_str5, [1 x i8]* @p_str1, i32 -1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [23 x i8]* @p_str7)
  call void (...)* @_ssdm_op_SpecInterface(i89* %input_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str91, i32 0, i32 0, [1 x i8]* @p_str92, [1 x i8]* @p_str93, [1 x i8]* @p_str94, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str95, [1 x i8]* @p_str96)
  br label %1

; <label>:1                                       ; preds = %4, %0
  %i = phi i10 [ 0, %0 ], [ %tmp_V_4, %4 ]
  %tmp = call i1 @_ssdm_op_BitSelect.i1.i10.i32(i10 %i, i32 9)
  %empty = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 1, i64 512, i64 256)
  %tmp_V_4 = add i10 %i, 1
  br i1 %tmp, label %.loopexit.loopexit, label %2

; <label>:2                                       ; preds = %1
  call void (...)* @_ssdm_op_SpecLoopName([11 x i8]* @p_str) nounwind
  %tmp_4 = call i32 (...)* @_ssdm_op_SpecRegionBegin([11 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecPipeline(i32 1, i32 1, i32 1, i32 0, [1 x i8]* @p_str1) nounwind
  %tmp2 = call i89 @_ssdm_op_Read.ap_fifo.volatile.i89P(i89* %input_V)
  %tmp_5 = trunc i89 %tmp2 to i64
  %tmp_7 = call i1 @_ssdm_op_BitSelect.i1.i89.i32(i89 %tmp2, i32 72)
  %tmp_6 = zext i10 %i to i64
  %buffer_storage_V_add = getelementptr [512 x i64]* %buffer_storage_V, i64 0, i64 %tmp_6
  store i64 %tmp_5, i64* %buffer_storage_V_add, align 8
  br i1 %tmp_7, label %3, label %4

; <label>:3                                       ; preds = %2
  %tmp_V_1 = call i8 @_ssdm_op_PartSelect.i8.i89.i32.i32(i89 %tmp2, i32 64, i32 71)
  %tmp_V_2 = call i8 @_ssdm_op_PartSelect.i8.i89.i32.i32(i89 %tmp2, i32 73, i32 80)
  %tmp_V = zext i10 %tmp_V_4 to i16
  call void @_ssdm_op_Write.ap_auto.volatile.i16P(i16* %length_stream_V_V, i16 %tmp_V)
  call void @_ssdm_op_Write.ap_auto.volatile.i8P(i8* %dest_stream_V_V, i8 %tmp_V_1)
  call void @_ssdm_op_Write.ap_auto.volatile.i8P(i8* %src_stream_V_V, i8 %tmp_V_2)
  br label %.loopexit

; <label>:4                                       ; preds = %2
  %empty_13 = call i32 (...)* @_ssdm_op_SpecRegionEnd([11 x i8]* @p_str, i32 %tmp_4)
  br label %1

.loopexit.loopexit:                               ; preds = %1
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %3
  ret void
}

define internal fastcc void @g2N_egress(i73* %output_V, [512 x i64]* nocapture %buffer_storage_V, i16* %length_stream_V_V, i8* %dest_stream_V_V, i8* %src_stream_V_V) {
_ZlsILi16ELb0EE11ap_int_baseIXT_EXT0_EXleT_Li64EEERKS1_i.exit:
  call void (...)* @_ssdm_op_SpecMemCore([512 x i64]* %buffer_storage_V, [1 x i8]* @p_str1, [7 x i8]* @p_str10, [1 x i8]* @p_str1, i32 -1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1)
  call void (...)* @_ssdm_op_SpecIFCore(i73* %output_V, [1 x i8]* @p_str1, [11 x i8]* @p_str5, [1 x i8]* @p_str1, i32 -1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [23 x i8]* @p_str6)
  call void (...)* @_ssdm_op_SpecInterface(i73* %output_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str97, i32 0, i32 0, [1 x i8]* @p_str98, [1 x i8]* @p_str99, [1 x i8]* @p_str100, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str101, [1 x i8]* @p_str102)
  %tmp_V = call i16 @_ssdm_op_Read.ap_auto.volatile.i16P(i16* %length_stream_V_V)
  %tmp_V_5 = call i8 @_ssdm_op_Read.ap_auto.volatile.i8P(i8* %dest_stream_V_V)
  %tmp_V_6 = call i8 @_ssdm_op_Read.ap_auto.volatile.i8P(i8* %src_stream_V_V)
  %tmp = trunc i16 %tmp_V to i13
  %tmp_5 = call i72 @_ssdm_op_BitConcatenate.i72.i40.i8.i8.i13.i3(i40 -4294967296, i8 %tmp_V_5, i8 %tmp_V_6, i13 %tmp, i3 0)
  %tmp_9 = call i73 @_ssdm_op_PartSet.i73.i73.i72.i32.i32(i73 undef, i72 %tmp_5, i32 0, i32 71)
  call void @_ssdm_op_Write.ap_fifo.volatile.i73P(i73* %output_V, i73 %tmp_9)
  br label %0

; <label>:0                                       ; preds = %1, %_ZlsILi16ELb0EE11ap_int_baseIXT_EXT0_EXleT_Li64EEERKS1_i.exit
  %i = phi i32 [ 0, %_ZlsILi16ELb0EE11ap_int_baseIXT_EXT0_EXleT_Li64EEERKS1_i.exit ], [ %i_3, %1 ]
  %tmp_s = zext i16 %tmp_V to i32
  %tmp_1 = icmp slt i32 %i, %tmp_s
  %i_3 = add nsw i32 %i, 1
  %empty = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 0, i64 65535, i64 0)
  br i1 %tmp_1, label %1, label %2

; <label>:1                                       ; preds = %0
  call void (...)* @_ssdm_op_SpecLoopName([10 x i8]* @p_str2) nounwind
  %tmp_7 = call i32 (...)* @_ssdm_op_SpecRegionBegin([10 x i8]* @p_str2)
  call void (...)* @_ssdm_op_SpecPipeline(i32 1, i32 1, i32 1, i32 0, [1 x i8]* @p_str1) nounwind
  %tmp_2 = zext i32 %i to i64
  %buffer_storage_V_add = getelementptr [512 x i64]* %buffer_storage_V, i64 0, i64 %tmp_2
  %n_data_V = load i64* %buffer_storage_V_add, align 8
  %lhs_V_cast = zext i16 %tmp_V to i17
  %r_V = add i17 %lhs_V_cast, -1
  %tmp_3_cast = sext i17 %r_V to i32
  %tmp_last_V = icmp eq i32 %i, %tmp_3_cast
  %tmp_16 = call i73 @_ssdm_op_BitConcatenate.i73.i1.i8.i64(i1 %tmp_last_V, i8 -1, i64 %n_data_V)
  call void @_ssdm_op_Write.ap_fifo.volatile.i73P(i73* %output_V, i73 %tmp_16)
  %empty_14 = call i32 (...)* @_ssdm_op_SpecRegionEnd([10 x i8]* @p_str2, i32 %tmp_7)
  br label %0

; <label>:2                                       ; preds = %0
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

define weak void @_ssdm_op_Write.ap_auto.volatile.i8P(i8*, i8) {
entry:
  store i8 %1, i8* %0
  ret void
}

define weak void @_ssdm_op_Write.ap_auto.volatile.i16P(i16*, i16) {
entry:
  store i16 %1, i16* %0
  ret void
}

define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

define weak i32 @_ssdm_op_SpecRegionEnd(...) {
entry:
  ret i32 0
}

define weak i32 @_ssdm_op_SpecRegionBegin(...) {
entry:
  ret i32 0
}

define weak void @_ssdm_op_SpecPipeline(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecMemCore(...) {
entry:
  ret void
}

define weak i32 @_ssdm_op_SpecLoopTripCount(...) {
entry:
  ret i32 0
}

define weak void @_ssdm_op_SpecLoopName(...) nounwind {
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

define weak i8 @_ssdm_op_Read.ap_auto.volatile.i8P(i8*) {
entry:
  %empty = load i8* %0
  ret i8 %empty
}

define weak i16 @_ssdm_op_Read.ap_auto.volatile.i16P(i16*) {
entry:
  %empty = load i16* %0
  ret i16 %empty
}

define weak i73 @_ssdm_op_PartSet.i73.i73.i72.i32.i32(i73, i72, i32, i32) nounwind readnone {
entry:
  %empty = call i73 @llvm.part.set.i73.i72(i73 %0, i72 %1, i32 %2, i32 %3)
  ret i73 %empty
}

define weak i8 @_ssdm_op_PartSelect.i8.i89.i32.i32(i89, i32, i32) nounwind readnone {
entry:
  %empty = call i89 @llvm.part.select.i89(i89 %0, i32 %1, i32 %2)
  %empty_15 = trunc i89 %empty to i8
  ret i8 %empty_15
}

define weak i8 @_ssdm_op_PartSelect.i8.i73.i32.i32(i73, i32, i32) nounwind readnone {
entry:
  %empty = call i73 @llvm.part.select.i73(i73 %0, i32 %1, i32 %2)
  %empty_16 = trunc i73 %empty to i8
  ret i8 %empty_16
}

declare i64 @_ssdm_op_PartSelect.i64.i89.i32.i32(i89, i32, i32) nounwind readnone

declare i64 @_ssdm_op_PartSelect.i64.i73.i32.i32(i73, i32, i32) nounwind readnone

declare i13 @_ssdm_op_PartSelect.i13.i16.i32.i32(i16, i32, i32) nounwind readnone

define weak i1 @_ssdm_op_BitSelect.i1.i89.i32(i89, i32) nounwind readnone {
entry:
  %empty = zext i32 %1 to i89
  %empty_17 = shl i89 1, %empty
  %empty_18 = and i89 %0, %empty_17
  %empty_19 = icmp ne i89 %empty_18, 0
  ret i1 %empty_19
}

define weak i1 @_ssdm_op_BitSelect.i1.i73.i32(i73, i32) nounwind readnone {
entry:
  %empty = zext i32 %1 to i73
  %empty_20 = shl i73 1, %empty
  %empty_21 = and i73 %0, %empty_20
  %empty_22 = icmp ne i73 %empty_21, 0
  ret i1 %empty_22
}

define weak i1 @_ssdm_op_BitSelect.i1.i10.i32(i10, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i10
  %empty_23 = shl i10 1, %empty
  %empty_24 = and i10 %0, %empty_23
  %empty_25 = icmp ne i10 %empty_24, 0
  ret i1 %empty_25
}

define weak i89 @_ssdm_op_BitConcatenate.i89.i8.i8.i1.i8.i64(i8, i8, i1, i8, i64) nounwind readnone {
entry:
  %empty = zext i8 %3 to i72
  %empty_26 = zext i64 %4 to i72
  %empty_27 = shl i72 %empty, 64
  %empty_28 = or i72 %empty_27, %empty_26
  %empty_29 = zext i1 %2 to i73
  %empty_30 = zext i72 %empty_28 to i73
  %empty_31 = shl i73 %empty_29, 72
  %empty_32 = or i73 %empty_31, %empty_30
  %empty_33 = zext i8 %1 to i81
  %empty_34 = zext i73 %empty_32 to i81
  %empty_35 = shl i81 %empty_33, 73
  %empty_36 = or i81 %empty_35, %empty_34
  %empty_37 = zext i8 %0 to i89
  %empty_38 = zext i81 %empty_36 to i89
  %empty_39 = shl i89 %empty_37, 81
  %empty_40 = or i89 %empty_39, %empty_38
  ret i89 %empty_40
}

define weak i73 @_ssdm_op_BitConcatenate.i73.i1.i8.i64(i1, i8, i64) nounwind readnone {
entry:
  %empty = zext i8 %1 to i72
  %empty_41 = zext i64 %2 to i72
  %empty_42 = shl i72 %empty, 64
  %empty_43 = or i72 %empty_42, %empty_41
  %empty_44 = zext i1 %0 to i73
  %empty_45 = zext i72 %empty_43 to i73
  %empty_46 = shl i73 %empty_44, 72
  %empty_47 = or i73 %empty_46, %empty_45
  ret i73 %empty_47
}

define weak i72 @_ssdm_op_BitConcatenate.i72.i40.i8.i8.i13.i3(i40, i8, i8, i13, i3) nounwind readnone {
entry:
  %empty = zext i13 %3 to i16
  %empty_48 = zext i3 %4 to i16
  %empty_49 = shl i16 %empty, 3
  %empty_50 = or i16 %empty_49, %empty_48
  %empty_51 = zext i8 %2 to i24
  %empty_52 = zext i16 %empty_50 to i24
  %empty_53 = shl i24 %empty_51, 16
  %empty_54 = or i24 %empty_53, %empty_52
  %empty_55 = zext i8 %1 to i32
  %empty_56 = zext i24 %empty_54 to i32
  %empty_57 = shl i32 %empty_55, 24
  %empty_58 = or i32 %empty_57, %empty_56
  %empty_59 = zext i40 %0 to i72
  %empty_60 = zext i32 %empty_58 to i72
  %empty_61 = shl i72 %empty_59, 32
  %empty_62 = or i72 %empty_61, %empty_60
  ret i72 %empty_62
}

declare i89 @_autotb_FifoWrite_i89(i89*, i89)

declare i73 @_autotb_FifoWrite_i73(i73*, i73)

declare i89 @_autotb_FifoRead_i89(i89*)

declare i73 @_autotb_FifoRead_i73(i73*)

!opencl.kernels = !{!0, !7, !10, !16, !22, !22, !22, !22, !22, !22, !22, !22, !22, !22, !22, !22, !28, !34, !34, !34, !22, !22, !22, !22, !22, !37, !37, !22, !22, !22, !40, !44, !44, !22, !47, !22, !22, !22, !50, !50, !52, !52, !22, !54, !54, !54, !54, !55, !57, !52, !52, !58, !22, !59, !61, !61, !62, !64, !64, !22, !22, !66, !54, !54, !68, !22, !70, !73, !75, !22, !22, !22, !22, !22, !22, !22, !77, !80, !80, !86, !22, !22, !88}
!hls.encrypted.func = !{}
!llvm.map.gv = !{!89}

!0 = metadata !{null, metadata !1, metadata !2, metadata !3, metadata !4, metadata !5, metadata !6}
!1 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 1, i32 0, i32 0, i32 0}
!2 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!3 = metadata !{metadata !"kernel_arg_type", metadata !"galapagos_interface*", metadata !"ap_uint<8 * 8>*", metadata !"hls::stream<ap_uint<16> > &", metadata !"hls::stream<ap_uint<8> > &", metadata !"hls::stream<ap_uint<8> > &"}
!4 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !"", metadata !""}
!5 = metadata !{metadata !"kernel_arg_name", metadata !"input", metadata !"buffer_storage", metadata !"length_stream", metadata !"dest_stream", metadata !"src_stream"}
!6 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!7 = metadata !{null, metadata !1, metadata !2, metadata !8, metadata !4, metadata !9, metadata !6}
!8 = metadata !{metadata !"kernel_arg_type", metadata !"hls::stream<netStream>*", metadata !"ap_uint<8 * 8>*", metadata !"hls::stream<ap_uint<16> > &", metadata !"hls::stream<ap_uint<8> > &", metadata !"hls::stream<ap_uint<8> > &"}
!9 = metadata !{metadata !"kernel_arg_name", metadata !"output", metadata !"buffer_storage", metadata !"length_stream", metadata !"dest_stream", metadata !"src_stream"}
!10 = metadata !{null, metadata !11, metadata !12, metadata !13, metadata !14, metadata !15, metadata !6}
!11 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 1}
!12 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none"}
!13 = metadata !{metadata !"kernel_arg_type", metadata !"hls::stream<netStream>*", metadata !"galapagos_interface*"}
!14 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !""}
!15 = metadata !{metadata !"kernel_arg_name", metadata !"input", metadata !"output"}
!16 = metadata !{null, metadata !17, metadata !18, metadata !19, metadata !20, metadata !21, metadata !6}
!17 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 1, i32 1, i32 1, i32 1, i32 1}
!18 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!19 = metadata !{metadata !"kernel_arg_type", metadata !"galapagos_interface*", metadata !"hls::stream<netStream>*", metadata !"ap_uint<8 * 8>*", metadata !"ap_uint<8 * 8>*", metadata !"hls::stream<netStream>*", metadata !"galapagos_interface*"}
!20 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !""}
!21 = metadata !{metadata !"kernel_arg_name", metadata !"g2N_input", metadata !"g2N_output", metadata !"buffer_storage_A", metadata !"buffer_storage_B", metadata !"n2G_input", metadata !"n2G_output"}
!22 = metadata !{null, metadata !23, metadata !24, metadata !25, metadata !26, metadata !27, metadata !6}
!23 = metadata !{metadata !"kernel_arg_addr_space"}
!24 = metadata !{metadata !"kernel_arg_access_qual"}
!25 = metadata !{metadata !"kernel_arg_type"}
!26 = metadata !{metadata !"kernel_arg_type_qual"}
!27 = metadata !{metadata !"kernel_arg_name"}
!28 = metadata !{null, metadata !29, metadata !30, metadata !31, metadata !32, metadata !33, metadata !6}
!29 = metadata !{metadata !"kernel_arg_addr_space", i32 0}
!30 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none"}
!31 = metadata !{metadata !"kernel_arg_type", metadata !"const struct galapagos::stream_packet<64> &"}
!32 = metadata !{metadata !"kernel_arg_type_qual", metadata !""}
!33 = metadata !{metadata !"kernel_arg_name", metadata !"din"}
!34 = metadata !{null, metadata !29, metadata !30, metadata !35, metadata !32, metadata !36, metadata !6}
!35 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_range_ref<64, false> &"}
!36 = metadata !{metadata !"kernel_arg_name", metadata !"ref"}
!37 = metadata !{null, metadata !29, metadata !30, metadata !38, metadata !32, metadata !39, metadata !6}
!38 = metadata !{metadata !"kernel_arg_type", metadata !"_Bool"}
!39 = metadata !{metadata !"kernel_arg_name", metadata !"val"}
!40 = metadata !{null, metadata !41, metadata !12, metadata !42, metadata !14, metadata !43, metadata !6}
!41 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0}
!42 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<16, false> &", metadata !"int"}
!43 = metadata !{metadata !"kernel_arg_name", metadata !"op", metadata !"i_op"}
!44 = metadata !{null, metadata !29, metadata !30, metadata !45, metadata !32, metadata !46, metadata !6}
!45 = metadata !{metadata !"kernel_arg_type", metadata !"int"}
!46 = metadata !{metadata !"kernel_arg_name", metadata !"op"}
!47 = metadata !{null, metadata !41, metadata !12, metadata !48, metadata !14, metadata !49, metadata !6}
!48 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<16, false> &", metadata !"const ap_int_base<32, true> &"}
!49 = metadata !{metadata !"kernel_arg_name", metadata !"op", metadata !"op2"}
!50 = metadata !{null, metadata !29, metadata !30, metadata !51, metadata !32, metadata !46, metadata !6}
!51 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, true> &"}
!52 = metadata !{null, metadata !29, metadata !30, metadata !53, metadata !32, metadata !46, metadata !6}
!53 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<16, false> &"}
!54 = metadata !{null, metadata !29, metadata !30, metadata !45, metadata !32, metadata !39, metadata !6}
!55 = metadata !{null, metadata !29, metadata !30, metadata !56, metadata !32, metadata !33, metadata !6}
!56 = metadata !{metadata !"kernel_arg_type", metadata !"const struct ap_axis_net<64> &"}
!57 = metadata !{null, metadata !29, metadata !30, metadata !53, metadata !32, metadata !39, metadata !6}
!58 = metadata !{null, metadata !41, metadata !12, metadata !42, metadata !14, metadata !49, metadata !6}
!59 = metadata !{null, metadata !29, metadata !30, metadata !60, metadata !32, metadata !39, metadata !6}
!60 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<8, false> &"}
!61 = metadata !{null, metadata !29, metadata !30, metadata !60, metadata !32, metadata !46, metadata !6}
!62 = metadata !{null, metadata !29, metadata !30, metadata !63, metadata !32, metadata !39, metadata !6}
!63 = metadata !{metadata !"kernel_arg_type", metadata !"ulong long"}
!64 = metadata !{null, metadata !29, metadata !30, metadata !65, metadata !32, metadata !46, metadata !6}
!65 = metadata !{metadata !"kernel_arg_type", metadata !"ap_ulong"}
!66 = metadata !{null, metadata !29, metadata !30, metadata !67, metadata !32, metadata !33, metadata !6}
!67 = metadata !{metadata !"kernel_arg_type", metadata !"const struct ap_uint<8> &"}
!68 = metadata !{null, metadata !29, metadata !30, metadata !69, metadata !32, metadata !33, metadata !6}
!69 = metadata !{metadata !"kernel_arg_type", metadata !"const struct ap_uint<16> &"}
!70 = metadata !{null, metadata !29, metadata !30, metadata !71, metadata !32, metadata !72, metadata !6}
!71 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<1> &"}
!72 = metadata !{metadata !"kernel_arg_name", metadata !"op2"}
!73 = metadata !{null, metadata !29, metadata !30, metadata !74, metadata !32, metadata !72, metadata !6}
!74 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<8> &"}
!75 = metadata !{null, metadata !29, metadata !30, metadata !76, metadata !32, metadata !72, metadata !6}
!76 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<64> &"}
!77 = metadata !{null, metadata !41, metadata !12, metadata !78, metadata !14, metadata !79, metadata !6}
!78 = metadata !{metadata !"kernel_arg_type", metadata !"int", metadata !"int"}
!79 = metadata !{metadata !"kernel_arg_name", metadata !"Hi", metadata !"Lo"}
!80 = metadata !{null, metadata !81, metadata !82, metadata !83, metadata !84, metadata !85, metadata !6}
!81 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 0, i32 0}
!82 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none"}
!83 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<64, false>*", metadata !"int", metadata !"int"}
!84 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !""}
!85 = metadata !{metadata !"kernel_arg_name", metadata !"bv", metadata !"h", metadata !"l"}
!86 = metadata !{null, metadata !29, metadata !30, metadata !56, metadata !32, metadata !87, metadata !6}
!87 = metadata !{metadata !"kernel_arg_name", metadata !""}
!88 = metadata !{null, metadata !29, metadata !30, metadata !31, metadata !32, metadata !87, metadata !6}
!89 = metadata !{metadata !90, [0 x i32]* @llvm_global_ctors_0}
!90 = metadata !{metadata !91}
!91 = metadata !{i32 0, i32 31, metadata !92}
!92 = metadata !{metadata !93}
!93 = metadata !{metadata !"llvm.global_ctors.0", metadata !94, metadata !"", i32 0, i32 31}
!94 = metadata !{metadata !95}
!95 = metadata !{i32 0, i32 0, i32 1}
!96 = metadata !{metadata !97, metadata !100, metadata !103, metadata !106, metadata !109}
!97 = metadata !{i32 0, i32 63, metadata !98}
!98 = metadata !{metadata !99}
!99 = metadata !{metadata !"n2G_output.V.data.V", metadata !94, metadata !"uint64", i32 0, i32 63}
!100 = metadata !{i32 64, i32 71, metadata !101}
!101 = metadata !{metadata !102}
!102 = metadata !{metadata !"n2G_output.V.dest.V", metadata !94, metadata !"uint8", i32 0, i32 7}
!103 = metadata !{i32 72, i32 72, metadata !104}
!104 = metadata !{metadata !105}
!105 = metadata !{metadata !"n2G_output.V.last.V", metadata !94, metadata !"uint1", i32 0, i32 0}
!106 = metadata !{i32 73, i32 80, metadata !107}
!107 = metadata !{metadata !108}
!108 = metadata !{metadata !"n2G_output.V.id.V", metadata !94, metadata !"uint8", i32 0, i32 7}
!109 = metadata !{i32 81, i32 88, metadata !110}
!110 = metadata !{metadata !111}
!111 = metadata !{metadata !"n2G_output.V.keep.V", metadata !94, metadata !"uint8", i32 0, i32 7}
!112 = metadata !{metadata !113, metadata !116, metadata !119}
!113 = metadata !{i32 0, i32 63, metadata !114}
!114 = metadata !{metadata !115}
!115 = metadata !{metadata !"n2G_input.V.data.V", metadata !94, metadata !"uint64", i32 0, i32 63}
!116 = metadata !{i32 64, i32 71, metadata !117}
!117 = metadata !{metadata !118}
!118 = metadata !{metadata !"n2G_input.V.keep.V", metadata !94, metadata !"uint8", i32 0, i32 7}
!119 = metadata !{i32 72, i32 72, metadata !120}
!120 = metadata !{metadata !121}
!121 = metadata !{metadata !"n2G_input.V.last.V", metadata !94, metadata !"uint1", i32 0, i32 0}
!122 = metadata !{metadata !123, metadata !126, metadata !129}
!123 = metadata !{i32 0, i32 63, metadata !124}
!124 = metadata !{metadata !125}
!125 = metadata !{metadata !"g2N_output.V.data.V", metadata !94, metadata !"uint64", i32 0, i32 63}
!126 = metadata !{i32 64, i32 71, metadata !127}
!127 = metadata !{metadata !128}
!128 = metadata !{metadata !"g2N_output.V.keep.V", metadata !94, metadata !"uint8", i32 0, i32 7}
!129 = metadata !{i32 72, i32 72, metadata !130}
!130 = metadata !{metadata !131}
!131 = metadata !{metadata !"g2N_output.V.last.V", metadata !94, metadata !"uint1", i32 0, i32 0}
!132 = metadata !{metadata !133, metadata !136, metadata !139, metadata !142, metadata !145}
!133 = metadata !{i32 0, i32 63, metadata !134}
!134 = metadata !{metadata !135}
!135 = metadata !{metadata !"g2N_input.V.data.V", metadata !94, metadata !"uint64", i32 0, i32 63}
!136 = metadata !{i32 64, i32 71, metadata !137}
!137 = metadata !{metadata !138}
!138 = metadata !{metadata !"g2N_input.V.dest.V", metadata !94, metadata !"uint8", i32 0, i32 7}
!139 = metadata !{i32 72, i32 72, metadata !140}
!140 = metadata !{metadata !141}
!141 = metadata !{metadata !"g2N_input.V.last.V", metadata !94, metadata !"uint1", i32 0, i32 0}
!142 = metadata !{i32 73, i32 80, metadata !143}
!143 = metadata !{metadata !144}
!144 = metadata !{metadata !"g2N_input.V.id.V", metadata !94, metadata !"uint8", i32 0, i32 7}
!145 = metadata !{i32 81, i32 88, metadata !146}
!146 = metadata !{metadata !147}
!147 = metadata !{metadata !"g2N_input.V.keep.V", metadata !94, metadata !"uint8", i32 0, i32 7}
!148 = metadata !{metadata !149}
!149 = metadata !{i32 0, i32 63, metadata !150}
!150 = metadata !{metadata !151}
!151 = metadata !{metadata !"buffer_storage_A.V", metadata !152, metadata !"uint64", i32 0, i32 63}
!152 = metadata !{metadata !153}
!153 = metadata !{i32 0, i32 511, i32 1}
!154 = metadata !{metadata !155}
!155 = metadata !{i32 0, i32 63, metadata !156}
!156 = metadata !{metadata !157}
!157 = metadata !{metadata !"buffer_storage_B.V", metadata !152, metadata !"uint64", i32 0, i32 63}
