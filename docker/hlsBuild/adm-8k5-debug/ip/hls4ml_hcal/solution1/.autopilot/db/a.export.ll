; ModuleID = '/home/user/galapagos/hlsBuild/adm-8k5-debug/ip/hls4ml_hcal/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@llvm_global_ctors_1 = appending global [1 x void ()*] [void ()* @_GLOBAL__I_a]
@llvm_global_ctors_0 = appending global [1 x i32] [i32 65535]
@hls4ml_hcal_str = internal unnamed_addr constant [12 x i8] c"hls4ml_hcal\00"
@p_str7 = private unnamed_addr constant [11 x i8] c"ResetAccum\00", align 1
@p_str6 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@p_str5 = private unnamed_addr constant [12 x i8] c"hls_label_0\00", align 1
@p_str410 = private unnamed_addr constant [4 x i8] c"mul\00", align 1
@p_str39 = private unnamed_addr constant [13 x i8] c"hls_label_18\00", align 1
@p_str3 = private unnamed_addr constant [5 x i8] c"both\00", align 1
@p_str28 = private unnamed_addr constant [13 x i8] c"hls_label_25\00", align 1
@p_str2 = private unnamed_addr constant [5 x i8] c"axis\00", align 1
@p_str14 = private unnamed_addr constant [12 x i8] c"hls_label_0\00", align 1
@p_str13 = private unnamed_addr constant [12 x i8] c"hls_label_7\00", align 1
@p_str12 = private unnamed_addr constant [12 x i8] c"hls_label_9\00", align 1
@p_str11 = private unnamed_addr constant [13 x i8] c"hls_label_16\00", align 1
@p_str10 = private unnamed_addr constant [7 x i8] c"Result\00", align 1
@p_str1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@p_str = private unnamed_addr constant [13 x i8] c"ap_ctrl_none\00", align 1

declare i64 @llvm.part.select.i64(i64, i32, i32) nounwind readnone

declare i50 @llvm.part.select.i50(i50, i32, i32) nounwind readnone

declare i49 @llvm.part.select.i49(i49, i32, i32) nounwind readnone

declare i48 @llvm.part.select.i48(i48, i32, i32) nounwind readnone

declare i47 @llvm.part.select.i47(i47, i32, i32) nounwind readnone

declare i46 @llvm.part.select.i46(i46, i32, i32) nounwind readnone

declare i45 @llvm.part.select.i45(i45, i32, i32) nounwind readnone

declare i44 @llvm.part.select.i44(i44, i32, i32) nounwind readnone

declare i43 @llvm.part.select.i43(i43, i32, i32) nounwind readnone

declare i42 @llvm.part.select.i42(i42, i32, i32) nounwind readnone

declare i41 @llvm.part.select.i41(i41, i32, i32) nounwind readnone

declare i40 @llvm.part.select.i40(i40, i32, i32) nounwind readnone

declare i39 @llvm.part.select.i39(i39, i32, i32) nounwind readnone

declare i38 @llvm.part.select.i38(i38, i32, i32) nounwind readnone

declare i37 @llvm.part.select.i37(i37, i32, i32) nounwind readnone

declare i32 @llvm.part.select.i32(i32, i32, i32) nounwind readnone

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

define internal fastcc { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } @linear.2(i32 %data_0_V_read, i32 %data_1_V_read, i32 %data_2_V_read, i32 %data_3_V_read, i32 %data_4_V_read, i32 %data_5_V_read, i32 %data_6_V_read, i32 %data_7_V_read, i32 %data_8_V_read, i32 %data_9_V_read, i32 %data_10_V_read, i32 %data_11_V_read, i32 %data_12_V_read, i32 %data_13_V_read, i32 %data_14_V_read) readnone {
  %data_14_V_read_1 = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %data_14_V_read)
  %data_13_V_read_1 = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %data_13_V_read)
  %data_12_V_read_1 = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %data_12_V_read)
  %data_11_V_read_1 = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %data_11_V_read)
  %data_10_V_read_1 = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %data_10_V_read)
  %data_9_V_read_1 = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %data_9_V_read)
  %data_8_V_read_1 = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %data_8_V_read)
  %data_7_V_read_1 = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %data_7_V_read)
  %data_6_V_read_1 = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %data_6_V_read)
  %data_5_V_read_1 = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %data_5_V_read)
  %data_4_V_read_1 = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %data_4_V_read)
  %data_3_V_read_1 = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %data_3_V_read)
  %data_2_V_read_1 = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %data_2_V_read)
  %data_1_V_read_1 = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %data_1_V_read)
  %data_0_V_read_1 = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %data_0_V_read)
  %tmp = call i32 (...)* @_ssdm_op_SpecRegionBegin([12 x i8]* @p_str13)
  call void (...)* @_ssdm_op_SpecPipeline(i32 -1, i32 1, i32 1, i32 0, [1 x i8]* @p_str6) nounwind
  %empty = call i32 (...)* @_ssdm_op_SpecRegionEnd([12 x i8]* @p_str13, i32 %tmp)
  %mrv = insertvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } undef, i32 %data_0_V_read_1, 0
  %mrv_1 = insertvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %mrv, i32 %data_1_V_read_1, 1
  %mrv_2 = insertvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %mrv_1, i32 %data_2_V_read_1, 2
  %mrv_3 = insertvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %mrv_2, i32 %data_3_V_read_1, 3
  %mrv_4 = insertvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %mrv_3, i32 %data_4_V_read_1, 4
  %mrv_5 = insertvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %mrv_4, i32 %data_5_V_read_1, 5
  %mrv_6 = insertvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %mrv_5, i32 %data_6_V_read_1, 6
  %mrv_7 = insertvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %mrv_6, i32 %data_7_V_read_1, 7
  %mrv_8 = insertvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %mrv_7, i32 %data_8_V_read_1, 8
  %mrv_9 = insertvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %mrv_8, i32 %data_9_V_read_1, 9
  %mrv_s = insertvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %mrv_9, i32 %data_10_V_read_1, 10
  %mrv_10 = insertvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %mrv_s, i32 %data_11_V_read_1, 11
  %mrv_11 = insertvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %mrv_10, i32 %data_12_V_read_1, 12
  %mrv_12 = insertvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %mrv_11, i32 %data_13_V_read_1, 13
  %mrv_13 = insertvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %mrv_12, i32 %data_14_V_read_1, 14
  ret { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %mrv_13
}

define internal fastcc { i32, i32, i32, i32, i32 } @linear.1(i32 %data_0_V_read, i32 %data_1_V_read, i32 %data_2_V_read, i32 %data_3_V_read, i32 %data_4_V_read) readnone {
  %data_4_V_read_2 = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %data_4_V_read)
  %data_3_V_read_2 = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %data_3_V_read)
  %data_2_V_read_2 = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %data_2_V_read)
  %data_1_V_read_2 = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %data_1_V_read)
  %data_0_V_read_2 = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %data_0_V_read)
  %tmp = call i32 (...)* @_ssdm_op_SpecRegionBegin([13 x i8]* @p_str11)
  call void (...)* @_ssdm_op_SpecPipeline(i32 -1, i32 1, i32 1, i32 0, [1 x i8]* @p_str6) nounwind
  %empty = call i32 (...)* @_ssdm_op_SpecRegionEnd([13 x i8]* @p_str11, i32 %tmp)
  %mrv = insertvalue { i32, i32, i32, i32, i32 } undef, i32 %data_0_V_read_2, 0
  %mrv_1 = insertvalue { i32, i32, i32, i32, i32 } %mrv, i32 %data_1_V_read_2, 1
  %mrv_2 = insertvalue { i32, i32, i32, i32, i32 } %mrv_1, i32 %data_2_V_read_2, 2
  %mrv_3 = insertvalue { i32, i32, i32, i32, i32 } %mrv_2, i32 %data_3_V_read_2, 3
  %mrv_4 = insertvalue { i32, i32, i32, i32, i32 } %mrv_3, i32 %data_4_V_read_2, 4
  ret { i32, i32, i32, i32, i32 } %mrv_4
}

define internal fastcc i32 @linear(i32 %data_V_read) readnone {
.critedge:
  %data_V_read_1 = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %data_V_read)
  %tmp = call i32 (...)* @_ssdm_op_SpecRegionBegin([13 x i8]* @p_str28)
  call void (...)* @_ssdm_op_SpecPipeline(i32 -1, i32 1, i32 1, i32 0, [1 x i8]* @p_str6) nounwind
  %empty = call i32 (...)* @_ssdm_op_SpecRegionEnd([13 x i8]* @p_str28, i32 %tmp)
  ret i32 %data_V_read_1
}

define void @hls4ml_hcal(i16 signext %id, i64* %in_V_data_V, i8* %in_V_dest_V, i1* %in_V_last_V, i8* %in_V_id_V, i8* %in_V_keep_V, i64* %out_V_data_V, i8* %out_V_dest_V, i1* %out_V_last_V, i8* %out_V_id_V, i8* %out_V_keep_V) {
arrayctor.loop7.preheader:
  %tmp_keep_V = alloca i8
  call void (...)* @_ssdm_op_SpecBitsMap(i16 %id), !map !127
  call void (...)* @_ssdm_op_SpecBitsMap(i64* %in_V_data_V), !map !133
  call void (...)* @_ssdm_op_SpecBitsMap(i8* %in_V_dest_V), !map !137
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %in_V_last_V), !map !141
  call void (...)* @_ssdm_op_SpecBitsMap(i8* %in_V_id_V), !map !145
  call void (...)* @_ssdm_op_SpecBitsMap(i8* %in_V_keep_V), !map !149
  call void (...)* @_ssdm_op_SpecBitsMap(i64* %out_V_data_V), !map !153
  call void (...)* @_ssdm_op_SpecBitsMap(i8* %out_V_dest_V), !map !157
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %out_V_last_V), !map !161
  call void (...)* @_ssdm_op_SpecBitsMap(i8* %out_V_id_V), !map !165
  call void (...)* @_ssdm_op_SpecBitsMap(i8* %out_V_keep_V), !map !169
  call void (...)* @_ssdm_op_SpecTopModule([12 x i8]* @hls4ml_hcal_str) nounwind
  %id_read = call i16 @_ssdm_op_Read.ap_auto.i16(i16 %id)
  %in_buf_0_V = alloca [5632 x i32], align 4
  %in_buf_1_V = alloca [5632 x i32], align 4
  %in_buf_2_V = alloca [5632 x i32], align 4
  %in_buf_3_V = alloca [5632 x i32], align 4
  %in_buf_4_V = alloca [5632 x i32], align 4
  %in_buf_5_V = alloca [5632 x i32], align 4
  %in_buf_6_V = alloca [5632 x i32], align 4
  %in_buf_7_V = alloca [5632 x i32], align 4
  %in_buf_8_V = alloca [5632 x i32], align 4
  %in_buf_9_V = alloca [5632 x i32], align 4
  %in_buf_10_V = alloca [5632 x i32], align 4
  %in_buf_11_V = alloca [5632 x i32], align 4
  %in_buf_12_V = alloca [5632 x i32], align 4
  %in_buf_13_V = alloca [5632 x i32], align 4
  %in_buf_14_V = alloca [5632 x i32], align 4
  %in_buf_15_V = alloca [5632 x i32], align 4
  %in_buf_16_V = alloca [5632 x i32], align 4
  %in_buf_17_V = alloca [5632 x i32], align 4
  %in_buf_18_V = alloca [5632 x i32], align 4
  %in_buf_19_V = alloca [5632 x i32], align 4
  %in_buf_20_V = alloca [5632 x i32], align 4
  %in_buf_21_V = alloca [5632 x i32], align 4
  %in_buf_22_V = alloca [5632 x i32], align 4
  %in_buf_23_V = alloca [5632 x i32], align 4
  %in_buf_24_V = alloca [5632 x i32], align 4
  %in_buf_25_V = alloca [5632 x i32], align 4
  %in_buf_26_V = alloca [5632 x i32], align 4
  %in_buf_27_V = alloca [5632 x i32], align 4
  %in_buf_28_V = alloca [5632 x i32], align 4
  %in_buf_29_V = alloca [5632 x i32], align 4
  %out_buf_0_V = alloca [512 x i32], align 4
  %out_buf_1_V = alloca [512 x i32], align 4
  %out_buf_2_V = alloca [512 x i32], align 4
  %out_buf_3_V = alloca [512 x i32], align 4
  %out_buf_4_V = alloca [512 x i32], align 4
  %out_buf_5_V = alloca [512 x i32], align 4
  %out_buf_6_V = alloca [512 x i32], align 4
  %out_buf_7_V = alloca [512 x i32], align 4
  %out_buf_8_V = alloca [512 x i32], align 4
  %out_buf_9_V = alloca [512 x i32], align 4
  %out_buf_10_V = alloca [512 x i32], align 4
  %out_buf_11_V = alloca [512 x i32], align 4
  %out_buf_12_V = alloca [512 x i32], align 4
  %out_buf_13_V = alloca [512 x i32], align 4
  %out_buf_14_V = alloca [512 x i32], align 4
  %out_buf_15_V = alloca [512 x i32], align 4
  %out_buf_16_V = alloca [512 x i32], align 4
  %out_buf_17_V = alloca [512 x i32], align 4
  %out_buf_18_V = alloca [512 x i32], align 4
  %out_buf_19_V = alloca [512 x i32], align 4
  %out_buf_20_V = alloca [512 x i32], align 4
  %out_buf_21_V = alloca [512 x i32], align 4
  %out_buf_22_V = alloca [512 x i32], align 4
  %out_buf_23_V = alloca [512 x i32], align 4
  %out_buf_24_V = alloca [512 x i32], align 4
  %out_buf_25_V = alloca [512 x i32], align 4
  %out_buf_26_V = alloca [512 x i32], align 4
  %out_buf_27_V = alloca [512 x i32], align 4
  %out_buf_28_V = alloca [512 x i32], align 4
  %out_buf_29_V = alloca [512 x i32], align 4
  call void (...)* @_ssdm_op_SpecInterface(i32 0, [13 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i64* %out_V_data_V, i8* %out_V_dest_V, i1* %out_V_last_V, i8* %out_V_id_V, i8* %out_V_keep_V, [5 x i8]* @p_str2, i32 1, i32 1, [5 x i8]* @p_str3, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i64* %in_V_data_V, i8* %in_V_dest_V, i1* %in_V_last_V, i8* %in_V_id_V, i8* %in_V_keep_V, [5 x i8]* @p_str2, i32 1, i32 1, [5 x i8]* @p_str3, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  %gp_id_V = trunc i16 %id_read to i8
  %gp_dest_V = add i8 -1, %gp_id_V
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %.preheader229
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %arrayctor.loop7.preheader
  %loop_begin = call i32 (...)* @_ssdm_op_SpecLoopBegin() nounwind
  br label %.loopexit36

.loopexit36.loopexit:                             ; preds = %.preheader232
  br label %.loopexit36

.loopexit36:                                      ; preds = %.loopexit36.loopexit, %.loopexit
  %i = phi i10 [ 0, %.loopexit ], [ %i_1, %.loopexit36.loopexit ]
  %phi_mul = phi i13 [ 0, %.loopexit ], [ %next_mul, %.loopexit36.loopexit ]
  %next_mul = add i13 %phi_mul, 11
  %exitcond1 = icmp eq i10 %i, -512
  %empty = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 512, i64 512, i64 512)
  %i_1 = add i10 %i, 1
  br i1 %exitcond1, label %.preheader230.preheader, label %.preheader232.preheader

.preheader232.preheader:                          ; preds = %.loopexit36
  br label %.preheader232

.preheader230.preheader:                          ; preds = %.loopexit36
  br label %.preheader230

.preheader232.loopexit:                           ; preds = %.preheader231
  br label %.preheader232

.preheader232:                                    ; preds = %.preheader232.preheader, %.preheader232.loopexit
  %j = phi i5 [ %j_2, %.preheader232.loopexit ], [ 0, %.preheader232.preheader ]
  %exitcond3 = icmp eq i5 %j, -2
  %empty_35 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 30, i64 30, i64 30)
  %j_2 = add i5 %j, 1
  br i1 %exitcond3, label %.loopexit36.loopexit, label %.preheader231.preheader

.preheader231.preheader:                          ; preds = %.preheader232
  br label %.preheader231

.preheader231:                                    ; preds = %.preheader231.preheader, %._crit_edge
  %k = phi i4 [ %k_1, %._crit_edge ], [ 0, %.preheader231.preheader ]
  %tmp_3 = icmp ult i4 %k, -4
  %empty_36 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 6, i64 6, i64 6)
  br i1 %tmp_3, label %0, label %.preheader232.loopexit

; <label>:0                                       ; preds = %.preheader231
  %empty_37 = call { i64, i8, i1, i8, i8 } @_ssdm_op_Read.axis.volatile.i64P.i8P.i1P.i8P.i8P(i64* %in_V_data_V, i8* %in_V_dest_V, i1* %in_V_last_V, i8* %in_V_id_V, i8* %in_V_keep_V)
  %tmp_data_V_1 = extractvalue { i64, i8, i1, i8, i8 } %empty_37, 0
  %tmp_keep_V_3 = extractvalue { i64, i8, i1, i8, i8 } %empty_37, 4
  %tmp_5_cast = zext i4 %k to i13
  %tmp_s = add i13 %tmp_5_cast, %phi_mul
  %tmp_11_cast = zext i13 %tmp_s to i64
  %in_buf_0_V_addr = getelementptr [5632 x i32]* %in_buf_0_V, i64 0, i64 %tmp_11_cast
  %in_buf_1_V_addr = getelementptr [5632 x i32]* %in_buf_1_V, i64 0, i64 %tmp_11_cast
  %in_buf_2_V_addr = getelementptr [5632 x i32]* %in_buf_2_V, i64 0, i64 %tmp_11_cast
  %in_buf_3_V_addr = getelementptr [5632 x i32]* %in_buf_3_V, i64 0, i64 %tmp_11_cast
  %in_buf_4_V_addr = getelementptr [5632 x i32]* %in_buf_4_V, i64 0, i64 %tmp_11_cast
  %in_buf_5_V_addr = getelementptr [5632 x i32]* %in_buf_5_V, i64 0, i64 %tmp_11_cast
  %in_buf_6_V_addr = getelementptr [5632 x i32]* %in_buf_6_V, i64 0, i64 %tmp_11_cast
  %in_buf_7_V_addr = getelementptr [5632 x i32]* %in_buf_7_V, i64 0, i64 %tmp_11_cast
  %in_buf_8_V_addr = getelementptr [5632 x i32]* %in_buf_8_V, i64 0, i64 %tmp_11_cast
  %in_buf_9_V_addr = getelementptr [5632 x i32]* %in_buf_9_V, i64 0, i64 %tmp_11_cast
  %in_buf_10_V_addr = getelementptr [5632 x i32]* %in_buf_10_V, i64 0, i64 %tmp_11_cast
  %in_buf_11_V_addr = getelementptr [5632 x i32]* %in_buf_11_V, i64 0, i64 %tmp_11_cast
  %in_buf_12_V_addr = getelementptr [5632 x i32]* %in_buf_12_V, i64 0, i64 %tmp_11_cast
  %in_buf_13_V_addr = getelementptr [5632 x i32]* %in_buf_13_V, i64 0, i64 %tmp_11_cast
  %in_buf_14_V_addr = getelementptr [5632 x i32]* %in_buf_14_V, i64 0, i64 %tmp_11_cast
  %in_buf_15_V_addr = getelementptr [5632 x i32]* %in_buf_15_V, i64 0, i64 %tmp_11_cast
  %in_buf_16_V_addr = getelementptr [5632 x i32]* %in_buf_16_V, i64 0, i64 %tmp_11_cast
  %in_buf_17_V_addr = getelementptr [5632 x i32]* %in_buf_17_V, i64 0, i64 %tmp_11_cast
  %in_buf_18_V_addr = getelementptr [5632 x i32]* %in_buf_18_V, i64 0, i64 %tmp_11_cast
  %in_buf_19_V_addr = getelementptr [5632 x i32]* %in_buf_19_V, i64 0, i64 %tmp_11_cast
  %in_buf_20_V_addr = getelementptr [5632 x i32]* %in_buf_20_V, i64 0, i64 %tmp_11_cast
  %in_buf_21_V_addr = getelementptr [5632 x i32]* %in_buf_21_V, i64 0, i64 %tmp_11_cast
  %in_buf_22_V_addr = getelementptr [5632 x i32]* %in_buf_22_V, i64 0, i64 %tmp_11_cast
  %in_buf_23_V_addr = getelementptr [5632 x i32]* %in_buf_23_V, i64 0, i64 %tmp_11_cast
  %in_buf_24_V_addr = getelementptr [5632 x i32]* %in_buf_24_V, i64 0, i64 %tmp_11_cast
  %in_buf_25_V_addr = getelementptr [5632 x i32]* %in_buf_25_V, i64 0, i64 %tmp_11_cast
  %in_buf_26_V_addr = getelementptr [5632 x i32]* %in_buf_26_V, i64 0, i64 %tmp_11_cast
  %in_buf_27_V_addr = getelementptr [5632 x i32]* %in_buf_27_V, i64 0, i64 %tmp_11_cast
  %in_buf_28_V_addr = getelementptr [5632 x i32]* %in_buf_28_V, i64 0, i64 %tmp_11_cast
  %in_buf_29_V_addr = getelementptr [5632 x i32]* %in_buf_29_V, i64 0, i64 %tmp_11_cast
  %tmp_5 = trunc i64 %tmp_data_V_1 to i14
  %tmp_6 = call i32 @_ssdm_op_BitConcatenate.i32.i14.i18(i14 %tmp_5, i18 0)
  switch i5 %j, label %branch29 [
    i5 0, label %branch0
    i5 1, label %branch1
    i5 2, label %branch2
    i5 3, label %branch3
    i5 4, label %branch4
    i5 5, label %branch5
    i5 6, label %branch6
    i5 7, label %branch7
    i5 8, label %branch8
    i5 9, label %branch9
    i5 10, label %branch10
    i5 11, label %branch11
    i5 12, label %branch12
    i5 13, label %branch13
    i5 14, label %branch14
    i5 15, label %branch15
    i5 -16, label %branch16
    i5 -15, label %branch17
    i5 -14, label %branch18
    i5 -13, label %branch19
    i5 -12, label %branch20
    i5 -11, label %branch21
    i5 -10, label %branch22
    i5 -9, label %branch23
    i5 -8, label %branch24
    i5 -7, label %branch25
    i5 -6, label %branch26
    i5 -5, label %branch27
    i5 -4, label %branch28
  ]

; <label>:1                                       ; preds = %branch29, %branch28, %branch27, %branch26, %branch25, %branch24, %branch23, %branch22, %branch21, %branch20, %branch19, %branch18, %branch17, %branch16, %branch15, %branch14, %branch13, %branch12, %branch11, %branch10, %branch9, %branch8, %branch7, %branch6, %branch5, %branch4, %branch3, %branch2, %branch1, %branch0
  %tmp_8 = icmp ult i4 %k, -6
  br i1 %tmp_8, label %2, label %._crit_edge

; <label>:2                                       ; preds = %1
  %tmp_9 = or i4 %k, 1
  %tmp_7_cast = zext i4 %tmp_9 to i13
  %tmp_11 = add i13 %phi_mul, %tmp_7_cast
  %tmp_14_cast = zext i13 %tmp_11 to i64
  %in_buf_0_V_addr_1 = getelementptr [5632 x i32]* %in_buf_0_V, i64 0, i64 %tmp_14_cast
  %in_buf_1_V_addr_1 = getelementptr [5632 x i32]* %in_buf_1_V, i64 0, i64 %tmp_14_cast
  %in_buf_2_V_addr_1 = getelementptr [5632 x i32]* %in_buf_2_V, i64 0, i64 %tmp_14_cast
  %in_buf_3_V_addr_1 = getelementptr [5632 x i32]* %in_buf_3_V, i64 0, i64 %tmp_14_cast
  %in_buf_4_V_addr_1 = getelementptr [5632 x i32]* %in_buf_4_V, i64 0, i64 %tmp_14_cast
  %in_buf_5_V_addr_1 = getelementptr [5632 x i32]* %in_buf_5_V, i64 0, i64 %tmp_14_cast
  %in_buf_6_V_addr_1 = getelementptr [5632 x i32]* %in_buf_6_V, i64 0, i64 %tmp_14_cast
  %in_buf_7_V_addr_1 = getelementptr [5632 x i32]* %in_buf_7_V, i64 0, i64 %tmp_14_cast
  %in_buf_8_V_addr_1 = getelementptr [5632 x i32]* %in_buf_8_V, i64 0, i64 %tmp_14_cast
  %in_buf_9_V_addr_1 = getelementptr [5632 x i32]* %in_buf_9_V, i64 0, i64 %tmp_14_cast
  %in_buf_10_V_addr_1 = getelementptr [5632 x i32]* %in_buf_10_V, i64 0, i64 %tmp_14_cast
  %in_buf_11_V_addr_1 = getelementptr [5632 x i32]* %in_buf_11_V, i64 0, i64 %tmp_14_cast
  %in_buf_12_V_addr_1 = getelementptr [5632 x i32]* %in_buf_12_V, i64 0, i64 %tmp_14_cast
  %in_buf_13_V_addr_1 = getelementptr [5632 x i32]* %in_buf_13_V, i64 0, i64 %tmp_14_cast
  %in_buf_14_V_addr_1 = getelementptr [5632 x i32]* %in_buf_14_V, i64 0, i64 %tmp_14_cast
  %in_buf_15_V_addr_1 = getelementptr [5632 x i32]* %in_buf_15_V, i64 0, i64 %tmp_14_cast
  %in_buf_16_V_addr_1 = getelementptr [5632 x i32]* %in_buf_16_V, i64 0, i64 %tmp_14_cast
  %in_buf_17_V_addr_1 = getelementptr [5632 x i32]* %in_buf_17_V, i64 0, i64 %tmp_14_cast
  %in_buf_18_V_addr_1 = getelementptr [5632 x i32]* %in_buf_18_V, i64 0, i64 %tmp_14_cast
  %in_buf_19_V_addr_1 = getelementptr [5632 x i32]* %in_buf_19_V, i64 0, i64 %tmp_14_cast
  %in_buf_20_V_addr_1 = getelementptr [5632 x i32]* %in_buf_20_V, i64 0, i64 %tmp_14_cast
  %in_buf_21_V_addr_1 = getelementptr [5632 x i32]* %in_buf_21_V, i64 0, i64 %tmp_14_cast
  %in_buf_22_V_addr_1 = getelementptr [5632 x i32]* %in_buf_22_V, i64 0, i64 %tmp_14_cast
  %in_buf_23_V_addr_1 = getelementptr [5632 x i32]* %in_buf_23_V, i64 0, i64 %tmp_14_cast
  %in_buf_24_V_addr_1 = getelementptr [5632 x i32]* %in_buf_24_V, i64 0, i64 %tmp_14_cast
  %in_buf_25_V_addr_1 = getelementptr [5632 x i32]* %in_buf_25_V, i64 0, i64 %tmp_14_cast
  %in_buf_26_V_addr_1 = getelementptr [5632 x i32]* %in_buf_26_V, i64 0, i64 %tmp_14_cast
  %in_buf_27_V_addr_1 = getelementptr [5632 x i32]* %in_buf_27_V, i64 0, i64 %tmp_14_cast
  %in_buf_28_V_addr_1 = getelementptr [5632 x i32]* %in_buf_28_V, i64 0, i64 %tmp_14_cast
  %in_buf_29_V_addr_1 = getelementptr [5632 x i32]* %in_buf_29_V, i64 0, i64 %tmp_14_cast
  %tmp_12 = call i14 @_ssdm_op_PartSelect.i14.i64.i32.i32(i64 %tmp_data_V_1, i32 32, i32 45)
  %tmp_10 = call i32 @_ssdm_op_BitConcatenate.i32.i14.i18(i14 %tmp_12, i18 0)
  switch i5 %j, label %branch59 [
    i5 0, label %branch30
    i5 1, label %branch31
    i5 2, label %branch32
    i5 3, label %branch33
    i5 4, label %branch34
    i5 5, label %branch35
    i5 6, label %branch36
    i5 7, label %branch37
    i5 8, label %branch38
    i5 9, label %branch39
    i5 10, label %branch40
    i5 11, label %branch41
    i5 12, label %branch42
    i5 13, label %branch43
    i5 14, label %branch44
    i5 15, label %branch45
    i5 -16, label %branch46
    i5 -15, label %branch47
    i5 -14, label %branch48
    i5 -13, label %branch49
    i5 -12, label %branch50
    i5 -11, label %branch51
    i5 -10, label %branch52
    i5 -9, label %branch53
    i5 -8, label %branch54
    i5 -7, label %branch55
    i5 -6, label %branch56
    i5 -5, label %branch57
    i5 -4, label %branch58
  ]

; <label>:3                                       ; preds = %branch59, %branch58, %branch57, %branch56, %branch55, %branch54, %branch53, %branch52, %branch51, %branch50, %branch49, %branch48, %branch47, %branch46, %branch45, %branch44, %branch43, %branch42, %branch41, %branch40, %branch39, %branch38, %branch37, %branch36, %branch35, %branch34, %branch33, %branch32, %branch31, %branch30
  br label %._crit_edge

._crit_edge:                                      ; preds = %3, %1
  %k_1 = add i4 %k, 2
  store i8 %tmp_keep_V_3, i8* %tmp_keep_V
  br label %.preheader231

.preheader230:                                    ; preds = %.preheader230.preheader, %4
  %indvar_flatten = phi i14 [ %indvar_flatten_next, %4 ], [ 0, %.preheader230.preheader ]
  %i1 = phi i10 [ %tmp_1_mid2_v, %4 ], [ 0, %.preheader230.preheader ]
  %j1 = phi i5 [ %j_1, %4 ], [ 0, %.preheader230.preheader ]
  %exitcond_flatten = icmp eq i14 %indvar_flatten, -1024
  %indvar_flatten_next = add i14 %indvar_flatten, 1
  br i1 %exitcond_flatten, label %.preheader229.preheader, label %.preheader

.preheader229.preheader:                          ; preds = %.preheader230
  br label %.preheader229

; <label>:4                                       ; preds = %branch89, %branch88, %branch87, %branch86, %branch85, %branch84, %branch83, %branch82, %branch81, %branch80, %branch79, %branch78, %branch77, %branch76, %branch75, %branch74, %branch73, %branch72, %branch71, %branch70, %branch69, %branch68, %branch67, %branch66, %branch65, %branch64, %branch63, %branch62, %branch61, %branch60
  %empty_38 = call i32 (...)* @_ssdm_op_SpecRegionEnd([12 x i8]* @p_str5, i32 %tmp)
  %j_1 = add i5 %j1_mid2, 1
  br label %.preheader230

.preheader:                                       ; preds = %.preheader230
  %i_2 = add i10 %i1, 1
  %exitcond2 = icmp eq i5 %j1, -2
  %j1_mid2 = select i1 %exitcond2, i5 0, i5 %j1
  %tmp_1_mid2_v = select i1 %exitcond2, i10 %i_2, i10 %i1
  %tmp_1_mid2 = zext i10 %tmp_1_mid2_v to i64
  %out_buf_0_V_addr = getelementptr [512 x i32]* %out_buf_0_V, i64 0, i64 %tmp_1_mid2
  %out_buf_1_V_addr = getelementptr [512 x i32]* %out_buf_1_V, i64 0, i64 %tmp_1_mid2
  %out_buf_2_V_addr = getelementptr [512 x i32]* %out_buf_2_V, i64 0, i64 %tmp_1_mid2
  %out_buf_3_V_addr = getelementptr [512 x i32]* %out_buf_3_V, i64 0, i64 %tmp_1_mid2
  %out_buf_4_V_addr = getelementptr [512 x i32]* %out_buf_4_V, i64 0, i64 %tmp_1_mid2
  %out_buf_5_V_addr = getelementptr [512 x i32]* %out_buf_5_V, i64 0, i64 %tmp_1_mid2
  %out_buf_6_V_addr = getelementptr [512 x i32]* %out_buf_6_V, i64 0, i64 %tmp_1_mid2
  %out_buf_7_V_addr = getelementptr [512 x i32]* %out_buf_7_V, i64 0, i64 %tmp_1_mid2
  %out_buf_8_V_addr = getelementptr [512 x i32]* %out_buf_8_V, i64 0, i64 %tmp_1_mid2
  %out_buf_9_V_addr = getelementptr [512 x i32]* %out_buf_9_V, i64 0, i64 %tmp_1_mid2
  %out_buf_10_V_addr = getelementptr [512 x i32]* %out_buf_10_V, i64 0, i64 %tmp_1_mid2
  %out_buf_11_V_addr = getelementptr [512 x i32]* %out_buf_11_V, i64 0, i64 %tmp_1_mid2
  %out_buf_12_V_addr = getelementptr [512 x i32]* %out_buf_12_V, i64 0, i64 %tmp_1_mid2
  %out_buf_13_V_addr = getelementptr [512 x i32]* %out_buf_13_V, i64 0, i64 %tmp_1_mid2
  %out_buf_14_V_addr = getelementptr [512 x i32]* %out_buf_14_V, i64 0, i64 %tmp_1_mid2
  %out_buf_15_V_addr = getelementptr [512 x i32]* %out_buf_15_V, i64 0, i64 %tmp_1_mid2
  %out_buf_16_V_addr = getelementptr [512 x i32]* %out_buf_16_V, i64 0, i64 %tmp_1_mid2
  %out_buf_17_V_addr = getelementptr [512 x i32]* %out_buf_17_V, i64 0, i64 %tmp_1_mid2
  %out_buf_18_V_addr = getelementptr [512 x i32]* %out_buf_18_V, i64 0, i64 %tmp_1_mid2
  %out_buf_19_V_addr = getelementptr [512 x i32]* %out_buf_19_V, i64 0, i64 %tmp_1_mid2
  %out_buf_20_V_addr = getelementptr [512 x i32]* %out_buf_20_V, i64 0, i64 %tmp_1_mid2
  %out_buf_21_V_addr = getelementptr [512 x i32]* %out_buf_21_V, i64 0, i64 %tmp_1_mid2
  %out_buf_22_V_addr = getelementptr [512 x i32]* %out_buf_22_V, i64 0, i64 %tmp_1_mid2
  %out_buf_23_V_addr = getelementptr [512 x i32]* %out_buf_23_V, i64 0, i64 %tmp_1_mid2
  %out_buf_24_V_addr = getelementptr [512 x i32]* %out_buf_24_V, i64 0, i64 %tmp_1_mid2
  %out_buf_25_V_addr = getelementptr [512 x i32]* %out_buf_25_V, i64 0, i64 %tmp_1_mid2
  %out_buf_26_V_addr = getelementptr [512 x i32]* %out_buf_26_V, i64 0, i64 %tmp_1_mid2
  %out_buf_27_V_addr = getelementptr [512 x i32]* %out_buf_27_V, i64 0, i64 %tmp_1_mid2
  %out_buf_28_V_addr = getelementptr [512 x i32]* %out_buf_28_V, i64 0, i64 %tmp_1_mid2
  %out_buf_29_V_addr = getelementptr [512 x i32]* %out_buf_29_V, i64 0, i64 %tmp_1_mid2
  %tmp = call i32 (...)* @_ssdm_op_SpecRegionBegin([12 x i8]* @p_str5)
  call void (...)* @_ssdm_op_SpecPipeline(i32 -1, i32 1, i32 1, i32 0, [1 x i8]* @p_str1) nounwind
  %tmp_4 = call fastcc i32 @ereg_v1([5632 x i32]* %in_buf_0_V, [5632 x i32]* %in_buf_1_V, [5632 x i32]* %in_buf_2_V, [5632 x i32]* %in_buf_3_V, [5632 x i32]* %in_buf_4_V, [5632 x i32]* %in_buf_5_V, [5632 x i32]* %in_buf_6_V, [5632 x i32]* %in_buf_7_V, [5632 x i32]* %in_buf_8_V, [5632 x i32]* %in_buf_9_V, [5632 x i32]* %in_buf_10_V, [5632 x i32]* %in_buf_11_V, [5632 x i32]* %in_buf_12_V, [5632 x i32]* %in_buf_13_V, [5632 x i32]* %in_buf_14_V, [5632 x i32]* %in_buf_15_V, [5632 x i32]* %in_buf_16_V, [5632 x i32]* %in_buf_17_V, [5632 x i32]* %in_buf_18_V, [5632 x i32]* %in_buf_19_V, [5632 x i32]* %in_buf_20_V, [5632 x i32]* %in_buf_21_V, [5632 x i32]* %in_buf_22_V, [5632 x i32]* %in_buf_23_V, [5632 x i32]* %in_buf_24_V, [5632 x i32]* %in_buf_25_V, [5632 x i32]* %in_buf_26_V, [5632 x i32]* %in_buf_27_V, [5632 x i32]* %in_buf_28_V, [5632 x i32]* %in_buf_29_V, i10 %tmp_1_mid2_v, i5 %j1_mid2)
  switch i5 %j1_mid2, label %branch89 [
    i5 0, label %branch60
    i5 1, label %branch61
    i5 2, label %branch62
    i5 3, label %branch63
    i5 4, label %branch64
    i5 5, label %branch65
    i5 6, label %branch66
    i5 7, label %branch67
    i5 8, label %branch68
    i5 9, label %branch69
    i5 10, label %branch70
    i5 11, label %branch71
    i5 12, label %branch72
    i5 13, label %branch73
    i5 14, label %branch74
    i5 15, label %branch75
    i5 -16, label %branch76
    i5 -15, label %branch77
    i5 -14, label %branch78
    i5 -13, label %branch79
    i5 -12, label %branch80
    i5 -11, label %branch81
    i5 -10, label %branch82
    i5 -9, label %branch83
    i5 -8, label %branch84
    i5 -7, label %branch85
    i5 -6, label %branch86
    i5 -5, label %branch87
    i5 -4, label %branch88
  ]

