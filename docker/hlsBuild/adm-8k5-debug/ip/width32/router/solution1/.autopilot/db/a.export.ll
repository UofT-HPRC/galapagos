; ModuleID = '/home/user/galapagos/hlsBuild/adm-8k5-debug/ip/width32/router/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@router_str = internal unnamed_addr constant [7 x i8] c"router\00"
@llvm_global_ctors_1 = appending global [0 x void ()*] zeroinitializer
@llvm_global_ctors_0 = appending global [0 x i32] zeroinitializer
@ap_fifo_str = internal unnamed_addr constant [8 x i8] c"ap_fifo\00"
@p_str2 = private unnamed_addr constant [13 x i8] c"ap_ctrl_none\00", align 1
@p_str1 = private unnamed_addr constant [11 x i8] c"AXI4Stream\00", align 1
@p_str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

define void @router([256 x i32]* %network_table_V, i32 %network_addr_V, i89* %stream_in_V, i89* %stream_out_switch_V, i89* %stream_out_network_V) {
  call void (...)* @_ssdm_op_SpecInterface(i89* %stream_out_network_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i89* %stream_out_switch_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecInterface(i89* %stream_in_V, [8 x i8]* @ap_fifo_str, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 2, i32 2, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecBitsMap(i89* %stream_out_network_V), !map !39
  call void (...)* @_ssdm_op_SpecBitsMap(i89* %stream_out_switch_V), !map !55
  call void (...)* @_ssdm_op_SpecBitsMap(i89* %stream_in_V), !map !71
  %network_addr_V_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %network_addr_V)
  call void (...)* @_ssdm_op_SpecBitsMap([256 x i32]* %network_table_V), !map !87
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %network_addr_V), !map !93
  call void (...)* @_ssdm_op_SpecTopModule([7 x i8]* @router_str) nounwind
  call void (...)* @_ssdm_op_SpecIFCore(i89* %stream_in_V, [1 x i8]* @p_str, [11 x i8]* @p_str1, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecIFCore(i89* %stream_out_switch_V, [1 x i8]* @p_str, [11 x i8]* @p_str1, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecIFCore(i89* %stream_out_network_V, [1 x i8]* @p_str, [11 x i8]* @p_str1, [1 x i8]* @p_str, i32 -1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecPipeline(i32 -1, i32 1, i32 1, i32 0, [1 x i8]* @p_str) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32 0, [13 x i8]* @p_str2, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str) nounwind
  %tmp = call i1 @_ssdm_op_NbReadReq.ap_fifo.i89P(i89* %stream_in_V, i32 1)
  br i1 %tmp, label %1, label %._crit_edge

; <label>:1                                       ; preds = %0
  %tmp26 = call i89 @_ssdm_op_Read.ap_fifo.volatile.i89P(i89* %stream_in_V)
  %tmp_dest_V = call i8 @_ssdm_op_PartSelect.i8.i89.i32.i32(i89 %tmp26, i32 64, i32 71)
  %tmp_2 = zext i8 %tmp_dest_V to i64
  %network_table_V_addr = getelementptr [256 x i32]* %network_table_V, i64 0, i64 %tmp_2
  %network_addr_in_V = load i32* %network_table_V_addr, align 4
  %inFPGA = icmp eq i32 %network_addr_in_V, %network_addr_V_read
  br i1 %inFPGA, label %2, label %3

; <label>:2                                       ; preds = %1
  call void @_ssdm_op_Write.ap_fifo.volatile.i89P(i89* %stream_out_switch_V, i89 %tmp26)
  br label %4

; <label>:3                                       ; preds = %1
  call void @_ssdm_op_Write.ap_fifo.volatile.i89P(i89* %stream_out_network_V, i89 %tmp26)
  br label %4

; <label>:4                                       ; preds = %3, %2
  br label %._crit_edge

._crit_edge:                                      ; preds = %4, %0
  ret void
}

declare i89 @llvm.part.select.i89(i89, i32, i32) nounwind readnone

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define weak void @_ssdm_op_Write.ap_fifo.volatile.i89P(i89*, i89) {
entry:
  %empty = call i89 @_autotb_FifoWrite_i89(i89* %0, i89 %1)
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

define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

define weak i89 @_ssdm_op_Read.ap_fifo.volatile.i89P(i89*) {
entry:
  %empty = call i89 @_autotb_FifoRead_i89(i89* %0)
  ret i89 %empty
}

define weak i32 @_ssdm_op_Read.ap_auto.i32(i32) {
entry:
  ret i32 %0
}

define weak i8 @_ssdm_op_PartSelect.i8.i89.i32.i32(i89, i32, i32) nounwind readnone {
entry:
  %empty = call i89 @llvm.part.select.i89(i89 %0, i32 %1, i32 %2)
  %empty_5 = trunc i89 %empty to i8
  ret i8 %empty_5
}

define weak i1 @_ssdm_op_NbReadReq.ap_fifo.i89P(i89*, i32) {
entry:
  %empty = call i1 @_autotb_FifoCanRead_i89(i89* %0)
  ret i1 %empty
}

declare i89 @_autotb_FifoWrite_i89(i89*, i89)

declare i89 @_autotb_FifoRead_i89(i89*)

declare i1 @_autotb_FifoCanRead_i89(i89*)

!opencl.kernels = !{!0, !7, !13, !16, !18, !18, !18, !18, !18, !18, !18, !18, !18, !18, !18, !18, !18, !18, !18, !18, !18, !18, !18, !18, !18, !24, !26, !28, !30}
!hls.encrypted.func = !{}
!llvm.map.gv = !{!32}

!0 = metadata !{null, metadata !1, metadata !2, metadata !3, metadata !4, metadata !5, metadata !6}
!1 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 0, i32 1, i32 1, i32 1}
!2 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!3 = metadata !{metadata !"kernel_arg_type", metadata !"ap_uint<32>*", metadata !"ap_uint<32>", metadata !"hls::stream<galapagos_packet>*", metadata !"hls::stream<galapagos_packet>*", metadata !"hls::stream<galapagos_packet>*"}
!4 = metadata !{metadata !"kernel_arg_type_qual", metadata !"const", metadata !"const", metadata !"", metadata !"", metadata !""}
!5 = metadata !{metadata !"kernel_arg_name", metadata !"network_table", metadata !"network_addr", metadata !"stream_in", metadata !"stream_out_switch", metadata !"stream_out_network"}
!6 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!7 = metadata !{null, metadata !8, metadata !9, metadata !10, metadata !11, metadata !12, metadata !6}
!8 = metadata !{metadata !"kernel_arg_addr_space", i32 0}
!9 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none"}
!10 = metadata !{metadata !"kernel_arg_type", metadata !"const struct galapagos::stream_packet<64> &"}
!11 = metadata !{metadata !"kernel_arg_type_qual", metadata !""}
!12 = metadata !{metadata !"kernel_arg_name", metadata !"din"}
!13 = metadata !{null, metadata !8, metadata !9, metadata !14, metadata !11, metadata !15, metadata !6}
!14 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, false> &"}
!15 = metadata !{metadata !"kernel_arg_name", metadata !"op2"}
!16 = metadata !{null, metadata !8, metadata !9, metadata !17, metadata !11, metadata !15, metadata !6}
!17 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<32> &"}
!18 = metadata !{null, metadata !19, metadata !20, metadata !21, metadata !22, metadata !23, metadata !6}
!19 = metadata !{metadata !"kernel_arg_addr_space"}
!20 = metadata !{metadata !"kernel_arg_access_qual"}
!21 = metadata !{metadata !"kernel_arg_type"}
!22 = metadata !{metadata !"kernel_arg_type_qual"}
!23 = metadata !{metadata !"kernel_arg_name"}
!24 = metadata !{null, metadata !8, metadata !9, metadata !10, metadata !11, metadata !25, metadata !6}
!25 = metadata !{metadata !"kernel_arg_name", metadata !""}
!26 = metadata !{null, metadata !8, metadata !9, metadata !27, metadata !11, metadata !15, metadata !6}
!27 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<1> &"}
!28 = metadata !{null, metadata !8, metadata !9, metadata !29, metadata !11, metadata !15, metadata !6}
!29 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<8> &"}
!30 = metadata !{null, metadata !8, metadata !9, metadata !31, metadata !11, metadata !15, metadata !6}
!31 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<64> &"}
!32 = metadata !{metadata !33, [0 x i32]* @llvm_global_ctors_0}
!33 = metadata !{metadata !34}
!34 = metadata !{i32 0, i32 31, metadata !35}
!35 = metadata !{metadata !36}
!36 = metadata !{metadata !"llvm.global_ctors.0", metadata !37, metadata !"", i32 0, i32 31}
!37 = metadata !{metadata !38}
!38 = metadata !{i32 0, i32 0, i32 1}
!39 = metadata !{metadata !40, metadata !43, metadata !46, metadata !49, metadata !52}
!40 = metadata !{i32 0, i32 63, metadata !41}
!41 = metadata !{metadata !42}
!42 = metadata !{metadata !"stream_out_network.V.data.V", metadata !37, metadata !"uint64", i32 0, i32 63}
!43 = metadata !{i32 64, i32 71, metadata !44}
!44 = metadata !{metadata !45}
!45 = metadata !{metadata !"stream_out_network.V.dest.V", metadata !37, metadata !"uint8", i32 0, i32 7}
!46 = metadata !{i32 72, i32 72, metadata !47}
!47 = metadata !{metadata !48}
!48 = metadata !{metadata !"stream_out_network.V.last.V", metadata !37, metadata !"uint1", i32 0, i32 0}
!49 = metadata !{i32 73, i32 80, metadata !50}
!50 = metadata !{metadata !51}
!51 = metadata !{metadata !"stream_out_network.V.id.V", metadata !37, metadata !"uint8", i32 0, i32 7}
!52 = metadata !{i32 81, i32 88, metadata !53}
!53 = metadata !{metadata !54}
!54 = metadata !{metadata !"stream_out_network.V.keep.V", metadata !37, metadata !"uint8", i32 0, i32 7}
!55 = metadata !{metadata !56, metadata !59, metadata !62, metadata !65, metadata !68}
!56 = metadata !{i32 0, i32 63, metadata !57}
!57 = metadata !{metadata !58}
!58 = metadata !{metadata !"stream_out_switch.V.data.V", metadata !37, metadata !"uint64", i32 0, i32 63}
!59 = metadata !{i32 64, i32 71, metadata !60}
!60 = metadata !{metadata !61}
!61 = metadata !{metadata !"stream_out_switch.V.dest.V", metadata !37, metadata !"uint8", i32 0, i32 7}
!62 = metadata !{i32 72, i32 72, metadata !63}
!63 = metadata !{metadata !64}
!64 = metadata !{metadata !"stream_out_switch.V.last.V", metadata !37, metadata !"uint1", i32 0, i32 0}
!65 = metadata !{i32 73, i32 80, metadata !66}
!66 = metadata !{metadata !67}
!67 = metadata !{metadata !"stream_out_switch.V.id.V", metadata !37, metadata !"uint8", i32 0, i32 7}
!68 = metadata !{i32 81, i32 88, metadata !69}
!69 = metadata !{metadata !70}
!70 = metadata !{metadata !"stream_out_switch.V.keep.V", metadata !37, metadata !"uint8", i32 0, i32 7}
!71 = metadata !{metadata !72, metadata !75, metadata !78, metadata !81, metadata !84}
!72 = metadata !{i32 0, i32 63, metadata !73}
!73 = metadata !{metadata !74}
!74 = metadata !{metadata !"stream_in.V.data.V", metadata !37, metadata !"uint64", i32 0, i32 63}
!75 = metadata !{i32 64, i32 71, metadata !76}
!76 = metadata !{metadata !77}
!77 = metadata !{metadata !"stream_in.V.dest.V", metadata !37, metadata !"uint8", i32 0, i32 7}
!78 = metadata !{i32 72, i32 72, metadata !79}
!79 = metadata !{metadata !80}
!80 = metadata !{metadata !"stream_in.V.last.V", metadata !37, metadata !"uint1", i32 0, i32 0}
!81 = metadata !{i32 73, i32 80, metadata !82}
!82 = metadata !{metadata !83}
!83 = metadata !{metadata !"stream_in.V.id.V", metadata !37, metadata !"uint8", i32 0, i32 7}
!84 = metadata !{i32 81, i32 88, metadata !85}
!85 = metadata !{metadata !86}
!86 = metadata !{metadata !"stream_in.V.keep.V", metadata !37, metadata !"uint8", i32 0, i32 7}
!87 = metadata !{metadata !88}
!88 = metadata !{i32 0, i32 31, metadata !89}
!89 = metadata !{metadata !90}
!90 = metadata !{metadata !"network_table.V", metadata !91, metadata !"uint32", i32 0, i32 31}
!91 = metadata !{metadata !92}
!92 = metadata !{i32 0, i32 255, i32 1}
!93 = metadata !{metadata !94}
!94 = metadata !{i32 0, i32 31, metadata !95}
!95 = metadata !{metadata !96}
!96 = metadata !{metadata !"network_addr.V", metadata !97, metadata !"uint32", i32 0, i32 31}
!97 = metadata !{metadata !98}
!98 = metadata !{i32 0, i32 0, i32 0}
