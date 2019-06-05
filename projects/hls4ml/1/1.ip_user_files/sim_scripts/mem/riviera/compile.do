vlib work
vlib riviera

vlib riviera/xilinx_vip
vlib riviera/xil_defaultlib
vlib riviera/xpm
vlib riviera/util_vector_logic_v2_0_1
vlib riviera/microblaze_v10_0_7
vlib riviera/lib_cdc_v1_0_2
vlib riviera/proc_sys_reset_v5_0_12
vlib riviera/lmb_v10_v3_0_9
vlib riviera/lmb_bram_if_cntlr_v4_0_15
vlib riviera/blk_mem_gen_v8_4_1
vlib riviera/iomodule_v3_1_3
vlib riviera/generic_baseblocks_v2_1_0
vlib riviera/fifo_generator_v13_2_2
vlib riviera/axi_data_fifo_v2_1_16
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/axi_clock_converter_v2_1_16

vmap xilinx_vip riviera/xilinx_vip
vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm
vmap util_vector_logic_v2_0_1 riviera/util_vector_logic_v2_0_1
vmap microblaze_v10_0_7 riviera/microblaze_v10_0_7
vmap lib_cdc_v1_0_2 riviera/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_12 riviera/proc_sys_reset_v5_0_12
vmap lmb_v10_v3_0_9 riviera/lmb_v10_v3_0_9
vmap lmb_bram_if_cntlr_v4_0_15 riviera/lmb_bram_if_cntlr_v4_0_15
vmap blk_mem_gen_v8_4_1 riviera/blk_mem_gen_v8_4_1
vmap iomodule_v3_1_3 riviera/iomodule_v3_1_3
vmap generic_baseblocks_v2_1_0 riviera/generic_baseblocks_v2_1_0
vmap fifo_generator_v13_2_2 riviera/fifo_generator_v13_2_2
vmap axi_data_fifo_v2_1_16 riviera/axi_data_fifo_v2_1_16
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap axi_clock_converter_v2_1_16 riviera/axi_clock_converter_v2_1_16

vlog -work xilinx_vip  -sv2k12 "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/cal" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/cal" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/cal" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"/opt/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/opt/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/opt/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"/opt/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work util_vector_logic_v2_0_1  -v2k5 "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/cal" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/cal" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../1.srcs/sources_1/bd/mem/ipshared/2137/hdl/util_vector_logic_v2_0_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/cal" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/cal" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../bd/mem/ip/mem_util_vector_logic_3_0/sim/mem_util_vector_logic_3_0.v" \

vcom -work microblaze_v10_0_7 -93 \
"../../../../1.srcs/sources_1/bd/mem/ipshared/b649/hdl/microblaze_v10_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/mem/ip/mem_ddr4_0_0/bd_0/ip/ip_0/sim/bd_bc63_microblaze_I_0.vhd" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../1.srcs/sources_1/bd/mem/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_12 -93 \
"../../../../1.srcs/sources_1/bd/mem/ipshared/f86a/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/mem/ip/mem_ddr4_0_0/bd_0/ip/ip_1/sim/bd_bc63_rst_0_0.vhd" \

vcom -work lmb_v10_v3_0_9 -93 \
"../../../../1.srcs/sources_1/bd/mem/ipshared/78eb/hdl/lmb_v10_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/mem/ip/mem_ddr4_0_0/bd_0/ip/ip_2/sim/bd_bc63_ilmb_0.vhd" \
"../../../bd/mem/ip/mem_ddr4_0_0/bd_0/ip/ip_3/sim/bd_bc63_dlmb_0.vhd" \

vcom -work lmb_bram_if_cntlr_v4_0_15 -93 \
"../../../../1.srcs/sources_1/bd/mem/ipshared/92fd/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/mem/ip/mem_ddr4_0_0/bd_0/ip/ip_4/sim/bd_bc63_dlmb_cntlr_0.vhd" \
"../../../bd/mem/ip/mem_ddr4_0_0/bd_0/ip/ip_5/sim/bd_bc63_ilmb_cntlr_0.vhd" \

