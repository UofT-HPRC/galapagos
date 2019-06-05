vlib work
vlib riviera

vlib riviera/xilinx_vip
vlib riviera/xil_defaultlib
vlib riviera/xpm
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/smartconnect_v1_0
vlib riviera/axi_protocol_checker_v2_0_3
vlib riviera/axi_vip_v1_1_3
vlib riviera/blk_mem_gen_v8_4_1
vlib riviera/axis_infrastructure_v1_1_0
vlib riviera/axis_register_slice_v1_1_17
vlib riviera/axis_switch_v1_1_17
vlib riviera/lib_pkg_v1_0_2
vlib riviera/fifo_generator_v13_2_2
vlib riviera/lib_fifo_v1_0_11
vlib riviera/lib_srl_fifo_v1_0_2
vlib riviera/lib_cdc_v1_0_2
vlib riviera/axi_datamover_v5_1_19
vlib riviera/xlconstant_v1_1_5
vlib riviera/proc_sys_reset_v5_0_12

vmap xilinx_vip riviera/xilinx_vip
vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap smartconnect_v1_0 riviera/smartconnect_v1_0
vmap axi_protocol_checker_v2_0_3 riviera/axi_protocol_checker_v2_0_3
vmap axi_vip_v1_1_3 riviera/axi_vip_v1_1_3
vmap blk_mem_gen_v8_4_1 riviera/blk_mem_gen_v8_4_1
vmap axis_infrastructure_v1_1_0 riviera/axis_infrastructure_v1_1_0
vmap axis_register_slice_v1_1_17 riviera/axis_register_slice_v1_1_17
vmap axis_switch_v1_1_17 riviera/axis_switch_v1_1_17
vmap lib_pkg_v1_0_2 riviera/lib_pkg_v1_0_2
vmap fifo_generator_v13_2_2 riviera/fifo_generator_v13_2_2
vmap lib_fifo_v1_0_11 riviera/lib_fifo_v1_0_11
vmap lib_srl_fifo_v1_0_2 riviera/lib_srl_fifo_v1_0_2
vmap lib_cdc_v1_0_2 riviera/lib_cdc_v1_0_2
vmap axi_datamover_v5_1_19 riviera/axi_datamover_v5_1_19
vmap xlconstant_v1_1_5 riviera/xlconstant_v1_1_5
vmap proc_sys_reset_v5_0_12 riviera/proc_sys_reset_v5_0_12

vlog -work xilinx_vip  -sv2k12 "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"/opt/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/opt/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/opt/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"/opt/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/sc_util_v1_0_vl_rfs.sv" \

vlog -work axi_protocol_checker_v2_0_3  -sv2k12 "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../1.srcs/sources_1/bd/pr/ipshared/03a9/hdl/axi_protocol_checker_v2_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../bd/pr/ip/pr_axi_vip_ctrl_0/sim/pr_axi_vip_ctrl_0_pkg.sv" \

vlog -work axi_vip_v1_1_3  -sv2k12 "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../1.srcs/sources_1/bd/pr/ipshared/b9a8/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../bd/pr/ip/pr_axi_vip_ctrl_0/sim/pr_axi_vip_ctrl_0.sv" \

vlog -work blk_mem_gen_v8_4_1  -v2k5 "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../1.srcs/sources_1/bd/pr/ipshared/67d8/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../bd/pr/ip/pr_blk_mem_switch_rom_0/sim/pr_blk_mem_switch_rom_0.v" \
"../../../../1.srcs/sources_1/bd/pr/ipshared/6571/hdl/verilog/width48router.v" \
"../../../../1.srcs/sources_1/bd/pr/ipshared/6571/hdl/verilog/width48router_ap_rst_if.v" \
"../../../../1.srcs/sources_1/bd/pr/ipshared/6571/hdl/verilog/width48router_network_table_V_if.v" \
"../../../../1.srcs/sources_1/bd/pr/ipshared/6571/hdl/verilog/width48router_stream_in_V_if.v" \
"../../../../1.srcs/sources_1/bd/pr/ipshared/6571/hdl/verilog/width48router_stream_out_network_V_if.v" \
"../../../../1.srcs/sources_1/bd/pr/ipshared/6571/hdl/verilog/width48router_stream_out_switch_V_if.v" \
"../../../../1.srcs/sources_1/bd/pr/ipshared/6571/hdl/verilog/width48router_top.v" \
"../../../bd/pr/ip/pr_custom_switch_inst_0/sim/pr_custom_switch_inst_0.v" \