.preheader229.loopexit:                           ; preds = %.preheader228
  br label %.preheader229

.preheader229:                                    ; preds = %.preheader229.preheader, %.preheader229.loopexit
  %i2 = phi i10 [ %i_3, %.preheader229.loopexit ], [ 0, %.preheader229.preheader ]
  %exitcond4 = icmp eq i10 %i2, -512
  %empty_39 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 512, i64 512, i64 512)
  %i_3 = add i10 %i2, 1
  br i1 %exitcond4, label %.loopexit.loopexit, label %.preheader228.preheader

.preheader228.preheader:                          ; preds = %.preheader229
  %tmp_2 = zext i10 %i2 to i64
  %out_buf_0_V_addr_1 = getelementptr [512 x i32]* %out_buf_0_V, i64 0, i64 %tmp_2
  %out_buf_1_V_addr_1 = getelementptr [512 x i32]* %out_buf_1_V, i64 0, i64 %tmp_2
  %out_buf_2_V_addr_1 = getelementptr [512 x i32]* %out_buf_2_V, i64 0, i64 %tmp_2
  %out_buf_3_V_addr_1 = getelementptr [512 x i32]* %out_buf_3_V, i64 0, i64 %tmp_2
  %out_buf_4_V_addr_1 = getelementptr [512 x i32]* %out_buf_4_V, i64 0, i64 %tmp_2
  %out_buf_5_V_addr_1 = getelementptr [512 x i32]* %out_buf_5_V, i64 0, i64 %tmp_2
  %out_buf_6_V_addr_1 = getelementptr [512 x i32]* %out_buf_6_V, i64 0, i64 %tmp_2
  %out_buf_7_V_addr_1 = getelementptr [512 x i32]* %out_buf_7_V, i64 0, i64 %tmp_2
  %out_buf_8_V_addr_1 = getelementptr [512 x i32]* %out_buf_8_V, i64 0, i64 %tmp_2
  %out_buf_9_V_addr_1 = getelementptr [512 x i32]* %out_buf_9_V, i64 0, i64 %tmp_2
  %out_buf_10_V_addr_1 = getelementptr [512 x i32]* %out_buf_10_V, i64 0, i64 %tmp_2
  %out_buf_11_V_addr_1 = getelementptr [512 x i32]* %out_buf_11_V, i64 0, i64 %tmp_2
  %out_buf_12_V_addr_1 = getelementptr [512 x i32]* %out_buf_12_V, i64 0, i64 %tmp_2
  %out_buf_13_V_addr_1 = getelementptr [512 x i32]* %out_buf_13_V, i64 0, i64 %tmp_2
  %out_buf_14_V_addr_1 = getelementptr [512 x i32]* %out_buf_14_V, i64 0, i64 %tmp_2
  %out_buf_15_V_addr_1 = getelementptr [512 x i32]* %out_buf_15_V, i64 0, i64 %tmp_2
  %out_buf_16_V_addr_1 = getelementptr [512 x i32]* %out_buf_16_V, i64 0, i64 %tmp_2
  %out_buf_17_V_addr_1 = getelementptr [512 x i32]* %out_buf_17_V, i64 0, i64 %tmp_2
  %out_buf_18_V_addr_1 = getelementptr [512 x i32]* %out_buf_18_V, i64 0, i64 %tmp_2
  %out_buf_19_V_addr_1 = getelementptr [512 x i32]* %out_buf_19_V, i64 0, i64 %tmp_2
  %out_buf_20_V_addr_1 = getelementptr [512 x i32]* %out_buf_20_V, i64 0, i64 %tmp_2
  %out_buf_21_V_addr_1 = getelementptr [512 x i32]* %out_buf_21_V, i64 0, i64 %tmp_2
  %out_buf_22_V_addr_1 = getelementptr [512 x i32]* %out_buf_22_V, i64 0, i64 %tmp_2
  %out_buf_23_V_addr_1 = getelementptr [512 x i32]* %out_buf_23_V, i64 0, i64 %tmp_2
  %out_buf_24_V_addr_1 = getelementptr [512 x i32]* %out_buf_24_V, i64 0, i64 %tmp_2
  %out_buf_25_V_addr_1 = getelementptr [512 x i32]* %out_buf_25_V, i64 0, i64 %tmp_2
  %out_buf_26_V_addr_1 = getelementptr [512 x i32]* %out_buf_26_V, i64 0, i64 %tmp_2
  %out_buf_27_V_addr_1 = getelementptr [512 x i32]* %out_buf_27_V, i64 0, i64 %tmp_2
  %out_buf_28_V_addr_1 = getelementptr [512 x i32]* %out_buf_28_V, i64 0, i64 %tmp_2
  %out_buf_29_V_addr_1 = getelementptr [512 x i32]* %out_buf_29_V, i64 0, i64 %tmp_2
  %out_buf_0_V_load = load i32* %out_buf_0_V_addr_1, align 4
  %out_buf_1_V_load = load i32* %out_buf_1_V_addr_1, align 4
  %out_buf_2_V_load = load i32* %out_buf_2_V_addr_1, align 4
  %out_buf_3_V_load = load i32* %out_buf_3_V_addr_1, align 4
  %out_buf_4_V_load = load i32* %out_buf_4_V_addr_1, align 4
  %out_buf_5_V_load = load i32* %out_buf_5_V_addr_1, align 4
  %out_buf_6_V_load = load i32* %out_buf_6_V_addr_1, align 4
  %out_buf_7_V_load = load i32* %out_buf_7_V_addr_1, align 4
  %out_buf_8_V_load = load i32* %out_buf_8_V_addr_1, align 4
  %out_buf_9_V_load = load i32* %out_buf_9_V_addr_1, align 4
  %out_buf_10_V_load = load i32* %out_buf_10_V_addr_1, align 4
  %out_buf_11_V_load = load i32* %out_buf_11_V_addr_1, align 4
  %out_buf_12_V_load = load i32* %out_buf_12_V_addr_1, align 4
  %out_buf_13_V_load = load i32* %out_buf_13_V_addr_1, align 4
  %out_buf_14_V_load = load i32* %out_buf_14_V_addr_1, align 4
  %out_buf_15_V_load = load i32* %out_buf_15_V_addr_1, align 4
  %out_buf_16_V_load = load i32* %out_buf_16_V_addr_1, align 4
  %out_buf_17_V_load = load i32* %out_buf_17_V_addr_1, align 4
  %out_buf_18_V_load = load i32* %out_buf_18_V_addr_1, align 4
  %out_buf_19_V_load = load i32* %out_buf_19_V_addr_1, align 4
  %out_buf_20_V_load = load i32* %out_buf_20_V_addr_1, align 4
  %out_buf_21_V_load = load i32* %out_buf_21_V_addr_1, align 4
  %out_buf_22_V_load = load i32* %out_buf_22_V_addr_1, align 4
  %out_buf_23_V_load = load i32* %out_buf_23_V_addr_1, align 4
  %out_buf_24_V_load = load i32* %out_buf_24_V_addr_1, align 4
  %out_buf_25_V_load = load i32* %out_buf_25_V_addr_1, align 4
  %out_buf_26_V_load = load i32* %out_buf_26_V_addr_1, align 4
  %out_buf_27_V_load = load i32* %out_buf_27_V_addr_1, align 4
  %out_buf_28_V_load = load i32* %out_buf_28_V_addr_1, align 4
  %out_buf_29_V_load = load i32* %out_buf_29_V_addr_1, align 4
  br label %.preheader228

.preheader228:                                    ; preds = %.preheader.preheader, %.preheader228.preheader
  %j3 = phi i5 [ 0, %.preheader228.preheader ], [ %j_3, %.preheader.preheader ]
  %exitcond = icmp eq i5 %j3, -2
  %empty_40 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 30, i64 30, i64 30)
  %j_3 = add i5 %j3, 1
  br i1 %exitcond, label %.preheader229.loopexit, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader228
  %tmp_keep_V_load = load i8* %tmp_keep_V
  %tmp_last_V = icmp eq i5 %j3, -3
  %tmp_7 = call i32 @_ssdm_op_Mux.ap_auto.30i32.i5(i32 %out_buf_0_V_load, i32 %out_buf_1_V_load, i32 %out_buf_2_V_load, i32 %out_buf_3_V_load, i32 %out_buf_4_V_load, i32 %out_buf_5_V_load, i32 %out_buf_6_V_load, i32 %out_buf_7_V_load, i32 %out_buf_8_V_load, i32 %out_buf_9_V_load, i32 %out_buf_10_V_load, i32 %out_buf_11_V_load, i32 %out_buf_12_V_load, i32 %out_buf_13_V_load, i32 %out_buf_14_V_load, i32 %out_buf_15_V_load, i32 %out_buf_16_V_load, i32 %out_buf_17_V_load, i32 %out_buf_18_V_load, i32 %out_buf_19_V_load, i32 %out_buf_20_V_load, i32 %out_buf_21_V_load, i32 %out_buf_22_V_load, i32 %out_buf_23_V_load, i32 %out_buf_24_V_load, i32 %out_buf_25_V_load, i32 %out_buf_26_V_load, i32 %out_buf_27_V_load, i32 %out_buf_28_V_load, i32 %out_buf_29_V_load, i5 %j3)
  %tmp_data_V = zext i32 %tmp_7 to i64
  call void @_ssdm_op_Write.axis.volatile.i64P.i8P.i1P.i8P.i8P(i64* %out_V_data_V, i8* %out_V_dest_V, i1* %out_V_last_V, i8* %out_V_id_V, i8* %out_V_keep_V, i64 %tmp_data_V, i8 %gp_dest_V, i1 %tmp_last_V, i8 %gp_id_V, i8 %tmp_keep_V_load)
  br label %.preheader228

branch0:                                          ; preds = %0
  store i32 %tmp_6, i32* %in_buf_0_V_addr, align 4
  br label %1

branch1:                                          ; preds = %0
  store i32 %tmp_6, i32* %in_buf_1_V_addr, align 4
  br label %1

branch2:                                          ; preds = %0
  store i32 %tmp_6, i32* %in_buf_2_V_addr, align 4
  br label %1

branch3:                                          ; preds = %0
  store i32 %tmp_6, i32* %in_buf_3_V_addr, align 4
  br label %1

branch4:                                          ; preds = %0
  store i32 %tmp_6, i32* %in_buf_4_V_addr, align 4
  br label %1

branch5:                                          ; preds = %0
  store i32 %tmp_6, i32* %in_buf_5_V_addr, align 4
  br label %1

branch6:                                          ; preds = %0
  store i32 %tmp_6, i32* %in_buf_6_V_addr, align 4
  br label %1

branch7:                                          ; preds = %0
  store i32 %tmp_6, i32* %in_buf_7_V_addr, align 4
  br label %1

branch8:                                          ; preds = %0
  store i32 %tmp_6, i32* %in_buf_8_V_addr, align 4
  br label %1

branch9:                                          ; preds = %0
  store i32 %tmp_6, i32* %in_buf_9_V_addr, align 4
  br label %1

branch10:                                         ; preds = %0
  store i32 %tmp_6, i32* %in_buf_10_V_addr, align 4
  br label %1

branch11:                                         ; preds = %0
  store i32 %tmp_6, i32* %in_buf_11_V_addr, align 4
  br label %1

branch12:                                         ; preds = %0
  store i32 %tmp_6, i32* %in_buf_12_V_addr, align 4
  br label %1

branch13:                                         ; preds = %0
  store i32 %tmp_6, i32* %in_buf_13_V_addr, align 4
  br label %1

branch14:                                         ; preds = %0
  store i32 %tmp_6, i32* %in_buf_14_V_addr, align 4
  br label %1

branch15:                                         ; preds = %0
  store i32 %tmp_6, i32* %in_buf_15_V_addr, align 4
  br label %1

branch16:                                         ; preds = %0
  store i32 %tmp_6, i32* %in_buf_16_V_addr, align 4
  br label %1

branch17:                                         ; preds = %0
  store i32 %tmp_6, i32* %in_buf_17_V_addr, align 4
  br label %1

branch18:                                         ; preds = %0
  store i32 %tmp_6, i32* %in_buf_18_V_addr, align 4
  br label %1

branch19:                                         ; preds = %0
  store i32 %tmp_6, i32* %in_buf_19_V_addr, align 4
  br label %1

branch20:                                         ; preds = %0
  store i32 %tmp_6, i32* %in_buf_20_V_addr, align 4
  br label %1

branch21:                                         ; preds = %0
  store i32 %tmp_6, i32* %in_buf_21_V_addr, align 4
  br label %1

branch22:                                         ; preds = %0
  store i32 %tmp_6, i32* %in_buf_22_V_addr, align 4
  br label %1

branch23:                                         ; preds = %0
  store i32 %tmp_6, i32* %in_buf_23_V_addr, align 4
  br label %1

branch24:                                         ; preds = %0
  store i32 %tmp_6, i32* %in_buf_24_V_addr, align 4
  br label %1

branch25:                                         ; preds = %0
  store i32 %tmp_6, i32* %in_buf_25_V_addr, align 4
  br label %1

branch26:                                         ; preds = %0
  store i32 %tmp_6, i32* %in_buf_26_V_addr, align 4
  br label %1

branch27:                                         ; preds = %0
  store i32 %tmp_6, i32* %in_buf_27_V_addr, align 4
  br label %1

branch28:                                         ; preds = %0
  store i32 %tmp_6, i32* %in_buf_28_V_addr, align 4
  br label %1

branch29:                                         ; preds = %0
  store i32 %tmp_6, i32* %in_buf_29_V_addr, align 4
  br label %1

branch30:                                         ; preds = %2
  store i32 %tmp_10, i32* %in_buf_0_V_addr_1, align 4
  br label %3

branch31:                                         ; preds = %2
  store i32 %tmp_10, i32* %in_buf_1_V_addr_1, align 4
  br label %3

branch32:                                         ; preds = %2
  store i32 %tmp_10, i32* %in_buf_2_V_addr_1, align 4
  br label %3

branch33:                                         ; preds = %2
  store i32 %tmp_10, i32* %in_buf_3_V_addr_1, align 4
  br label %3

branch34:                                         ; preds = %2
  store i32 %tmp_10, i32* %in_buf_4_V_addr_1, align 4
  br label %3

branch35:                                         ; preds = %2
  store i32 %tmp_10, i32* %in_buf_5_V_addr_1, align 4
  br label %3

branch36:                                         ; preds = %2
  store i32 %tmp_10, i32* %in_buf_6_V_addr_1, align 4
  br label %3

branch37:                                         ; preds = %2
  store i32 %tmp_10, i32* %in_buf_7_V_addr_1, align 4
  br label %3

branch38:                                         ; preds = %2
  store i32 %tmp_10, i32* %in_buf_8_V_addr_1, align 4
  br label %3

branch39:                                         ; preds = %2
  store i32 %tmp_10, i32* %in_buf_9_V_addr_1, align 4
  br label %3

branch40:                                         ; preds = %2
  store i32 %tmp_10, i32* %in_buf_10_V_addr_1, align 4
  br label %3

branch41:                                         ; preds = %2
  store i32 %tmp_10, i32* %in_buf_11_V_addr_1, align 4
  br label %3

branch42:                                         ; preds = %2
  store i32 %tmp_10, i32* %in_buf_12_V_addr_1, align 4
  br label %3

branch43:                                         ; preds = %2
  store i32 %tmp_10, i32* %in_buf_13_V_addr_1, align 4
  br label %3

branch44:                                         ; preds = %2
  store i32 %tmp_10, i32* %in_buf_14_V_addr_1, align 4
  br label %3

branch45:                                         ; preds = %2
  store i32 %tmp_10, i32* %in_buf_15_V_addr_1, align 4
  br label %3

branch46:                                         ; preds = %2
  store i32 %tmp_10, i32* %in_buf_16_V_addr_1, align 4
  br label %3

branch47:                                         ; preds = %2
  store i32 %tmp_10, i32* %in_buf_17_V_addr_1, align 4
  br label %3

branch48:                                         ; preds = %2
  store i32 %tmp_10, i32* %in_buf_18_V_addr_1, align 4
  br label %3

branch49:                                         ; preds = %2
  store i32 %tmp_10, i32* %in_buf_19_V_addr_1, align 4
  br label %3

branch50:                                         ; preds = %2
  store i32 %tmp_10, i32* %in_buf_20_V_addr_1, align 4
  br label %3

branch51:                                         ; preds = %2
  store i32 %tmp_10, i32* %in_buf_21_V_addr_1, align 4
  br label %3

branch52:                                         ; preds = %2
  store i32 %tmp_10, i32* %in_buf_22_V_addr_1, align 4
  br label %3

branch53:                                         ; preds = %2
  store i32 %tmp_10, i32* %in_buf_23_V_addr_1, align 4
  br label %3

branch54:                                         ; preds = %2
  store i32 %tmp_10, i32* %in_buf_24_V_addr_1, align 4
  br label %3

branch55:                                         ; preds = %2
  store i32 %tmp_10, i32* %in_buf_25_V_addr_1, align 4
  br label %3

branch56:                                         ; preds = %2
  store i32 %tmp_10, i32* %in_buf_26_V_addr_1, align 4
  br label %3

branch57:                                         ; preds = %2
  store i32 %tmp_10, i32* %in_buf_27_V_addr_1, align 4
  br label %3

branch58:                                         ; preds = %2
  store i32 %tmp_10, i32* %in_buf_28_V_addr_1, align 4
  br label %3

branch59:                                         ; preds = %2
  store i32 %tmp_10, i32* %in_buf_29_V_addr_1, align 4
  br label %3

branch60:                                         ; preds = %.preheader
  store i32 %tmp_4, i32* %out_buf_0_V_addr, align 4
  br label %4

branch61:                                         ; preds = %.preheader
  store i32 %tmp_4, i32* %out_buf_1_V_addr, align 4
  br label %4

branch62:                                         ; preds = %.preheader
  store i32 %tmp_4, i32* %out_buf_2_V_addr, align 4
  br label %4

branch63:                                         ; preds = %.preheader
  store i32 %tmp_4, i32* %out_buf_3_V_addr, align 4
  br label %4

branch64:                                         ; preds = %.preheader
  store i32 %tmp_4, i32* %out_buf_4_V_addr, align 4
  br label %4

branch65:                                         ; preds = %.preheader
  store i32 %tmp_4, i32* %out_buf_5_V_addr, align 4
  br label %4

branch66:                                         ; preds = %.preheader
  store i32 %tmp_4, i32* %out_buf_6_V_addr, align 4
  br label %4

branch67:                                         ; preds = %.preheader
  store i32 %tmp_4, i32* %out_buf_7_V_addr, align 4
  br label %4

branch68:                                         ; preds = %.preheader
  store i32 %tmp_4, i32* %out_buf_8_V_addr, align 4
  br label %4

branch69:                                         ; preds = %.preheader
  store i32 %tmp_4, i32* %out_buf_9_V_addr, align 4
  br label %4

branch70:                                         ; preds = %.preheader
  store i32 %tmp_4, i32* %out_buf_10_V_addr, align 4
  br label %4

branch71:                                         ; preds = %.preheader
  store i32 %tmp_4, i32* %out_buf_11_V_addr, align 4
  br label %4

branch72:                                         ; preds = %.preheader
  store i32 %tmp_4, i32* %out_buf_12_V_addr, align 4
  br label %4

branch73:                                         ; preds = %.preheader
  store i32 %tmp_4, i32* %out_buf_13_V_addr, align 4
  br label %4

branch74:                                         ; preds = %.preheader
  store i32 %tmp_4, i32* %out_buf_14_V_addr, align 4
  br label %4

branch75:                                         ; preds = %.preheader
  store i32 %tmp_4, i32* %out_buf_15_V_addr, align 4
  br label %4

branch76:                                         ; preds = %.preheader
  store i32 %tmp_4, i32* %out_buf_16_V_addr, align 4
  br label %4

branch77:                                         ; preds = %.preheader
  store i32 %tmp_4, i32* %out_buf_17_V_addr, align 4
  br label %4

branch78:                                         ; preds = %.preheader
  store i32 %tmp_4, i32* %out_buf_18_V_addr, align 4
  br label %4

branch79:                                         ; preds = %.preheader
  store i32 %tmp_4, i32* %out_buf_19_V_addr, align 4
  br label %4

branch80:                                         ; preds = %.preheader
  store i32 %tmp_4, i32* %out_buf_20_V_addr, align 4
  br label %4

branch81:                                         ; preds = %.preheader
  store i32 %tmp_4, i32* %out_buf_21_V_addr, align 4
  br label %4

branch82:                                         ; preds = %.preheader
  store i32 %tmp_4, i32* %out_buf_22_V_addr, align 4
  br label %4

branch83:                                         ; preds = %.preheader
  store i32 %tmp_4, i32* %out_buf_23_V_addr, align 4
  br label %4

branch84:                                         ; preds = %.preheader
  store i32 %tmp_4, i32* %out_buf_24_V_addr, align 4
  br label %4

branch85:                                         ; preds = %.preheader
  store i32 %tmp_4, i32* %out_buf_25_V_addr, align 4
  br label %4

branch86:                                         ; preds = %.preheader
  store i32 %tmp_4, i32* %out_buf_26_V_addr, align 4
  br label %4

branch87:                                         ; preds = %.preheader
  store i32 %tmp_4, i32* %out_buf_27_V_addr, align 4
  br label %4

branch88:                                         ; preds = %.preheader
  store i32 %tmp_4, i32* %out_buf_28_V_addr, align 4
  br label %4

branch89:                                         ; preds = %.preheader
  store i32 %tmp_4, i32* %out_buf_29_V_addr, align 4
  br label %4
}

define internal fastcc i32 @ereg_v1([5632 x i32]* nocapture %data_V, [5632 x i32]* nocapture %data_V1, [5632 x i32]* nocapture %data_V2, [5632 x i32]* nocapture %data_V3, [5632 x i32]* nocapture %data_V4, [5632 x i32]* nocapture %data_V5, [5632 x i32]* nocapture %data_V6, [5632 x i32]* nocapture %data_V7, [5632 x i32]* nocapture %data_V8, [5632 x i32]* nocapture %data_V9, [5632 x i32]* nocapture %data_V10, [5632 x i32]* nocapture %data_V11, [5632 x i32]* nocapture %data_V12, [5632 x i32]* nocapture %data_V13, [5632 x i32]* nocapture %data_V14, [5632 x i32]* nocapture %data_V15, [5632 x i32]* nocapture %data_V16, [5632 x i32]* nocapture %data_V17, [5632 x i32]* nocapture %data_V18, [5632 x i32]* nocapture %data_V19, [5632 x i32]* nocapture %data_V20, [5632 x i32]* nocapture %data_V21, [5632 x i32]* nocapture %data_V22, [5632 x i32]* nocapture %data_V23, [5632 x i32]* nocapture %data_V24, [5632 x i32]* nocapture %data_V25, [5632 x i32]* nocapture %data_V26, [5632 x i32]* nocapture %data_V27, [5632 x i32]* nocapture %data_V28, [5632 x i32]* nocapture %data_V29, i10 %data_V_offset, i5 %data_V_offset1) readonly {
ap_fixed_base.exit:
  call void (...)* @_ssdm_op_SpecPipeline(i32 -1, i32 1, i32 1, i32 0, [1 x i8]* @p_str6) nounwind
  %data_V_offset1_read = call i5 @_ssdm_op_Read.ap_auto.i5(i5 %data_V_offset1)
  %data_V_offset_read = call i10 @_ssdm_op_Read.ap_auto.i10(i10 %data_V_offset)
  %tmp = trunc i10 %data_V_offset_read to i9
  %call_ret4 = call fastcc { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } @compute_layer.0.0.0..1([5632 x i32]* %data_V, [5632 x i32]* %data_V1, [5632 x i32]* %data_V2, [5632 x i32]* %data_V3, [5632 x i32]* %data_V4, [5632 x i32]* %data_V5, [5632 x i32]* %data_V6, [5632 x i32]* %data_V7, [5632 x i32]* %data_V8, [5632 x i32]* %data_V9, [5632 x i32]* %data_V10, [5632 x i32]* %data_V11, [5632 x i32]* %data_V12, [5632 x i32]* %data_V13, [5632 x i32]* %data_V14, [5632 x i32]* %data_V15, [5632 x i32]* %data_V16, [5632 x i32]* %data_V17, [5632 x i32]* %data_V18, [5632 x i32]* %data_V19, [5632 x i32]* %data_V20, [5632 x i32]* %data_V21, [5632 x i32]* %data_V22, [5632 x i32]* %data_V23, [5632 x i32]* %data_V24, [5632 x i32]* %data_V25, [5632 x i32]* %data_V26, [5632 x i32]* %data_V27, [5632 x i32]* %data_V28, [5632 x i32]* %data_V29, i9 %tmp, i5 %data_V_offset1_read)
  %logits1_0_V = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %call_ret4, 0
  %logits1_1_V = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %call_ret4, 1
  %logits1_2_V = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %call_ret4, 2
  %logits1_3_V = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %call_ret4, 3
  %logits1_4_V = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %call_ret4, 4
  %logits1_5_V = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %call_ret4, 5
  %logits1_6_V = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %call_ret4, 6
  %logits1_7_V = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %call_ret4, 7
  %logits1_8_V = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %call_ret4, 8
  %logits1_9_V = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %call_ret4, 9
  %logits1_10_V = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %call_ret4, 10
  %logits1_11_V = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %call_ret4, 11
  %logits1_12_V = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %call_ret4, 12
  %logits1_13_V = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %call_ret4, 13
  %logits1_14_V = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %call_ret4, 14
  %call_ret1 = call fastcc { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } @linear.2(i32 %logits1_0_V, i32 %logits1_1_V, i32 %logits1_2_V, i32 %logits1_3_V, i32 %logits1_4_V, i32 %logits1_5_V, i32 %logits1_6_V, i32 %logits1_7_V, i32 %logits1_8_V, i32 %logits1_9_V, i32 %logits1_10_V, i32 %logits1_11_V, i32 %logits1_12_V, i32 %logits1_13_V, i32 %logits1_14_V)
  %layer1_out_0_V = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %call_ret1, 0
  %layer1_out_1_V = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %call_ret1, 1
  %layer1_out_2_V = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %call_ret1, 2
  %layer1_out_3_V = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %call_ret1, 3
  %layer1_out_4_V = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %call_ret1, 4
  %layer1_out_5_V = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %call_ret1, 5
  %layer1_out_6_V = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %call_ret1, 6
  %layer1_out_7_V = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %call_ret1, 7
  %layer1_out_8_V = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %call_ret1, 8
  %layer1_out_9_V = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %call_ret1, 9
  %layer1_out_10_V = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %call_ret1, 10
  %layer1_out_11_V = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %call_ret1, 11
  %layer1_out_12_V = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %call_ret1, 12
  %layer1_out_13_V = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %call_ret1, 13
  %layer1_out_14_V = extractvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %call_ret1, 14
  %call_ret2 = call fastcc { i32, i32, i32, i32, i32 } @compute_layer.0.0.0.(i32 %layer1_out_0_V, i32 %layer1_out_1_V, i32 %layer1_out_2_V, i32 %layer1_out_3_V, i32 %layer1_out_4_V, i32 %layer1_out_5_V, i32 %layer1_out_6_V, i32 %layer1_out_7_V, i32 %layer1_out_8_V, i32 %layer1_out_9_V, i32 %layer1_out_10_V, i32 %layer1_out_11_V, i32 %layer1_out_12_V, i32 %layer1_out_13_V, i32 %layer1_out_14_V)
  %logits2_0_V = extractvalue { i32, i32, i32, i32, i32 } %call_ret2, 0
  %logits2_1_V = extractvalue { i32, i32, i32, i32, i32 } %call_ret2, 1
  %logits2_2_V = extractvalue { i32, i32, i32, i32, i32 } %call_ret2, 2
  %logits2_3_V = extractvalue { i32, i32, i32, i32, i32 } %call_ret2, 3
  %logits2_4_V = extractvalue { i32, i32, i32, i32, i32 } %call_ret2, 4
  %call_ret3 = call fastcc { i32, i32, i32, i32, i32 } @linear.1(i32 %logits2_0_V, i32 %logits2_1_V, i32 %logits2_2_V, i32 %logits2_3_V, i32 %logits2_4_V)
  %layer2_out_0_V = extractvalue { i32, i32, i32, i32, i32 } %call_ret3, 0
  %layer2_out_1_V = extractvalue { i32, i32, i32, i32, i32 } %call_ret3, 1
  %layer2_out_2_V = extractvalue { i32, i32, i32, i32, i32 } %call_ret3, 2
  %layer2_out_3_V = extractvalue { i32, i32, i32, i32, i32 } %call_ret3, 3
  %layer2_out_4_V = extractvalue { i32, i32, i32, i32, i32 } %call_ret3, 4
  %logits3_0_V = call fastcc i29 @compute_layer.0.0(i32 %layer2_out_0_V, i32 %layer2_out_1_V, i32 %layer2_out_2_V, i32 %layer2_out_3_V, i32 %layer2_out_4_V)
  %res_V_write_assign_t = sext i29 %logits3_0_V to i32
  %res_V_write_assign = call fastcc i32 @linear(i32 %res_V_write_assign_t)
  ret i32 %res_V_write_assign
}