vlog -work blk_mem_gen_v8_4_1  -v2k5 "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/cal" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/cal" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../1.srcs/sources_1/bd/mem/ipshared/67d8/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/cal" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/cal" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../bd/mem/ip/mem_ddr4_0_0/bd_0/ip/ip_6/sim/bd_bc63_lmb_bram_I_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/mem/ip/mem_ddr4_0_0/bd_0/ip/ip_7/sim/bd_bc63_second_dlmb_cntlr_0.vhd" \
"../../../bd/mem/ip/mem_ddr4_0_0/bd_0/ip/ip_8/sim/bd_bc63_second_ilmb_cntlr_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/cal" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/cal" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../bd/mem/ip/mem_ddr4_0_0/bd_0/ip/ip_9/sim/bd_bc63_second_lmb_bram_I_0.v" \

vcom -work iomodule_v3_1_3 -93 \
"../../../../1.srcs/sources_1/bd/mem/ipshared/ca2b/hdl/iomodule_v3_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/mem/ip/mem_ddr4_0_0/bd_0/ip/ip_10/sim/bd_bc63_iomodule_0_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/cal" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/cal" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../bd/mem/ip/mem_ddr4_0_0/bd_0/sim/bd_bc63.v" \
"../../../bd/mem/ip/mem_ddr4_0_0/ip_0/sim/mem_ddr4_0_0_microblaze_mcs.v" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/cal" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/cal" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/phy/ddr4_phy_v2_2_xiphy_behav.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/phy/ddr4_phy_v2_2_xiphy.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/iob/ddr4_phy_v2_2_iob_byte.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/iob/ddr4_phy_v2_2_iob.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/clocking/ddr4_phy_v2_2_pll.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/xiphy_files/ddr4_phy_v2_2_xiphy_tristate_wrapper.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/xiphy_files/ddr4_phy_v2_2_xiphy_riuor_wrapper.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/xiphy_files/ddr4_phy_v2_2_xiphy_control_wrapper.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/xiphy_files/ddr4_phy_v2_2_xiphy_byte_wrapper.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/xiphy_files/ddr4_phy_v2_2_xiphy_bitslice_wrapper.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/phy/mem_ddr4_0_0_phy_ddr4.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/ip_top/mem_ddr4_0_0_phy.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/controller/ddr4_v2_2_mc_wtr.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/controller/ddr4_v2_2_mc_ref.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/controller/ddr4_v2_2_mc_rd_wr.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/controller/ddr4_v2_2_mc_periodic.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/controller/ddr4_v2_2_mc_group.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/controller/ddr4_v2_2_mc_ecc_merge_enc.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/controller/ddr4_v2_2_mc_ecc_gen.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/controller/ddr4_v2_2_mc_ecc_fi_xor.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/controller/ddr4_v2_2_mc_ecc_dec_fix.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/controller/ddr4_v2_2_mc_ecc_buf.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/controller/ddr4_v2_2_mc_ecc.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/controller/ddr4_v2_2_mc_ctl.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/controller/ddr4_v2_2_mc_cmd_mux_c.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/controller/ddr4_v2_2_mc_cmd_mux_ap.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/controller/ddr4_v2_2_mc_arb_p.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/controller/ddr4_v2_2_mc_arb_mux_p.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/controller/ddr4_v2_2_mc_arb_c.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/controller/ddr4_v2_2_mc_arb_a.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/controller/ddr4_v2_2_mc_act_timer.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/controller/ddr4_v2_2_mc_act_rank.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/controller/ddr4_v2_2_mc.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/ui/ddr4_v2_2_ui_wr_data.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/ui/ddr4_v2_2_ui_rd_data.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/ui/ddr4_v2_2_ui_cmd.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/ui/ddr4_v2_2_ui.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/axi/ddr4_v2_2_axi_ar_channel.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/axi/ddr4_v2_2_axi_aw_channel.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/axi/ddr4_v2_2_axi_b_channel.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/axi/ddr4_v2_2_axi_cmd_arbiter.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/axi/ddr4_v2_2_axi_cmd_fsm.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/axi/ddr4_v2_2_axi_cmd_translator.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/axi/ddr4_v2_2_axi_fifo.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/axi/ddr4_v2_2_axi_incr_cmd.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/axi/ddr4_v2_2_axi_r_channel.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/axi/ddr4_v2_2_axi_w_channel.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/axi/ddr4_v2_2_axi_wr_cmd_fsm.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/axi/ddr4_v2_2_axi_wrap_cmd.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/axi/ddr4_v2_2_a_upsizer.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/axi/ddr4_v2_2_axi.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/axi/ddr4_v2_2_axi_register_slice.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/axi/ddr4_v2_2_axi_upsizer.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/axi/ddr4_v2_2_axic_register_slice.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/axi/ddr4_v2_2_carry_and.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/axi/ddr4_v2_2_carry_latch_and.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/axi/ddr4_v2_2_carry_latch_or.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/axi/ddr4_v2_2_carry_or.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/axi/ddr4_v2_2_command_fifo.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/axi/ddr4_v2_2_comparator.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/axi/ddr4_v2_2_comparator_sel.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/axi/ddr4_v2_2_comparator_sel_static.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/axi/ddr4_v2_2_r_upsizer.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/axi/ddr4_v2_2_w_upsizer.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/axi_ctrl/ddr4_v2_2_axi_ctrl_addr_decode.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/axi_ctrl/ddr4_v2_2_axi_ctrl_read.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/axi_ctrl/ddr4_v2_2_axi_ctrl_reg_bank.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/axi_ctrl/ddr4_v2_2_axi_ctrl_reg.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/axi_ctrl/ddr4_v2_2_axi_ctrl_top.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/axi_ctrl/ddr4_v2_2_axi_ctrl_write.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/clocking/ddr4_v2_2_infrastructure.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal/ddr4_v2_2_cal_xsdb_bram.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal/ddr4_v2_2_cal_write.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal/ddr4_v2_2_cal_wr_byte.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal/ddr4_v2_2_cal_wr_bit.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal/ddr4_v2_2_cal_sync.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal/ddr4_v2_2_cal_read.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal/ddr4_v2_2_cal_rd_en.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal/ddr4_v2_2_cal_pi.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal/ddr4_v2_2_cal_mc_odt.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal/ddr4_v2_2_cal_debug_microblaze.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal/ddr4_v2_2_cal_cplx_data.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal/ddr4_v2_2_cal_cplx.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal/ddr4_v2_2_cal_config_rom.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal/ddr4_v2_2_cal_addr_decode.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal/ddr4_v2_2_cal_top.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal/ddr4_v2_2_cal_xsdb_arbiter.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal/ddr4_v2_2_cal.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal/ddr4_v2_2_chipscope_xsdb_slave.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal/ddr4_v2_2_dp_AB9.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/ip_top/mem_ddr4_0_0.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/ip_top/mem_ddr4_0_0_ddr4.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/ip_top/mem_ddr4_0_0_ddr4_mem_intfc.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal/mem_ddr4_0_0_ddr4_cal_riu.sv" \
"../../../bd/mem/ip/mem_ddr4_0_0/tb/microblaze_mcs_0.sv" \