vlog -work axis_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl/axis_infrastructure_v1_1_vl_rfs.v" \

vlog -work axis_register_slice_v1_1_17  -v2k5 "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../1.srcs/sources_1/bd/pr/ipshared/15d7/hdl/axis_register_slice_v1_1_vl_rfs.v" \

vlog -work axis_switch_v1_1_17  -v2k5 "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../1.srcs/sources_1/bd/pr/ipshared/57ab/hdl/axis_switch_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../bd/pr/ip/pr_input_switch_0/sim/pr_input_switch_0.v" \

vcom -work lib_pkg_v1_0_2 -93 \
"../../../../1.srcs/sources_1/bd/pr/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vlog -work fifo_generator_v13_2_2  -v2k5 "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../1.srcs/sources_1/bd/pr/ipshared/7aff/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_2 -93 \
"../../../../1.srcs/sources_1/bd/pr/ipshared/7aff/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_2  -v2k5 "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../1.srcs/sources_1/bd/pr/ipshared/7aff/hdl/fifo_generator_v13_2_rfs.v" \

vcom -work lib_fifo_v1_0_11 -93 \
"../../../../1.srcs/sources_1/bd/pr/ipshared/6078/hdl/lib_fifo_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_2 -93 \
"../../../../1.srcs/sources_1/bd/pr/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../1.srcs/sources_1/bd/pr/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work axi_datamover_v5_1_19 -93 \
"../../../../1.srcs/sources_1/bd/pr/ipshared/ec8a/hdl/axi_datamover_v5_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/pr/ip/pr_axi_datamover_0_1/sim/pr_axi_datamover_0_1.vhd" \

