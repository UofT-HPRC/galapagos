# /middleware/python/tclFileGenerator.py:1346
create_bd_cell -type hier applicationRegion
# /middleware/python/tclFileGenerator.py:357
create_bd_cell -type ip -vlnv xilinx.com:hls:myproject_galapagos applicationRegion/myproject_galapagos_inst_1
# /middleware/python/tclFileGenerator.py:357
connect_bd_net [get_bd_ports CLK] [get_bd_pins applicationRegion/myproject_galapagos_inst_1/ap_clk]
# /middleware/python/tclFileGenerator.py:357
connect_bd_net [get_bd_ports ARESETN] [get_bd_pins applicationRegion/myproject_galapagos_inst_1/ap_rst_n]
# /middleware/python/tclFileGenerator.py:29
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_vip applicationRegion/axi_vip_ctrl
# /middleware/python/tclFileGenerator.py:29
set_property -dict [list CONFIG.PROTOCOL {AXI4LITE} CONFIG.INTERFACE_MODE {SLAVE} ] [get_bd_cells applicationRegion/axi_vip_ctrl]
# /middleware/python/tclFileGenerator.py:29
connect_bd_net [get_bd_ports CLK] [get_bd_pins applicationRegion/axi_vip_ctrl/aclk]
# /middleware/python/tclFileGenerator.py:29
connect_bd_net [get_bd_ports ARESETN] [get_bd_pins applicationRegion/axi_vip_ctrl/aresetn]
# /middleware/python/tclFileGenerator.py:41
connect_bd_intf_net [get_bd_intf_ports S_AXI_CONTROL] [get_bd_intf_pins applicationRegion/axi_vip_ctrl/S_AXI]
# /middleware/python/tclFileGenerator.py:296
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_vip applicationRegion/axi_vip_mem_0
# /middleware/python/tclFileGenerator.py:296
set_property -dict [list CONFIG.INTERFACE_MODE {MASTER} CONFIG.DATA_WIDTH {512} ] [get_bd_cells applicationRegion/axi_vip_mem_0]
# /middleware/python/tclFileGenerator.py:296
connect_bd_net [get_bd_ports CLK] [get_bd_pins applicationRegion/axi_vip_mem_0/aclk]
# /middleware/python/tclFileGenerator.py:296
connect_bd_net [get_bd_ports ARESETN] [get_bd_pins applicationRegion/axi_vip_mem_0/aresetn]
# /middleware/python/tclFileGenerator.py:308
connect_bd_intf_net [get_bd_intf_pins applicationRegion/axi_vip_mem_0/M_AXI] [get_bd_intf_ports S_AXI_MEM_0]
# /middleware/python/tclFileGenerator.py:318
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_vip applicationRegion/axi_vip_mem_1
# /middleware/python/tclFileGenerator.py:318
set_property -dict [list CONFIG.INTERFACE_MODE {MASTER} CONFIG.DATA_WIDTH {512} ] [get_bd_cells applicationRegion/axi_vip_mem_1]
# /middleware/python/tclFileGenerator.py:318
connect_bd_net [get_bd_ports CLK] [get_bd_pins applicationRegion/axi_vip_mem_1/aclk]
# /middleware/python/tclFileGenerator.py:318
connect_bd_net [get_bd_ports ARESETN] [get_bd_pins applicationRegion/axi_vip_mem_1/aresetn]
# /middleware/python/tclFileGenerator.py:331
connect_bd_intf_net [get_bd_intf_pins applicationRegion/axi_vip_mem_1/M_AXI] [get_bd_intf_ports S_AXI_MEM_1]
# /middleware/python/tclFileGenerator.py:417
create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen applicationRegion/blk_mem_switch_rom
# /middleware/python/tclFileGenerator.py:483
create_bd_cell -type ip -vlnv xilinx.com:hls:width48router applicationRegion/custom_switch_inst
# /middleware/python/tclFileGenerator.py:483
connect_bd_net [get_bd_ports CLK] [get_bd_pins applicationRegion/custom_switch_inst/aclk]
# /middleware/python/tclFileGenerator.py:483
connect_bd_net [get_bd_ports ARESETN] [get_bd_pins applicationRegion/custom_switch_inst/aresetn]
# /middleware/python/tclFileGenerator.py:505
set_property -dict [list CONFIG.Memory_Type {Single_Port_ROM} CONFIG.Enable_32bit_Address {true} CONFIG.Use_Byte_Write_Enable {false} CONFIG.Byte_Size {8} CONFIG.Write_Width_A {64} CONFIG.Write_Depth_A {256} CONFIG.Read_Width_A {64} CONFIG.Write_Width_B {64} CONFIG.Read_Width_B {64} CONFIG.Register_PortA_Output_of_Memory_Primitives {false} CONFIG.Use_RSTA_Pin {true} CONFIG.Port_A_Write_Rate {0} CONFIG.use_bram_block {BRAM_Controller} CONFIG.EN_SAFETY_CKT {true} CONFIG.Load_init_file {true} CONFIG.Coe_File $top_path/projects/$default_dir/mac.coe ] [get_bd_cells applicationRegion/blk_mem_switch_rom]
# /middleware/python/tclFileGenerator.py:517
connect_bd_net [get_bd_pins network/ip_constant_block_inst/mac_big] [get_bd_pins applicationRegion/custom_switch_inst/network_addr_V]
# /middleware/python/tclFileGenerator.py:531
connect_bd_intf_net [get_bd_intf_pins applicationRegion/custom_switch_inst/network_table_V_PORTA] [get_bd_intf_pins applicationRegion/blk_mem_switch_rom/BRAM_PORTA]
# /middleware/python/tclFileGenerator.py:698
create_bd_cell -type ip -vlnv xilinx.com:ip:axis_switch applicationRegion/input_switch
# /middleware/python/tclFileGenerator.py:698
set_property -dict [list CONFIG.NUM_SI {2} CONFIG.NUM_MI {1} CONFIG.ARG_ON_TLAST {1} ] [get_bd_cells applicationRegion/input_switch]
# /middleware/python/tclFileGenerator.py:698
connect_bd_net [get_bd_ports CLK] [get_bd_pins applicationRegion/input_switch/aclk]
# /middleware/python/tclFileGenerator.py:698
connect_bd_net [get_bd_ports ARESETN] [get_bd_pins applicationRegion/input_switch/aresetn]
# /middleware/python/tclFileGenerator.py:728
set_property -dict [list CONFIG.M00_AXIS_BASETDEST {0x00000001} CONFIG.M00_AXIS_HIGHTDEST {0x00000001} ] [get_bd_cells applicationRegion/input_switch]
# /middleware/python/tclFileGenerator.py:863
connect_bd_intf_net [get_bd_intf_pins applicationRegion/input_switch/M00_AXIS] [get_bd_intf_pins applicationRegion/myproject_galapagos_inst_1/in_r]
# /middleware/python/tclFileGenerator.py:875
connect_bd_intf_net [get_bd_intf_pins applicationRegion/custom_switch_inst/stream_out_switch_V] [get_bd_intf_pins applicationRegion/input_switch/S01_AXIS]
# /middleware/python/tclFileGenerator.py:897
connect_bd_intf_net [get_bd_intf_pins applicationRegion/myproject_galapagos_inst_1/out_r] [get_bd_intf_pins applicationRegion/custom_switch_inst/stream_in_V]
# /middleware/python/tclFileGenerator.py:1150
assign_bd_address [get_bd_addr_segs {S_AXI_MEM_0/Reg}]