vcom -work xil_defaultlib -93 \
"../../../bd/mem/ip/mem_ddr4_1_0/bd_0/ip/ip_0/sim/bd_80a3_microblaze_I_0.vhd" \
"../../../bd/mem/ip/mem_ddr4_1_0/bd_0/ip/ip_1/sim/bd_80a3_rst_0_0.vhd" \
"../../../bd/mem/ip/mem_ddr4_1_0/bd_0/ip/ip_2/sim/bd_80a3_ilmb_0.vhd" \
"../../../bd/mem/ip/mem_ddr4_1_0/bd_0/ip/ip_3/sim/bd_80a3_dlmb_0.vhd" \
"../../../bd/mem/ip/mem_ddr4_1_0/bd_0/ip/ip_4/sim/bd_80a3_dlmb_cntlr_0.vhd" \
"../../../bd/mem/ip/mem_ddr4_1_0/bd_0/ip/ip_5/sim/bd_80a3_ilmb_cntlr_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/cal" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/cal" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../bd/mem/ip/mem_ddr4_1_0/bd_0/ip/ip_6/sim/bd_80a3_lmb_bram_I_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/mem/ip/mem_ddr4_1_0/bd_0/ip/ip_7/sim/bd_80a3_second_dlmb_cntlr_0.vhd" \
"../../../bd/mem/ip/mem_ddr4_1_0/bd_0/ip/ip_8/sim/bd_80a3_second_ilmb_cntlr_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/cal" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/cal" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../bd/mem/ip/mem_ddr4_1_0/bd_0/ip/ip_9/sim/bd_80a3_second_lmb_bram_I_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/mem/ip/mem_ddr4_1_0/bd_0/ip/ip_10/sim/bd_80a3_iomodule_0_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/cal" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/cal" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../bd/mem/ip/mem_ddr4_1_0/bd_0/sim/bd_80a3.v" \
"../../../bd/mem/ip/mem_ddr4_1_0/ip_0/sim/mem_ddr4_1_0_microblaze_mcs.v" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/cal" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/cal" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/phy/mem_ddr4_1_0_phy_ddr4.sv" \
"../../../bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/ip_top/mem_ddr4_1_0_phy.sv" \
"../../../bd/mem/ip/mem_ddr4_1_0/rtl/ip_top/mem_ddr4_1_0.sv" \
"../../../bd/mem/ip/mem_ddr4_1_0/rtl/ip_top/mem_ddr4_1_0_ddr4.sv" \
"../../../bd/mem/ip/mem_ddr4_1_0/rtl/ip_top/mem_ddr4_1_0_ddr4_mem_intfc.sv" \
"../../../bd/mem/ip/mem_ddr4_1_0/rtl/cal/mem_ddr4_1_0_ddr4_cal_riu.sv" \
"../../../bd/mem/ip/mem_ddr4_1_0/tb/microblaze_mcs_0.sv" \