vlog -work xlconstant_v1_1_5  -v2k5 "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../1.srcs/sources_1/bd/pr/ipshared/f1c3/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../bd/pr/ip/pr_xlconstant_0_1/sim/pr_xlconstant_0_1.v" \
"../../../bd/pr/ip/pr_xlconstant_0_2/sim/pr_xlconstant_0_2.v" \
"../../../bd/pr/ip/pr_smartconnect_0_0/bd_0/sim/bd_7d4e.v" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../1.srcs/sources_1/bd/pr/ipshared/5160/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../bd/pr/ip/pr_smartconnect_0_0/bd_0/ip/ip_10/sim/bd_7d4e_s00a2s_0.sv" \
"../../../bd/pr/ip/pr_smartconnect_0_0/bd_0/ip/ip_16/sim/bd_7d4e_s01a2s_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../1.srcs/sources_1/bd/pr/ipshared/acc2/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../bd/pr/ip/pr_smartconnect_0_0/bd_0/ip/ip_20/sim/bd_7d4e_m00s2a_0.sv" \
"../../../bd/pr/ip/pr_smartconnect_0_0/bd_0/ip/ip_27/sim/bd_7d4e_m01s2a_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../1.srcs/sources_1/bd/pr/ipshared/28cb/hdl/sc_exit_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../bd/pr/ip/pr_smartconnect_0_0/bd_0/ip/ip_33/sim/bd_7d4e_m01e_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/sc_node_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../bd/pr/ip/pr_smartconnect_0_0/bd_0/ip/ip_28/sim/bd_7d4e_m01arn_0.sv" \
"../../../bd/pr/ip/pr_smartconnect_0_0/bd_0/ip/ip_29/sim/bd_7d4e_m01rn_0.sv" \
"../../../bd/pr/ip/pr_smartconnect_0_0/bd_0/ip/ip_30/sim/bd_7d4e_m01awn_0.sv" \
"../../../bd/pr/ip/pr_smartconnect_0_0/bd_0/ip/ip_31/sim/bd_7d4e_m01wn_0.sv" \
"../../../bd/pr/ip/pr_smartconnect_0_0/bd_0/ip/ip_32/sim/bd_7d4e_m01bn_0.sv" \
"../../../bd/pr/ip/pr_smartconnect_0_0/bd_0/ip/ip_26/sim/bd_7d4e_m00e_0.sv" \
"../../../bd/pr/ip/pr_smartconnect_0_0/bd_0/ip/ip_21/sim/bd_7d4e_m00arn_0.sv" \
"../../../bd/pr/ip/pr_smartconnect_0_0/bd_0/ip/ip_22/sim/bd_7d4e_m00rn_0.sv" \
"../../../bd/pr/ip/pr_smartconnect_0_0/bd_0/ip/ip_23/sim/bd_7d4e_m00awn_0.sv" \
"../../../bd/pr/ip/pr_smartconnect_0_0/bd_0/ip/ip_24/sim/bd_7d4e_m00wn_0.sv" \
"../../../bd/pr/ip/pr_smartconnect_0_0/bd_0/ip/ip_25/sim/bd_7d4e_m00bn_0.sv" \
"../../../bd/pr/ip/pr_smartconnect_0_0/bd_0/ip/ip_17/sim/bd_7d4e_sawn_0.sv" \
"../../../bd/pr/ip/pr_smartconnect_0_0/bd_0/ip/ip_18/sim/bd_7d4e_swn_0.sv" \
"../../../bd/pr/ip/pr_smartconnect_0_0/bd_0/ip/ip_19/sim/bd_7d4e_sbn_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../1.srcs/sources_1/bd/pr/ipshared/afa8/hdl/sc_mmu_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../bd/pr/ip/pr_smartconnect_0_0/bd_0/ip/ip_13/sim/bd_7d4e_s01mmu_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../1.srcs/sources_1/bd/pr/ipshared/4521/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../bd/pr/ip/pr_smartconnect_0_0/bd_0/ip/ip_14/sim/bd_7d4e_s01tr_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../1.srcs/sources_1/bd/pr/ipshared/d1fc/hdl/sc_si_converter_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../bd/pr/ip/pr_smartconnect_0_0/bd_0/ip/ip_15/sim/bd_7d4e_s01sic_0.sv" \
"../../../bd/pr/ip/pr_smartconnect_0_0/bd_0/ip/ip_11/sim/bd_7d4e_sarn_0.sv" \
"../../../bd/pr/ip/pr_smartconnect_0_0/bd_0/ip/ip_12/sim/bd_7d4e_srn_0.sv" \
"../../../bd/pr/ip/pr_smartconnect_0_0/bd_0/ip/ip_7/sim/bd_7d4e_s00mmu_0.sv" \
"../../../bd/pr/ip/pr_smartconnect_0_0/bd_0/ip/ip_8/sim/bd_7d4e_s00tr_0.sv" \
"../../../bd/pr/ip/pr_smartconnect_0_0/bd_0/ip/ip_9/sim/bd_7d4e_s00sic_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../1.srcs/sources_1/bd/pr/ipshared/4e7b/hdl/sc_switchboard_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../bd/pr/ip/pr_smartconnect_0_0/bd_0/ip/ip_2/sim/bd_7d4e_arsw_0.sv" \
"../../../bd/pr/ip/pr_smartconnect_0_0/bd_0/ip/ip_3/sim/bd_7d4e_rsw_0.sv" \
"../../../bd/pr/ip/pr_smartconnect_0_0/bd_0/ip/ip_4/sim/bd_7d4e_awsw_0.sv" \
"../../../bd/pr/ip/pr_smartconnect_0_0/bd_0/ip/ip_5/sim/bd_7d4e_wsw_0.sv" \
"../../../bd/pr/ip/pr_smartconnect_0_0/bd_0/ip/ip_6/sim/bd_7d4e_bsw_0.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../bd/pr/ip/pr_smartconnect_0_0/bd_0/ip/ip_0/sim/bd_7d4e_one_0.v" \