define internal fastcc { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } @compute_layer.0.0.0..1([5632 x i32]* nocapture %data_V, [5632 x i32]* nocapture %data_V1, [5632 x i32]* nocapture %data_V2, [5632 x i32]* nocapture %data_V3, [5632 x i32]* nocapture %data_V4, [5632 x i32]* nocapture %data_V5, [5632 x i32]* nocapture %data_V6, [5632 x i32]* nocapture %data_V7, [5632 x i32]* nocapture %data_V8, [5632 x i32]* nocapture %data_V9, [5632 x i32]* nocapture %data_V10, [5632 x i32]* nocapture %data_V11, [5632 x i32]* nocapture %data_V12, [5632 x i32]* nocapture %data_V13, [5632 x i32]* nocapture %data_V14, [5632 x i32]* nocapture %data_V15, [5632 x i32]* nocapture %data_V16, [5632 x i32]* nocapture %data_V17, [5632 x i32]* nocapture %data_V18, [5632 x i32]* nocapture %data_V19, [5632 x i32]* nocapture %data_V20, [5632 x i32]* nocapture %data_V21, [5632 x i32]* nocapture %data_V22, [5632 x i32]* nocapture %data_V23, [5632 x i32]* nocapture %data_V24, [5632 x i32]* nocapture %data_V25, [5632 x i32]* nocapture %data_V26, [5632 x i32]* nocapture %data_V27, [5632 x i32]* nocapture %data_V28, [5632 x i32]* nocapture %data_V29, i9 %data_V_offset, i5 %data_V_offset1) {
arrayctor.loop4.preheader:
  %data_V_offset1_read = call i5 @_ssdm_op_Read.ap_auto.i5(i5 %data_V_offset1)
  %data_V_offset_read = call i9 @_ssdm_op_Read.ap_auto.i9(i9 %data_V_offset)
  %data_V_offset_cast_c = zext i9 %data_V_offset_read to i14
  %tmp_13 = mul i14 11, %data_V_offset_cast_c
  %tmp_6 = trunc i14 %tmp_13 to i13
  %tmp_16_cast = zext i14 %tmp_13 to i64
  %data_V_addr = getelementptr [5632 x i32]* %data_V, i64 0, i64 %tmp_16_cast
  %tmp_16 = add i13 1, %tmp_6
  %tmp_17_cast = zext i13 %tmp_16 to i64
  %data_V_addr_1 = getelementptr [5632 x i32]* %data_V, i64 0, i64 %tmp_17_cast
  %tmp_17 = add i13 2, %tmp_6
  %tmp_18_cast = zext i13 %tmp_17 to i64
  %data_V_addr_2 = getelementptr [5632 x i32]* %data_V, i64 0, i64 %tmp_18_cast
  %tmp_18 = add i13 3, %tmp_6
  %tmp_19_cast = zext i13 %tmp_18 to i64
  %data_V_addr_3 = getelementptr [5632 x i32]* %data_V, i64 0, i64 %tmp_19_cast
  %tmp_19 = add i13 4, %tmp_6
  %tmp_20_cast = zext i13 %tmp_19 to i64
  %data_V_addr_4 = getelementptr [5632 x i32]* %data_V, i64 0, i64 %tmp_20_cast
  %tmp_20 = add i13 5, %tmp_6
  %tmp_21_cast = zext i13 %tmp_20 to i64
  %data_V_addr_5 = getelementptr [5632 x i32]* %data_V, i64 0, i64 %tmp_21_cast
  %tmp_21 = add i13 6, %tmp_6
  %tmp_22_cast = zext i13 %tmp_21 to i64
  %data_V_addr_6 = getelementptr [5632 x i32]* %data_V, i64 0, i64 %tmp_22_cast
  %tmp_22 = add i13 7, %tmp_6
  %tmp_23_cast = zext i13 %tmp_22 to i64
  %data_V_addr_7 = getelementptr [5632 x i32]* %data_V, i64 0, i64 %tmp_23_cast
  %tmp_23 = add i13 8, %tmp_6
  %tmp_24_cast = zext i13 %tmp_23 to i64
  %data_V_addr_8 = getelementptr [5632 x i32]* %data_V, i64 0, i64 %tmp_24_cast
  %tmp_24 = add i13 9, %tmp_6
  %tmp_25_cast = zext i13 %tmp_24 to i64
  %data_V_addr_9 = getelementptr [5632 x i32]* %data_V, i64 0, i64 %tmp_25_cast
  %tmp_25 = add i13 10, %tmp_6
  %tmp_26_cast = zext i13 %tmp_25 to i64
  %data_V_addr_10 = getelementptr [5632 x i32]* %data_V, i64 0, i64 %tmp_26_cast
  %data_V1_addr = getelementptr [5632 x i32]* %data_V1, i64 0, i64 %tmp_16_cast
  %data_V1_addr_1 = getelementptr [5632 x i32]* %data_V1, i64 0, i64 %tmp_17_cast
  %data_V1_addr_2 = getelementptr [5632 x i32]* %data_V1, i64 0, i64 %tmp_18_cast
  %data_V1_addr_3 = getelementptr [5632 x i32]* %data_V1, i64 0, i64 %tmp_19_cast
  %data_V1_addr_4 = getelementptr [5632 x i32]* %data_V1, i64 0, i64 %tmp_20_cast
  %data_V1_addr_5 = getelementptr [5632 x i32]* %data_V1, i64 0, i64 %tmp_21_cast
  %data_V1_addr_6 = getelementptr [5632 x i32]* %data_V1, i64 0, i64 %tmp_22_cast
  %data_V1_addr_7 = getelementptr [5632 x i32]* %data_V1, i64 0, i64 %tmp_23_cast
  %data_V1_addr_8 = getelementptr [5632 x i32]* %data_V1, i64 0, i64 %tmp_24_cast
  %data_V1_addr_9 = getelementptr [5632 x i32]* %data_V1, i64 0, i64 %tmp_25_cast
  %data_V1_addr_10 = getelementptr [5632 x i32]* %data_V1, i64 0, i64 %tmp_26_cast
  %data_V2_addr = getelementptr [5632 x i32]* %data_V2, i64 0, i64 %tmp_16_cast
  %data_V2_addr_1 = getelementptr [5632 x i32]* %data_V2, i64 0, i64 %tmp_17_cast
  %data_V2_addr_2 = getelementptr [5632 x i32]* %data_V2, i64 0, i64 %tmp_18_cast
  %data_V2_addr_3 = getelementptr [5632 x i32]* %data_V2, i64 0, i64 %tmp_19_cast
  %data_V2_addr_4 = getelementptr [5632 x i32]* %data_V2, i64 0, i64 %tmp_20_cast
  %data_V2_addr_5 = getelementptr [5632 x i32]* %data_V2, i64 0, i64 %tmp_21_cast
  %data_V2_addr_6 = getelementptr [5632 x i32]* %data_V2, i64 0, i64 %tmp_22_cast
  %data_V2_addr_7 = getelementptr [5632 x i32]* %data_V2, i64 0, i64 %tmp_23_cast
  %data_V2_addr_8 = getelementptr [5632 x i32]* %data_V2, i64 0, i64 %tmp_24_cast
  %data_V2_addr_9 = getelementptr [5632 x i32]* %data_V2, i64 0, i64 %tmp_25_cast
  %data_V2_addr_10 = getelementptr [5632 x i32]* %data_V2, i64 0, i64 %tmp_26_cast
  %data_V3_addr = getelementptr [5632 x i32]* %data_V3, i64 0, i64 %tmp_16_cast
  %data_V3_addr_1 = getelementptr [5632 x i32]* %data_V3, i64 0, i64 %tmp_17_cast
  %data_V3_addr_2 = getelementptr [5632 x i32]* %data_V3, i64 0, i64 %tmp_18_cast
  %data_V3_addr_3 = getelementptr [5632 x i32]* %data_V3, i64 0, i64 %tmp_19_cast
  %data_V3_addr_4 = getelementptr [5632 x i32]* %data_V3, i64 0, i64 %tmp_20_cast
  %data_V3_addr_5 = getelementptr [5632 x i32]* %data_V3, i64 0, i64 %tmp_21_cast
  %data_V3_addr_6 = getelementptr [5632 x i32]* %data_V3, i64 0, i64 %tmp_22_cast
  %data_V3_addr_7 = getelementptr [5632 x i32]* %data_V3, i64 0, i64 %tmp_23_cast
  %data_V3_addr_8 = getelementptr [5632 x i32]* %data_V3, i64 0, i64 %tmp_24_cast
  %data_V3_addr_9 = getelementptr [5632 x i32]* %data_V3, i64 0, i64 %tmp_25_cast
  %data_V3_addr_10 = getelementptr [5632 x i32]* %data_V3, i64 0, i64 %tmp_26_cast
  %data_V4_addr = getelementptr [5632 x i32]* %data_V4, i64 0, i64 %tmp_16_cast
  %data_V4_addr_1 = getelementptr [5632 x i32]* %data_V4, i64 0, i64 %tmp_17_cast
  %data_V4_addr_2 = getelementptr [5632 x i32]* %data_V4, i64 0, i64 %tmp_18_cast
  %data_V4_addr_3 = getelementptr [5632 x i32]* %data_V4, i64 0, i64 %tmp_19_cast
  %data_V4_addr_4 = getelementptr [5632 x i32]* %data_V4, i64 0, i64 %tmp_20_cast
  %data_V4_addr_5 = getelementptr [5632 x i32]* %data_V4, i64 0, i64 %tmp_21_cast
  %data_V4_addr_6 = getelementptr [5632 x i32]* %data_V4, i64 0, i64 %tmp_22_cast
  %data_V4_addr_7 = getelementptr [5632 x i32]* %data_V4, i64 0, i64 %tmp_23_cast
  %data_V4_addr_8 = getelementptr [5632 x i32]* %data_V4, i64 0, i64 %tmp_24_cast
  %data_V4_addr_9 = getelementptr [5632 x i32]* %data_V4, i64 0, i64 %tmp_25_cast
  %data_V4_addr_10 = getelementptr [5632 x i32]* %data_V4, i64 0, i64 %tmp_26_cast
  %data_V5_addr = getelementptr [5632 x i32]* %data_V5, i64 0, i64 %tmp_16_cast
  %data_V5_addr_1 = getelementptr [5632 x i32]* %data_V5, i64 0, i64 %tmp_17_cast
  %data_V5_addr_2 = getelementptr [5632 x i32]* %data_V5, i64 0, i64 %tmp_18_cast
  %data_V5_addr_3 = getelementptr [5632 x i32]* %data_V5, i64 0, i64 %tmp_19_cast
  %data_V5_addr_4 = getelementptr [5632 x i32]* %data_V5, i64 0, i64 %tmp_20_cast
  %data_V5_addr_5 = getelementptr [5632 x i32]* %data_V5, i64 0, i64 %tmp_21_cast
  %data_V5_addr_6 = getelementptr [5632 x i32]* %data_V5, i64 0, i64 %tmp_22_cast
  %data_V5_addr_7 = getelementptr [5632 x i32]* %data_V5, i64 0, i64 %tmp_23_cast
  %data_V5_addr_8 = getelementptr [5632 x i32]* %data_V5, i64 0, i64 %tmp_24_cast
  %data_V5_addr_9 = getelementptr [5632 x i32]* %data_V5, i64 0, i64 %tmp_25_cast
  %data_V5_addr_10 = getelementptr [5632 x i32]* %data_V5, i64 0, i64 %tmp_26_cast
  %data_V6_addr = getelementptr [5632 x i32]* %data_V6, i64 0, i64 %tmp_16_cast
  %data_V6_addr_1 = getelementptr [5632 x i32]* %data_V6, i64 0, i64 %tmp_17_cast
  %data_V6_addr_2 = getelementptr [5632 x i32]* %data_V6, i64 0, i64 %tmp_18_cast
  %data_V6_addr_3 = getelementptr [5632 x i32]* %data_V6, i64 0, i64 %tmp_19_cast
  %data_V6_addr_4 = getelementptr [5632 x i32]* %data_V6, i64 0, i64 %tmp_20_cast
  %data_V6_addr_5 = getelementptr [5632 x i32]* %data_V6, i64 0, i64 %tmp_21_cast
  %data_V6_addr_6 = getelementptr [5632 x i32]* %data_V6, i64 0, i64 %tmp_22_cast
  %data_V6_addr_7 = getelementptr [5632 x i32]* %data_V6, i64 0, i64 %tmp_23_cast
  %data_V6_addr_8 = getelementptr [5632 x i32]* %data_V6, i64 0, i64 %tmp_24_cast
  %data_V6_addr_9 = getelementptr [5632 x i32]* %data_V6, i64 0, i64 %tmp_25_cast
  %data_V6_addr_10 = getelementptr [5632 x i32]* %data_V6, i64 0, i64 %tmp_26_cast
  %data_V7_addr = getelementptr [5632 x i32]* %data_V7, i64 0, i64 %tmp_16_cast
  %data_V7_addr_1 = getelementptr [5632 x i32]* %data_V7, i64 0, i64 %tmp_17_cast
  %data_V7_addr_2 = getelementptr [5632 x i32]* %data_V7, i64 0, i64 %tmp_18_cast
  %data_V7_addr_3 = getelementptr [5632 x i32]* %data_V7, i64 0, i64 %tmp_19_cast
  %data_V7_addr_4 = getelementptr [5632 x i32]* %data_V7, i64 0, i64 %tmp_20_cast
  %data_V7_addr_5 = getelementptr [5632 x i32]* %data_V7, i64 0, i64 %tmp_21_cast
  %data_V7_addr_6 = getelementptr [5632 x i32]* %data_V7, i64 0, i64 %tmp_22_cast
  %data_V7_addr_7 = getelementptr [5632 x i32]* %data_V7, i64 0, i64 %tmp_23_cast
  %data_V7_addr_8 = getelementptr [5632 x i32]* %data_V7, i64 0, i64 %tmp_24_cast
  %data_V7_addr_9 = getelementptr [5632 x i32]* %data_V7, i64 0, i64 %tmp_25_cast
  %data_V7_addr_10 = getelementptr [5632 x i32]* %data_V7, i64 0, i64 %tmp_26_cast
  %data_V8_addr = getelementptr [5632 x i32]* %data_V8, i64 0, i64 %tmp_16_cast
  %data_V8_addr_1 = getelementptr [5632 x i32]* %data_V8, i64 0, i64 %tmp_17_cast
  %data_V8_addr_2 = getelementptr [5632 x i32]* %data_V8, i64 0, i64 %tmp_18_cast
  %data_V8_addr_3 = getelementptr [5632 x i32]* %data_V8, i64 0, i64 %tmp_19_cast
  %data_V8_addr_4 = getelementptr [5632 x i32]* %data_V8, i64 0, i64 %tmp_20_cast
  %data_V8_addr_5 = getelementptr [5632 x i32]* %data_V8, i64 0, i64 %tmp_21_cast
  %data_V8_addr_6 = getelementptr [5632 x i32]* %data_V8, i64 0, i64 %tmp_22_cast
  %data_V8_addr_7 = getelementptr [5632 x i32]* %data_V8, i64 0, i64 %tmp_23_cast
  %data_V8_addr_8 = getelementptr [5632 x i32]* %data_V8, i64 0, i64 %tmp_24_cast
  %data_V8_addr_9 = getelementptr [5632 x i32]* %data_V8, i64 0, i64 %tmp_25_cast
  %data_V8_addr_10 = getelementptr [5632 x i32]* %data_V8, i64 0, i64 %tmp_26_cast
  %data_V9_addr = getelementptr [5632 x i32]* %data_V9, i64 0, i64 %tmp_16_cast
  %data_V9_addr_1 = getelementptr [5632 x i32]* %data_V9, i64 0, i64 %tmp_17_cast
  %data_V9_addr_2 = getelementptr [5632 x i32]* %data_V9, i64 0, i64 %tmp_18_cast
  %data_V9_addr_3 = getelementptr [5632 x i32]* %data_V9, i64 0, i64 %tmp_19_cast
  %data_V9_addr_4 = getelementptr [5632 x i32]* %data_V9, i64 0, i64 %tmp_20_cast
  %data_V9_addr_5 = getelementptr [5632 x i32]* %data_V9, i64 0, i64 %tmp_21_cast
  %data_V9_addr_6 = getelementptr [5632 x i32]* %data_V9, i64 0, i64 %tmp_22_cast
  %data_V9_addr_7 = getelementptr [5632 x i32]* %data_V9, i64 0, i64 %tmp_23_cast
  %data_V9_addr_8 = getelementptr [5632 x i32]* %data_V9, i64 0, i64 %tmp_24_cast
  %data_V9_addr_9 = getelementptr [5632 x i32]* %data_V9, i64 0, i64 %tmp_25_cast
  %data_V9_addr_10 = getelementptr [5632 x i32]* %data_V9, i64 0, i64 %tmp_26_cast
  %data_V10_addr = getelementptr [5632 x i32]* %data_V10, i64 0, i64 %tmp_16_cast
  %data_V10_addr_1 = getelementptr [5632 x i32]* %data_V10, i64 0, i64 %tmp_17_cast
  %data_V10_addr_2 = getelementptr [5632 x i32]* %data_V10, i64 0, i64 %tmp_18_cast
  %data_V10_addr_3 = getelementptr [5632 x i32]* %data_V10, i64 0, i64 %tmp_19_cast
  %data_V10_addr_4 = getelementptr [5632 x i32]* %data_V10, i64 0, i64 %tmp_20_cast
  %data_V10_addr_5 = getelementptr [5632 x i32]* %data_V10, i64 0, i64 %tmp_21_cast
  %data_V10_addr_6 = getelementptr [5632 x i32]* %data_V10, i64 0, i64 %tmp_22_cast
  %data_V10_addr_7 = getelementptr [5632 x i32]* %data_V10, i64 0, i64 %tmp_23_cast
  %data_V10_addr_8 = getelementptr [5632 x i32]* %data_V10, i64 0, i64 %tmp_24_cast
  %data_V10_addr_9 = getelementptr [5632 x i32]* %data_V10, i64 0, i64 %tmp_25_cast
  %data_V10_addr_10 = getelementptr [5632 x i32]* %data_V10, i64 0, i64 %tmp_26_cast
  %data_V11_addr = getelementptr [5632 x i32]* %data_V11, i64 0, i64 %tmp_16_cast
  %data_V11_addr_1 = getelementptr [5632 x i32]* %data_V11, i64 0, i64 %tmp_17_cast
  %data_V11_addr_2 = getelementptr [5632 x i32]* %data_V11, i64 0, i64 %tmp_18_cast
  %data_V11_addr_3 = getelementptr [5632 x i32]* %data_V11, i64 0, i64 %tmp_19_cast
  %data_V11_addr_4 = getelementptr [5632 x i32]* %data_V11, i64 0, i64 %tmp_20_cast
  %data_V11_addr_5 = getelementptr [5632 x i32]* %data_V11, i64 0, i64 %tmp_21_cast
  %data_V11_addr_6 = getelementptr [5632 x i32]* %data_V11, i64 0, i64 %tmp_22_cast
  %data_V11_addr_7 = getelementptr [5632 x i32]* %data_V11, i64 0, i64 %tmp_23_cast
  %data_V11_addr_8 = getelementptr [5632 x i32]* %data_V11, i64 0, i64 %tmp_24_cast
  %data_V11_addr_9 = getelementptr [5632 x i32]* %data_V11, i64 0, i64 %tmp_25_cast
  %data_V11_addr_10 = getelementptr [5632 x i32]* %data_V11, i64 0, i64 %tmp_26_cast
  %data_V12_addr = getelementptr [5632 x i32]* %data_V12, i64 0, i64 %tmp_16_cast
  %data_V12_addr_1 = getelementptr [5632 x i32]* %data_V12, i64 0, i64 %tmp_17_cast
  %data_V12_addr_2 = getelementptr [5632 x i32]* %data_V12, i64 0, i64 %tmp_18_cast
  %data_V12_addr_3 = getelementptr [5632 x i32]* %data_V12, i64 0, i64 %tmp_19_cast
  %data_V12_addr_4 = getelementptr [5632 x i32]* %data_V12, i64 0, i64 %tmp_20_cast
  %data_V12_addr_5 = getelementptr [5632 x i32]* %data_V12, i64 0, i64 %tmp_21_cast
  %data_V12_addr_6 = getelementptr [5632 x i32]* %data_V12, i64 0, i64 %tmp_22_cast
  %data_V12_addr_7 = getelementptr [5632 x i32]* %data_V12, i64 0, i64 %tmp_23_cast
  %data_V12_addr_8 = getelementptr [5632 x i32]* %data_V12, i64 0, i64 %tmp_24_cast
  %data_V12_addr_9 = getelementptr [5632 x i32]* %data_V12, i64 0, i64 %tmp_25_cast
  %data_V12_addr_10 = getelementptr [5632 x i32]* %data_V12, i64 0, i64 %tmp_26_cast
  %data_V13_addr = getelementptr [5632 x i32]* %data_V13, i64 0, i64 %tmp_16_cast
  %data_V13_addr_1 = getelementptr [5632 x i32]* %data_V13, i64 0, i64 %tmp_17_cast
  %data_V13_addr_2 = getelementptr [5632 x i32]* %data_V13, i64 0, i64 %tmp_18_cast
  %data_V13_addr_3 = getelementptr [5632 x i32]* %data_V13, i64 0, i64 %tmp_19_cast
  %data_V13_addr_4 = getelementptr [5632 x i32]* %data_V13, i64 0, i64 %tmp_20_cast
  %data_V13_addr_5 = getelementptr [5632 x i32]* %data_V13, i64 0, i64 %tmp_21_cast
  %data_V13_addr_6 = getelementptr [5632 x i32]* %data_V13, i64 0, i64 %tmp_22_cast
  %data_V13_addr_7 = getelementptr [5632 x i32]* %data_V13, i64 0, i64 %tmp_23_cast
  %data_V13_addr_8 = getelementptr [5632 x i32]* %data_V13, i64 0, i64 %tmp_24_cast
  %data_V13_addr_9 = getelementptr [5632 x i32]* %data_V13, i64 0, i64 %tmp_25_cast
  %data_V13_addr_10 = getelementptr [5632 x i32]* %data_V13, i64 0, i64 %tmp_26_cast
  %data_V14_addr = getelementptr [5632 x i32]* %data_V14, i64 0, i64 %tmp_16_cast
  %data_V14_addr_1 = getelementptr [5632 x i32]* %data_V14, i64 0, i64 %tmp_17_cast
  %data_V14_addr_2 = getelementptr [5632 x i32]* %data_V14, i64 0, i64 %tmp_18_cast
  %data_V14_addr_3 = getelementptr [5632 x i32]* %data_V14, i64 0, i64 %tmp_19_cast
  %data_V14_addr_4 = getelementptr [5632 x i32]* %data_V14, i64 0, i64 %tmp_20_cast
  %data_V14_addr_5 = getelementptr [5632 x i32]* %data_V14, i64 0, i64 %tmp_21_cast
  %data_V14_addr_6 = getelementptr [5632 x i32]* %data_V14, i64 0, i64 %tmp_22_cast
  %data_V14_addr_7 = getelementptr [5632 x i32]* %data_V14, i64 0, i64 %tmp_23_cast
  %data_V14_addr_8 = getelementptr [5632 x i32]* %data_V14, i64 0, i64 %tmp_24_cast
  %data_V14_addr_9 = getelementptr [5632 x i32]* %data_V14, i64 0, i64 %tmp_25_cast
  %data_V14_addr_10 = getelementptr [5632 x i32]* %data_V14, i64 0, i64 %tmp_26_cast
  %data_V15_addr = getelementptr [5632 x i32]* %data_V15, i64 0, i64 %tmp_16_cast
  %data_V15_addr_1 = getelementptr [5632 x i32]* %data_V15, i64 0, i64 %tmp_17_cast
  %data_V15_addr_2 = getelementptr [5632 x i32]* %data_V15, i64 0, i64 %tmp_18_cast
  %data_V15_addr_3 = getelementptr [5632 x i32]* %data_V15, i64 0, i64 %tmp_19_cast
  %data_V15_addr_4 = getelementptr [5632 x i32]* %data_V15, i64 0, i64 %tmp_20_cast
  %data_V15_addr_5 = getelementptr [5632 x i32]* %data_V15, i64 0, i64 %tmp_21_cast
  %data_V15_addr_6 = getelementptr [5632 x i32]* %data_V15, i64 0, i64 %tmp_22_cast
  %data_V15_addr_7 = getelementptr [5632 x i32]* %data_V15, i64 0, i64 %tmp_23_cast
  %data_V15_addr_8 = getelementptr [5632 x i32]* %data_V15, i64 0, i64 %tmp_24_cast
  %data_V15_addr_9 = getelementptr [5632 x i32]* %data_V15, i64 0, i64 %tmp_25_cast
  %data_V15_addr_10 = getelementptr [5632 x i32]* %data_V15, i64 0, i64 %tmp_26_cast
  %data_V16_addr = getelementptr [5632 x i32]* %data_V16, i64 0, i64 %tmp_16_cast
  %data_V16_addr_1 = getelementptr [5632 x i32]* %data_V16, i64 0, i64 %tmp_17_cast
  %data_V16_addr_2 = getelementptr [5632 x i32]* %data_V16, i64 0, i64 %tmp_18_cast
  %data_V16_addr_3 = getelementptr [5632 x i32]* %data_V16, i64 0, i64 %tmp_19_cast
  %data_V16_addr_4 = getelementptr [5632 x i32]* %data_V16, i64 0, i64 %tmp_20_cast
  %data_V16_addr_5 = getelementptr [5632 x i32]* %data_V16, i64 0, i64 %tmp_21_cast
  %data_V16_addr_6 = getelementptr [5632 x i32]* %data_V16, i64 0, i64 %tmp_22_cast
  %data_V16_addr_7 = getelementptr [5632 x i32]* %data_V16, i64 0, i64 %tmp_23_cast
  %data_V16_addr_8 = getelementptr [5632 x i32]* %data_V16, i64 0, i64 %tmp_24_cast
  %data_V16_addr_9 = getelementptr [5632 x i32]* %data_V16, i64 0, i64 %tmp_25_cast
  %data_V16_addr_10 = getelementptr [5632 x i32]* %data_V16, i64 0, i64 %tmp_26_cast
  %data_V17_addr = getelementptr [5632 x i32]* %data_V17, i64 0, i64 %tmp_16_cast
  %data_V17_addr_1 = getelementptr [5632 x i32]* %data_V17, i64 0, i64 %tmp_17_cast
  %data_V17_addr_2 = getelementptr [5632 x i32]* %data_V17, i64 0, i64 %tmp_18_cast
  %data_V17_addr_3 = getelementptr [5632 x i32]* %data_V17, i64 0, i64 %tmp_19_cast
  %data_V17_addr_4 = getelementptr [5632 x i32]* %data_V17, i64 0, i64 %tmp_20_cast
  %data_V17_addr_5 = getelementptr [5632 x i32]* %data_V17, i64 0, i64 %tmp_21_cast
  %data_V17_addr_6 = getelementptr [5632 x i32]* %data_V17, i64 0, i64 %tmp_22_cast
  %data_V17_addr_7 = getelementptr [5632 x i32]* %data_V17, i64 0, i64 %tmp_23_cast
  %data_V17_addr_8 = getelementptr [5632 x i32]* %data_V17, i64 0, i64 %tmp_24_cast
  %data_V17_addr_9 = getelementptr [5632 x i32]* %data_V17, i64 0, i64 %tmp_25_cast
  %data_V17_addr_10 = getelementptr [5632 x i32]* %data_V17, i64 0, i64 %tmp_26_cast
  %data_V18_addr = getelementptr [5632 x i32]* %data_V18, i64 0, i64 %tmp_16_cast
  %data_V18_addr_1 = getelementptr [5632 x i32]* %data_V18, i64 0, i64 %tmp_17_cast
  %data_V18_addr_2 = getelementptr [5632 x i32]* %data_V18, i64 0, i64 %tmp_18_cast
  %data_V18_addr_3 = getelementptr [5632 x i32]* %data_V18, i64 0, i64 %tmp_19_cast
  %data_V18_addr_4 = getelementptr [5632 x i32]* %data_V18, i64 0, i64 %tmp_20_cast
  %data_V18_addr_5 = getelementptr [5632 x i32]* %data_V18, i64 0, i64 %tmp_21_cast
  %data_V18_addr_6 = getelementptr [5632 x i32]* %data_V18, i64 0, i64 %tmp_22_cast
  %data_V18_addr_7 = getelementptr [5632 x i32]* %data_V18, i64 0, i64 %tmp_23_cast
  %data_V18_addr_8 = getelementptr [5632 x i32]* %data_V18, i64 0, i64 %tmp_24_cast
  %data_V18_addr_9 = getelementptr [5632 x i32]* %data_V18, i64 0, i64 %tmp_25_cast
  %data_V18_addr_10 = getelementptr [5632 x i32]* %data_V18, i64 0, i64 %tmp_26_cast
  %data_V19_addr = getelementptr [5632 x i32]* %data_V19, i64 0, i64 %tmp_16_cast
  %data_V19_addr_1 = getelementptr [5632 x i32]* %data_V19, i64 0, i64 %tmp_17_cast
  %data_V19_addr_2 = getelementptr [5632 x i32]* %data_V19, i64 0, i64 %tmp_18_cast
  %data_V19_addr_3 = getelementptr [5632 x i32]* %data_V19, i64 0, i64 %tmp_19_cast
  %data_V19_addr_4 = getelementptr [5632 x i32]* %data_V19, i64 0, i64 %tmp_20_cast
  %data_V19_addr_5 = getelementptr [5632 x i32]* %data_V19, i64 0, i64 %tmp_21_cast
  %data_V19_addr_6 = getelementptr [5632 x i32]* %data_V19, i64 0, i64 %tmp_22_cast
  %data_V19_addr_7 = getelementptr [5632 x i32]* %data_V19, i64 0, i64 %tmp_23_cast
  %data_V19_addr_8 = getelementptr [5632 x i32]* %data_V19, i64 0, i64 %tmp_24_cast
  %data_V19_addr_9 = getelementptr [5632 x i32]* %data_V19, i64 0, i64 %tmp_25_cast
  %data_V19_addr_10 = getelementptr [5632 x i32]* %data_V19, i64 0, i64 %tmp_26_cast
  %data_V20_addr = getelementptr [5632 x i32]* %data_V20, i64 0, i64 %tmp_16_cast
  %data_V20_addr_1 = getelementptr [5632 x i32]* %data_V20, i64 0, i64 %tmp_17_cast
  %data_V20_addr_2 = getelementptr [5632 x i32]* %data_V20, i64 0, i64 %tmp_18_cast
  %data_V20_addr_3 = getelementptr [5632 x i32]* %data_V20, i64 0, i64 %tmp_19_cast
  %data_V20_addr_4 = getelementptr [5632 x i32]* %data_V20, i64 0, i64 %tmp_20_cast
  %data_V20_addr_5 = getelementptr [5632 x i32]* %data_V20, i64 0, i64 %tmp_21_cast
  %data_V20_addr_6 = getelementptr [5632 x i32]* %data_V20, i64 0, i64 %tmp_22_cast
  %data_V20_addr_7 = getelementptr [5632 x i32]* %data_V20, i64 0, i64 %tmp_23_cast
  %data_V20_addr_8 = getelementptr [5632 x i32]* %data_V20, i64 0, i64 %tmp_24_cast
  %data_V20_addr_9 = getelementptr [5632 x i32]* %data_V20, i64 0, i64 %tmp_25_cast
  %data_V20_addr_10 = getelementptr [5632 x i32]* %data_V20, i64 0, i64 %tmp_26_cast
  %data_V21_addr = getelementptr [5632 x i32]* %data_V21, i64 0, i64 %tmp_16_cast
  %data_V21_addr_1 = getelementptr [5632 x i32]* %data_V21, i64 0, i64 %tmp_17_cast
  %data_V21_addr_2 = getelementptr [5632 x i32]* %data_V21, i64 0, i64 %tmp_18_cast
  %data_V21_addr_3 = getelementptr [5632 x i32]* %data_V21, i64 0, i64 %tmp_19_cast
  %data_V21_addr_4 = getelementptr [5632 x i32]* %data_V21, i64 0, i64 %tmp_20_cast
  %data_V21_addr_5 = getelementptr [5632 x i32]* %data_V21, i64 0, i64 %tmp_21_cast
  %data_V21_addr_6 = getelementptr [5632 x i32]* %data_V21, i64 0, i64 %tmp_22_cast
  %data_V21_addr_7 = getelementptr [5632 x i32]* %data_V21, i64 0, i64 %tmp_23_cast
  %data_V21_addr_8 = getelementptr [5632 x i32]* %data_V21, i64 0, i64 %tmp_24_cast
  %data_V21_addr_9 = getelementptr [5632 x i32]* %data_V21, i64 0, i64 %tmp_25_cast
  %data_V21_addr_10 = getelementptr [5632 x i32]* %data_V21, i64 0, i64 %tmp_26_cast
  %data_V22_addr = getelementptr [5632 x i32]* %data_V22, i64 0, i64 %tmp_16_cast
  %data_V22_addr_1 = getelementptr [5632 x i32]* %data_V22, i64 0, i64 %tmp_17_cast
  %data_V22_addr_2 = getelementptr [5632 x i32]* %data_V22, i64 0, i64 %tmp_18_cast
  %data_V22_addr_3 = getelementptr [5632 x i32]* %data_V22, i64 0, i64 %tmp_19_cast
  %data_V22_addr_4 = getelementptr [5632 x i32]* %data_V22, i64 0, i64 %tmp_20_cast
  %data_V22_addr_5 = getelementptr [5632 x i32]* %data_V22, i64 0, i64 %tmp_21_cast
  %data_V22_addr_6 = getelementptr [5632 x i32]* %data_V22, i64 0, i64 %tmp_22_cast
  %data_V22_addr_7 = getelementptr [5632 x i32]* %data_V22, i64 0, i64 %tmp_23_cast
  %data_V22_addr_8 = getelementptr [5632 x i32]* %data_V22, i64 0, i64 %tmp_24_cast
  %data_V22_addr_9 = getelementptr [5632 x i32]* %data_V22, i64 0, i64 %tmp_25_cast
  %data_V22_addr_10 = getelementptr [5632 x i32]* %data_V22, i64 0, i64 %tmp_26_cast
  %data_V23_addr = getelementptr [5632 x i32]* %data_V23, i64 0, i64 %tmp_16_cast
  %data_V23_addr_1 = getelementptr [5632 x i32]* %data_V23, i64 0, i64 %tmp_17_cast
  %data_V23_addr_2 = getelementptr [5632 x i32]* %data_V23, i64 0, i64 %tmp_18_cast
  %data_V23_addr_3 = getelementptr [5632 x i32]* %data_V23, i64 0, i64 %tmp_19_cast
  %data_V23_addr_4 = getelementptr [5632 x i32]* %data_V23, i64 0, i64 %tmp_20_cast
  %data_V23_addr_5 = getelementptr [5632 x i32]* %data_V23, i64 0, i64 %tmp_21_cast
  %data_V23_addr_6 = getelementptr [5632 x i32]* %data_V23, i64 0, i64 %tmp_22_cast
  %data_V23_addr_7 = getelementptr [5632 x i32]* %data_V23, i64 0, i64 %tmp_23_cast
  %data_V23_addr_8 = getelementptr [5632 x i32]* %data_V23, i64 0, i64 %tmp_24_cast
  %data_V23_addr_9 = getelementptr [5632 x i32]* %data_V23, i64 0, i64 %tmp_25_cast
  %data_V23_addr_10 = getelementptr [5632 x i32]* %data_V23, i64 0, i64 %tmp_26_cast
  %data_V24_addr = getelementptr [5632 x i32]* %data_V24, i64 0, i64 %tmp_16_cast
  %data_V24_addr_1 = getelementptr [5632 x i32]* %data_V24, i64 0, i64 %tmp_17_cast
  %data_V24_addr_2 = getelementptr [5632 x i32]* %data_V24, i64 0, i64 %tmp_18_cast
  %data_V24_addr_3 = getelementptr [5632 x i32]* %data_V24, i64 0, i64 %tmp_19_cast
  %data_V24_addr_4 = getelementptr [5632 x i32]* %data_V24, i64 0, i64 %tmp_20_cast
  %data_V24_addr_5 = getelementptr [5632 x i32]* %data_V24, i64 0, i64 %tmp_21_cast
  %data_V24_addr_6 = getelementptr [5632 x i32]* %data_V24, i64 0, i64 %tmp_22_cast
  %data_V24_addr_7 = getelementptr [5632 x i32]* %data_V24, i64 0, i64 %tmp_23_cast
  %data_V24_addr_8 = getelementptr [5632 x i32]* %data_V24, i64 0, i64 %tmp_24_cast
  %data_V24_addr_9 = getelementptr [5632 x i32]* %data_V24, i64 0, i64 %tmp_25_cast
  %data_V24_addr_10 = getelementptr [5632 x i32]* %data_V24, i64 0, i64 %tmp_26_cast
  %data_V25_addr = getelementptr [5632 x i32]* %data_V25, i64 0, i64 %tmp_16_cast
  %data_V25_addr_1 = getelementptr [5632 x i32]* %data_V25, i64 0, i64 %tmp_17_cast
  %data_V25_addr_2 = getelementptr [5632 x i32]* %data_V25, i64 0, i64 %tmp_18_cast
  %data_V25_addr_3 = getelementptr [5632 x i32]* %data_V25, i64 0, i64 %tmp_19_cast
  %data_V25_addr_4 = getelementptr [5632 x i32]* %data_V25, i64 0, i64 %tmp_20_cast
  %data_V25_addr_5 = getelementptr [5632 x i32]* %data_V25, i64 0, i64 %tmp_21_cast
  %data_V25_addr_6 = getelementptr [5632 x i32]* %data_V25, i64 0, i64 %tmp_22_cast
  %data_V25_addr_7 = getelementptr [5632 x i32]* %data_V25, i64 0, i64 %tmp_23_cast
  %data_V25_addr_8 = getelementptr [5632 x i32]* %data_V25, i64 0, i64 %tmp_24_cast
  %data_V25_addr_9 = getelementptr [5632 x i32]* %data_V25, i64 0, i64 %tmp_25_cast
  %data_V25_addr_10 = getelementptr [5632 x i32]* %data_V25, i64 0, i64 %tmp_26_cast
  %data_V26_addr = getelementptr [5632 x i32]* %data_V26, i64 0, i64 %tmp_16_cast
  %data_V26_addr_1 = getelementptr [5632 x i32]* %data_V26, i64 0, i64 %tmp_17_cast
  %data_V26_addr_2 = getelementptr [5632 x i32]* %data_V26, i64 0, i64 %tmp_18_cast
  %data_V26_addr_3 = getelementptr [5632 x i32]* %data_V26, i64 0, i64 %tmp_19_cast
  %data_V26_addr_4 = getelementptr [5632 x i32]* %data_V26, i64 0, i64 %tmp_20_cast
  %data_V26_addr_5 = getelementptr [5632 x i32]* %data_V26, i64 0, i64 %tmp_21_cast
  %data_V26_addr_6 = getelementptr [5632 x i32]* %data_V26, i64 0, i64 %tmp_22_cast
  %data_V26_addr_7 = getelementptr [5632 x i32]* %data_V26, i64 0, i64 %tmp_23_cast
  %data_V26_addr_8 = getelementptr [5632 x i32]* %data_V26, i64 0, i64 %tmp_24_cast
  %data_V26_addr_9 = getelementptr [5632 x i32]* %data_V26, i64 0, i64 %tmp_25_cast
  %data_V26_addr_10 = getelementptr [5632 x i32]* %data_V26, i64 0, i64 %tmp_26_cast
  %data_V27_addr = getelementptr [5632 x i32]* %data_V27, i64 0, i64 %tmp_16_cast
  %data_V27_addr_1 = getelementptr [5632 x i32]* %data_V27, i64 0, i64 %tmp_17_cast
  %data_V27_addr_2 = getelementptr [5632 x i32]* %data_V27, i64 0, i64 %tmp_18_cast
  %data_V27_addr_3 = getelementptr [5632 x i32]* %data_V27, i64 0, i64 %tmp_19_cast
  %data_V27_addr_4 = getelementptr [5632 x i32]* %data_V27, i64 0, i64 %tmp_20_cast
  %data_V27_addr_5 = getelementptr [5632 x i32]* %data_V27, i64 0, i64 %tmp_21_cast
  %data_V27_addr_6 = getelementptr [5632 x i32]* %data_V27, i64 0, i64 %tmp_22_cast
  %data_V27_addr_7 = getelementptr [5632 x i32]* %data_V27, i64 0, i64 %tmp_23_cast
  %data_V27_addr_8 = getelementptr [5632 x i32]* %data_V27, i64 0, i64 %tmp_24_cast
  %data_V27_addr_9 = getelementptr [5632 x i32]* %data_V27, i64 0, i64 %tmp_25_cast
  %data_V27_addr_10 = getelementptr [5632 x i32]* %data_V27, i64 0, i64 %tmp_26_cast
  %data_V28_addr = getelementptr [5632 x i32]* %data_V28, i64 0, i64 %tmp_16_cast
  %data_V28_addr_1 = getelementptr [5632 x i32]* %data_V28, i64 0, i64 %tmp_17_cast
  %data_V28_addr_2 = getelementptr [5632 x i32]* %data_V28, i64 0, i64 %tmp_18_cast
  %data_V28_addr_3 = getelementptr [5632 x i32]* %data_V28, i64 0, i64 %tmp_19_cast
  %data_V28_addr_4 = getelementptr [5632 x i32]* %data_V28, i64 0, i64 %tmp_20_cast
  %data_V28_addr_5 = getelementptr [5632 x i32]* %data_V28, i64 0, i64 %tmp_21_cast
  %data_V28_addr_6 = getelementptr [5632 x i32]* %data_V28, i64 0, i64 %tmp_22_cast
  %data_V28_addr_7 = getelementptr [5632 x i32]* %data_V28, i64 0, i64 %tmp_23_cast
  %data_V28_addr_8 = getelementptr [5632 x i32]* %data_V28, i64 0, i64 %tmp_24_cast
  %data_V28_addr_9 = getelementptr [5632 x i32]* %data_V28, i64 0, i64 %tmp_25_cast
  %data_V28_addr_10 = getelementptr [5632 x i32]* %data_V28, i64 0, i64 %tmp_26_cast
  %data_V29_addr = getelementptr [5632 x i32]* %data_V29, i64 0, i64 %tmp_16_cast
  %data_V29_addr_1 = getelementptr [5632 x i32]* %data_V29, i64 0, i64 %tmp_17_cast
  %data_V29_addr_2 = getelementptr [5632 x i32]* %data_V29, i64 0, i64 %tmp_18_cast
  %data_V29_addr_3 = getelementptr [5632 x i32]* %data_V29, i64 0, i64 %tmp_19_cast
  %data_V29_addr_4 = getelementptr [5632 x i32]* %data_V29, i64 0, i64 %tmp_20_cast
  %data_V29_addr_5 = getelementptr [5632 x i32]* %data_V29, i64 0, i64 %tmp_21_cast
  %data_V29_addr_6 = getelementptr [5632 x i32]* %data_V29, i64 0, i64 %tmp_22_cast
  %data_V29_addr_7 = getelementptr [5632 x i32]* %data_V29, i64 0, i64 %tmp_23_cast
  %data_V29_addr_8 = getelementptr [5632 x i32]* %data_V29, i64 0, i64 %tmp_24_cast
  %data_V29_addr_9 = getelementptr [5632 x i32]* %data_V29, i64 0, i64 %tmp_25_cast
  %data_V29_addr_10 = getelementptr [5632 x i32]* %data_V29, i64 0, i64 %tmp_26_cast
  %tmp = call i32 (...)* @_ssdm_op_SpecRegionBegin([12 x i8]* @p_str14)
  call void (...)* @_ssdm_op_SpecPipeline(i32 1, i32 1, i32 1, i32 0, [1 x i8]* @p_str6) nounwind
  call void (...)* @_ssdm_op_SpecResourceLimit(i32 165, [4 x i8]* @p_str410, [1 x i8]* @p_str6, [1 x i8]* @p_str6, [1 x i8]* @p_str6) nounwind
  %empty = call i32 (...)* @_ssdm_op_SpecRegionEnd([12 x i8]* @p_str14, i32 %tmp)
  %data_V_load = load i32* %data_V_addr, align 4
  %data_V1_load = load i32* %data_V1_addr, align 4
  %data_V2_load = load i32* %data_V2_addr, align 4
  %data_V3_load = load i32* %data_V3_addr, align 4
  %data_V4_load = load i32* %data_V4_addr, align 4
  %data_V5_load = load i32* %data_V5_addr, align 4
  %data_V6_load = load i32* %data_V6_addr, align 4
  %data_V7_load = load i32* %data_V7_addr, align 4
  %data_V8_load = load i32* %data_V8_addr, align 4
  %data_V9_load = load i32* %data_V9_addr, align 4
  %data_V10_load = load i32* %data_V10_addr, align 4
  %data_V11_load = load i32* %data_V11_addr, align 4
  %data_V12_load = load i32* %data_V12_addr, align 4
  %data_V13_load = load i32* %data_V13_addr, align 4
  %data_V14_load = load i32* %data_V14_addr, align 4
  %data_V15_load = load i32* %data_V15_addr, align 4
  %data_V16_load = load i32* %data_V16_addr, align 4
  %data_V17_load = load i32* %data_V17_addr, align 4
  %data_V18_load = load i32* %data_V18_addr, align 4
  %data_V19_load = load i32* %data_V19_addr, align 4
  %data_V20_load = load i32* %data_V20_addr, align 4
  %data_V21_load = load i32* %data_V21_addr, align 4
  %data_V22_load = load i32* %data_V22_addr, align 4
  %data_V23_load = load i32* %data_V23_addr, align 4
  %data_V24_load = load i32* %data_V24_addr, align 4
  %data_V25_load = load i32* %data_V25_addr, align 4
  %data_V26_load = load i32* %data_V26_addr, align 4
  %data_V27_load = load i32* %data_V27_addr, align 4
  %data_V28_load = load i32* %data_V28_addr, align 4
  %data_V29_load = load i32* %data_V29_addr, align 4
  %tmp_s = call i32 @_ssdm_op_Mux.ap_auto.30i32.i5(i32 %data_V_load, i32 %data_V1_load, i32 %data_V2_load, i32 %data_V3_load, i32 %data_V4_load, i32 %data_V5_load, i32 %data_V6_load, i32 %data_V7_load, i32 %data_V8_load, i32 %data_V9_load, i32 %data_V10_load, i32 %data_V11_load, i32 %data_V12_load, i32 %data_V13_load, i32 %data_V14_load, i32 %data_V15_load, i32 %data_V16_load, i32 %data_V17_load, i32 %data_V18_load, i32 %data_V19_load, i32 %data_V20_load, i32 %data_V21_load, i32 %data_V22_load, i32 %data_V23_load, i32 %data_V24_load, i32 %data_V25_load, i32 %data_V26_load, i32 %data_V27_load, i32 %data_V28_load, i32 %data_V29_load, i5 %data_V_offset1_read)
  %OP1_V_cast4 = sext i32 %tmp_s to i43
  %OP1_V_cast5 = sext i32 %tmp_s to i47
  %OP1_V_cast6 = sext i32 %tmp_s to i45
  %OP1_V_cast7 = sext i32 %tmp_s to i44
  %OP1_V_cast8 = sext i32 %tmp_s to i46
  %OP1_V_cast = sext i32 %tmp_s to i48
  %p_Val2_s = mul i48 -37470, %OP1_V_cast
  %tmp_14 = call i30 @_ssdm_op_PartSelect.i30.i48.i32.i32(i48 %p_Val2_s, i32 18, i32 47)
  %mult_0_0_V = sext i30 %tmp_14 to i32
  %p_Val2_0_1 = mul i46 10582, %OP1_V_cast8
  %tmp_15 = call i28 @_ssdm_op_PartSelect.i28.i46.i32.i32(i46 %p_Val2_0_1, i32 18, i32 45)
  %mult_0_1_V = sext i28 %tmp_15 to i32
  %p_Val2_0_2 = mul i46 -13468, %OP1_V_cast8
  %tmp_7 = call i28 @_ssdm_op_PartSelect.i28.i46.i32.i32(i46 %p_Val2_0_2, i32 18, i32 45)
  %mult_0_2_V_cast = sext i28 %tmp_7 to i30
  %p_Val2_0_3 = mul i44 3126, %OP1_V_cast7
  %tmp_26 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_0_3, i32 18, i32 43)
  %mult_0_3_V = sext i26 %tmp_26 to i32
  %p_Val2_0_4 = mul i45 6626, %OP1_V_cast6
  %tmp_27 = call i27 @_ssdm_op_PartSelect.i27.i45.i32.i32(i45 %p_Val2_0_4, i32 18, i32 44)
  %mult_0_4_V = sext i27 %tmp_27 to i32
  %p_Val2_0_5 = mul i46 -10705, %OP1_V_cast8
  %tmp_8 = call i28 @_ssdm_op_PartSelect.i28.i46.i32.i32(i46 %p_Val2_0_5, i32 18, i32 45)
  %mult_0_5_V_cast = sext i28 %tmp_8 to i31
  %p_Val2_0_6 = mul i47 -16441, %OP1_V_cast5
  %tmp_28 = call i29 @_ssdm_op_PartSelect.i29.i47.i32.i32(i47 %p_Val2_0_6, i32 18, i32 46)
  %mult_0_6_V = sext i29 %tmp_28 to i32
  %p_Val2_0_7 = mul i47 17793, %OP1_V_cast5
  %tmp_9 = call i29 @_ssdm_op_PartSelect.i29.i47.i32.i32(i47 %p_Val2_0_7, i32 18, i32 46)
  %mult_0_7_V_cast = sext i29 %tmp_9 to i30
  %p_Val2_0_8 = mul i47 -20159, %OP1_V_cast5
  %tmp_29 = call i29 @_ssdm_op_PartSelect.i29.i47.i32.i32(i47 %p_Val2_0_8, i32 18, i32 46)
  %mult_0_8_V = sext i29 %tmp_29 to i32
  %p_Val2_0_9 = mul i47 17905, %OP1_V_cast5
  %tmp_30 = call i29 @_ssdm_op_PartSelect.i29.i47.i32.i32(i47 %p_Val2_0_9, i32 18, i32 46)
  %mult_0_9_V = sext i29 %tmp_30 to i32
  %p_Val2_0_s = mul i45 4866, %OP1_V_cast6
  %tmp_31 = call i27 @_ssdm_op_PartSelect.i27.i45.i32.i32(i45 %p_Val2_0_s, i32 18, i32 44)
  %mult_0_10_V = sext i27 %tmp_31 to i32
  %p_Val2_0_10 = mul i46 10308, %OP1_V_cast8
  %tmp_32 = call i28 @_ssdm_op_PartSelect.i28.i46.i32.i32(i46 %p_Val2_0_10, i32 18, i32 45)
  %mult_0_11_V = sext i28 %tmp_32 to i32
  %p_Val2_0_11 = mul i43 -731, %OP1_V_cast4
  %tmp_33 = call i25 @_ssdm_op_PartSelect.i25.i43.i32.i32(i43 %p_Val2_0_11, i32 18, i32 42)
  %mult_0_12_V = sext i25 %tmp_33 to i32
  %p_Val2_0_12 = mul i47 -23510, %OP1_V_cast5
  %tmp_34 = call i29 @_ssdm_op_PartSelect.i29.i47.i32.i32(i47 %p_Val2_0_12, i32 18, i32 46)
  %mult_0_13_V = sext i29 %tmp_34 to i32
  %p_Val2_0_13 = mul i48 -40297, %OP1_V_cast
  %tmp_35 = call i30 @_ssdm_op_PartSelect.i30.i48.i32.i32(i48 %p_Val2_0_13, i32 18, i32 47)
  %mult_0_14_V = sext i30 %tmp_35 to i32
  %data_V_load_1 = load i32* %data_V_addr_1, align 4
  %data_V1_load_1 = load i32* %data_V1_addr_1, align 4
  %data_V2_load_1 = load i32* %data_V2_addr_1, align 4
  %data_V3_load_1 = load i32* %data_V3_addr_1, align 4
  %data_V4_load_1 = load i32* %data_V4_addr_1, align 4
  %data_V5_load_1 = load i32* %data_V5_addr_1, align 4
  %data_V6_load_1 = load i32* %data_V6_addr_1, align 4
  %data_V7_load_1 = load i32* %data_V7_addr_1, align 4
  %data_V8_load_1 = load i32* %data_V8_addr_1, align 4
  %data_V9_load_1 = load i32* %data_V9_addr_1, align 4
  %data_V10_load_1 = load i32* %data_V10_addr_1, align 4
  %data_V11_load_1 = load i32* %data_V11_addr_1, align 4
  %data_V12_load_1 = load i32* %data_V12_addr_1, align 4
  %data_V13_load_1 = load i32* %data_V13_addr_1, align 4
  %data_V14_load_1 = load i32* %data_V14_addr_1, align 4
  %data_V15_load_1 = load i32* %data_V15_addr_1, align 4
  %data_V16_load_1 = load i32* %data_V16_addr_1, align 4
  %data_V17_load_1 = load i32* %data_V17_addr_1, align 4
  %data_V18_load_1 = load i32* %data_V18_addr_1, align 4
  %data_V19_load_1 = load i32* %data_V19_addr_1, align 4
  %data_V20_load_1 = load i32* %data_V20_addr_1, align 4
  %data_V21_load_1 = load i32* %data_V21_addr_1, align 4
  %data_V22_load_1 = load i32* %data_V22_addr_1, align 4
  %data_V23_load_1 = load i32* %data_V23_addr_1, align 4
  %data_V24_load_1 = load i32* %data_V24_addr_1, align 4
  %data_V25_load_1 = load i32* %data_V25_addr_1, align 4
  %data_V26_load_1 = load i32* %data_V26_addr_1, align 4
  %data_V27_load_1 = load i32* %data_V27_addr_1, align 4
  %data_V28_load_1 = load i32* %data_V28_addr_1, align 4
  %data_V29_load_1 = load i32* %data_V29_addr_1, align 4
  %tmp_36 = call i32 @_ssdm_op_Mux.ap_auto.30i32.i5(i32 %data_V_load_1, i32 %data_V1_load_1, i32 %data_V2_load_1, i32 %data_V3_load_1, i32 %data_V4_load_1, i32 %data_V5_load_1, i32 %data_V6_load_1, i32 %data_V7_load_1, i32 %data_V8_load_1, i32 %data_V9_load_1, i32 %data_V10_load_1, i32 %data_V11_load_1, i32 %data_V12_load_1, i32 %data_V13_load_1, i32 %data_V14_load_1, i32 %data_V15_load_1, i32 %data_V16_load_1, i32 %data_V17_load_1, i32 %data_V18_load_1, i32 %data_V19_load_1, i32 %data_V20_load_1, i32 %data_V21_load_1, i32 %data_V22_load_1, i32 %data_V23_load_1, i32 %data_V24_load_1, i32 %data_V25_load_1, i32 %data_V26_load_1, i32 %data_V27_load_1, i32 %data_V28_load_1, i32 %data_V29_load_1, i5 %data_V_offset1_read)
  %OP1_V_1_cast3 = sext i32 %tmp_36 to i49
  %OP1_V_1_cast4 = sext i32 %tmp_36 to i46
  %OP1_V_1_cast5 = sext i32 %tmp_36 to i47
  %OP1_V_1_cast6 = sext i32 %tmp_36 to i45
  %OP1_V_1_cast7 = sext i32 %tmp_36 to i50
  %OP1_V_1_cast8 = sext i32 %tmp_36 to i48
  %OP1_V_1_cast = sext i32 %tmp_36 to i44
  %p_Val2_1 = mul i44 2518, %OP1_V_1_cast
  %tmp_37 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_1, i32 18, i32 43)
  %mult_1_0_V = sext i26 %tmp_37 to i32
  %p_Val2_1_1 = mul i48 42507, %OP1_V_1_cast8
  %tmp_38 = call i30 @_ssdm_op_PartSelect.i30.i48.i32.i32(i48 %p_Val2_1_1, i32 18, i32 47)
  %mult_1_1_V = sext i30 %tmp_38 to i32
  %p_Val2_1_2 = mul i44 -1996, %OP1_V_1_cast
  %tmp_10 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_1_2, i32 18, i32 43)
  %mult_1_2_V_cast = sext i26 %tmp_10 to i29
  %p_Val2_1_3 = mul i50 -163225, %OP1_V_1_cast7
  %mult_1_3_V = call i32 @_ssdm_op_PartSelect.i32.i50.i32.i32(i50 %p_Val2_1_3, i32 18, i32 49)
  %p_Val2_1_4 = mul i45 -6936, %OP1_V_1_cast6
  %tmp_39 = call i27 @_ssdm_op_PartSelect.i27.i45.i32.i32(i45 %p_Val2_1_4, i32 18, i32 44)
  %mult_1_4_V = sext i27 %tmp_39 to i32
  %p_Val2_1_5 = mul i47 17312, %OP1_V_1_cast5
  %tmp_11 = call i29 @_ssdm_op_PartSelect.i29.i47.i32.i32(i47 %p_Val2_1_5, i32 18, i32 46)
  %mult_1_5_V_cast = sext i29 %tmp_11 to i31
  %p_Val2_1_6 = mul i47 -23258, %OP1_V_1_cast5
  %tmp_40 = call i29 @_ssdm_op_PartSelect.i29.i47.i32.i32(i47 %p_Val2_1_6, i32 18, i32 46)
  %mult_1_6_V = sext i29 %tmp_40 to i32
  %p_Val2_1_7 = mul i46 9931, %OP1_V_1_cast4
  %tmp_12 = call i28 @_ssdm_op_PartSelect.i28.i46.i32.i32(i46 %p_Val2_1_7, i32 18, i32 45)
  %mult_1_7_V_cast = sext i28 %tmp_12 to i29
  %p_Val2_1_8 = mul i45 4463, %OP1_V_1_cast6
  %tmp_41 = call i27 @_ssdm_op_PartSelect.i27.i45.i32.i32(i45 %p_Val2_1_8, i32 18, i32 44)
  %mult_1_8_V = sext i27 %tmp_41 to i32
  %p_Val2_1_9 = mul i46 8358, %OP1_V_1_cast4
  %tmp_42 = call i28 @_ssdm_op_PartSelect.i28.i46.i32.i32(i46 %p_Val2_1_9, i32 18, i32 45)
  %mult_1_9_V = sext i28 %tmp_42 to i32
  %p_Val2_1_s = mul i49 -119027, %OP1_V_1_cast3
  %tmp_43 = call i31 @_ssdm_op_PartSelect.i31.i49.i32.i32(i49 %p_Val2_1_s, i32 18, i32 48)
  %mult_1_10_V = sext i31 %tmp_43 to i32
  %p_Val2_1_10 = mul i44 1761, %OP1_V_1_cast
  %tmp_44 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_1_10, i32 18, i32 43)
  %mult_1_11_V = sext i26 %tmp_44 to i32
  %p_Val2_1_11 = mul i48 53350, %OP1_V_1_cast8
  %tmp_45 = call i30 @_ssdm_op_PartSelect.i30.i48.i32.i32(i48 %p_Val2_1_11, i32 18, i32 47)
  %mult_1_12_V = sext i30 %tmp_45 to i32
  %p_Val2_1_12 = mul i48 44017, %OP1_V_1_cast8
  %tmp_46 = call i30 @_ssdm_op_PartSelect.i30.i48.i32.i32(i48 %p_Val2_1_12, i32 18, i32 47)
  %mult_1_13_V = sext i30 %tmp_46 to i32
  %p_Val2_1_13 = mul i48 49066, %OP1_V_1_cast8
  %tmp_47 = call i30 @_ssdm_op_PartSelect.i30.i48.i32.i32(i48 %p_Val2_1_13, i32 18, i32 47)
  %mult_1_14_V = sext i30 %tmp_47 to i32
  %data_V_load_2 = load i32* %data_V_addr_2, align 4
  %data_V1_load_2 = load i32* %data_V1_addr_2, align 4
  %data_V2_load_2 = load i32* %data_V2_addr_2, align 4
  %data_V3_load_2 = load i32* %data_V3_addr_2, align 4
  %data_V4_load_2 = load i32* %data_V4_addr_2, align 4
  %data_V5_load_2 = load i32* %data_V5_addr_2, align 4
  %data_V6_load_2 = load i32* %data_V6_addr_2, align 4
  %data_V7_load_2 = load i32* %data_V7_addr_2, align 4
  %data_V8_load_2 = load i32* %data_V8_addr_2, align 4
  %data_V9_load_2 = load i32* %data_V9_addr_2, align 4
  %data_V10_load_2 = load i32* %data_V10_addr_2, align 4
  %data_V11_load_2 = load i32* %data_V11_addr_2, align 4
  %data_V12_load_2 = load i32* %data_V12_addr_2, align 4
  %data_V13_load_2 = load i32* %data_V13_addr_2, align 4
  %data_V14_load_2 = load i32* %data_V14_addr_2, align 4
  %data_V15_load_2 = load i32* %data_V15_addr_2, align 4
  %data_V16_load_2 = load i32* %data_V16_addr_2, align 4
  %data_V17_load_2 = load i32* %data_V17_addr_2, align 4
  %data_V18_load_2 = load i32* %data_V18_addr_2, align 4
  %data_V19_load_2 = load i32* %data_V19_addr_2, align 4
  %data_V20_load_2 = load i32* %data_V20_addr_2, align 4
  %data_V21_load_2 = load i32* %data_V21_addr_2, align 4
  %data_V22_load_2 = load i32* %data_V22_addr_2, align 4
  %data_V23_load_2 = load i32* %data_V23_addr_2, align 4
  %data_V24_load_2 = load i32* %data_V24_addr_2, align 4
  %data_V25_load_2 = load i32* %data_V25_addr_2, align 4
  %data_V26_load_2 = load i32* %data_V26_addr_2, align 4
  %data_V27_load_2 = load i32* %data_V27_addr_2, align 4
  %data_V28_load_2 = load i32* %data_V28_addr_2, align 4
  %data_V29_load_2 = load i32* %data_V29_addr_2, align 4
  %tmp_48 = call i32 @_ssdm_op_Mux.ap_auto.30i32.i5(i32 %data_V_load_2, i32 %data_V1_load_2, i32 %data_V2_load_2, i32 %data_V3_load_2, i32 %data_V4_load_2, i32 %data_V5_load_2, i32 %data_V6_load_2, i32 %data_V7_load_2, i32 %data_V8_load_2, i32 %data_V9_load_2, i32 %data_V10_load_2, i32 %data_V11_load_2, i32 %data_V12_load_2, i32 %data_V13_load_2, i32 %data_V14_load_2, i32 %data_V15_load_2, i32 %data_V16_load_2, i32 %data_V17_load_2, i32 %data_V18_load_2, i32 %data_V19_load_2, i32 %data_V20_load_2, i32 %data_V21_load_2, i32 %data_V22_load_2, i32 %data_V23_load_2, i32 %data_V24_load_2, i32 %data_V25_load_2, i32 %data_V26_load_2, i32 %data_V27_load_2, i32 %data_V28_load_2, i32 %data_V29_load_2, i5 %data_V_offset1_read)
  %OP1_V_2_cast6 = sext i32 %tmp_48 to i48
  %OP1_V_2_cast7 = sext i32 %tmp_48 to i46
  %OP1_V_2_cast = sext i32 %tmp_48 to i50
  %p_Val2_2 = mul i50 -666690, %OP1_V_2_cast
  %mult_2_0_V = call i32 @_ssdm_op_PartSelect.i32.i50.i32.i32(i50 %p_Val2_2, i32 18, i32 49)
  %p_Val2_2_1 = mul i50 -259238, %OP1_V_2_cast
  %mult_2_1_V = call i32 @_ssdm_op_PartSelect.i32.i50.i32.i32(i50 %p_Val2_2_1, i32 18, i32 49)
  %p_Val2_2_2 = mul i46 -9444, %OP1_V_2_cast7
  %tmp_49 = call i28 @_ssdm_op_PartSelect.i28.i46.i32.i32(i46 %p_Val2_2_2, i32 18, i32 45)
  %mult_2_2_V_cast = sext i28 %tmp_49 to i29
  %p_Val2_2_3 = mul i50 4418398, %OP1_V_2_cast
  %mult_2_3_V = call i32 @_ssdm_op_PartSelect.i32.i50.i32.i32(i50 %p_Val2_2_3, i32 18, i32 49)
  %p_Val2_2_4 = mul i50 359202, %OP1_V_2_cast
  %mult_2_4_V = call i32 @_ssdm_op_PartSelect.i32.i50.i32.i32(i50 %p_Val2_2_4, i32 18, i32 49)
  %p_Val2_2_5 = mul i48 46501, %OP1_V_2_cast6
  %tmp_50 = call i30 @_ssdm_op_PartSelect.i30.i48.i32.i32(i48 %p_Val2_2_5, i32 18, i32 47)
  %mult_2_5_V_cast = sext i30 %tmp_50 to i31
  %p_Val2_2_6 = mul i50 373238, %OP1_V_2_cast
  %mult_2_6_V = call i32 @_ssdm_op_PartSelect.i32.i50.i32.i32(i50 %p_Val2_2_6, i32 18, i32 49)
  %p_Val2_2_7 = mul i46 10016, %OP1_V_2_cast7
  %tmp_51 = call i28 @_ssdm_op_PartSelect.i28.i46.i32.i32(i46 %p_Val2_2_7, i32 18, i32 45)
  %mult_2_7_V_cast = sext i28 %tmp_51 to i29
  %p_Val2_2_8 = mul i50 205864, %OP1_V_2_cast
  %mult_2_8_V = call i32 @_ssdm_op_PartSelect.i32.i50.i32.i32(i50 %p_Val2_2_8, i32 18, i32 49)
  %p_Val2_2_9 = mul i50 232039, %OP1_V_2_cast
  %mult_2_9_V = call i32 @_ssdm_op_PartSelect.i32.i50.i32.i32(i50 %p_Val2_2_9, i32 18, i32 49)
  %p_Val2_2_s = mul i50 2523457, %OP1_V_2_cast
  %mult_2_10_V = call i32 @_ssdm_op_PartSelect.i32.i50.i32.i32(i50 %p_Val2_2_s, i32 18, i32 49)
  %p_Val2_2_10 = mul i50 -5433217, %OP1_V_2_cast
  %mult_2_11_V = call i32 @_ssdm_op_PartSelect.i32.i50.i32.i32(i50 %p_Val2_2_10, i32 18, i32 49)
  %p_Val2_2_11 = mul i50 -926562, %OP1_V_2_cast
  %mult_2_12_V = call i32 @_ssdm_op_PartSelect.i32.i50.i32.i32(i50 %p_Val2_2_11, i32 18, i32 49)
  %p_Val2_2_12 = mul i50 -187607, %OP1_V_2_cast
  %mult_2_13_V = call i32 @_ssdm_op_PartSelect.i32.i50.i32.i32(i50 %p_Val2_2_12, i32 18, i32 49)
  %p_Val2_2_13 = mul i50 -911667, %OP1_V_2_cast
  %mult_2_14_V = call i32 @_ssdm_op_PartSelect.i32.i50.i32.i32(i50 %p_Val2_2_13, i32 18, i32 49)
  %data_V_load_3 = load i32* %data_V_addr_3, align 4
  %data_V1_load_3 = load i32* %data_V1_addr_3, align 4
  %data_V2_load_3 = load i32* %data_V2_addr_3, align 4
  %data_V3_load_3 = load i32* %data_V3_addr_3, align 4
  %data_V4_load_3 = load i32* %data_V4_addr_3, align 4
  %data_V5_load_3 = load i32* %data_V5_addr_3, align 4
  %data_V6_load_3 = load i32* %data_V6_addr_3, align 4
  %data_V7_load_3 = load i32* %data_V7_addr_3, align 4
  %data_V8_load_3 = load i32* %data_V8_addr_3, align 4
  %data_V9_load_3 = load i32* %data_V9_addr_3, align 4
  %data_V10_load_3 = load i32* %data_V10_addr_3, align 4
  %data_V11_load_3 = load i32* %data_V11_addr_3, align 4
  %data_V12_load_3 = load i32* %data_V12_addr_3, align 4
  %data_V13_load_3 = load i32* %data_V13_addr_3, align 4
  %data_V14_load_3 = load i32* %data_V14_addr_3, align 4
  %data_V15_load_3 = load i32* %data_V15_addr_3, align 4
  %data_V16_load_3 = load i32* %data_V16_addr_3, align 4
  %data_V17_load_3 = load i32* %data_V17_addr_3, align 4
  %data_V18_load_3 = load i32* %data_V18_addr_3, align 4
  %data_V19_load_3 = load i32* %data_V19_addr_3, align 4
  %data_V20_load_3 = load i32* %data_V20_addr_3, align 4
  %data_V21_load_3 = load i32* %data_V21_addr_3, align 4
  %data_V22_load_3 = load i32* %data_V22_addr_3, align 4
  %data_V23_load_3 = load i32* %data_V23_addr_3, align 4
  %data_V24_load_3 = load i32* %data_V24_addr_3, align 4
  %data_V25_load_3 = load i32* %data_V25_addr_3, align 4
  %data_V26_load_3 = load i32* %data_V26_addr_3, align 4
  %data_V27_load_3 = load i32* %data_V27_addr_3, align 4
  %data_V28_load_3 = load i32* %data_V28_addr_3, align 4
  %data_V29_load_3 = load i32* %data_V29_addr_3, align 4
  %tmp_52 = call i32 @_ssdm_op_Mux.ap_auto.30i32.i5(i32 %data_V_load_3, i32 %data_V1_load_3, i32 %data_V2_load_3, i32 %data_V3_load_3, i32 %data_V4_load_3, i32 %data_V5_load_3, i32 %data_V6_load_3, i32 %data_V7_load_3, i32 %data_V8_load_3, i32 %data_V9_load_3, i32 %data_V10_load_3, i32 %data_V11_load_3, i32 %data_V12_load_3, i32 %data_V13_load_3, i32 %data_V14_load_3, i32 %data_V15_load_3, i32 %data_V16_load_3, i32 %data_V17_load_3, i32 %data_V18_load_3, i32 %data_V19_load_3, i32 %data_V20_load_3, i32 %data_V21_load_3, i32 %data_V22_load_3, i32 %data_V23_load_3, i32 %data_V24_load_3, i32 %data_V25_load_3, i32 %data_V26_load_3, i32 %data_V27_load_3, i32 %data_V28_load_3, i32 %data_V29_load_3, i5 %data_V_offset1_read)
  %OP1_V_3_cast5 = sext i32 %tmp_52 to i39
  %OP1_V_3_cast6 = sext i32 %tmp_52 to i42
  %OP1_V_3_cast7 = sext i32 %tmp_52 to i45
  %OP1_V_3_cast8 = sext i32 %tmp_52 to i43
  %OP1_V_3_cast9 = sext i32 %tmp_52 to i40
  %OP1_V_3_cast = sext i32 %tmp_52 to i44
  %p_Val2_3 = mul i44 -3215, %OP1_V_3_cast
  %tmp_53 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_3, i32 18, i32 43)
  %mult_3_0_V_cast = sext i26 %tmp_53 to i27
  %p_Val2_3_1 = mul i44 1045, %OP1_V_3_cast
  %tmp_54 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_3_1, i32 18, i32 43)
  %mult_3_1_V_cast = sext i26 %tmp_54 to i28
  %p_Val2_3_2 = mul i40 95, %OP1_V_3_cast9
  %tmp_55 = call i22 @_ssdm_op_PartSelect.i22.i40.i32.i32(i40 %p_Val2_3_2, i32 18, i32 39)
  %mult_3_2_V_cast = sext i22 %tmp_55 to i27
  %p_Val2_3_3 = mul i43 634, %OP1_V_3_cast8
  %tmp_56 = call i25 @_ssdm_op_PartSelect.i25.i43.i32.i32(i43 %p_Val2_3_3, i32 18, i32 42)
  %mult_3_3_V_cast = sext i25 %tmp_56 to i28
  %p_Val2_3_4 = mul i44 -3606, %OP1_V_3_cast
  %tmp_57 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_3_4, i32 18, i32 43)
  %mult_3_4_V_cast = sext i26 %tmp_57 to i28
  %p_Val2_3_5 = mul i45 5360, %OP1_V_3_cast7
  %tmp_58 = call i27 @_ssdm_op_PartSelect.i27.i45.i32.i32(i45 %p_Val2_3_5, i32 18, i32 44)
  %mult_3_5_V_cast = sext i27 %tmp_58 to i28
  %p_Val2_3_6 = mul i44 2850, %OP1_V_3_cast
  %tmp_59 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_3_6, i32 18, i32 43)
  %mult_3_6_V_cast = sext i26 %tmp_59 to i28
  %p_Val2_3_7 = mul i44 -2920, %OP1_V_3_cast
  %tmp_60 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_3_7, i32 18, i32 43)
  %mult_3_7_V_cast = sext i26 %tmp_60 to i28
  %p_Val2_3_8 = mul i44 -2253, %OP1_V_3_cast
  %tmp_61 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_3_8, i32 18, i32 43)
  %mult_3_8_V_cast = sext i26 %tmp_61 to i28
  %p_Val2_3_9 = mul i44 3470, %OP1_V_3_cast
  %tmp_62 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_3_9, i32 18, i32 43)
  %mult_3_9_V_cast = sext i26 %tmp_62 to i28
  %p_Val2_3_s = mul i44 1331, %OP1_V_3_cast
  %tmp_63 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_3_s, i32 18, i32 43)
  %mult_3_10_V_cast = sext i26 %tmp_63 to i28
  %p_Val2_3_10 = mul i45 4971, %OP1_V_3_cast7
  %tmp_64 = call i27 @_ssdm_op_PartSelect.i27.i45.i32.i32(i45 %p_Val2_3_10, i32 18, i32 44)
  %mult_3_11_V_cast = sext i27 %tmp_64 to i30
  %p_Val2_3_11 = mul i42 -354, %OP1_V_3_cast6
  %tmp_65 = call i24 @_ssdm_op_PartSelect.i24.i42.i32.i32(i42 %p_Val2_3_11, i32 18, i32 41)
  %mult_3_12_V_cast = sext i24 %tmp_65 to i26
  %p_Val2_3_12 = mul i44 -1371, %OP1_V_3_cast
  %tmp_66 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_3_12, i32 18, i32 43)
  %mult_3_13_V_cast = sext i26 %tmp_66 to i28
  %p_Val2_3_13 = mul i39 -61, %OP1_V_3_cast5
  %tmp_67 = call i21 @_ssdm_op_PartSelect.i21.i39.i32.i32(i39 %p_Val2_3_13, i32 18, i32 38)
  %mult_3_14_V_cast = sext i21 %tmp_67 to i27
  %data_V_load_4 = load i32* %data_V_addr_4, align 4
  %data_V1_load_4 = load i32* %data_V1_addr_4, align 4
  %data_V2_load_4 = load i32* %data_V2_addr_4, align 4
  %data_V3_load_4 = load i32* %data_V3_addr_4, align 4
  %data_V4_load_4 = load i32* %data_V4_addr_4, align 4
  %data_V5_load_4 = load i32* %data_V5_addr_4, align 4
  %data_V6_load_4 = load i32* %data_V6_addr_4, align 4
  %data_V7_load_4 = load i32* %data_V7_addr_4, align 4
  %data_V8_load_4 = load i32* %data_V8_addr_4, align 4
  %data_V9_load_4 = load i32* %data_V9_addr_4, align 4
  %data_V10_load_4 = load i32* %data_V10_addr_4, align 4
  %data_V11_load_4 = load i32* %data_V11_addr_4, align 4
  %data_V12_load_4 = load i32* %data_V12_addr_4, align 4
  %data_V13_load_4 = load i32* %data_V13_addr_4, align 4
  %data_V14_load_4 = load i32* %data_V14_addr_4, align 4
  %data_V15_load_4 = load i32* %data_V15_addr_4, align 4
  %data_V16_load_4 = load i32* %data_V16_addr_4, align 4
  %data_V17_load_4 = load i32* %data_V17_addr_4, align 4
  %data_V18_load_4 = load i32* %data_V18_addr_4, align 4
  %data_V19_load_4 = load i32* %data_V19_addr_4, align 4
  %data_V20_load_4 = load i32* %data_V20_addr_4, align 4
  %data_V21_load_4 = load i32* %data_V21_addr_4, align 4
  %data_V22_load_4 = load i32* %data_V22_addr_4, align 4
  %data_V23_load_4 = load i32* %data_V23_addr_4, align 4
  %data_V24_load_4 = load i32* %data_V24_addr_4, align 4
  %data_V25_load_4 = load i32* %data_V25_addr_4, align 4
  %data_V26_load_4 = load i32* %data_V26_addr_4, align 4
  %data_V27_load_4 = load i32* %data_V27_addr_4, align 4
  %data_V28_load_4 = load i32* %data_V28_addr_4, align 4
  %data_V29_load_4 = load i32* %data_V29_addr_4, align 4
  %tmp_68 = call i32 @_ssdm_op_Mux.ap_auto.30i32.i5(i32 %data_V_load_4, i32 %data_V1_load_4, i32 %data_V2_load_4, i32 %data_V3_load_4, i32 %data_V4_load_4, i32 %data_V5_load_4, i32 %data_V6_load_4, i32 %data_V7_load_4, i32 %data_V8_load_4, i32 %data_V9_load_4, i32 %data_V10_load_4, i32 %data_V11_load_4, i32 %data_V12_load_4, i32 %data_V13_load_4, i32 %data_V14_load_4, i32 %data_V15_load_4, i32 %data_V16_load_4, i32 %data_V17_load_4, i32 %data_V18_load_4, i32 %data_V19_load_4, i32 %data_V20_load_4, i32 %data_V21_load_4, i32 %data_V22_load_4, i32 %data_V23_load_4, i32 %data_V24_load_4, i32 %data_V25_load_4, i32 %data_V26_load_4, i32 %data_V27_load_4, i32 %data_V28_load_4, i32 %data_V29_load_4, i5 %data_V_offset1_read)
  %OP1_V_4_cast5 = sext i32 %tmp_68 to i41
  %OP1_V_4_cast6 = sext i32 %tmp_68 to i44
  %OP1_V_4_cast7 = sext i32 %tmp_68 to i42
  %OP1_V_4_cast = sext i32 %tmp_68 to i43
  %p_Val2_4 = mul i43 -644, %OP1_V_4_cast
  %tmp_69 = call i25 @_ssdm_op_PartSelect.i25.i43.i32.i32(i43 %p_Val2_4, i32 18, i32 42)
  %mult_4_0_V_cast = sext i25 %tmp_69 to i26
  %p_Val2_4_1 = mul i42 271, %OP1_V_4_cast7
  %tmp_70 = call i24 @_ssdm_op_PartSelect.i24.i42.i32.i32(i42 %p_Val2_4_1, i32 18, i32 41)
  %mult_4_1_V_cast = sext i24 %tmp_70 to i27
  %p_Val2_4_2 = mul i44 -1284, %OP1_V_4_cast6
  %tmp_71 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_4_2, i32 18, i32 43)
  %mult_4_2_V_cast = sext i26 %tmp_71 to i27
  %p_Val2_4_3 = mul i44 -3043, %OP1_V_4_cast6
  %tmp_72 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_4_3, i32 18, i32 43)
  %mult_4_3_V_cast = sext i26 %tmp_72 to i27
  %p_Val2_4_4 = mul i43 -748, %OP1_V_4_cast
  %tmp_73 = call i25 @_ssdm_op_PartSelect.i25.i43.i32.i32(i43 %p_Val2_4_4, i32 18, i32 42)
  %mult_4_4_V_cast = sext i25 %tmp_73 to i27
  %p_Val2_4_5 = mul i42 297, %OP1_V_4_cast7
  %tmp_74 = call i24 @_ssdm_op_PartSelect.i24.i42.i32.i32(i42 %p_Val2_4_5, i32 18, i32 41)
  %mult_4_5_V_cast = sext i24 %tmp_74 to i27
  %p_Val2_4_6 = mul i44 -2144, %OP1_V_4_cast6
  %tmp_75 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_4_6, i32 18, i32 43)
  %mult_4_6_V_cast = sext i26 %tmp_75 to i27
  %p_Val2_4_7 = mul i43 812, %OP1_V_4_cast
  %tmp_76 = call i25 @_ssdm_op_PartSelect.i25.i43.i32.i32(i43 %p_Val2_4_7, i32 18, i32 42)
  %mult_4_7_V_cast = sext i25 %tmp_76 to i27
  %p_Val2_4_8 = mul i44 1853, %OP1_V_4_cast6
  %tmp_77 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_4_8, i32 18, i32 43)
  %mult_4_8_V_cast = sext i26 %tmp_77 to i27
  %p_Val2_4_9 = mul i44 1312, %OP1_V_4_cast6
  %tmp_78 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_4_9, i32 18, i32 43)
  %mult_4_9_V_cast = sext i26 %tmp_78 to i27
  %p_Val2_4_s = mul i44 -1912, %OP1_V_4_cast6
  %tmp_79 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_4_s, i32 18, i32 43)
  %mult_4_10_V_cast = sext i26 %tmp_79 to i27
  %p_Val2_4_10 = mul i44 -2420, %OP1_V_4_cast6
  %tmp_80 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_4_10, i32 18, i32 43)
  %mult_4_11_V_cast = sext i26 %tmp_80 to i30
  %p_Val2_4_11 = mul i41 213, %OP1_V_4_cast5
  %tmp_81 = call i23 @_ssdm_op_PartSelect.i23.i41.i32.i32(i41 %p_Val2_4_11, i32 18, i32 40)
  %mult_4_12_V_cast = sext i23 %tmp_81 to i25
  %p_Val2_4_12 = mul i44 -2959, %OP1_V_4_cast6
  %tmp_82 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_4_12, i32 18, i32 43)
  %mult_4_13_V_cast = sext i26 %tmp_82 to i27
  %p_Val2_4_13 = mul i43 -872, %OP1_V_4_cast
  %tmp_83 = call i25 @_ssdm_op_PartSelect.i25.i43.i32.i32(i43 %p_Val2_4_13, i32 18, i32 42)
  %mult_4_14_V_cast = sext i25 %tmp_83 to i27
  %data_V_load_5 = load i32* %data_V_addr_5, align 4
  %data_V1_load_5 = load i32* %data_V1_addr_5, align 4
  %data_V2_load_5 = load i32* %data_V2_addr_5, align 4
  %data_V3_load_5 = load i32* %data_V3_addr_5, align 4
  %data_V4_load_5 = load i32* %data_V4_addr_5, align 4
  %data_V5_load_5 = load i32* %data_V5_addr_5, align 4
  %data_V6_load_5 = load i32* %data_V6_addr_5, align 4
  %data_V7_load_5 = load i32* %data_V7_addr_5, align 4
  %data_V8_load_5 = load i32* %data_V8_addr_5, align 4
  %data_V9_load_5 = load i32* %data_V9_addr_5, align 4
  %data_V10_load_5 = load i32* %data_V10_addr_5, align 4
  %data_V11_load_5 = load i32* %data_V11_addr_5, align 4
  %data_V12_load_5 = load i32* %data_V12_addr_5, align 4
  %data_V13_load_5 = load i32* %data_V13_addr_5, align 4
  %data_V14_load_5 = load i32* %data_V14_addr_5, align 4
  %data_V15_load_5 = load i32* %data_V15_addr_5, align 4
  %data_V16_load_5 = load i32* %data_V16_addr_5, align 4
  %data_V17_load_5 = load i32* %data_V17_addr_5, align 4
  %data_V18_load_5 = load i32* %data_V18_addr_5, align 4
  %data_V19_load_5 = load i32* %data_V19_addr_5, align 4
  %data_V20_load_5 = load i32* %data_V20_addr_5, align 4
  %data_V21_load_5 = load i32* %data_V21_addr_5, align 4
  %data_V22_load_5 = load i32* %data_V22_addr_5, align 4
  %data_V23_load_5 = load i32* %data_V23_addr_5, align 4
  %data_V24_load_5 = load i32* %data_V24_addr_5, align 4
  %data_V25_load_5 = load i32* %data_V25_addr_5, align 4
  %data_V26_load_5 = load i32* %data_V26_addr_5, align 4
  %data_V27_load_5 = load i32* %data_V27_addr_5, align 4
  %data_V28_load_5 = load i32* %data_V28_addr_5, align 4
  %data_V29_load_5 = load i32* %data_V29_addr_5, align 4
  %tmp_84 = call i32 @_ssdm_op_Mux.ap_auto.30i32.i5(i32 %data_V_load_5, i32 %data_V1_load_5, i32 %data_V2_load_5, i32 %data_V3_load_5, i32 %data_V4_load_5, i32 %data_V5_load_5, i32 %data_V6_load_5, i32 %data_V7_load_5, i32 %data_V8_load_5, i32 %data_V9_load_5, i32 %data_V10_load_5, i32 %data_V11_load_5, i32 %data_V12_load_5, i32 %data_V13_load_5, i32 %data_V14_load_5, i32 %data_V15_load_5, i32 %data_V16_load_5, i32 %data_V17_load_5, i32 %data_V18_load_5, i32 %data_V19_load_5, i32 %data_V20_load_5, i32 %data_V21_load_5, i32 %data_V22_load_5, i32 %data_V23_load_5, i32 %data_V24_load_5, i32 %data_V25_load_5, i32 %data_V26_load_5, i32 %data_V27_load_5, i32 %data_V28_load_5, i32 %data_V29_load_5, i5 %data_V_offset1_read)
  %OP1_V_5_cast = sext i32 %tmp_84 to i47
  %OP1_V_5_cast2 = sext i32 %tmp_84 to i43
  %OP1_V_5_cast3 = sext i32 %tmp_84 to i44
  %OP1_V_5_cast4 = sext i32 %tmp_84 to i42
  %p_Val2_5 = mul i42 304, %OP1_V_5_cast4
  %tmp_85 = call i24 @_ssdm_op_PartSelect.i24.i42.i32.i32(i42 %p_Val2_5, i32 18, i32 41)
  %mult_5_0_V_cast = sext i24 %tmp_85 to i26
  %p_Val2_5_1 = mul i44 2130, %OP1_V_5_cast3
  %tmp_86 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_5_1, i32 18, i32 43)
  %mult_5_1_V_cast = sext i26 %tmp_86 to i27
  %p_Val2_5_2 = mul i43 917, %OP1_V_5_cast2
  %tmp_87 = call i25 @_ssdm_op_PartSelect.i25.i43.i32.i32(i43 %p_Val2_5_2, i32 18, i32 42)
  %mult_5_2_V_cast = sext i25 %tmp_87 to i27
  %p_Val2_5_3 = mul i44 -2396, %OP1_V_5_cast3
  %tmp_88 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_5_3, i32 18, i32 43)
  %mult_5_3_V_cast = sext i26 %tmp_88 to i27
  %p_Val2_5_4 = mul i44 1522, %OP1_V_5_cast3
  %tmp_89 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_5_4, i32 18, i32 43)
  %tmp_97_cast = sext i26 %tmp_89 to i27
  %p_Val2_5_5 = mul i44 -1374, %OP1_V_5_cast3
  %tmp_90 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_5_5, i32 18, i32 43)
  %tmp_99_cast = sext i26 %tmp_90 to i27
  %p_Val2_5_6 = mul i43 784, %OP1_V_5_cast2
  %tmp_91 = call i25 @_ssdm_op_PartSelect.i25.i43.i32.i32(i43 %p_Val2_5_6, i32 18, i32 42)
  %tmp_101_cast = sext i25 %tmp_91 to i27
  %p_Val2_5_7 = mul i44 -2260, %OP1_V_5_cast3
  %tmp_92 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_5_7, i32 18, i32 43)
  %tmp_103_cast = sext i26 %tmp_92 to i27
  %p_Val2_5_8 = mul i42 431, %OP1_V_5_cast4
  %tmp_93 = call i24 @_ssdm_op_PartSelect.i24.i42.i32.i32(i42 %p_Val2_5_8, i32 18, i32 41)
  %tmp_105_cast = sext i24 %tmp_93 to i27
  %p_Val2_5_9 = mul i44 -1550, %OP1_V_5_cast3
  %tmp_94 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_5_9, i32 18, i32 43)
  %tmp_107_cast = sext i26 %tmp_94 to i27
  %p_shl5 = call i39 @_ssdm_op_BitConcatenate.i39.i32.i7(i32 %tmp_84, i7 0)
  %p_shl5_cast = sext i39 %p_shl5 to i40
  %p_shl6 = call i37 @_ssdm_op_BitConcatenate.i37.i32.i5(i32 %tmp_84, i5 0)
  %p_shl6_cast = sext i37 %p_shl6 to i40
  %p_Val2_5_s = sub i40 %p_shl5_cast, %p_shl6_cast
  %tmp_95 = call i22 @_ssdm_op_PartSelect.i22.i40.i32.i32(i40 %p_Val2_5_s, i32 18, i32 39)
  %tmp_109_cast = sext i22 %tmp_95 to i27
  %p_Val2_5_10 = mul i47 26190, %OP1_V_5_cast
  %tmp_96 = call i29 @_ssdm_op_PartSelect.i29.i47.i32.i32(i47 %p_Val2_5_10, i32 18, i32 46)
  %tmp_111_cast = sext i29 %tmp_96 to i30
  %p_Val2_5_11 = mul i42 454, %OP1_V_5_cast4
  %tmp_97 = call i24 @_ssdm_op_PartSelect.i24.i42.i32.i32(i42 %p_Val2_5_11, i32 18, i32 41)
  %tmp_113_cast = sext i24 %tmp_97 to i25
  %p_Val2_5_12 = mul i44 1147, %OP1_V_5_cast3
  %tmp_98 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_5_12, i32 18, i32 43)
  %tmp_115_cast = sext i26 %tmp_98 to i27
  %p_Val2_5_13 = mul i44 1136, %OP1_V_5_cast3
  %tmp_99 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_5_13, i32 18, i32 43)
  %tmp_117_cast = sext i26 %tmp_99 to i27
  %data_V_load_6 = load i32* %data_V_addr_6, align 4
  %data_V1_load_6 = load i32* %data_V1_addr_6, align 4
  %data_V2_load_6 = load i32* %data_V2_addr_6, align 4
  %data_V3_load_6 = load i32* %data_V3_addr_6, align 4
  %data_V4_load_6 = load i32* %data_V4_addr_6, align 4
  %data_V5_load_6 = load i32* %data_V5_addr_6, align 4
  %data_V6_load_6 = load i32* %data_V6_addr_6, align 4
  %data_V7_load_6 = load i32* %data_V7_addr_6, align 4
  %data_V8_load_6 = load i32* %data_V8_addr_6, align 4
  %data_V9_load_6 = load i32* %data_V9_addr_6, align 4
  %data_V10_load_6 = load i32* %data_V10_addr_6, align 4
  %data_V11_load_6 = load i32* %data_V11_addr_6, align 4
  %data_V12_load_6 = load i32* %data_V12_addr_6, align 4
  %data_V13_load_6 = load i32* %data_V13_addr_6, align 4
  %data_V14_load_6 = load i32* %data_V14_addr_6, align 4
  %data_V15_load_6 = load i32* %data_V15_addr_6, align 4
  %data_V16_load_6 = load i32* %data_V16_addr_6, align 4
  %data_V17_load_6 = load i32* %data_V17_addr_6, align 4
  %data_V18_load_6 = load i32* %data_V18_addr_6, align 4
  %data_V19_load_6 = load i32* %data_V19_addr_6, align 4
  %data_V20_load_6 = load i32* %data_V20_addr_6, align 4
  %data_V21_load_6 = load i32* %data_V21_addr_6, align 4
  %data_V22_load_6 = load i32* %data_V22_addr_6, align 4
  %data_V23_load_6 = load i32* %data_V23_addr_6, align 4
  %data_V24_load_6 = load i32* %data_V24_addr_6, align 4
  %data_V25_load_6 = load i32* %data_V25_addr_6, align 4
  %data_V26_load_6 = load i32* %data_V26_addr_6, align 4
  %data_V27_load_6 = load i32* %data_V27_addr_6, align 4
  %data_V28_load_6 = load i32* %data_V28_addr_6, align 4
  %data_V29_load_6 = load i32* %data_V29_addr_6, align 4
  %tmp_100 = call i32 @_ssdm_op_Mux.ap_auto.30i32.i5(i32 %data_V_load_6, i32 %data_V1_load_6, i32 %data_V2_load_6, i32 %data_V3_load_6, i32 %data_V4_load_6, i32 %data_V5_load_6, i32 %data_V6_load_6, i32 %data_V7_load_6, i32 %data_V8_load_6, i32 %data_V9_load_6, i32 %data_V10_load_6, i32 %data_V11_load_6, i32 %data_V12_load_6, i32 %data_V13_load_6, i32 %data_V14_load_6, i32 %data_V15_load_6, i32 %data_V16_load_6, i32 %data_V17_load_6, i32 %data_V18_load_6, i32 %data_V19_load_6, i32 %data_V20_load_6, i32 %data_V21_load_6, i32 %data_V22_load_6, i32 %data_V23_load_6, i32 %data_V24_load_6, i32 %data_V25_load_6, i32 %data_V26_load_6, i32 %data_V27_load_6, i32 %data_V28_load_6, i32 %data_V29_load_6, i5 %data_V_offset1_read)
  %OP1_V_6_cast4 = sext i32 %tmp_100 to i39
  %OP1_V_6_cast5 = sext i32 %tmp_100 to i48
  %OP1_V_6_cast6 = sext i32 %tmp_100 to i41
  %OP1_V_6_cast7 = sext i32 %tmp_100 to i44
  %OP1_V_6_cast8 = sext i32 %tmp_100 to i37
  %OP1_V_6_cast9 = sext i32 %tmp_100 to i42
  %OP1_V_6_cast1 = sext i32 %tmp_100 to i43
  %OP1_V_6_cast = sext i32 %tmp_100 to i40
  %p_Val2_6 = mul i40 -101, %OP1_V_6_cast
  %tmp_101 = call i22 @_ssdm_op_PartSelect.i22.i40.i32.i32(i40 %p_Val2_6, i32 18, i32 39)
  %tmp_120_cast = sext i22 %tmp_101 to i26
  %p_Val2_6_1 = mul i43 706, %OP1_V_6_cast1
  %tmp_102 = call i25 @_ssdm_op_PartSelect.i25.i43.i32.i32(i43 %p_Val2_6_1, i32 18, i32 42)
  %tmp_122_cast = sext i25 %tmp_102 to i27
  %p_Val2_6_2 = mul i42 -267, %OP1_V_6_cast9
  %tmp_103 = call i24 @_ssdm_op_PartSelect.i24.i42.i32.i32(i42 %p_Val2_6_2, i32 18, i32 41)
  %tmp_124_cast = sext i24 %tmp_103 to i26
  %p_Val2_6_3 = mul i40 69, %OP1_V_6_cast
  %tmp_104 = call i22 @_ssdm_op_PartSelect.i22.i40.i32.i32(i40 %p_Val2_6_3, i32 18, i32 39)
  %tmp_126_cast = sext i22 %tmp_104 to i27
  %p_Val2_6_4 = mul i43 785, %OP1_V_6_cast1
  %tmp_105 = call i25 @_ssdm_op_PartSelect.i25.i43.i32.i32(i43 %p_Val2_6_4, i32 18, i32 42)
  %tmp_128_cast = sext i25 %tmp_105 to i27
  %p_Val2_6_5 = mul i37 11, %OP1_V_6_cast8
  %tmp_106 = call i19 @_ssdm_op_PartSelect.i19.i37.i32.i32(i37 %p_Val2_6_5, i32 18, i32 36)
  %tmp_130_cast = sext i19 %tmp_106 to i24
  %p_Val2_6_6 = mul i44 1083, %OP1_V_6_cast7
  %tmp_107 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_6_6, i32 18, i32 43)
  %tmp_132_cast = sext i26 %tmp_107 to i28
  %p_Val2_6_7 = mul i43 -759, %OP1_V_6_cast1
  %tmp_108 = call i25 @_ssdm_op_PartSelect.i25.i43.i32.i32(i43 %p_Val2_6_7, i32 18, i32 42)
  %tmp_134_cast = sext i25 %tmp_108 to i27
  %p_shl3 = call i40 @_ssdm_op_BitConcatenate.i40.i32.i8(i32 %tmp_100, i8 0)
  %p_shl3_cast = sext i40 %p_shl3 to i41
  %p_shl4 = call i33 @_ssdm_op_BitConcatenate.i33.i32.i1(i32 %tmp_100, i1 false)
  %p_shl4_cast = sext i33 %p_shl4 to i41
  %p_Val2_6_8 = sub i41 %p_shl4_cast, %p_shl3_cast
  %tmp_109 = call i23 @_ssdm_op_PartSelect.i23.i41.i32.i32(i41 %p_Val2_6_8, i32 18, i32 40)
  %tmp_136_cast = sext i23 %tmp_109 to i25
  %tmp_110 = call i15 @_ssdm_op_PartSelect.i15.i32.i32.i32(i32 %tmp_100, i32 17, i32 31)
  %tmp_25_6_9_cast = sext i15 %tmp_110 to i17
  %p_Val2_6_s = mul i41 171, %OP1_V_6_cast6
  %tmp_111 = call i23 @_ssdm_op_PartSelect.i23.i41.i32.i32(i41 %p_Val2_6_s, i32 18, i32 40)
  %tmp_139_cast = sext i23 %tmp_111 to i27
  %p_Val2_6_9 = mul i48 -44903, %OP1_V_6_cast5
  %tmp_112 = call i30 @_ssdm_op_PartSelect.i30.i48.i32.i32(i48 %p_Val2_6_9, i32 18, i32 47)
  %tmp_141_cast = sext i30 %tmp_112 to i31
  %p_Val2_6_10 = mul i39 -57, %OP1_V_6_cast4
  %tmp_113 = call i21 @_ssdm_op_PartSelect.i21.i39.i32.i32(i39 %p_Val2_6_10, i32 18, i32 38)
  %tmp_143_cast = sext i21 %tmp_113 to i28
  %p_Val2_6_11 = mul i42 -306, %OP1_V_6_cast9
  %tmp_114 = call i24 @_ssdm_op_PartSelect.i24.i42.i32.i32(i42 %p_Val2_6_11, i32 18, i32 41)
  %tmp_145_cast = sext i24 %tmp_114 to i26
  %p_Val2_6_12 = mul i43 -517, %OP1_V_6_cast1
  %tmp_115 = call i25 @_ssdm_op_PartSelect.i25.i43.i32.i32(i43 %p_Val2_6_12, i32 18, i32 42)
  %tmp_147_cast = sext i25 %tmp_115 to i27
  %data_V_load_7 = load i32* %data_V_addr_7, align 4
  %data_V1_load_7 = load i32* %data_V1_addr_7, align 4
  %data_V2_load_7 = load i32* %data_V2_addr_7, align 4
  %data_V3_load_7 = load i32* %data_V3_addr_7, align 4
  %data_V4_load_7 = load i32* %data_V4_addr_7, align 4
  %data_V5_load_7 = load i32* %data_V5_addr_7, align 4
  %data_V6_load_7 = load i32* %data_V6_addr_7, align 4
  %data_V7_load_7 = load i32* %data_V7_addr_7, align 4
  %data_V8_load_7 = load i32* %data_V8_addr_7, align 4
  %data_V9_load_7 = load i32* %data_V9_addr_7, align 4
  %data_V10_load_7 = load i32* %data_V10_addr_7, align 4
  %data_V11_load_7 = load i32* %data_V11_addr_7, align 4
  %data_V12_load_7 = load i32* %data_V12_addr_7, align 4
  %data_V13_load_7 = load i32* %data_V13_addr_7, align 4
  %data_V14_load_7 = load i32* %data_V14_addr_7, align 4
  %data_V15_load_7 = load i32* %data_V15_addr_7, align 4
  %data_V16_load_7 = load i32* %data_V16_addr_7, align 4
  %data_V17_load_7 = load i32* %data_V17_addr_7, align 4
  %data_V18_load_7 = load i32* %data_V18_addr_7, align 4
  %data_V19_load_7 = load i32* %data_V19_addr_7, align 4
  %data_V20_load_7 = load i32* %data_V20_addr_7, align 4
  %data_V21_load_7 = load i32* %data_V21_addr_7, align 4
  %data_V22_load_7 = load i32* %data_V22_addr_7, align 4
  %data_V23_load_7 = load i32* %data_V23_addr_7, align 4
  %data_V24_load_7 = load i32* %data_V24_addr_7, align 4
  %data_V25_load_7 = load i32* %data_V25_addr_7, align 4
  %data_V26_load_7 = load i32* %data_V26_addr_7, align 4
  %data_V27_load_7 = load i32* %data_V27_addr_7, align 4
  %data_V28_load_7 = load i32* %data_V28_addr_7, align 4
  %data_V29_load_7 = load i32* %data_V29_addr_7, align 4
  %tmp_116 = call i32 @_ssdm_op_Mux.ap_auto.30i32.i5(i32 %data_V_load_7, i32 %data_V1_load_7, i32 %data_V2_load_7, i32 %data_V3_load_7, i32 %data_V4_load_7, i32 %data_V5_load_7, i32 %data_V6_load_7, i32 %data_V7_load_7, i32 %data_V8_load_7, i32 %data_V9_load_7, i32 %data_V10_load_7, i32 %data_V11_load_7, i32 %data_V12_load_7, i32 %data_V13_load_7, i32 %data_V14_load_7, i32 %data_V15_load_7, i32 %data_V16_load_7, i32 %data_V17_load_7, i32 %data_V18_load_7, i32 %data_V19_load_7, i32 %data_V20_load_7, i32 %data_V21_load_7, i32 %data_V22_load_7, i32 %data_V23_load_7, i32 %data_V24_load_7, i32 %data_V25_load_7, i32 %data_V26_load_7, i32 %data_V27_load_7, i32 %data_V28_load_7, i32 %data_V29_load_7, i5 %data_V_offset1_read)
  %OP1_V_7_cast4 = sext i32 %tmp_116 to i43
  %OP1_V_7_cast5 = sext i32 %tmp_116 to i40
  %OP1_V_7_cast6 = sext i32 %tmp_116 to i42
  %OP1_V_7_cast7 = sext i32 %tmp_116 to i44
  %OP1_V_7_cast = sext i32 %tmp_116 to i41
  %p_Val2_s_41 = mul i41 154, %OP1_V_7_cast
  %tmp_117 = call i23 @_ssdm_op_PartSelect.i23.i41.i32.i32(i41 %p_Val2_s_41, i32 18, i32 40)
  %tmp_150_cast = sext i23 %tmp_117 to i26
  %p_Val2_79_1 = mul i44 -1482, %OP1_V_7_cast7
  %tmp_118 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_79_1, i32 18, i32 43)
  %tmp_152_cast = sext i26 %tmp_118 to i27
  %p_Val2_79_2 = mul i41 -169, %OP1_V_7_cast
  %tmp_119 = call i23 @_ssdm_op_PartSelect.i23.i41.i32.i32(i41 %p_Val2_79_2, i32 18, i32 40)
  %tmp_154_cast = sext i23 %tmp_119 to i26
  %p_Val2_79_3 = mul i42 -402, %OP1_V_7_cast6
  %tmp_120 = call i24 @_ssdm_op_PartSelect.i24.i42.i32.i32(i42 %p_Val2_79_3, i32 18, i32 41)
  %tmp_156_cast = sext i24 %tmp_120 to i27
  %p_Val2_79_4 = mul i42 -484, %OP1_V_7_cast6
  %tmp_121 = call i24 @_ssdm_op_PartSelect.i24.i42.i32.i32(i42 %p_Val2_79_4, i32 18, i32 41)
  %tmp_158_cast = sext i24 %tmp_121 to i27
  %p_Val2_79_5 = mul i41 -133, %OP1_V_7_cast
  %tmp_122 = call i23 @_ssdm_op_PartSelect.i23.i41.i32.i32(i41 %p_Val2_79_5, i32 18, i32 40)
  %tmp_160_cast = sext i23 %tmp_122 to i24
  %p_Val2_79_6 = mul i44 -1793, %OP1_V_7_cast7
  %tmp_123 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_79_6, i32 18, i32 43)
  %tmp_162_cast = sext i26 %tmp_123 to i27
  %p_Val2_79_7 = mul i40 125, %OP1_V_7_cast5
  %tmp_124 = call i22 @_ssdm_op_PartSelect.i22.i40.i32.i32(i40 %p_Val2_79_7, i32 18, i32 39)
  %tmp_164_cast = sext i22 %tmp_124 to i27
  %p_Val2_79_8 = mul i41 228, %OP1_V_7_cast
  %tmp_125 = call i23 @_ssdm_op_PartSelect.i23.i41.i32.i32(i41 %p_Val2_79_8, i32 18, i32 40)
  %tmp_166_cast = sext i23 %tmp_125 to i24
  %p_Val2_79_9 = mul i42 -325, %OP1_V_7_cast6
  %tmp_126 = call i24 @_ssdm_op_PartSelect.i24.i42.i32.i32(i42 %p_Val2_79_9, i32 18, i32 41)
  %tmp_168_cast = sext i24 %tmp_126 to i27
  %p_Val2_79_s = mul i43 549, %OP1_V_7_cast4
  %tmp_127 = call i25 @_ssdm_op_PartSelect.i25.i43.i32.i32(i43 %p_Val2_79_s, i32 18, i32 42)
  %tmp_170_cast = sext i25 %tmp_127 to i27
  %p_Val2_79_10 = mul i44 2761, %OP1_V_7_cast7
  %tmp_128 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_79_10, i32 18, i32 43)
  %tmp_172_cast = sext i26 %tmp_128 to i27
  %p_Val2_79_11 = mul i44 -1034, %OP1_V_7_cast7
  %tmp_129 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_79_11, i32 18, i32 43)
  %tmp_174_cast = sext i26 %tmp_129 to i27
  %p_Val2_79_12 = mul i43 738, %OP1_V_7_cast4
  %tmp_130 = call i25 @_ssdm_op_PartSelect.i25.i43.i32.i32(i43 %p_Val2_79_12, i32 18, i32 42)
  %tmp_176_cast = sext i25 %tmp_130 to i26
  %p_Val2_79_13 = mul i43 529, %OP1_V_7_cast4
  %tmp_131 = call i25 @_ssdm_op_PartSelect.i25.i43.i32.i32(i43 %p_Val2_79_13, i32 18, i32 42)
  %tmp_178_cast = sext i25 %tmp_131 to i27
  %data_V_load_8 = load i32* %data_V_addr_8, align 4
  %data_V1_load_8 = load i32* %data_V1_addr_8, align 4
  %data_V2_load_8 = load i32* %data_V2_addr_8, align 4
  %data_V3_load_8 = load i32* %data_V3_addr_8, align 4
  %data_V4_load_8 = load i32* %data_V4_addr_8, align 4
  %data_V5_load_8 = load i32* %data_V5_addr_8, align 4
  %data_V6_load_8 = load i32* %data_V6_addr_8, align 4
  %data_V7_load_8 = load i32* %data_V7_addr_8, align 4
  %data_V8_load_8 = load i32* %data_V8_addr_8, align 4
  %data_V9_load_8 = load i32* %data_V9_addr_8, align 4
  %data_V10_load_8 = load i32* %data_V10_addr_8, align 4
  %data_V11_load_8 = load i32* %data_V11_addr_8, align 4
  %data_V12_load_8 = load i32* %data_V12_addr_8, align 4
  %data_V13_load_8 = load i32* %data_V13_addr_8, align 4
  %data_V14_load_8 = load i32* %data_V14_addr_8, align 4
  %data_V15_load_8 = load i32* %data_V15_addr_8, align 4
  %data_V16_load_8 = load i32* %data_V16_addr_8, align 4
  %data_V17_load_8 = load i32* %data_V17_addr_8, align 4
  %data_V18_load_8 = load i32* %data_V18_addr_8, align 4
  %data_V19_load_8 = load i32* %data_V19_addr_8, align 4
  %data_V20_load_8 = load i32* %data_V20_addr_8, align 4
  %data_V21_load_8 = load i32* %data_V21_addr_8, align 4
  %data_V22_load_8 = load i32* %data_V22_addr_8, align 4
  %data_V23_load_8 = load i32* %data_V23_addr_8, align 4
  %data_V24_load_8 = load i32* %data_V24_addr_8, align 4
  %data_V25_load_8 = load i32* %data_V25_addr_8, align 4
  %data_V26_load_8 = load i32* %data_V26_addr_8, align 4
  %data_V27_load_8 = load i32* %data_V27_addr_8, align 4
  %data_V28_load_8 = load i32* %data_V28_addr_8, align 4
  %data_V29_load_8 = load i32* %data_V29_addr_8, align 4
  %tmp_132 = call i32 @_ssdm_op_Mux.ap_auto.30i32.i5(i32 %data_V_load_8, i32 %data_V1_load_8, i32 %data_V2_load_8, i32 %data_V3_load_8, i32 %data_V4_load_8, i32 %data_V5_load_8, i32 %data_V6_load_8, i32 %data_V7_load_8, i32 %data_V8_load_8, i32 %data_V9_load_8, i32 %data_V10_load_8, i32 %data_V11_load_8, i32 %data_V12_load_8, i32 %data_V13_load_8, i32 %data_V14_load_8, i32 %data_V15_load_8, i32 %data_V16_load_8, i32 %data_V17_load_8, i32 %data_V18_load_8, i32 %data_V19_load_8, i32 %data_V20_load_8, i32 %data_V21_load_8, i32 %data_V22_load_8, i32 %data_V23_load_8, i32 %data_V24_load_8, i32 %data_V25_load_8, i32 %data_V26_load_8, i32 %data_V27_load_8, i32 %data_V28_load_8, i32 %data_V29_load_8, i5 %data_V_offset1_read)
  %OP1_V_8_cast = sext i32 %tmp_132 to i42
  %OP1_V_8_cast3 = sext i32 %tmp_132 to i44
  %OP1_V_8_cast5 = sext i32 %tmp_132 to i41
  %OP1_V_8_cast6 = sext i32 %tmp_132 to i43
  %p_Val2_7 = mul i43 882, %OP1_V_8_cast6
  %tmp_133 = call i25 @_ssdm_op_PartSelect.i25.i43.i32.i32(i43 %p_Val2_7, i32 18, i32 42)
  %tmp_181_cast = sext i25 %tmp_133 to i26
  %p_Val2_811_1 = mul i41 231, %OP1_V_8_cast5
  %tmp_134 = call i23 @_ssdm_op_PartSelect.i23.i41.i32.i32(i41 %p_Val2_811_1, i32 18, i32 40)
  %tmp_183_cast = sext i23 %tmp_134 to i27
  %p_Val2_811_3 = mul i44 1497, %OP1_V_8_cast3
  %tmp_135 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_811_3, i32 18, i32 43)
  %tmp_185_cast = sext i26 %tmp_135 to i27
  %p_Val2_811_4 = mul i44 -1660, %OP1_V_8_cast3
  %tmp_136 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_811_4, i32 18, i32 43)
  %tmp_187_cast = sext i26 %tmp_136 to i27
  %p_shl2 = call i39 @_ssdm_op_BitConcatenate.i39.i32.i7(i32 %tmp_132, i7 0)
  %p_shl2_cast = sext i39 %p_shl2 to i40
  %p_Val2_811_5 = sub i40 0, %p_shl2_cast
  %tmp_137 = call i22 @_ssdm_op_PartSelect.i22.i40.i32.i32(i40 %p_Val2_811_5, i32 18, i32 39)
  %tmp_189_cast = sext i22 %tmp_137 to i24
  %p_Val2_811_6 = mul i43 -983, %OP1_V_8_cast6
  %tmp_138 = call i25 @_ssdm_op_PartSelect.i25.i43.i32.i32(i43 %p_Val2_811_6, i32 18, i32 42)
  %tmp_191_cast = sext i25 %tmp_138 to i27
  %p_Val2_811_7 = mul i44 1241, %OP1_V_8_cast3
  %tmp_139 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_811_7, i32 18, i32 43)
  %tmp_193_cast = sext i26 %tmp_139 to i27
  %p_Val2_811_8 = mul i41 -234, %OP1_V_8_cast5
  %tmp_140 = call i23 @_ssdm_op_PartSelect.i23.i41.i32.i32(i41 %p_Val2_811_8, i32 18, i32 40)
  %tmp_195_cast = sext i23 %tmp_140 to i24
  %p_Val2_811_9 = mul i42 449, %OP1_V_8_cast
  %tmp_141 = call i24 @_ssdm_op_PartSelect.i24.i42.i32.i32(i42 %p_Val2_811_9, i32 18, i32 41)
  %tmp_197_cast = sext i24 %tmp_141 to i27
  %p_Val2_811_s = mul i44 -2469, %OP1_V_8_cast3
  %tmp_142 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_811_s, i32 18, i32 43)
  %tmp_199_cast = sext i26 %tmp_142 to i27
  %p_Val2_811_2 = mul i44 1263, %OP1_V_8_cast3
  %tmp_143 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_811_2, i32 18, i32 43)
  %tmp_201_cast = sext i26 %tmp_143 to i27
  %p_Val2_811_10 = mul i44 2168, %OP1_V_8_cast3
  %tmp_144 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_811_10, i32 18, i32 43)
  %tmp_203_cast = sext i26 %tmp_144 to i27
  %p_Val2_811_11 = mul i41 234, %OP1_V_8_cast5
  %tmp_145 = call i23 @_ssdm_op_PartSelect.i23.i41.i32.i32(i41 %p_Val2_811_11, i32 18, i32 40)
  %tmp_205_cast = sext i23 %tmp_145 to i26
  %p_Val2_811_12 = mul i44 1124, %OP1_V_8_cast3
  %tmp_146 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_811_12, i32 18, i32 43)
  %tmp_207_cast = sext i26 %tmp_146 to i27
  %data_V_load_9 = load i32* %data_V_addr_9, align 4
  %data_V1_load_9 = load i32* %data_V1_addr_9, align 4
  %data_V2_load_9 = load i32* %data_V2_addr_9, align 4
  %data_V3_load_9 = load i32* %data_V3_addr_9, align 4
  %data_V4_load_9 = load i32* %data_V4_addr_9, align 4
  %data_V5_load_9 = load i32* %data_V5_addr_9, align 4
  %data_V6_load_9 = load i32* %data_V6_addr_9, align 4
  %data_V7_load_9 = load i32* %data_V7_addr_9, align 4
  %data_V8_load_9 = load i32* %data_V8_addr_9, align 4
  %data_V9_load_9 = load i32* %data_V9_addr_9, align 4
  %data_V10_load_9 = load i32* %data_V10_addr_9, align 4
  %data_V11_load_9 = load i32* %data_V11_addr_9, align 4
  %data_V12_load_9 = load i32* %data_V12_addr_9, align 4
  %data_V13_load_9 = load i32* %data_V13_addr_9, align 4
  %data_V14_load_9 = load i32* %data_V14_addr_9, align 4
  %data_V15_load_9 = load i32* %data_V15_addr_9, align 4
  %data_V16_load_9 = load i32* %data_V16_addr_9, align 4
  %data_V17_load_9 = load i32* %data_V17_addr_9, align 4
  %data_V18_load_9 = load i32* %data_V18_addr_9, align 4
  %data_V19_load_9 = load i32* %data_V19_addr_9, align 4
  %data_V20_load_9 = load i32* %data_V20_addr_9, align 4
  %data_V21_load_9 = load i32* %data_V21_addr_9, align 4
  %data_V22_load_9 = load i32* %data_V22_addr_9, align 4
  %data_V23_load_9 = load i32* %data_V23_addr_9, align 4
  %data_V24_load_9 = load i32* %data_V24_addr_9, align 4
  %data_V25_load_9 = load i32* %data_V25_addr_9, align 4
  %data_V26_load_9 = load i32* %data_V26_addr_9, align 4
  %data_V27_load_9 = load i32* %data_V27_addr_9, align 4
  %data_V28_load_9 = load i32* %data_V28_addr_9, align 4
  %data_V29_load_9 = load i32* %data_V29_addr_9, align 4
  %tmp_147 = call i32 @_ssdm_op_Mux.ap_auto.30i32.i5(i32 %data_V_load_9, i32 %data_V1_load_9, i32 %data_V2_load_9, i32 %data_V3_load_9, i32 %data_V4_load_9, i32 %data_V5_load_9, i32 %data_V6_load_9, i32 %data_V7_load_9, i32 %data_V8_load_9, i32 %data_V9_load_9, i32 %data_V10_load_9, i32 %data_V11_load_9, i32 %data_V12_load_9, i32 %data_V13_load_9, i32 %data_V14_load_9, i32 %data_V15_load_9, i32 %data_V16_load_9, i32 %data_V17_load_9, i32 %data_V18_load_9, i32 %data_V19_load_9, i32 %data_V20_load_9, i32 %data_V21_load_9, i32 %data_V22_load_9, i32 %data_V23_load_9, i32 %data_V24_load_9, i32 %data_V25_load_9, i32 %data_V26_load_9, i32 %data_V27_load_9, i32 %data_V28_load_9, i32 %data_V29_load_9, i5 %data_V_offset1_read)
  %OP1_V_9_cast4 = sext i32 %tmp_147 to i45
  %OP1_V_9_cast5 = sext i32 %tmp_147 to i40
  %OP1_V_9_cast6 = sext i32 %tmp_147 to i42
  %OP1_V_9_cast7 = sext i32 %tmp_147 to i44
  %OP1_V_9_cast = sext i32 %tmp_147 to i43
  %p_Val2_8 = mul i43 -746, %OP1_V_9_cast
  %tmp_148 = call i25 @_ssdm_op_PartSelect.i25.i43.i32.i32(i43 %p_Val2_8, i32 18, i32 42)
  %tmp_210_cast = sext i25 %tmp_148 to i27
  %p_Val2_912_1 = mul i43 -875, %OP1_V_9_cast
  %tmp_149 = call i25 @_ssdm_op_PartSelect.i25.i43.i32.i32(i43 %p_Val2_912_1, i32 18, i32 42)
  %tmp_212_cast = sext i25 %tmp_149 to i27
  %p_Val2_912_2 = mul i44 1475, %OP1_V_9_cast7
  %tmp_150 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_912_2, i32 18, i32 43)
  %tmp_214_cast = sext i26 %tmp_150 to i28
  %p_Val2_912_3 = mul i43 -850, %OP1_V_9_cast
  %tmp_151 = call i25 @_ssdm_op_PartSelect.i25.i43.i32.i32(i43 %p_Val2_912_3, i32 18, i32 42)
  %tmp_216_cast = sext i25 %tmp_151 to i27
  %p_Val2_912_4 = mul i44 -1564, %OP1_V_9_cast7
  %tmp_152 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_912_4, i32 18, i32 43)
  %tmp_218_cast = sext i26 %tmp_152 to i28
  %p_Val2_912_5 = mul i43 -568, %OP1_V_9_cast
  %tmp_153 = call i25 @_ssdm_op_PartSelect.i25.i43.i32.i32(i43 %p_Val2_912_5, i32 18, i32 42)
  %tmp_220_cast = sext i25 %tmp_153 to i27
  %p_Val2_912_6 = mul i42 -319, %OP1_V_9_cast6
  %tmp_154 = call i24 @_ssdm_op_PartSelect.i24.i42.i32.i32(i42 %p_Val2_912_6, i32 18, i32 41)
  %tmp_222_cast = sext i24 %tmp_154 to i26
  %p_Val2_912_7 = mul i43 -649, %OP1_V_9_cast
  %tmp_155 = call i25 @_ssdm_op_PartSelect.i25.i43.i32.i32(i43 %p_Val2_912_7, i32 18, i32 42)
  %tmp_224_cast = sext i25 %tmp_155 to i26
  %p_Val2_912_8 = mul i40 -118, %OP1_V_9_cast5
  %tmp_156 = call i22 @_ssdm_op_PartSelect.i22.i40.i32.i32(i40 %p_Val2_912_8, i32 18, i32 39)
  %tmp_226_cast = sext i22 %tmp_156 to i27
  %p_Val2_912_9 = mul i44 -1198, %OP1_V_9_cast7
  %tmp_157 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_912_9, i32 18, i32 43)
  %tmp_228_cast = sext i26 %tmp_157 to i27
  %p_Val2_912_s = mul i44 2158, %OP1_V_9_cast7
  %tmp_158 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_912_s, i32 18, i32 43)
  %tmp_230_cast = sext i26 %tmp_158 to i28
  %p_Val2_912_10 = mul i45 4521, %OP1_V_9_cast4
  %tmp_159 = call i27 @_ssdm_op_PartSelect.i27.i45.i32.i32(i45 %p_Val2_912_10, i32 18, i32 44)
  %tmp_232_cast = sext i27 %tmp_159 to i28
  %p_Val2_912_11 = mul i44 -1242, %OP1_V_9_cast7
  %tmp_160 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_912_11, i32 18, i32 43)
  %tmp_234_cast = sext i26 %tmp_160 to i28
  %p_Val2_912_12 = mul i44 -1508, %OP1_V_9_cast7
  %tmp_161 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_912_12, i32 18, i32 43)
  %tmp_236_cast = sext i26 %tmp_161 to i28
  %p_Val2_912_13 = mul i44 -1490, %OP1_V_9_cast7
  %tmp_162 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_912_13, i32 18, i32 43)
  %tmp_238_cast = sext i26 %tmp_162 to i27
  %data_V_load_10 = load i32* %data_V_addr_10, align 4
  %data_V1_load_10 = load i32* %data_V1_addr_10, align 4
  %data_V2_load_10 = load i32* %data_V2_addr_10, align 4
  %data_V3_load_10 = load i32* %data_V3_addr_10, align 4
  %data_V4_load_10 = load i32* %data_V4_addr_10, align 4
  %data_V5_load_10 = load i32* %data_V5_addr_10, align 4
  %data_V6_load_10 = load i32* %data_V6_addr_10, align 4
  %data_V7_load_10 = load i32* %data_V7_addr_10, align 4
  %data_V8_load_10 = load i32* %data_V8_addr_10, align 4
  %data_V9_load_10 = load i32* %data_V9_addr_10, align 4
  %data_V10_load_10 = load i32* %data_V10_addr_10, align 4
  %data_V11_load_10 = load i32* %data_V11_addr_10, align 4
  %data_V12_load_10 = load i32* %data_V12_addr_10, align 4
  %data_V13_load_10 = load i32* %data_V13_addr_10, align 4
  %data_V14_load_10 = load i32* %data_V14_addr_10, align 4
  %data_V15_load_10 = load i32* %data_V15_addr_10, align 4
  %data_V16_load_10 = load i32* %data_V16_addr_10, align 4
  %data_V17_load_10 = load i32* %data_V17_addr_10, align 4
  %data_V18_load_10 = load i32* %data_V18_addr_10, align 4
  %data_V19_load_10 = load i32* %data_V19_addr_10, align 4
  %data_V20_load_10 = load i32* %data_V20_addr_10, align 4
  %data_V21_load_10 = load i32* %data_V21_addr_10, align 4
  %data_V22_load_10 = load i32* %data_V22_addr_10, align 4
  %data_V23_load_10 = load i32* %data_V23_addr_10, align 4
  %data_V24_load_10 = load i32* %data_V24_addr_10, align 4
  %data_V25_load_10 = load i32* %data_V25_addr_10, align 4
  %data_V26_load_10 = load i32* %data_V26_addr_10, align 4
  %data_V27_load_10 = load i32* %data_V27_addr_10, align 4
  %data_V28_load_10 = load i32* %data_V28_addr_10, align 4
  %data_V29_load_10 = load i32* %data_V29_addr_10, align 4
  %tmp_163 = call i32 @_ssdm_op_Mux.ap_auto.30i32.i5(i32 %data_V_load_10, i32 %data_V1_load_10, i32 %data_V2_load_10, i32 %data_V3_load_10, i32 %data_V4_load_10, i32 %data_V5_load_10, i32 %data_V6_load_10, i32 %data_V7_load_10, i32 %data_V8_load_10, i32 %data_V9_load_10, i32 %data_V10_load_10, i32 %data_V11_load_10, i32 %data_V12_load_10, i32 %data_V13_load_10, i32 %data_V14_load_10, i32 %data_V15_load_10, i32 %data_V16_load_10, i32 %data_V17_load_10, i32 %data_V18_load_10, i32 %data_V19_load_10, i32 %data_V20_load_10, i32 %data_V21_load_10, i32 %data_V22_load_10, i32 %data_V23_load_10, i32 %data_V24_load_10, i32 %data_V25_load_10, i32 %data_V26_load_10, i32 %data_V27_load_10, i32 %data_V28_load_10, i32 %data_V29_load_10, i5 %data_V_offset1_read)
  %OP1_V_10_cast4 = sext i32 %tmp_163 to i44
  %OP1_V_10_cast = sext i32 %tmp_163 to i42
  %p_Val2_9 = mul i44 2619, %OP1_V_10_cast4
  %tmp_164 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_9, i32 18, i32 43)
  %tmp_241_cast = sext i26 %tmp_164 to i27
  %p_Val2_10_1 = mul i44 1579, %OP1_V_10_cast4
  %tmp_165 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_10_1, i32 18, i32 43)
  %tmp_243_cast = sext i26 %tmp_165 to i27
  %p_Val2_10_2 = mul i44 -2352, %OP1_V_10_cast4
  %tmp_166 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_10_2, i32 18, i32 43)
  %tmp_245_cast = sext i26 %tmp_166 to i27
  %p_Val2_10_3 = mul i44 1547, %OP1_V_10_cast4
  %tmp_167 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_10_3, i32 18, i32 43)
  %tmp_247_cast = sext i26 %tmp_167 to i27
  %p_Val2_10_4 = mul i44 1637, %OP1_V_10_cast4
  %tmp_168 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_10_4, i32 18, i32 43)
  %tmp_249_cast = sext i26 %tmp_168 to i27
  %p_Val2_10_5 = mul i44 -1749, %OP1_V_10_cast4
  %tmp_169 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_10_5, i32 18, i32 43)
  %tmp_251_cast = sext i26 %tmp_169 to i27
  %p_Val2_10_6 = mul i42 321, %OP1_V_10_cast
  %tmp_170 = call i24 @_ssdm_op_PartSelect.i24.i42.i32.i32(i42 %p_Val2_10_6, i32 18, i32 41)
  %tmp_253_cast = sext i24 %tmp_170 to i25
  %p_Val2_10_8 = mul i44 2888, %OP1_V_10_cast4
  %tmp_171 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_10_8, i32 18, i32 43)
  %tmp_255_cast = sext i26 %tmp_171 to i27
  %p_Val2_10_9 = mul i44 1037, %OP1_V_10_cast4
  %tmp_172 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_10_9, i32 18, i32 43)
  %tmp_257_cast = sext i26 %tmp_172 to i27
  %p_Val2_10_s = mul i44 -3911, %OP1_V_10_cast4
  %tmp_173 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_10_s, i32 18, i32 43)
  %tmp_259_cast = sext i26 %tmp_173 to i27
  %p_Val2_10_7 = mul i42 -379, %OP1_V_10_cast
  %tmp_174 = call i24 @_ssdm_op_PartSelect.i24.i42.i32.i32(i42 %p_Val2_10_7, i32 18, i32 41)
  %tmp_261_cast = sext i24 %tmp_174 to i25
  %p_Val2_10_10 = mul i44 3535, %OP1_V_10_cast4
  %tmp_175 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_10_10, i32 18, i32 43)
  %tmp_263_cast = sext i26 %tmp_175 to i27
  %p_Val2_10_11 = mul i44 2976, %OP1_V_10_cast4
  %tmp_176 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_10_11, i32 18, i32 43)
  %tmp_265_cast = sext i26 %tmp_176 to i27
  %p_shl = call i42 @_ssdm_op_BitConcatenate.i42.i32.i10(i32 %tmp_163, i10 0)
  %p_shl_cast = sext i42 %p_shl to i43
  %p_shl1 = call i34 @_ssdm_op_BitConcatenate.i34.i32.i2(i32 %tmp_163, i2 0)
  %p_shl1_cast = sext i34 %p_shl1 to i43
  %p_Val2_10_12 = sub i43 %p_shl_cast, %p_shl1_cast
  %tmp_177 = call i25 @_ssdm_op_PartSelect.i25.i43.i32.i32(i43 %p_Val2_10_12, i32 18, i32 42)
  %tmp_267_cast = sext i25 %tmp_177 to i26
  %tmp9 = add i32 %mult_2_0_V, %mult_1_0_V
  %tmp8 = add i32 %mult_0_0_V, %tmp9
  %tmp11 = add i26 %mult_5_0_V_cast, %mult_4_0_V_cast
  %tmp11_cast = sext i26 %tmp11 to i27
  %tmp10 = add i27 %mult_3_0_V_cast, %tmp11_cast
  %tmp10_cast = sext i27 %tmp10 to i32
  %tmp7 = add i32 %tmp8, %tmp10_cast
  %tmp14 = add i26 %tmp_181_cast, %tmp_150_cast
  %tmp13 = add i26 %tmp_120_cast, %tmp14
  %tmp13_cast = sext i26 %tmp13 to i28
  %tmp16 = add i27 56091, %tmp_241_cast
  %tmp15 = add i27 %tmp_210_cast, %tmp16
  %tmp15_cast = sext i27 %tmp15 to i28
  %tmp12 = add i28 %tmp13_cast, %tmp15_cast
  %tmp12_cast = sext i28 %tmp12 to i32
  %res_0_V_write_assig = add i32 %tmp7, %tmp12_cast
  %tmp19 = add i32 %mult_2_1_V, %mult_1_1_V
  %tmp18 = add i32 %mult_0_1_V, %tmp19
  %tmp21 = add i27 %mult_5_1_V_cast, %mult_4_1_V_cast
  %tmp21_cast = sext i27 %tmp21 to i28
  %tmp20 = add i28 %mult_3_1_V_cast, %tmp21_cast
  %tmp20_cast = sext i28 %tmp20 to i32
  %tmp17 = add i32 %tmp18, %tmp20_cast
  %tmp24 = add i27 %tmp_183_cast, %tmp_152_cast
  %tmp23 = add i27 %tmp_122_cast, %tmp24
  %tmp23_cast = sext i27 %tmp23 to i28
  %tmp26 = add i27 68078, %tmp_243_cast
  %tmp25 = add i27 %tmp_212_cast, %tmp26
  %tmp25_cast = sext i27 %tmp25 to i28
  %tmp22 = add i28 %tmp23_cast, %tmp25_cast
  %tmp22_cast = sext i28 %tmp22 to i32
  %res_1_V_write_assig = add i32 %tmp17, %tmp22_cast
  %tmp29 = add i29 %mult_2_2_V_cast, %mult_1_2_V_cast
  %tmp29_cast = sext i29 %tmp29 to i30
  %tmp28 = add i30 %mult_0_2_V_cast, %tmp29_cast
  %tmp31 = add i27 %mult_5_2_V_cast, %mult_4_2_V_cast
  %tmp30 = add i27 %mult_3_2_V_cast, %tmp31
  %tmp30_cast = sext i27 %tmp30 to i30
  %tmp27 = add i30 %tmp28, %tmp30_cast
  %tmp34 = add i26 %tmp_181_cast, %tmp_154_cast
  %tmp33 = add i26 %tmp_124_cast, %tmp34
  %tmp33_cast = sext i26 %tmp33 to i28
  %tmp36 = add i27 64448, %tmp_245_cast
  %tmp36_cast = sext i27 %tmp36 to i28
  %tmp35 = add i28 %tmp_214_cast, %tmp36_cast
  %tmp32 = add i28 %tmp33_cast, %tmp35
  %tmp32_cast = sext i28 %tmp32 to i30
  %res_2_V_write_assig = add i30 %tmp27, %tmp32_cast
  %res_2_V_write_assig_1 = sext i30 %res_2_V_write_assig to i32
  %tmp39 = add i32 %mult_2_3_V, %mult_1_3_V
  %tmp38 = add i32 %mult_0_3_V, %tmp39
  %tmp41 = add i27 %mult_5_3_V_cast, %mult_4_3_V_cast
  %tmp41_cast = sext i27 %tmp41 to i28
  %tmp40 = add i28 %mult_3_3_V_cast, %tmp41_cast
  %tmp40_cast = sext i28 %tmp40 to i32
  %tmp37 = add i32 %tmp38, %tmp40_cast
  %tmp44 = add i27 %tmp_185_cast, %tmp_156_cast
  %tmp43 = add i27 %tmp_126_cast, %tmp44
  %tmp43_cast = sext i27 %tmp43 to i28
  %tmp46 = add i27 -509786, %tmp_247_cast
  %tmp45 = add i27 %tmp_216_cast, %tmp46
  %tmp45_cast = sext i27 %tmp45 to i28
  %tmp42 = add i28 %tmp43_cast, %tmp45_cast
  %tmp42_cast = sext i28 %tmp42 to i32
  %res_3_V_write_assig = add i32 %tmp37, %tmp42_cast
  %tmp49 = add i32 %mult_2_4_V, %mult_1_4_V
  %tmp48 = add i32 %mult_0_4_V, %tmp49
  %tmp51 = add i27 %tmp_97_cast, %mult_4_4_V_cast
  %tmp51_cast = sext i27 %tmp51 to i28
  %tmp50 = add i28 %mult_3_4_V_cast, %tmp51_cast
  %tmp50_cast = sext i28 %tmp50 to i32
  %tmp47 = add i32 %tmp48, %tmp50_cast
  %tmp54 = add i27 %tmp_187_cast, %tmp_158_cast
  %tmp53 = add i27 %tmp_128_cast, %tmp54
  %tmp53_cast = sext i27 %tmp53 to i28
  %tmp56 = add i27 2141, %tmp_249_cast
  %tmp56_cast = sext i27 %tmp56 to i28
  %tmp55 = add i28 %tmp_218_cast, %tmp56_cast
  %tmp52 = add i28 %tmp53_cast, %tmp55
  %tmp52_cast = sext i28 %tmp52 to i32
  %res_4_V_write_assig = add i32 %tmp47, %tmp52_cast
  %tmp59 = add i31 %mult_2_5_V_cast, %mult_1_5_V_cast
  %tmp58 = add i31 %mult_0_5_V_cast, %tmp59
  %tmp61 = add i27 %tmp_99_cast, %mult_4_5_V_cast
  %tmp61_cast = sext i27 %tmp61 to i28
  %tmp60 = add i28 %mult_3_5_V_cast, %tmp61_cast
  %tmp60_cast = sext i28 %tmp60 to i31
  %tmp57 = add i31 %tmp58, %tmp60_cast
  %tmp57_cast = sext i31 %tmp57 to i32
  %tmp64 = add i24 %tmp_189_cast, %tmp_160_cast
  %tmp63 = add i24 %tmp_130_cast, %tmp64
  %tmp63_cast = sext i24 %tmp63 to i27
  %tmp66 = add i27 28776, %tmp_251_cast
  %tmp65 = add i27 %tmp_220_cast, %tmp66
  %tmp62 = add i27 %tmp63_cast, %tmp65
  %tmp62_cast = sext i27 %tmp62 to i32
  %res_5_V_write_assig = add i32 %tmp57_cast, %tmp62_cast
  %tmp69 = add i32 %mult_2_6_V, %mult_1_6_V
  %tmp68 = add i32 %mult_0_6_V, %tmp69
  %tmp71 = add i27 %tmp_101_cast, %mult_4_6_V_cast
  %tmp71_cast = sext i27 %tmp71 to i28
  %tmp70 = add i28 %mult_3_6_V_cast, %tmp71_cast
  %tmp70_cast = sext i28 %tmp70 to i32
  %tmp67 = add i32 %tmp68, %tmp70_cast
  %tmp74 = add i27 %tmp_191_cast, %tmp_162_cast
  %tmp74_cast = sext i27 %tmp74 to i28
  %tmp73 = add i28 %tmp_132_cast, %tmp74_cast
  %tmp76 = add i25 -31233, %tmp_253_cast
  %tmp76_cast = sext i25 %tmp76 to i26
  %tmp75 = add i26 %tmp_222_cast, %tmp76_cast
  %tmp75_cast = sext i26 %tmp75 to i28
  %tmp72 = add i28 %tmp73, %tmp75_cast
  %tmp72_cast = sext i28 %tmp72 to i32
  %res_6_V_write_assig = add i32 %tmp67, %tmp72_cast
  %tmp79 = add i29 %mult_2_7_V_cast, %mult_1_7_V_cast
  %tmp79_cast = sext i29 %tmp79 to i30
  %tmp78 = add i30 %mult_0_7_V_cast, %tmp79_cast
  %tmp78_cast = sext i30 %tmp78 to i31
  %tmp81 = add i27 %tmp_103_cast, %mult_4_7_V_cast
  %tmp81_cast = sext i27 %tmp81 to i28
  %tmp80 = add i28 %mult_3_7_V_cast, %tmp81_cast
  %tmp80_cast = sext i28 %tmp80 to i31
  %tmp77 = add i31 %tmp78_cast, %tmp80_cast
  %tmp84 = add i27 %tmp_193_cast, %tmp_164_cast
  %tmp83 = add i27 %tmp_134_cast, %tmp84
  %tmp83_cast = sext i27 %tmp83 to i28
  %tmp86 = add i25 -38765, %tmp_253_cast
  %tmp86_cast = sext i25 %tmp86 to i26
  %tmp85 = add i26 %tmp_224_cast, %tmp86_cast
  %tmp85_cast = sext i26 %tmp85 to i28
  %tmp82 = add i28 %tmp83_cast, %tmp85_cast
  %tmp82_cast = sext i28 %tmp82 to i31
  %res_7_V_write_assig = add i31 %tmp77, %tmp82_cast
  %res_7_V_write_assig_1 = sext i31 %res_7_V_write_assig to i32
  %tmp89 = add i32 %mult_2_8_V, %mult_1_8_V
  %tmp88 = add i32 %mult_0_8_V, %tmp89
  %tmp91 = add i27 %tmp_105_cast, %mult_4_8_V_cast
  %tmp91_cast = sext i27 %tmp91 to i28
  %tmp90 = add i28 %mult_3_8_V_cast, %tmp91_cast
  %tmp90_cast = sext i28 %tmp90 to i32
  %tmp87 = add i32 %tmp88, %tmp90_cast
  %tmp94 = add i24 %tmp_195_cast, %tmp_166_cast
  %tmp94_cast = sext i24 %tmp94 to i25
  %tmp93 = add i25 %tmp_136_cast, %tmp94_cast
  %tmp93_cast = sext i25 %tmp93 to i27
  %tmp96 = add i27 -41199, %tmp_255_cast
  %tmp95 = add i27 %tmp_226_cast, %tmp96
  %tmp92 = add i27 %tmp93_cast, %tmp95
  %tmp92_cast = sext i27 %tmp92 to i32
  %res_8_V_write_assig = add i32 %tmp87, %tmp92_cast
  %tmp99 = add i32 %mult_2_9_V, %mult_1_9_V
  %tmp98 = add i32 %mult_0_9_V, %tmp99
  %tmp101 = add i27 %tmp_107_cast, %mult_4_9_V_cast
  %tmp101_cast = sext i27 %tmp101 to i28
  %tmp100 = add i28 %mult_3_9_V_cast, %tmp101_cast
  %tmp100_cast = sext i28 %tmp100 to i32
  %tmp97 = add i32 %tmp98, %tmp100_cast
  %tmp104 = add i27 %tmp_228_cast, %tmp_197_cast
  %tmp103 = add i27 %tmp_168_cast, %tmp104
  %tmp103_cast = sext i27 %tmp103 to i28
  %tmp106 = add i17 -41170, %tmp_25_6_9_cast
  %tmp106_cast_cast = sext i17 %tmp106 to i27
  %tmp105 = add i27 %tmp_257_cast, %tmp106_cast_cast
  %tmp105_cast = sext i27 %tmp105 to i28
  %tmp102 = add i28 %tmp103_cast, %tmp105_cast
  %tmp102_cast = sext i28 %tmp102 to i32
  %res_9_V_write_assig = add i32 %tmp97, %tmp102_cast
  %tmp109 = add i32 %mult_2_10_V, %mult_1_10_V
  %tmp108 = add i32 %mult_0_10_V, %tmp109
  %tmp111 = add i27 %tmp_109_cast, %mult_4_10_V_cast
  %tmp111_cast = sext i27 %tmp111 to i28
  %tmp110 = add i28 %mult_3_10_V_cast, %tmp111_cast
  %tmp110_cast = sext i28 %tmp110 to i32
  %tmp107 = add i32 %tmp108, %tmp110_cast
  %tmp114 = add i27 %tmp_199_cast, %tmp_170_cast
  %tmp113 = add i27 %tmp_139_cast, %tmp114
  %tmp113_cast = sext i27 %tmp113 to i28
  %tmp116 = add i27 -374167, %tmp_259_cast
  %tmp116_cast = sext i27 %tmp116 to i28
  %tmp115 = add i28 %tmp_230_cast, %tmp116_cast
  %tmp112 = add i28 %tmp113_cast, %tmp115
  %tmp112_cast = sext i28 %tmp112 to i32
  %res_10_V_write_assi = add i32 %tmp107, %tmp112_cast
  %tmp119 = add i32 %mult_2_11_V, %mult_1_11_V
  %tmp118 = add i32 %mult_0_11_V, %tmp119
  %tmp121 = add i30 %tmp_111_cast, %mult_4_11_V_cast
  %tmp120 = add i30 %mult_3_11_V_cast, %tmp121
  %tmp120_cast = sext i30 %tmp120 to i32
  %tmp117 = add i32 %tmp118, %tmp120_cast
  %tmp124 = add i27 %tmp_201_cast, %tmp_172_cast
  %tmp124_cast = sext i27 %tmp124 to i31
  %tmp123 = add i31 %tmp_141_cast, %tmp124_cast
  %tmp126 = add i25 401877, %tmp_261_cast
  %tmp126_cast = sext i25 %tmp126 to i28
  %tmp125 = add i28 %tmp_232_cast, %tmp126_cast
  %tmp125_cast = sext i28 %tmp125 to i31
  %tmp122 = add i31 %tmp123, %tmp125_cast
  %tmp122_cast = sext i31 %tmp122 to i32
  %res_11_V_write_assi = add i32 %tmp117, %tmp122_cast
  %tmp129 = add i32 %mult_2_12_V, %mult_1_12_V
  %tmp128 = add i32 %mult_0_12_V, %tmp129
  %tmp131 = add i25 %tmp_113_cast, %mult_4_12_V_cast
  %tmp131_cast = sext i25 %tmp131 to i26
  %tmp130 = add i26 %mult_3_12_V_cast, %tmp131_cast
  %tmp130_cast = sext i26 %tmp130 to i32
  %tmp127 = add i32 %tmp128, %tmp130_cast
  %tmp134 = add i27 %tmp_203_cast, %tmp_174_cast
  %tmp134_cast = sext i27 %tmp134 to i28
  %tmp133 = add i28 %tmp_143_cast, %tmp134_cast
  %tmp133_cast = sext i28 %tmp133 to i29
  %tmp136 = add i27 138393, %tmp_263_cast
  %tmp136_cast = sext i27 %tmp136 to i28
  %tmp135 = add i28 %tmp_234_cast, %tmp136_cast
  %tmp135_cast = sext i28 %tmp135 to i29
  %tmp132 = add i29 %tmp133_cast, %tmp135_cast
  %tmp132_cast = sext i29 %tmp132 to i32
  %res_12_V_write_assi = add i32 %tmp127, %tmp132_cast
  %tmp139 = add i32 %mult_2_13_V, %mult_1_13_V
  %tmp138 = add i32 %mult_0_13_V, %tmp139
  %tmp141 = add i27 %tmp_115_cast, %mult_4_13_V_cast
  %tmp141_cast = sext i27 %tmp141 to i28
  %tmp140 = add i28 %mult_3_13_V_cast, %tmp141_cast
  %tmp140_cast = sext i28 %tmp140 to i32
  %tmp137 = add i32 %tmp138, %tmp140_cast
  %tmp144 = add i26 %tmp_205_cast, %tmp_176_cast
  %tmp143 = add i26 %tmp_145_cast, %tmp144
  %tmp143_cast = sext i26 %tmp143 to i28
  %tmp146 = add i27 85873, %tmp_265_cast
  %tmp146_cast = sext i27 %tmp146 to i28
  %tmp145 = add i28 %tmp_236_cast, %tmp146_cast
  %tmp142 = add i28 %tmp143_cast, %tmp145
  %tmp142_cast = sext i28 %tmp142 to i32
  %res_13_V_write_assi = add i32 %tmp137, %tmp142_cast
  %tmp149 = add i32 %mult_2_14_V, %mult_1_14_V
  %tmp148 = add i32 %mult_0_14_V, %tmp149
  %tmp151 = add i27 %tmp_117_cast, %mult_4_14_V_cast
  %tmp150 = add i27 %mult_3_14_V_cast, %tmp151
  %tmp150_cast = sext i27 %tmp150 to i32
  %tmp147 = add i32 %tmp148, %tmp150_cast
  %tmp154 = add i27 %tmp_207_cast, %tmp_178_cast
  %tmp153 = add i27 %tmp_147_cast, %tmp154
  %tmp153_cast = sext i27 %tmp153 to i28
  %tmp156 = add i26 184404, %tmp_267_cast
  %tmp156_cast = sext i26 %tmp156 to i27
  %tmp155 = add i27 %tmp_238_cast, %tmp156_cast
  %tmp155_cast = sext i27 %tmp155 to i28
  %tmp152 = add i28 %tmp153_cast, %tmp155_cast
  %tmp152_cast = sext i28 %tmp152 to i32
  %res_14_V_write_assi = add i32 %tmp147, %tmp152_cast
  %mrv = insertvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } undef, i32 %res_0_V_write_assig, 0
  %mrv_1 = insertvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %mrv, i32 %res_1_V_write_assig, 1
  %mrv_2 = insertvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %mrv_1, i32 %res_2_V_write_assig_1, 2
  %mrv_3 = insertvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %mrv_2, i32 %res_3_V_write_assig, 3
  %mrv_4 = insertvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %mrv_3, i32 %res_4_V_write_assig, 4
  %mrv_5 = insertvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %mrv_4, i32 %res_5_V_write_assig, 5
  %mrv_6 = insertvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %mrv_5, i32 %res_6_V_write_assig, 6
  %mrv_7 = insertvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %mrv_6, i32 %res_7_V_write_assig_1, 7
  %mrv_8 = insertvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %mrv_7, i32 %res_8_V_write_assig, 8
  %mrv_9 = insertvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %mrv_8, i32 %res_9_V_write_assig, 9
  %mrv_10 = insertvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %mrv_9, i32 %res_10_V_write_assi, 10
  %mrv_11 = insertvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %mrv_10, i32 %res_11_V_write_assi, 11
  %mrv_12 = insertvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %mrv_11, i32 %res_12_V_write_assi, 12
  %mrv_13 = insertvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %mrv_12, i32 %res_13_V_write_assi, 13
  %mrv_s = insertvalue { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %mrv_13, i32 %res_14_V_write_assi, 14
  ret { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 } %mrv_s
}