vcom -work xil_defaultlib -93 \
"../../../bd/mem/ip/mem_proc_sys_reset_1_0/sim/mem_proc_sys_reset_1_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/cal" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/cal" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../bd/mem/ip/mem_util_vector_logic_4_0/sim/mem_util_vector_logic_4_0.v" \
"../../../bd/mem/ip/mem_util_vector_logic_5_0/sim/mem_util_vector_logic_5_0.v" \

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/cal" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/cal" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../1.srcs/sources_1/bd/mem/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_2  -v2k5 "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/cal" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/cal" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../1.srcs/sources_1/bd/mem/ipshared/7aff/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_2 -93 \
"../../../../1.srcs/sources_1/bd/mem/ipshared/7aff/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_2  -v2k5 "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/cal" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/cal" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../1.srcs/sources_1/bd/mem/ipshared/7aff/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_16  -v2k5 "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/cal" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/cal" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../1.srcs/sources_1/bd/mem/ipshared/247d/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/cal" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/cal" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../bd/mem/ip/mem_s00_data_fifo_1/sim/mem_s00_data_fifo_1.v" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/cal" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/cal" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../1.srcs/sources_1/bd/mem/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_clock_converter_v2_1_16  -v2k5 "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/cal" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/cal" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../1.srcs/sources_1/bd/mem/ipshared/e9a5/hdl/axi_clock_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/cal" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ipshared/ec67/hdl" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_0_0/rtl/cal" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/ip_1/rtl/map" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/ip_top" "+incdir+../../../../1.srcs/sources_1/bd/mem/ip/mem_ddr4_1_0/rtl/cal" "+incdir+/opt/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../bd/mem/ip/mem_auto_cc_1/sim/mem_auto_cc_1.v" \
"../../../bd/mem/ip/mem_s00_data_fifo_0/sim/mem_s00_data_fifo_0.v" \
"../../../bd/mem/ip/mem_auto_cc_0/sim/mem_auto_cc_0.v" \
"../../../bd/mem/sim/mem.v" \

vlog -work xil_defaultlib \
"glbl.v"