vcom -work proc_sys_reset_v5_0_12 -93 \
"../../../../1.srcs/sources_1/bd/pr/ipshared/f86a/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/pr/ip/pr_smartconnect_0_0/bd_0/ip/ip_1/sim/bd_7d4e_psr_aclk_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/5bb9/hdl/verilog" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/0ab1/hdl" "+incdir+../../../../1.srcs/sources_1/bd/pr/ipshared/f90c/hdl/verilog" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../bd/pr/ip/pr_smartconnect_0_0/sim/pr_smartconnect_0_0.v" \
"../../../bd/pr/ipshared/546a/ip_constant_block.v" \
"../../../bd/pr/ip/pr_ip_constant_block_inst_1/sim/pr_ip_constant_block_inst_1.v" \
"../../../../1.srcs/sources_1/bd/pr/ipshared/f6d2/hdl/verilog/app_to_eth.v" \
"../../../../1.srcs/sources_1/bd/pr/ipshared/f6d2/hdl/verilog/eth_to_app.v" \
"../../../../1.srcs/sources_1/bd/pr/ipshared/f6d2/hdl/verilog/ethernet_bridge.v" \
"../../../../1.srcs/sources_1/bd/pr/ipshared/f6d2/hdl/verilog/ethernet_bridge_ap_rst_if.v" \
"../../../../1.srcs/sources_1/bd/pr/ipshared/f6d2/hdl/verilog/ethernet_bridge_entr.v" \
"../../../../1.srcs/sources_1/bd/pr/ipshared/f6d2/hdl/verilog/ethernet_bridge_from_app_V_if.v" \
"../../../../1.srcs/sources_1/bd/pr/ipshared/f6d2/hdl/verilog/ethernet_bridge_from_eth_V_if.v" \
"../../../../1.srcs/sources_1/bd/pr/ipshared/f6d2/hdl/verilog/ethernet_bridge_mac_table_V_if.v" \
"../../../../1.srcs/sources_1/bd/pr/ipshared/f6d2/hdl/verilog/ethernet_bridge_to_app_V_if.v" \
"../../../../1.srcs/sources_1/bd/pr/ipshared/f6d2/hdl/verilog/ethernet_bridge_to_eth_V_if.v" \
"../../../../1.srcs/sources_1/bd/pr/ipshared/f6d2/hdl/verilog/fifo_w48_d2_A.v" \
"../../../../1.srcs/sources_1/bd/pr/ipshared/f6d2/hdl/verilog/ethernet_bridge_top.v" \
"../../../bd/pr/ip/pr_network_bridge_inst_1/sim/pr_network_bridge_inst_1.v" \
"../../../bd/pr/ip/pr_blk_mem_bridge_rom_1/sim/pr_blk_mem_bridge_rom_1.v" \
"../../../bd/pr/sim/pr.v" \
"../../../../1.srcs/sources_1/bd/pr/ipshared/d0e3/hdl/verilog/dariusController_bkb.v" \
"../../../../1.srcs/sources_1/bd/pr/ipshared/d0e3/hdl/verilog/dariusController_raw_darius_driver_m_axi.v" \
"../../../../1.srcs/sources_1/bd/pr/ipshared/d0e3/hdl/verilog/dariusController_raw.v" \
"../../../bd/pr/ip/pr_dariusController_raw_0_0/sim/pr_dariusController_raw_0_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