define internal fastcc { i32, i32, i32, i32, i32 } @compute_layer.0.0.0.(i32 %data_0_V_read, i32 %data_1_V_read, i32 %data_2_V_read, i32 %data_3_V_read, i32 %data_4_V_read, i32 %data_5_V_read, i32 %data_6_V_read, i32 %data_7_V_read, i32 %data_8_V_read, i32 %data_9_V_read, i32 %data_10_V_read, i32 %data_11_V_read, i32 %data_12_V_read, i32 %data_13_V_read, i32 %data_14_V_read) readnone {
arrayctor.loop4.preheader:
  %data_14_V_read_2 = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %data_14_V_read)
  %data_13_V_read_2 = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %data_13_V_read)
  %data_12_V_read_2 = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %data_12_V_read)
  %data_11_V_read_2 = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %data_11_V_read)
  %data_10_V_read11 = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %data_10_V_read)
  %data_9_V_read_2 = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %data_9_V_read)
  %data_8_V_read_2 = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %data_8_V_read)
  %data_7_V_read_2 = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %data_7_V_read)
  %data_6_V_read_2 = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %data_6_V_read)
  %data_5_V_read_2 = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %data_5_V_read)
  %data_4_V_read_3 = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %data_4_V_read)
  %data_3_V_read_3 = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %data_3_V_read)
  %data_2_V_read_3 = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %data_2_V_read)
  %data_1_V_read_3 = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %data_1_V_read)
  %data_0_V_read_3 = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %data_0_V_read)
  %tmp = call i32 (...)* @_ssdm_op_SpecRegionBegin([12 x i8]* @p_str12)
  call void (...)* @_ssdm_op_SpecPipeline(i32 1, i32 1, i32 1, i32 0, [1 x i8]* @p_str6) nounwind
  call void (...)* @_ssdm_op_SpecResourceLimit(i32 75, [4 x i8]* @p_str410, [1 x i8]* @p_str6, [1 x i8]* @p_str6, [1 x i8]* @p_str6) nounwind
  %empty = call i32 (...)* @_ssdm_op_SpecRegionEnd([12 x i8]* @p_str12, i32 %tmp)
  %OP1_V_cast = sext i32 %data_0_V_read_3 to i44
  %OP1_V_cast1 = sext i32 %data_0_V_read_3 to i42
  %p_shl9 = call i38 @_ssdm_op_BitConcatenate.i38.i32.i6(i32 %data_0_V_read_3, i6 0)
  %p_shl9_cast = sext i38 %p_shl9 to i39
  %p_shl5 = call i34 @_ssdm_op_BitConcatenate.i34.i32.i2(i32 %data_0_V_read_3, i2 0)
  %p_shl10_cast = sext i34 %p_shl5 to i39
  %p_Val2_s = add i39 %p_shl9_cast, %p_shl10_cast
  %tmp_178 = call i21 @_ssdm_op_PartSelect.i21.i39.i32.i32(i39 %p_Val2_s, i32 18, i32 38)
  %tmp_18_cast = sext i21 %tmp_178 to i24
  %p_Val2_0_1 = mul i42 %OP1_V_cast1, 294
  %tmp_179 = call i24 @_ssdm_op_PartSelect.i24.i42.i32.i32(i42 %p_Val2_0_1, i32 18, i32 41)
  %tmp_21_cast = sext i24 %tmp_179 to i27
  %p_Val2_0_2 = mul i42 %OP1_V_cast1, 333
  %tmp_180 = call i24 @_ssdm_op_PartSelect.i24.i42.i32.i32(i42 %p_Val2_0_2, i32 18, i32 41)
  %tmp_24_cast = sext i24 %tmp_180 to i28
  %p_Val2_0_3 = mul i44 %OP1_V_cast, 1661
  %tmp_181 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_0_3, i32 18, i32 43)
  %tmp_27_cast = sext i26 %tmp_181 to i27
  %p_Val2_0_4 = mul i44 %OP1_V_cast, 1851
  %tmp_182 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_0_4, i32 18, i32 43)
  %tmp_30_cast = sext i26 %tmp_182 to i27
  %OP1_V_1_cast1 = sext i32 %data_1_V_read_3 to i45
  %OP1_V_1_cast2 = sext i32 %data_1_V_read_3 to i44
  %OP1_V_1_cast = sext i32 %data_1_V_read_3 to i41
  %p_Val2_1 = mul i41 %OP1_V_1_cast, -241
  %tmp_183 = call i23 @_ssdm_op_PartSelect.i23.i41.i32.i32(i41 %p_Val2_1, i32 18, i32 40)
  %tmp_33_cast = sext i23 %tmp_183 to i24
  %p_Val2_1_1 = mul i44 %OP1_V_1_cast2, -1219
  %tmp_184 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_1_1, i32 18, i32 43)
  %tmp_36_cast = sext i26 %tmp_184 to i27
  %p_Val2_1_2 = mul i45 %OP1_V_1_cast1, -6721
  %tmp_185 = call i27 @_ssdm_op_PartSelect.i27.i45.i32.i32(i45 %p_Val2_1_2, i32 18, i32 44)
  %tmp_39_cast = sext i27 %tmp_185 to i28
  %p_Val2_1_3 = mul i44 %OP1_V_1_cast2, 1147
  %tmp_186 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_1_3, i32 18, i32 43)
  %tmp_42_cast = sext i26 %tmp_186 to i27
  %p_Val2_1_4 = mul i44 %OP1_V_1_cast2, -2262
  %tmp_187 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_1_4, i32 18, i32 43)
  %tmp_45_cast = sext i26 %tmp_187 to i27
  %OP1_V_2_cast = sext i32 %data_2_V_read_3 to i45
  %OP1_V_2_cast1 = sext i32 %data_2_V_read_3 to i39
  %OP1_V_2_cast2 = sext i32 %data_2_V_read_3 to i44
  %OP1_V_2_cast3 = sext i32 %data_2_V_read_3 to i46
  %p_shl7 = call i37 @_ssdm_op_BitConcatenate.i37.i32.i5(i32 %data_2_V_read_3, i5 0)
  %p_shl7_cast = sext i37 %p_shl7 to i38
  %p_shl8 = call i33 @_ssdm_op_BitConcatenate.i33.i32.i1(i32 %data_2_V_read_3, i1 false)
  %p_shl8_cast = sext i33 %p_shl8 to i38
  %p_Val2_2 = sub i38 %p_shl7_cast, %p_shl8_cast
  %tmp_188 = call i20 @_ssdm_op_PartSelect.i20.i38.i32.i32(i38 %p_Val2_2, i32 18, i32 37)
  %tmp_48_cast = sext i20 %tmp_188 to i25
  %p_Val2_2_1 = mul i46 %OP1_V_2_cast3, -10762
  %tmp_189 = call i28 @_ssdm_op_PartSelect.i28.i46.i32.i32(i46 %p_Val2_2_1, i32 18, i32 45)
  %tmp_51_cast = sext i28 %tmp_189 to i29
  %p_Val2_2_2 = mul i44 %OP1_V_2_cast2, 2111
  %tmp_190 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_2_2, i32 18, i32 43)
  %tmp_54_cast = sext i26 %tmp_190 to i28
  %p_Val2_2_3 = mul i39 %OP1_V_2_cast1, 58
  %tmp_191 = call i21 @_ssdm_op_PartSelect.i21.i39.i32.i32(i39 %p_Val2_2_3, i32 18, i32 38)
  %tmp_57_cast = sext i21 %tmp_191 to i27
  %p_Val2_2_4 = mul i45 %OP1_V_2_cast, -5802
  %tmp_192 = call i27 @_ssdm_op_PartSelect.i27.i45.i32.i32(i45 %p_Val2_2_4, i32 18, i32 44)
  %tmp_60_cast = sext i27 %tmp_192 to i28
  %OP1_V_3_cast = sext i32 %data_3_V_read_3 to i44
  %OP1_V_3_cast1 = sext i32 %data_3_V_read_3 to i45
  %OP1_V_3_cast2 = sext i32 %data_3_V_read_3 to i42
  %p_Val2_3 = mul i42 %OP1_V_3_cast2, 306
  %tmp_193 = call i24 @_ssdm_op_PartSelect.i24.i42.i32.i32(i42 %p_Val2_3, i32 18, i32 41)
  %tmp_63_cast = sext i24 %tmp_193 to i25
  %p_shl4 = call i41 @_ssdm_op_BitConcatenate.i41.i32.i9(i32 %data_3_V_read_3, i9 0)
  %p_shl4_cast = sext i41 %p_shl4 to i42
  %p_shl6 = call i39 @_ssdm_op_BitConcatenate.i39.i32.i7(i32 %data_3_V_read_3, i7 0)
  %p_shl6_cast = sext i39 %p_shl6 to i42
  %p_Val2_3_1 = sub i42 %p_shl6_cast, %p_shl4_cast
  %tmp_194 = call i24 @_ssdm_op_PartSelect.i24.i42.i32.i32(i42 %p_Val2_3_1, i32 18, i32 41)
  %tmp_66_cast = sext i24 %tmp_194 to i29
  %p_Val2_3_2 = mul i45 %OP1_V_3_cast1, 6618
  %tmp_195 = call i27 @_ssdm_op_PartSelect.i27.i45.i32.i32(i45 %p_Val2_3_2, i32 18, i32 44)
  %tmp_69_cast = sext i27 %tmp_195 to i28
  %p_Val2_3_3 = mul i44 %OP1_V_3_cast, 1597
  %tmp_196 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_3_3, i32 18, i32 43)
  %tmp_72_cast = sext i26 %tmp_196 to i27
  %p_Val2_3_4 = mul i44 %OP1_V_3_cast, -1131
  %tmp_197 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_3_4, i32 18, i32 43)
  %tmp_75_cast = sext i26 %tmp_197 to i28
  %OP1_V_4_cast1 = sext i32 %data_4_V_read_3 to i42
  %OP1_V_4_cast2 = sext i32 %data_4_V_read_3 to i43
  %OP1_V_4_cast3 = sext i32 %data_4_V_read_3 to i45
  %OP1_V_4_cast4 = sext i32 %data_4_V_read_3 to i44
  %OP1_V_4_cast = sext i32 %data_4_V_read_3 to i39
  %p_Val2_s_42 = mul i39 %OP1_V_4_cast, -39
  %tmp_198 = call i21 @_ssdm_op_PartSelect.i21.i39.i32.i32(i39 %p_Val2_s_42, i32 18, i32 38)
  %tmp_78_cast = sext i21 %tmp_198 to i23
  %p_Val2_415_1 = mul i44 %OP1_V_4_cast4, -1644
  %tmp_199 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_415_1, i32 18, i32 43)
  %tmp_81_cast = sext i26 %tmp_199 to i27
  %p_Val2_415_2 = mul i45 %OP1_V_4_cast3, 4275
  %tmp_200 = call i27 @_ssdm_op_PartSelect.i27.i45.i32.i32(i45 %p_Val2_415_2, i32 18, i32 44)
  %tmp_84_cast = sext i27 %tmp_200 to i28
  %p_Val2_415_3 = mul i43 %OP1_V_4_cast2, -706
  %tmp_201 = call i25 @_ssdm_op_PartSelect.i25.i43.i32.i32(i43 %p_Val2_415_3, i32 18, i32 42)
  %tmp_87_cast = sext i25 %tmp_201 to i27
  %p_Val2_415_4 = mul i42 %OP1_V_4_cast1, 290
  %tmp_202 = call i24 @_ssdm_op_PartSelect.i24.i42.i32.i32(i42 %p_Val2_415_4, i32 18, i32 41)
  %tmp_90_cast = sext i24 %tmp_202 to i27
  %OP1_V_5_cast1 = sext i32 %data_5_V_read_2 to i44
  %OP1_V_5_cast = sext i32 %data_5_V_read_2 to i40
  %p_Val2_4 = mul i40 %OP1_V_5_cast, -75
  %tmp_203 = call i22 @_ssdm_op_PartSelect.i22.i40.i32.i32(i40 %p_Val2_4, i32 18, i32 39)
  %tmp_93_cast = sext i22 %tmp_203 to i23
  %p_Val2_518_1 = mul i44 %OP1_V_5_cast1, -2991
  %tmp_204 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_518_1, i32 18, i32 43)
  %tmp_96_cast = sext i26 %tmp_204 to i27
  %p_Val2_518_2 = mul i44 %OP1_V_5_cast1, 1525
  %tmp_205 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_518_2, i32 18, i32 43)
  %tmp_99_cast = sext i26 %tmp_205 to i28
  %p_Val2_518_3 = mul i44 %OP1_V_5_cast1, 2841
  %tmp_206 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_518_3, i32 18, i32 43)
  %tmp_102_cast = sext i26 %tmp_206 to i27
  %p_Val2_518_4 = mul i44 %OP1_V_5_cast1, 1469
  %tmp_207 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_518_4, i32 18, i32 43)
  %tmp_105_cast = sext i26 %tmp_207 to i27
  %OP1_V_6_cast1 = sext i32 %data_6_V_read_2 to i43
  %OP1_V_6_cast2 = sext i32 %data_6_V_read_2 to i44
  %OP1_V_6_cast3 = sext i32 %data_6_V_read_2 to i41
  %OP1_V_6_cast = sext i32 %data_6_V_read_2 to i37
  %p_Val2_5 = mul i37 %OP1_V_6_cast, -13
  %tmp_208 = call i19 @_ssdm_op_PartSelect.i19.i37.i32.i32(i37 %p_Val2_5, i32 18, i32 36)
  %tmp_108_cast = sext i19 %tmp_208 to i24
  %p_Val2_621_1 = mul i41 %OP1_V_6_cast3, 134
  %tmp_209 = call i23 @_ssdm_op_PartSelect.i23.i41.i32.i32(i41 %p_Val2_621_1, i32 18, i32 40)
  %tmp_111_cast = sext i23 %tmp_209 to i26
  %p_Val2_621_2 = mul i44 %OP1_V_6_cast2, 1355
  %tmp_210 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_621_2, i32 18, i32 43)
  %tmp_114_cast = sext i26 %tmp_210 to i29
  %p_Val2_621_3 = mul i41 %OP1_V_6_cast3, 168
  %tmp_211 = call i23 @_ssdm_op_PartSelect.i23.i41.i32.i32(i41 %p_Val2_621_3, i32 18, i32 40)
  %tmp_117_cast = sext i23 %tmp_211 to i28
  %p_Val2_621_4 = mul i43 %OP1_V_6_cast1, 916
  %tmp_212 = call i25 @_ssdm_op_PartSelect.i25.i43.i32.i32(i43 %p_Val2_621_4, i32 18, i32 42)
  %tmp_120_cast = sext i25 %tmp_212 to i26
  %OP1_V_7_cast1 = sext i32 %data_7_V_read_2 to i45
  %OP1_V_7_cast2 = sext i32 %data_7_V_read_2 to i46
  %OP1_V_7_cast3 = sext i32 %data_7_V_read_2 to i43
  %OP1_V_7_cast = sext i32 %data_7_V_read_2 to i41
  %p_Val2_7 = mul i41 %OP1_V_7_cast, 250
  %tmp_213 = call i23 @_ssdm_op_PartSelect.i23.i41.i32.i32(i41 %p_Val2_7, i32 18, i32 40)
  %tmp_123_cast = sext i23 %tmp_213 to i24
  %p_Val2_7_1 = mul i43 %OP1_V_7_cast3, 808
  %tmp_214 = call i25 @_ssdm_op_PartSelect.i25.i43.i32.i32(i43 %p_Val2_7_1, i32 18, i32 42)
  %tmp_126_cast = sext i25 %tmp_214 to i26
  %p_Val2_7_2 = mul i46 %OP1_V_7_cast2, 12674
  %tmp_215 = call i28 @_ssdm_op_PartSelect.i28.i46.i32.i32(i46 %p_Val2_7_2, i32 18, i32 45)
  %tmp_129_cast = sext i28 %tmp_215 to i29
  %p_Val2_7_3 = mul i45 %OP1_V_7_cast1, -5402
  %tmp_216 = call i27 @_ssdm_op_PartSelect.i27.i45.i32.i32(i45 %p_Val2_7_3, i32 18, i32 44)
  %tmp_132_cast = sext i27 %tmp_216 to i28
  %p_Val2_7_4 = mul i43 %OP1_V_7_cast3, -525
  %tmp_217 = call i25 @_ssdm_op_PartSelect.i25.i43.i32.i32(i43 %p_Val2_7_4, i32 18, i32 42)
  %tmp_135_cast = sext i25 %tmp_217 to i26
  %OP1_V_8_cast1 = sext i32 %data_8_V_read_2 to i44
  %OP1_V_8_cast2 = sext i32 %data_8_V_read_2 to i45
  %OP1_V_8_cast = sext i32 %data_8_V_read_2 to i41
  %p_Val2_8 = mul i41 %OP1_V_8_cast, -161
  %tmp_218 = call i23 @_ssdm_op_PartSelect.i23.i41.i32.i32(i41 %p_Val2_8, i32 18, i32 40)
  %tmp_138_cast = sext i23 %tmp_218 to i24
  %p_Val2_8_1 = mul i45 %OP1_V_8_cast2, -6368
  %tmp_219 = call i27 @_ssdm_op_PartSelect.i27.i45.i32.i32(i45 %p_Val2_8_1, i32 18, i32 44)
  %tmp_141_cast = sext i27 %tmp_219 to i28
  %p_Val2_8_2 = mul i44 %OP1_V_8_cast1, -2573
  %tmp_220 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_8_2, i32 18, i32 43)
  %tmp_144_cast = sext i26 %tmp_220 to i27
  %p_Val2_8_3 = mul i41 %OP1_V_8_cast, -152
  %tmp_221 = call i23 @_ssdm_op_PartSelect.i23.i41.i32.i32(i41 %p_Val2_8_3, i32 18, i32 40)
  %tmp_147_cast = sext i23 %tmp_221 to i27
  %p_Val2_8_4 = mul i44 %OP1_V_8_cast1, -1085
  %tmp_222 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_8_4, i32 18, i32 43)
  %tmp_150_cast = sext i26 %tmp_222 to i27
  %OP1_V_9_cast = sext i32 %data_9_V_read_2 to i44
  %OP1_V_9_cast1 = sext i32 %data_9_V_read_2 to i40
  %p_Val2_9 = mul i40 %OP1_V_9_cast1, -108
  %tmp_223 = call i22 @_ssdm_op_PartSelect.i22.i40.i32.i32(i40 %p_Val2_9, i32 18, i32 39)
  %tmp_153_cast = sext i22 %tmp_223 to i24
  %p_Val2_9_1 = mul i44 %OP1_V_9_cast, -3027
  %tmp_224 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_9_1, i32 18, i32 43)
  %tmp_156_cast = sext i26 %tmp_224 to i28
  %p_shl2 = call i37 @_ssdm_op_BitConcatenate.i37.i32.i5(i32 %data_9_V_read_2, i5 0)
  %p_shl2_cast = sext i37 %p_shl2 to i38
  %p_neg = sub i38 0, %p_shl2_cast
  %p_shl3 = call i35 @_ssdm_op_BitConcatenate.i35.i32.i3(i32 %data_9_V_read_2, i3 0)
  %p_shl3_cast = sext i35 %p_shl3 to i38
  %p_Val2_9_2 = sub i38 %p_neg, %p_shl3_cast
  %tmp_225 = call i20 @_ssdm_op_PartSelect.i20.i38.i32.i32(i38 %p_Val2_9_2, i32 18, i32 37)
  %tmp_159_cast = sext i20 %tmp_225 to i27
  %p_Val2_9_3 = mul i44 %OP1_V_9_cast, 1343
  %tmp_226 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_9_3, i32 18, i32 43)
  %tmp_162_cast = sext i26 %tmp_226 to i27
  %p_Val2_9_4 = mul i44 %OP1_V_9_cast, 1099
  %tmp_227 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_9_4, i32 18, i32 43)
  %tmp_165_cast = sext i26 %tmp_227 to i27
  %OP1_V_cast_43 = sext i32 %data_10_V_read11 to i44
  %p_shl = call i39 @_ssdm_op_BitConcatenate.i39.i32.i7(i32 %data_10_V_read11, i7 0)
  %p_shl_cast = sext i39 %p_shl to i40
  %p_shl1 = call i37 @_ssdm_op_BitConcatenate.i37.i32.i5(i32 %data_10_V_read11, i5 0)
  %p_shl1_cast = sext i37 %p_shl1 to i40
  %p_Val2_6 = sub i40 %p_shl_cast, %p_shl1_cast
  %tmp_228 = call i22 @_ssdm_op_PartSelect.i22.i40.i32.i32(i40 %p_Val2_6, i32 18, i32 39)
  %tmp_168_cast = sext i22 %tmp_228 to i30
  %p_Val2_10_1 = mul i44 %OP1_V_cast_43, 1063
  %tmp_229 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_10_1, i32 18, i32 43)
  %tmp_171_cast = sext i26 %tmp_229 to i27
  %p_Val2_10_2 = mul i44 %OP1_V_cast_43, 2421
  %tmp_230 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_10_2, i32 18, i32 43)
  %tmp_174_cast = sext i26 %tmp_230 to i27
  %p_Val2_10_3 = mul i44 %OP1_V_cast_43, 2737
  %tmp_231 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_10_3, i32 18, i32 43)
  %tmp_177_cast = sext i26 %tmp_231 to i27
  %p_Val2_10_4 = mul i44 %OP1_V_cast_43, -1326
  %tmp_232 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_10_4, i32 18, i32 43)
  %tmp_180_cast = sext i26 %tmp_232 to i27
  %OP1_V_10_cast1 = sext i32 %data_11_V_read_2 to i40
  %OP1_V_10_cast2 = sext i32 %data_11_V_read_2 to i43
  %OP1_V_10_cast3 = sext i32 %data_11_V_read_2 to i41
  %OP1_V_10_cast = sext i32 %data_11_V_read_2 to i47
  %p_Val2_10 = mul i47 %OP1_V_10_cast, -21679
  %tmp_233 = call i29 @_ssdm_op_PartSelect.i29.i47.i32.i32(i47 %p_Val2_10, i32 18, i32 46)
  %tmp_183_cast = sext i29 %tmp_233 to i30
  %p_Val2_11_1 = mul i41 %OP1_V_10_cast3, -205
  %tmp_234 = call i23 @_ssdm_op_PartSelect.i23.i41.i32.i32(i41 %p_Val2_11_1, i32 18, i32 40)
  %tmp_186_cast = sext i23 %tmp_234 to i27
  %p_Val2_11_2 = mul i43 %OP1_V_10_cast2, -687
  %tmp_235 = call i25 @_ssdm_op_PartSelect.i25.i43.i32.i32(i43 %p_Val2_11_2, i32 18, i32 42)
  %tmp_189_cast = sext i25 %tmp_235 to i27
  %p_Val2_11_3 = mul i41 %OP1_V_10_cast3, 217
  %tmp_236 = call i23 @_ssdm_op_PartSelect.i23.i41.i32.i32(i41 %p_Val2_11_3, i32 18, i32 40)
  %tmp_192_cast = sext i23 %tmp_236 to i27
  %p_Val2_11_4 = mul i40 %OP1_V_10_cast1, -67
  %tmp_237 = call i22 @_ssdm_op_PartSelect.i22.i40.i32.i32(i40 %p_Val2_11_4, i32 18, i32 39)
  %tmp_195_cast = sext i22 %tmp_237 to i27
  %OP1_V_11_cast1 = sext i32 %data_12_V_read_2 to i45
  %OP1_V_11_cast2 = sext i32 %data_12_V_read_2 to i44
  %OP1_V_11_cast = sext i32 %data_12_V_read_2 to i39
  %p_Val2_11 = mul i39 %OP1_V_11_cast, -49
  %tmp_238 = call i21 @_ssdm_op_PartSelect.i21.i39.i32.i32(i39 %p_Val2_11, i32 18, i32 38)
  %tmp_198_cast = sext i21 %tmp_238 to i23
  %p_Val2_12_1 = mul i44 %OP1_V_11_cast2, -3044
  %tmp_239 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_12_1, i32 18, i32 43)
  %tmp_201_cast = sext i26 %tmp_239 to i27
  %p_Val2_12_2 = mul i45 %OP1_V_11_cast1, -4820
  %tmp_240 = call i27 @_ssdm_op_PartSelect.i27.i45.i32.i32(i45 %p_Val2_12_2, i32 18, i32 44)
  %tmp_204_cast = sext i27 %tmp_240 to i28
  %p_Val2_12_3 = mul i44 %OP1_V_11_cast2, -2204
  %tmp_241 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_12_3, i32 18, i32 43)
  %tmp_207_cast = sext i26 %tmp_241 to i27
  %p_Val2_12_4 = mul i44 %OP1_V_11_cast2, 1904
  %tmp_242 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_12_4, i32 18, i32 43)
  %tmp_210_cast = sext i26 %tmp_242 to i27
  %OP1_V_12_cast1 = sext i32 %data_13_V_read_2 to i44
  %OP1_V_12_cast = sext i32 %data_13_V_read_2 to i40
  %p_Val2_12 = mul i40 %OP1_V_12_cast, 110
  %tmp_243 = call i22 @_ssdm_op_PartSelect.i22.i40.i32.i32(i40 %p_Val2_12, i32 18, i32 39)
  %tmp_213_cast = sext i22 %tmp_243 to i23
  %p_Val2_13_1 = mul i44 %OP1_V_12_cast1, 1777
  %tmp_244 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_13_1, i32 18, i32 43)
  %tmp_216_cast = sext i26 %tmp_244 to i27
  %p_Val2_13_2 = mul i40 %OP1_V_12_cast, -98
  %tmp_245 = call i22 @_ssdm_op_PartSelect.i22.i40.i32.i32(i40 %p_Val2_13_2, i32 18, i32 39)
  %tmp_219_cast = sext i22 %tmp_245 to i28
  %p_Val2_13_3 = mul i40 %OP1_V_12_cast, -69
  %tmp_246 = call i22 @_ssdm_op_PartSelect.i22.i40.i32.i32(i40 %p_Val2_13_3, i32 18, i32 39)
  %tmp_222_cast = sext i22 %tmp_246 to i27
  %p_Val2_13_4 = mul i44 %OP1_V_12_cast1, 3173
  %tmp_247 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_13_4, i32 18, i32 43)
  %tmp_225_cast = sext i26 %tmp_247 to i27
  %OP1_V_13_cast1 = sext i32 %data_14_V_read_2 to i44
  %OP1_V_13_cast2 = sext i32 %data_14_V_read_2 to i46
  %OP1_V_13_cast = sext i32 %data_14_V_read_2 to i39
  %p_Val2_13 = mul i39 %OP1_V_13_cast, -37
  %tmp_248 = call i21 @_ssdm_op_PartSelect.i21.i39.i32.i32(i39 %p_Val2_13, i32 18, i32 38)
  %tmp_228_cast = sext i21 %tmp_248 to i22
  %p_Val2_14_1 = mul i46 %OP1_V_13_cast2, -8226
  %tmp_249 = call i28 @_ssdm_op_PartSelect.i28.i46.i32.i32(i46 %p_Val2_14_1, i32 18, i32 45)
  %tmp_231_cast = sext i28 %tmp_249 to i29
  %p_Val2_14_2 = mul i44 %OP1_V_13_cast1, 1885
  %tmp_250 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_14_2, i32 18, i32 43)
  %tmp_234_cast = sext i26 %tmp_250 to i27
  %p_Val2_14_3 = mul i44 %OP1_V_13_cast1, 3023
  %tmp_251 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_14_3, i32 18, i32 43)
  %tmp_237_cast = sext i26 %tmp_251 to i27
  %p_Val2_14_4 = mul i44 %OP1_V_13_cast1, -2526
  %tmp_252 = call i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44 %p_Val2_14_4, i32 18, i32 43)
  %tmp_240_cast = sext i26 %tmp_252 to i27
  %tmp13 = add i24 %tmp_18_cast, %tmp_33_cast
  %tmp13_cast = sext i24 %tmp13 to i25
  %tmp14 = add i25 %tmp_48_cast, %tmp_63_cast
  %tmp12 = add i25 %tmp14, %tmp13_cast
  %tmp12_cast = sext i25 %tmp12 to i26
  %tmp16 = add i23 %tmp_78_cast, %tmp_93_cast
  %tmp16_cast = sext i23 %tmp16 to i24
  %tmp17 = add i24 %tmp_108_cast, %tmp_123_cast
  %tmp15 = add i24 %tmp17, %tmp16_cast
  %tmp15_cast = sext i24 %tmp15 to i26
  %tmp11 = add i26 %tmp15_cast, %tmp12_cast
  %tmp11_cast = sext i26 %tmp11 to i30
  %tmp20 = add i24 %tmp_138_cast, %tmp_153_cast
  %tmp20_cast = sext i24 %tmp20 to i30
  %tmp21 = add i30 %tmp_168_cast, %tmp_183_cast
  %tmp19 = add i30 %tmp21, %tmp20_cast
  %tmp23 = add i23 %tmp_198_cast, %tmp_213_cast
  %tmp23_cast = sext i23 %tmp23 to i24
  %tmp24 = add i22 %tmp_228_cast, -263792
  %tmp24_cast = sext i22 %tmp24 to i24
  %tmp22 = add i24 %tmp24_cast, %tmp23_cast
  %tmp22_cast = sext i24 %tmp22 to i30
  %tmp18 = add i30 %tmp22_cast, %tmp19
  %res_0_V_write_assig = add i30 %tmp18, %tmp11_cast
  %res_0_V_write_assig_1 = sext i30 %res_0_V_write_assig to i32
  %tmp27 = add i27 %tmp_21_cast, %tmp_36_cast
  %tmp27_cast = sext i27 %tmp27 to i29
  %tmp28 = add i29 %tmp_51_cast, %tmp_66_cast
  %tmp26 = add i29 %tmp28, %tmp27_cast
  %tmp26_cast = sext i29 %tmp26 to i30
  %tmp30 = add i27 %tmp_81_cast, %tmp_96_cast
  %tmp30_cast = sext i27 %tmp30 to i28
  %tmp31 = add i26 %tmp_111_cast, %tmp_126_cast
  %tmp31_cast = sext i26 %tmp31 to i28
  %tmp29 = add i28 %tmp31_cast, %tmp30_cast
  %tmp29_cast = sext i28 %tmp29 to i30
  %tmp25 = add i30 %tmp29_cast, %tmp26_cast
  %tmp25_cast = sext i30 %tmp25 to i31
  %tmp34 = add i28 %tmp_141_cast, %tmp_156_cast
  %tmp34_cast = sext i28 %tmp34 to i29
  %tmp35 = add i27 %tmp_171_cast, %tmp_186_cast
  %tmp35_cast = sext i27 %tmp35 to i29
  %tmp33 = add i29 %tmp35_cast, %tmp34_cast
  %tmp33_cast = sext i29 %tmp33 to i30
  %tmp37 = add i27 %tmp_201_cast, %tmp_216_cast
  %tmp37_cast = sext i27 %tmp37 to i29
  %tmp38 = add i29 %tmp_231_cast, -27040
  %tmp36 = add i29 %tmp38, %tmp37_cast
  %tmp36_cast = sext i29 %tmp36 to i30
  %tmp32 = add i30 %tmp36_cast, %tmp33_cast
  %tmp32_cast = sext i30 %tmp32 to i31
  %res_1_V_write_assig = add i31 %tmp32_cast, %tmp25_cast
  %res_1_V_write_assig_1 = sext i31 %res_1_V_write_assig to i32
  %tmp41 = add i28 %tmp_24_cast, %tmp_39_cast
  %tmp41_cast = sext i28 %tmp41 to i29
  %tmp42 = add i28 %tmp_54_cast, %tmp_69_cast
  %tmp42_cast = sext i28 %tmp42 to i29
  %tmp40 = add i29 %tmp42_cast, %tmp41_cast
  %tmp40_cast = sext i29 %tmp40 to i30
  %tmp44 = add i28 %tmp_84_cast, %tmp_99_cast
  %tmp44_cast = sext i28 %tmp44 to i29
  %tmp45 = add i29 %tmp_114_cast, %tmp_129_cast
  %tmp43 = add i29 %tmp45, %tmp44_cast
  %tmp43_cast = sext i29 %tmp43 to i30
  %tmp39 = add i30 %tmp43_cast, %tmp40_cast
  %tmp39_cast = sext i30 %tmp39 to i31
  %tmp48 = add i27 %tmp_144_cast, %tmp_159_cast
  %tmp48_cast = sext i27 %tmp48 to i28
  %tmp49 = add i27 %tmp_174_cast, %tmp_189_cast
  %tmp49_cast = sext i27 %tmp49 to i28
  %tmp47 = add i28 %tmp49_cast, %tmp48_cast
  %tmp47_cast = sext i28 %tmp47 to i29
  %tmp51 = add i28 %tmp_204_cast, %tmp_219_cast
  %tmp52 = add i27 %tmp_234_cast, -12119
  %tmp52_cast = sext i27 %tmp52 to i28
  %tmp50 = add i28 %tmp52_cast, %tmp51
  %tmp50_cast = sext i28 %tmp50 to i29
  %tmp46 = add i29 %tmp50_cast, %tmp47_cast
  %tmp46_cast = sext i29 %tmp46 to i31
  %res_2_V_write_assig = add i31 %tmp46_cast, %tmp39_cast
  %res_2_V_write_assig_2 = sext i31 %res_2_V_write_assig to i32
  %tmp55 = add i27 %tmp_27_cast, %tmp_42_cast
  %tmp55_cast = sext i27 %tmp55 to i28
  %tmp56 = add i27 %tmp_57_cast, %tmp_72_cast
  %tmp56_cast = sext i27 %tmp56 to i28
  %tmp54 = add i28 %tmp56_cast, %tmp55_cast
  %tmp54_cast = sext i28 %tmp54 to i29
  %tmp58 = add i27 %tmp_87_cast, %tmp_102_cast
  %tmp58_cast = sext i27 %tmp58 to i28
  %tmp59 = add i28 %tmp_117_cast, %tmp_132_cast
  %tmp57 = add i28 %tmp59, %tmp58_cast
  %tmp57_cast = sext i28 %tmp57 to i29
  %tmp53 = add i29 %tmp57_cast, %tmp54_cast
  %tmp53_cast = sext i29 %tmp53 to i30
  %tmp62 = add i27 %tmp_147_cast, %tmp_162_cast
  %tmp62_cast = sext i27 %tmp62 to i28
  %tmp63 = add i27 %tmp_177_cast, %tmp_192_cast
  %tmp63_cast = sext i27 %tmp63 to i28
  %tmp61 = add i28 %tmp63_cast, %tmp62_cast
  %tmp61_cast = sext i28 %tmp61 to i29
  %tmp65 = add i27 %tmp_207_cast, %tmp_222_cast
  %tmp65_cast = sext i27 %tmp65 to i28
  %tmp66 = add i27 %tmp_237_cast, 28916
  %tmp66_cast = sext i27 %tmp66 to i28
  %tmp64 = add i28 %tmp66_cast, %tmp65_cast
  %tmp64_cast = sext i28 %tmp64 to i29
  %tmp60 = add i29 %tmp64_cast, %tmp61_cast
  %tmp60_cast = sext i29 %tmp60 to i30
  %res_3_V_write_assig = add i30 %tmp60_cast, %tmp53_cast
  %res_3_V_write_assig_1 = sext i30 %res_3_V_write_assig to i32
  %tmp69 = add i27 %tmp_30_cast, %tmp_45_cast
  %tmp69_cast = sext i27 %tmp69 to i29
  %tmp70 = add i28 %tmp_60_cast, %tmp_75_cast
  %tmp70_cast = sext i28 %tmp70 to i29
  %tmp68 = add i29 %tmp70_cast, %tmp69_cast
  %tmp72 = add i27 %tmp_90_cast, %tmp_105_cast
  %tmp72_cast = sext i27 %tmp72 to i28
  %tmp73 = add i26 %tmp_120_cast, %tmp_135_cast
  %tmp73_cast = sext i26 %tmp73 to i28
  %tmp71 = add i28 %tmp73_cast, %tmp72_cast
  %tmp71_cast = sext i28 %tmp71 to i29
  %tmp67 = add i29 %tmp71_cast, %tmp68
  %tmp67_cast = sext i29 %tmp67 to i30
  %tmp76 = add i27 %tmp_150_cast, %tmp_165_cast
  %tmp76_cast = sext i27 %tmp76 to i28
  %tmp77 = add i27 %tmp_180_cast, %tmp_195_cast
  %tmp77_cast = sext i27 %tmp77 to i28
  %tmp75 = add i28 %tmp77_cast, %tmp76_cast
  %tmp75_cast = sext i28 %tmp75 to i29
  %tmp79 = add i27 %tmp_210_cast, %tmp_225_cast
  %tmp79_cast = sext i27 %tmp79 to i28
  %tmp80 = add i27 %tmp_240_cast, 38185
  %tmp80_cast = sext i27 %tmp80 to i28
  %tmp78 = add i28 %tmp80_cast, %tmp79_cast
  %tmp78_cast = sext i28 %tmp78 to i29
  %tmp74 = add i29 %tmp78_cast, %tmp75_cast
  %tmp74_cast = sext i29 %tmp74 to i30
  %res_4_V_write_assig = add i30 %tmp74_cast, %tmp67_cast
  %res_4_V_write_assig_1 = sext i30 %res_4_V_write_assig to i32
  %mrv = insertvalue { i32, i32, i32, i32, i32 } undef, i32 %res_0_V_write_assig_1, 0
  %mrv_1 = insertvalue { i32, i32, i32, i32, i32 } %mrv, i32 %res_1_V_write_assig_1, 1
  %mrv_2 = insertvalue { i32, i32, i32, i32, i32 } %mrv_1, i32 %res_2_V_write_assig_2, 2
  %mrv_3 = insertvalue { i32, i32, i32, i32, i32 } %mrv_2, i32 %res_3_V_write_assig_1, 3
  %mrv_4 = insertvalue { i32, i32, i32, i32, i32 } %mrv_3, i32 %res_4_V_write_assig_1, 4
  ret { i32, i32, i32, i32, i32 } %mrv_4
}

