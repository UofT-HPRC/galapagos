onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L xilinx_vip -L xil_defaultlib -L xpm -L util_vector_logic_v2_0_1 -L microblaze_v10_0_7 -L lib_cdc_v1_0_2 -L proc_sys_reset_v5_0_12 -L lmb_v10_v3_0_9 -L lmb_bram_if_cntlr_v4_0_15 -L blk_mem_gen_v8_4_1 -L iomodule_v3_1_3 -L generic_baseblocks_v2_1_0 -L fifo_generator_v13_2_2 -L axi_data_fifo_v2_1_16 -L axi_infrastructure_v1_1_0 -L axi_clock_converter_v2_1_16 -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.mem xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {mem.udo}

run -all

quit -force