define internal fastcc i29 @compute_layer.0.0(i32 %data_0_V_read, i32 %data_1_V_read, i32 %data_2_V_read, i32 %data_3_V_read, i32 %data_4_V_read) readnone {
arrayctor.loop4.preheader:
  %data_4_V_read_4 = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %data_4_V_read)
  %data_3_V_read_4 = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %data_3_V_read)
  %data_2_V_read_4 = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %data_2_V_read)
  %data_1_V_read_4 = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %data_1_V_read)
  %data_0_V_read_4 = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %data_0_V_read)
  %tmp = call i32 (...)* @_ssdm_op_SpecRegionBegin([13 x i8]* @p_str39)
  call void (...)* @_ssdm_op_SpecPipeline(i32 1, i32 1, i32 1, i32 0, [1 x i8]* @p_str6) nounwind
  call void (...)* @_ssdm_op_SpecResourceLimit(i32 5, [4 x i8]* @p_str410, [1 x i8]* @p_str6, [1 x i8]* @p_str6, [1 x i8]* @p_str6) nounwind
  %empty = call i32 (...)* @_ssdm_op_SpecRegionEnd([13 x i8]* @p_str39, i32 %tmp)
  %OP1_V_cast = sext i32 %data_0_V_read_4 to i46
  %p_Val2_s = mul i46 %OP1_V_cast, 12147
  %tmp_253 = call i28 @_ssdm_op_PartSelect.i28.i46.i32.i32(i46 %p_Val2_s, i32 18, i32 45)
  %tmp_3_cast = sext i28 %tmp_253 to i29
  %OP1_V_1_cast = sext i32 %data_1_V_read_4 to i40
  %p_Val2_s_44 = mul i40 %OP1_V_1_cast, 70
  %tmp_254 = call i22 @_ssdm_op_PartSelect.i22.i40.i32.i32(i40 %p_Val2_s_44, i32 18, i32 39)
  %tmp_6_cast = sext i22 %tmp_254 to i23
  %OP1_V_2_cast = sext i32 %data_2_V_read_4 to i39
  %p_Val2_1 = mul i39 %OP1_V_2_cast, 39
  %tmp_255 = call i21 @_ssdm_op_PartSelect.i21.i39.i32.i32(i39 %p_Val2_1, i32 18, i32 38)
  %tmp_9_cast = sext i21 %tmp_255 to i23
  %OP1_V_3_cast5 = sext i32 %data_3_V_read_4 to i38
  %p_shl = call i37 @_ssdm_op_BitConcatenate.i37.i32.i5(i32 %data_3_V_read_4, i5 0)
  %p_shl_cast = sext i37 %p_shl to i38
  %p_neg = sub i38 0, %p_shl_cast
  %p_Val2_2 = sub i38 %p_neg, %OP1_V_3_cast5
  %tmp_256 = call i20 @_ssdm_op_PartSelect.i20.i38.i32.i32(i38 %p_Val2_2, i32 18, i32 37)
  %tmp_12_cast = sext i20 %tmp_256 to i22
  %OP1_V_4_cast = sext i32 %data_4_V_read_4 to i38
  %p_Val2_4 = mul i38 %OP1_V_4_cast, 23
  %tmp_257 = call i20 @_ssdm_op_PartSelect.i20.i38.i32.i32(i38 %p_Val2_4, i32 18, i32 37)
  %tmp_15_cast = sext i20 %tmp_257 to i21
  call void (...)* @_ssdm_op_SpecLoopName([11 x i8]* @p_str7) nounwind
  %tmp2 = add i23 %tmp_6_cast, %tmp_9_cast
  %tmp2_cast = sext i23 %tmp2 to i29
  %tmp1 = add i29 %tmp2_cast, %tmp_3_cast
  %tmp4 = add i21 %tmp_15_cast, -58281
  %tmp4_cast = sext i21 %tmp4 to i22
  %tmp3 = add i22 %tmp4_cast, %tmp_12_cast
  %tmp3_cast = sext i22 %tmp3 to i29
  %res_V_write_assign = add i29 %tmp3_cast, %tmp1
  call void (...)* @_ssdm_op_SpecLoopName([7 x i8]* @p_str10) nounwind
  ret i29 %res_V_write_assign
}

define weak void @_ssdm_op_Write.axis.volatile.i64P.i8P.i1P.i8P.i8P(i64*, i8*, i1*, i8*, i8*, i64, i8, i1, i8, i8) {
entry:
  store i64 %5, i64* %0
  store i8 %6, i8* %1
  store i1 %7, i1* %2
  store i8 %8, i8* %3
  store i8 %9, i8* %4
  ret void
}

define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

define weak void @_ssdm_op_SpecResourceLimit(...) nounwind {
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

define weak i32 @_ssdm_op_SpecLoopTripCount(...) {
entry:
  ret i32 0
}

define weak void @_ssdm_op_SpecLoopName(...) nounwind {
entry:
  ret void
}

define weak i32 @_ssdm_op_SpecLoopBegin(...) {
entry:
  ret i32 0
}

define weak void @_ssdm_op_SpecInterface(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

define weak { i64, i8, i1, i8, i8 } @_ssdm_op_Read.axis.volatile.i64P.i8P.i1P.i8P.i8P(i64*, i8*, i1*, i8*, i8*) {
entry:
  %empty = load i64* %0
  %empty_45 = load i8* %1
  %empty_46 = load i1* %2
  %empty_47 = load i8* %3
  %empty_48 = load i8* %4
  %mrv_0 = insertvalue { i64, i8, i1, i8, i8 } undef, i64 %empty, 0
  %mrv1 = insertvalue { i64, i8, i1, i8, i8 } %mrv_0, i8 %empty_45, 1
  %mrv2 = insertvalue { i64, i8, i1, i8, i8 } %mrv1, i1 %empty_46, 2
  %mrv3 = insertvalue { i64, i8, i1, i8, i8 } %mrv2, i8 %empty_47, 3
  %mrv4 = insertvalue { i64, i8, i1, i8, i8 } %mrv3, i8 %empty_48, 4
  ret { i64, i8, i1, i8, i8 } %mrv4
}

define weak i9 @_ssdm_op_Read.ap_auto.i9(i9) {
entry:
  ret i9 %0
}

define weak i5 @_ssdm_op_Read.ap_auto.i5(i5) {
entry:
  ret i5 %0
}

define weak i32 @_ssdm_op_Read.ap_auto.i32(i32) {
entry:
  ret i32 %0
}

define weak i16 @_ssdm_op_Read.ap_auto.i16(i16) {
entry:
  ret i16 %0
}

define weak i10 @_ssdm_op_Read.ap_auto.i10(i10) {
entry:
  ret i10 %0
}

declare i9 @_ssdm_op_PartSelect.i9.i10.i32.i32(i10, i32, i32) nounwind readnone

declare i8 @_ssdm_op_PartSelect.i8.i16.i32.i32(i16, i32, i32) nounwind readnone

define weak i32 @_ssdm_op_PartSelect.i32.i50.i32.i32(i50, i32, i32) nounwind readnone {
entry:
  %empty = call i50 @llvm.part.select.i50(i50 %0, i32 %1, i32 %2)
  %empty_49 = trunc i50 %empty to i32
  ret i32 %empty_49
}

define weak i31 @_ssdm_op_PartSelect.i31.i49.i32.i32(i49, i32, i32) nounwind readnone {
entry:
  %empty = call i49 @llvm.part.select.i49(i49 %0, i32 %1, i32 %2)
  %empty_50 = trunc i49 %empty to i31
  ret i31 %empty_50
}

define weak i30 @_ssdm_op_PartSelect.i30.i48.i32.i32(i48, i32, i32) nounwind readnone {
entry:
  %empty = call i48 @llvm.part.select.i48(i48 %0, i32 %1, i32 %2)
  %empty_51 = trunc i48 %empty to i30
  ret i30 %empty_51
}

define weak i29 @_ssdm_op_PartSelect.i29.i47.i32.i32(i47, i32, i32) nounwind readnone {
entry:
  %empty = call i47 @llvm.part.select.i47(i47 %0, i32 %1, i32 %2)
  %empty_52 = trunc i47 %empty to i29
  ret i29 %empty_52
}

define weak i28 @_ssdm_op_PartSelect.i28.i46.i32.i32(i46, i32, i32) nounwind readnone {
entry:
  %empty = call i46 @llvm.part.select.i46(i46 %0, i32 %1, i32 %2)
  %empty_53 = trunc i46 %empty to i28
  ret i28 %empty_53
}

define weak i27 @_ssdm_op_PartSelect.i27.i45.i32.i32(i45, i32, i32) nounwind readnone {
entry:
  %empty = call i45 @llvm.part.select.i45(i45 %0, i32 %1, i32 %2)
  %empty_54 = trunc i45 %empty to i27
  ret i27 %empty_54
}

define weak i26 @_ssdm_op_PartSelect.i26.i44.i32.i32(i44, i32, i32) nounwind readnone {
entry:
  %empty = call i44 @llvm.part.select.i44(i44 %0, i32 %1, i32 %2)
  %empty_55 = trunc i44 %empty to i26
  ret i26 %empty_55
}

define weak i25 @_ssdm_op_PartSelect.i25.i43.i32.i32(i43, i32, i32) nounwind readnone {
entry:
  %empty = call i43 @llvm.part.select.i43(i43 %0, i32 %1, i32 %2)
  %empty_56 = trunc i43 %empty to i25
  ret i25 %empty_56
}

define weak i24 @_ssdm_op_PartSelect.i24.i42.i32.i32(i42, i32, i32) nounwind readnone {
entry:
  %empty = call i42 @llvm.part.select.i42(i42 %0, i32 %1, i32 %2)
  %empty_57 = trunc i42 %empty to i24
  ret i24 %empty_57
}

define weak i23 @_ssdm_op_PartSelect.i23.i41.i32.i32(i41, i32, i32) nounwind readnone {
entry:
  %empty = call i41 @llvm.part.select.i41(i41 %0, i32 %1, i32 %2)
  %empty_58 = trunc i41 %empty to i23
  ret i23 %empty_58
}

define weak i22 @_ssdm_op_PartSelect.i22.i40.i32.i32(i40, i32, i32) nounwind readnone {
entry:
  %empty = call i40 @llvm.part.select.i40(i40 %0, i32 %1, i32 %2)
  %empty_59 = trunc i40 %empty to i22
  ret i22 %empty_59
}

define weak i21 @_ssdm_op_PartSelect.i21.i39.i32.i32(i39, i32, i32) nounwind readnone {
entry:
  %empty = call i39 @llvm.part.select.i39(i39 %0, i32 %1, i32 %2)
  %empty_60 = trunc i39 %empty to i21
  ret i21 %empty_60
}

define weak i20 @_ssdm_op_PartSelect.i20.i38.i32.i32(i38, i32, i32) nounwind readnone {
entry:
  %empty = call i38 @llvm.part.select.i38(i38 %0, i32 %1, i32 %2)
  %empty_61 = trunc i38 %empty to i20
  ret i20 %empty_61
}

define weak i19 @_ssdm_op_PartSelect.i19.i37.i32.i32(i37, i32, i32) nounwind readnone {
entry:
  %empty = call i37 @llvm.part.select.i37(i37 %0, i32 %1, i32 %2)
  %empty_62 = trunc i37 %empty to i19
  ret i19 %empty_62
}

define weak i15 @_ssdm_op_PartSelect.i15.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2)
  %empty_63 = trunc i32 %empty to i15
  ret i15 %empty_63
}

define weak i14 @_ssdm_op_PartSelect.i14.i64.i32.i32(i64, i32, i32) nounwind readnone {
entry:
  %empty = call i64 @llvm.part.select.i64(i64 %0, i32 %1, i32 %2)
  %empty_64 = trunc i64 %empty to i14
  ret i14 %empty_64
}

declare i13 @_ssdm_op_PartSelect.i13.i14.i32.i32(i14, i32, i32) nounwind readnone

define weak i32 @_ssdm_op_Mux.ap_auto.30i32.i5(i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i5) {
entry:
  switch i5 %30, label %case29 [
    i5 0, label %case0
    i5 1, label %case1
    i5 2, label %case2
    i5 3, label %case3
    i5 4, label %case4
    i5 5, label %case5
    i5 6, label %case6
    i5 7, label %case7
    i5 8, label %case8
    i5 9, label %case9
    i5 10, label %case10
    i5 11, label %case11
    i5 12, label %case12
    i5 13, label %case13
    i5 14, label %case14
    i5 15, label %case15
    i5 -16, label %case16
    i5 -15, label %case17
    i5 -14, label %case18
    i5 -13, label %case19
    i5 -12, label %case20
    i5 -11, label %case21
    i5 -10, label %case22
    i5 -9, label %case23
    i5 -8, label %case24
    i5 -7, label %case25
    i5 -6, label %case26
    i5 -5, label %case27
    i5 -4, label %case28
  ]

case0:                                            ; preds = %case29, %case28, %case27, %case26, %case25, %case24, %case23, %case22, %case21, %case20, %case19, %case18, %case17, %case16, %case15, %case14, %case13, %case12, %case11, %case10, %case9, %case8, %case7, %case6, %case5, %case4, %case3, %case2, %case1, %entry
  %merge = phi i32 [ %0, %entry ], [ %1, %case1 ], [ %2, %case2 ], [ %3, %case3 ], [ %4, %case4 ], [ %5, %case5 ], [ %6, %case6 ], [ %7, %case7 ], [ %8, %case8 ], [ %9, %case9 ], [ %10, %case10 ], [ %11, %case11 ], [ %12, %case12 ], [ %13, %case13 ], [ %14, %case14 ], [ %15, %case15 ], [ %16, %case16 ], [ %17, %case17 ], [ %18, %case18 ], [ %19, %case19 ], [ %20, %case20 ], [ %21, %case21 ], [ %22, %case22 ], [ %23, %case23 ], [ %24, %case24 ], [ %25, %case25 ], [ %26, %case26 ], [ %27, %case27 ], [ %28, %case28 ], [ %29, %case29 ]
  ret i32 %merge

case1:                                            ; preds = %entry
  br label %case0

case2:                                            ; preds = %entry
  br label %case0

case3:                                            ; preds = %entry
  br label %case0

case4:                                            ; preds = %entry
  br label %case0

case5:                                            ; preds = %entry
  br label %case0

case6:                                            ; preds = %entry
  br label %case0

case7:                                            ; preds = %entry
  br label %case0

case8:                                            ; preds = %entry
  br label %case0

case9:                                            ; preds = %entry
  br label %case0

case10:                                           ; preds = %entry
  br label %case0

case11:                                           ; preds = %entry
  br label %case0

case12:                                           ; preds = %entry
  br label %case0

case13:                                           ; preds = %entry
  br label %case0

case14:                                           ; preds = %entry
  br label %case0

case15:                                           ; preds = %entry
  br label %case0

case16:                                           ; preds = %entry
  br label %case0

case17:                                           ; preds = %entry
  br label %case0

case18:                                           ; preds = %entry
  br label %case0

case19:                                           ; preds = %entry
  br label %case0

case20:                                           ; preds = %entry
  br label %case0

case21:                                           ; preds = %entry
  br label %case0

case22:                                           ; preds = %entry
  br label %case0

case23:                                           ; preds = %entry
  br label %case0

case24:                                           ; preds = %entry
  br label %case0

case25:                                           ; preds = %entry
  br label %case0

case26:                                           ; preds = %entry
  br label %case0

case27:                                           ; preds = %entry
  br label %case0

case28:                                           ; preds = %entry
  br label %case0

case29:                                           ; preds = %entry
  br label %case0
}

define weak i42 @_ssdm_op_BitConcatenate.i42.i32.i10(i32, i10) nounwind readnone {
entry:
  %empty = zext i32 %0 to i42
  %empty_65 = zext i10 %1 to i42
  %empty_66 = shl i42 %empty, 10
  %empty_67 = or i42 %empty_66, %empty_65
  ret i42 %empty_67
}

define weak i41 @_ssdm_op_BitConcatenate.i41.i32.i9(i32, i9) nounwind readnone {
entry:
  %empty = zext i32 %0 to i41
  %empty_68 = zext i9 %1 to i41
  %empty_69 = shl i41 %empty, 9
  %empty_70 = or i41 %empty_69, %empty_68
  ret i41 %empty_70
}

define weak i40 @_ssdm_op_BitConcatenate.i40.i32.i8(i32, i8) nounwind readnone {
entry:
  %empty = zext i32 %0 to i40
  %empty_71 = zext i8 %1 to i40
  %empty_72 = shl i40 %empty, 8
  %empty_73 = or i40 %empty_72, %empty_71
  ret i40 %empty_73
}

define weak i39 @_ssdm_op_BitConcatenate.i39.i32.i7(i32, i7) nounwind readnone {
entry:
  %empty = zext i32 %0 to i39
  %empty_74 = zext i7 %1 to i39
  %empty_75 = shl i39 %empty, 7
  %empty_76 = or i39 %empty_75, %empty_74
  ret i39 %empty_76
}

define weak i38 @_ssdm_op_BitConcatenate.i38.i32.i6(i32, i6) nounwind readnone {
entry:
  %empty = zext i32 %0 to i38
  %empty_77 = zext i6 %1 to i38
  %empty_78 = shl i38 %empty, 6
  %empty_79 = or i38 %empty_78, %empty_77
  ret i38 %empty_79
}

define weak i37 @_ssdm_op_BitConcatenate.i37.i32.i5(i32, i5) nounwind readnone {
entry:
  %empty = zext i32 %0 to i37
  %empty_80 = zext i5 %1 to i37
  %empty_81 = shl i37 %empty, 5
  %empty_82 = or i37 %empty_81, %empty_80
  ret i37 %empty_82
}

define weak i35 @_ssdm_op_BitConcatenate.i35.i32.i3(i32, i3) nounwind readnone {
entry:
  %empty = zext i32 %0 to i35
  %empty_83 = zext i3 %1 to i35
  %empty_84 = shl i35 %empty, 3
  %empty_85 = or i35 %empty_84, %empty_83
  ret i35 %empty_85
}

define weak i34 @_ssdm_op_BitConcatenate.i34.i32.i2(i32, i2) nounwind readnone {
entry:
  %empty = zext i32 %0 to i34
  %empty_86 = zext i2 %1 to i34
  %empty_87 = shl i34 %empty, 2
  %empty_88 = or i34 %empty_87, %empty_86
  ret i34 %empty_88
}

define weak i33 @_ssdm_op_BitConcatenate.i33.i32.i1(i32, i1) nounwind readnone {
entry:
  %empty = zext i32 %0 to i33
  %empty_89 = zext i1 %1 to i33
  %empty_90 = shl i33 %empty, 1
  %empty_91 = or i33 %empty_90, %empty_89
  ret i33 %empty_91
}

define weak i32 @_ssdm_op_BitConcatenate.i32.i14.i18(i14, i18) nounwind readnone {
entry:
  %empty = zext i14 %0 to i32
  %empty_92 = zext i18 %1 to i32
  %empty_93 = shl i32 %empty, 18
  %empty_94 = or i32 %empty_93, %empty_92
  ret i32 %empty_94
}

declare void @_GLOBAL__I_a() nounwind section ".text.startup"

!opencl.kernels = !{!0, !0, !7, !7, !7, !13, !13, !13, !13, !19, !25, !25, !29, !29, !13, !13, !13, !31, !31, !31, !34, !34, !13, !13, !36, !36, !38, !38, !13, !13, !40, !13, !42, !13, !13, !13, !29, !29, !13, !13, !44, !13, !47, !50, !50, !52, !54, !56, !56, !29, !29, !13, !13, !58, !60, !60, !19, !61, !61, !63, !63, !29, !29, !65, !65, !67, !13, !13, !13, !13, !13, !13, !13, !13, !69, !71, !75, !42, !77, !83, !83, !40, !40, !13, !13, !13, !84, !84, !13, !40, !83, !13, !13, !13, !13, !13, !86, !86, !86, !75, !88, !75, !90, !13, !13, !13, !92, !92, !95, !13, !97, !97, !13, !98, !13, !13, !13, !101, !101, !103, !103, !105, !13, !13, !13, !107, !97, !97, !110, !13, !13, !112, !112, !114, !114, !116, !13, !13, !13, !13, !13, !13, !118, !13, !13, !13}
!hls.encrypted.func = !{}
!llvm.map.gv = !{!120}

!0 = metadata !{null, metadata !1, metadata !2, metadata !3, metadata !4, metadata !5, metadata !6}
!1 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 1, i32 1}
!2 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none"}
!3 = metadata !{metadata !"kernel_arg_type", metadata !"short", metadata !"galapagos_interface*", metadata !"galapagos_interface*"}
!4 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !""}
!5 = metadata !{metadata !"kernel_arg_name", metadata !"id", metadata !"in", metadata !"out"}
!6 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!7 = metadata !{null, metadata !8, metadata !9, metadata !10, metadata !11, metadata !12, metadata !6}
!8 = metadata !{metadata !"kernel_arg_addr_space", i32 0}
!9 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none"}
!10 = metadata !{metadata !"kernel_arg_type", metadata !"const af_range_ref<32, 14, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!11 = metadata !{metadata !"kernel_arg_type_qual", metadata !""}
!12 = metadata !{metadata !"kernel_arg_name", metadata !"val"}
!13 = metadata !{null, metadata !14, metadata !15, metadata !16, metadata !17, metadata !18, metadata !6}
!14 = metadata !{metadata !"kernel_arg_addr_space"}
!15 = metadata !{metadata !"kernel_arg_access_qual"}
!16 = metadata !{metadata !"kernel_arg_type"}
!17 = metadata !{metadata !"kernel_arg_type_qual"}
!18 = metadata !{metadata !"kernel_arg_name"}
!19 = metadata !{null, metadata !20, metadata !21, metadata !22, metadata !23, metadata !24, metadata !6}
!20 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0}
!21 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none"}
!22 = metadata !{metadata !"kernel_arg_type", metadata !"int", metadata !"int"}
!23 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !""}
!24 = metadata !{metadata !"kernel_arg_name", metadata !"Hi", metadata !"Lo"}
!25 = metadata !{null, metadata !26, metadata !2, metadata !27, metadata !4, metadata !28, metadata !6}
!26 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 0, i32 0}
!27 = metadata !{metadata !"kernel_arg_type", metadata !"ap_fixed_base<32, 14, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0>*", metadata !"int", metadata !"int"}
!28 = metadata !{metadata !"kernel_arg_name", metadata !"bv", metadata !"h", metadata !"l"}
!29 = metadata !{null, metadata !8, metadata !9, metadata !30, metadata !11, metadata !12, metadata !6}
!30 = metadata !{metadata !"kernel_arg_type", metadata !"int"}
!31 = metadata !{null, metadata !8, metadata !9, metadata !32, metadata !11, metadata !33, metadata !6}
!32 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_range_ref<64, false> &"}
!33 = metadata !{metadata !"kernel_arg_name", metadata !"op"}
!34 = metadata !{null, metadata !8, metadata !9, metadata !32, metadata !11, metadata !35, metadata !6}
!35 = metadata !{metadata !"kernel_arg_name", metadata !"ref"}
!36 = metadata !{null, metadata !8, metadata !9, metadata !37, metadata !11, metadata !33, metadata !6}
!37 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<64, false> &"}
!38 = metadata !{null, metadata !8, metadata !9, metadata !39, metadata !11, metadata !33, metadata !6}
!39 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<64, 64, false, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!40 = metadata !{null, metadata !8, metadata !9, metadata !41, metadata !11, metadata !33, metadata !6}
!41 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<32, 14, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!42 = metadata !{null, metadata !8, metadata !9, metadata !43, metadata !11, metadata !33, metadata !6}
!43 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed<32, 14, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!44 = metadata !{null, metadata !8, metadata !9, metadata !45, metadata !11, metadata !46, metadata !6}
!45 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<64> &"}
!46 = metadata !{metadata !"kernel_arg_name", metadata !"op2"}
!47 = metadata !{null, metadata !8, metadata !9, metadata !48, metadata !11, metadata !49, metadata !6}
!48 = metadata !{metadata !"kernel_arg_type", metadata !"const struct galapagos::stream_packet<64> &"}
!49 = metadata !{metadata !"kernel_arg_name", metadata !"din"}
!50 = metadata !{null, metadata !8, metadata !9, metadata !51, metadata !11, metadata !12, metadata !6}
!51 = metadata !{metadata !"kernel_arg_type", metadata !"_Bool"}
!52 = metadata !{null, metadata !8, metadata !9, metadata !53, metadata !11, metadata !46, metadata !6}
!53 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<1> &"}
!54 = metadata !{null, metadata !8, metadata !9, metadata !55, metadata !11, metadata !12, metadata !6}
!55 = metadata !{metadata !"kernel_arg_type", metadata !"ulong long"}
!56 = metadata !{null, metadata !8, metadata !9, metadata !57, metadata !11, metadata !33, metadata !6}
!57 = metadata !{metadata !"kernel_arg_type", metadata !"ap_ulong"}
!58 = metadata !{null, metadata !8, metadata !9, metadata !59, metadata !11, metadata !12, metadata !6}
!59 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, false> &"}
!60 = metadata !{null, metadata !8, metadata !9, metadata !59, metadata !11, metadata !33, metadata !6}
!61 = metadata !{null, metadata !26, metadata !2, metadata !62, metadata !4, metadata !28, metadata !6}
!62 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<64, false>*", metadata !"int", metadata !"int"}
!63 = metadata !{null, metadata !8, metadata !9, metadata !64, metadata !11, metadata !12, metadata !6}
!64 = metadata !{metadata !"kernel_arg_type", metadata !"uint"}
!65 = metadata !{null, metadata !8, metadata !9, metadata !66, metadata !11, metadata !12, metadata !6}
!66 = metadata !{metadata !"kernel_arg_type", metadata !"short"}
!67 = metadata !{null, metadata !8, metadata !9, metadata !68, metadata !11, metadata !46, metadata !6}
!68 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<8> &"}
!69 = metadata !{null, metadata !8, metadata !9, metadata !48, metadata !11, metadata !70, metadata !6}
!70 = metadata !{metadata !"kernel_arg_name", metadata !""}
!71 = metadata !{null, metadata !72, metadata !21, metadata !73, metadata !23, metadata !74, metadata !6}
!72 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 1}
!73 = metadata !{metadata !"kernel_arg_type", metadata !"input_t*", metadata !"result_t*"}
!74 = metadata !{metadata !"kernel_arg_name", metadata !"data", metadata !"res"}
!75 = metadata !{null, metadata !72, metadata !21, metadata !76, metadata !23, metadata !74, metadata !6}
!76 = metadata !{metadata !"kernel_arg_type", metadata !"struct ap_fixed<32, 14, 5, 3, 0>*", metadata !"struct ap_fixed<32, 14, 5, 3, 0>*"}
!77 = metadata !{null, metadata !78, metadata !79, metadata !80, metadata !81, metadata !82, metadata !6}
!78 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 1, i32 1, i32 1}
!79 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!80 = metadata !{metadata !"kernel_arg_type", metadata !"struct ap_fixed<32, 14, 5, 3, 0>*", metadata !"struct ap_fixed<32, 14, 5, 3, 0>*", metadata !"typename struct config3::weight_t [1]*", metadata !"typename struct config3::bias_t*"}
!81 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !""}
!82 = metadata !{metadata !"kernel_arg_name", metadata !"data", metadata !"res", metadata !"weights", metadata !"biases"}
!83 = metadata !{null, metadata !8, metadata !9, metadata !41, metadata !11, metadata !46, metadata !6}
!84 = metadata !{null, metadata !8, metadata !9, metadata !85, metadata !11, metadata !33, metadata !6}
!85 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<33, 15, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!86 = metadata !{null, metadata !8, metadata !9, metadata !87, metadata !11, metadata !33, metadata !6}
!87 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<64, 28, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!88 = metadata !{null, metadata !78, metadata !79, metadata !89, metadata !81, metadata !82, metadata !6}
!89 = metadata !{metadata !"kernel_arg_type", metadata !"struct ap_fixed<32, 14, 5, 3, 0>*", metadata !"struct ap_fixed<32, 14, 5, 3, 0>*", metadata !"typename struct config2::weight_t [5]*", metadata !"typename struct config2::bias_t*"}
!90 = metadata !{null, metadata !78, metadata !79, metadata !91, metadata !81, metadata !82, metadata !6}
!91 = metadata !{metadata !"kernel_arg_type", metadata !"struct ap_fixed<32, 14, 5, 3, 0>*", metadata !"struct ap_fixed<32, 14, 5, 3, 0>*", metadata !"typename struct config1::weight_t [15]*", metadata !"typename struct config1::bias_t*"}
!92 = metadata !{null, metadata !8, metadata !9, metadata !93, metadata !11, metadata !94, metadata !6}
!93 = metadata !{metadata !"kernel_arg_type", metadata !"double"}
!94 = metadata !{metadata !"kernel_arg_name", metadata !"v"}
!95 = metadata !{null, metadata !8, metadata !9, metadata !93, metadata !11, metadata !96, metadata !6}
!96 = metadata !{metadata !"kernel_arg_name", metadata !"d"}
!97 = metadata !{null, metadata !8, metadata !9, metadata !30, metadata !11, metadata !33, metadata !6}
!98 = metadata !{null, metadata !20, metadata !21, metadata !99, metadata !23, metadata !100, metadata !6}
!99 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<1, false> &", metadata !"const ap_int_base<54, true> &"}
!100 = metadata !{metadata !"kernel_arg_name", metadata !"op", metadata !"op2"}
!101 = metadata !{null, metadata !8, metadata !9, metadata !102, metadata !11, metadata !33, metadata !6}
!102 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<54, true> &"}
!103 = metadata !{null, metadata !8, metadata !9, metadata !104, metadata !11, metadata !33, metadata !6}
!104 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<1, false> &"}
!105 = metadata !{null, metadata !8, metadata !9, metadata !106, metadata !11, metadata !46, metadata !6}
!106 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<55, true> &"}
!107 = metadata !{null, metadata !20, metadata !21, metadata !108, metadata !23, metadata !109, metadata !6}
!108 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<11, false> &", metadata !"int"}
!109 = metadata !{metadata !"kernel_arg_name", metadata !"op", metadata !"i_op"}
!110 = metadata !{null, metadata !20, metadata !21, metadata !111, metadata !23, metadata !100, metadata !6}
!111 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<11, false> &", metadata !"const ap_int_base<32, true> &"}
!112 = metadata !{null, metadata !8, metadata !9, metadata !113, metadata !11, metadata !33, metadata !6}
!113 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, true> &"}
!114 = metadata !{null, metadata !8, metadata !9, metadata !115, metadata !11, metadata !33, metadata !6}
!115 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<11, false> &"}
!116 = metadata !{null, metadata !8, metadata !9, metadata !117, metadata !11, metadata !46, metadata !6}
!117 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<33, true> &"}
!118 = metadata !{null, metadata !8, metadata !9, metadata !93, metadata !11, metadata !119, metadata !6}
!119 = metadata !{metadata !"kernel_arg_name", metadata !"pf"}
!120 = metadata !{metadata !121, [1 x i32]* @llvm_global_ctors_0}
!121 = metadata !{metadata !122}
!122 = metadata !{i32 0, i32 31, metadata !123}
!123 = metadata !{metadata !124}
!124 = metadata !{metadata !"llvm.global_ctors.0", metadata !125, metadata !"", i32 0, i32 31}
!125 = metadata !{metadata !126}
!126 = metadata !{i32 0, i32 0, i32 1}
!127 = metadata !{metadata !128}
!128 = metadata !{i32 0, i32 15, metadata !129}
!129 = metadata !{metadata !130}
!130 = metadata !{metadata !"id", metadata !131, metadata !"short", i32 0, i32 15}
!131 = metadata !{metadata !132}
!132 = metadata !{i32 0, i32 0, i32 0}
!133 = metadata !{metadata !134}
!134 = metadata !{i32 0, i32 63, metadata !135}
!135 = metadata !{metadata !136}
!136 = metadata !{metadata !"in.V.data.V", metadata !125, metadata !"uint64", i32 0, i32 63}
!137 = metadata !{metadata !138}
!138 = metadata !{i32 0, i32 7, metadata !139}
!139 = metadata !{metadata !140}
!140 = metadata !{metadata !"in.V.dest.V", metadata !125, metadata !"uint8", i32 0, i32 7}
!141 = metadata !{metadata !142}
!142 = metadata !{i32 0, i32 0, metadata !143}
!143 = metadata !{metadata !144}
!144 = metadata !{metadata !"in.V.last.V", metadata !125, metadata !"uint1", i32 0, i32 0}
!145 = metadata !{metadata !146}
!146 = metadata !{i32 0, i32 7, metadata !147}
!147 = metadata !{metadata !148}
!148 = metadata !{metadata !"in.V.id.V", metadata !125, metadata !"uint8", i32 0, i32 7}
!149 = metadata !{metadata !150}
!150 = metadata !{i32 0, i32 7, metadata !151}
!151 = metadata !{metadata !152}
!152 = metadata !{metadata !"in.V.keep.V", metadata !125, metadata !"uint8", i32 0, i32 7}
!153 = metadata !{metadata !154}
!154 = metadata !{i32 0, i32 63, metadata !155}
!155 = metadata !{metadata !156}
!156 = metadata !{metadata !"out.V.data.V", metadata !125, metadata !"uint64", i32 0, i32 63}
!157 = metadata !{metadata !158}
!158 = metadata !{i32 0, i32 7, metadata !159}
!159 = metadata !{metadata !160}
!160 = metadata !{metadata !"out.V.dest.V", metadata !125, metadata !"uint8", i32 0, i32 7}
!161 = metadata !{metadata !162}
!162 = metadata !{i32 0, i32 0, metadata !163}
!163 = metadata !{metadata !164}
!164 = metadata !{metadata !"out.V.last.V", metadata !125, metadata !"uint1", i32 0, i32 0}
!165 = metadata !{metadata !166}
!166 = metadata !{i32 0, i32 7, metadata !167}
!167 = metadata !{metadata !168}
!168 = metadata !{metadata !"out.V.id.V", metadata !125, metadata !"uint8", i32 0, i32 7}
!169 = metadata !{metadata !170}
!170 = metadata !{i32 0, i32 7, metadata !171}
!171 = metadata !{metadata !172}
!172 = metadata !{metadata !"out.V.keep.V", metadata !125, metadata !"uint8", i32 0, i32 7}
