# /middleware/python/tclFileGenerator.py:1346
create_bd_cell -type hier applicationRegion
# /middleware/python/tclFileGenerator.py:357
create_bd_cell -type ip -vlnv xilinx.com:hls:kern_recv applicationRegion/kern_recv_inst_1
# /middleware/python/tclFileGenerator.py:357
connect_bd_net [get_bd_ports CLK] [get_bd_pins applicationRegion/kern_recv_inst_1/ap_clk]
# /middleware/python/tclFileGenerator.py:357
connect_bd_net [get_bd_ports ARESETN] [get_bd_pins applicationRegion/kern_recv_inst_1/ap_rst_n]
# /middleware/python/tclFileGenerator.py:69
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect applicationRegion/axi_interconnect_ctrl
# /middleware/python/tclFileGenerator.py:69
set_property -dict [list CONFIG.NUM_SI {1} CONFIG.NUM_MI {2} ] [get_bd_cells applicationRegion/axi_interconnect_ctrl]
# /middleware/python/tclFileGenerator.py:69
connect_bd_net [get_bd_ports CLK] [get_bd_pins applicationRegion/axi_interconnect_ctrl/ACLK]
# /middleware/python/tclFileGenerator.py:69
connect_bd_net [get_bd_ports CLK] [get_bd_pins applicationRegion/axi_interconnect_ctrl/S00_ACLK]
# /middleware/python/tclFileGenerator.py:69
connect_bd_net [get_bd_ports CLK] [get_bd_pins applicationRegion/axi_interconnect_ctrl/M00_ACLK]
# /middleware/python/tclFileGenerator.py:69
connect_bd_net [get_bd_ports CLK] [get_bd_pins applicationRegion/axi_interconnect_ctrl/M01_ACLK]
# /middleware/python/tclFileGenerator.py:69
connect_bd_net [get_bd_ports ARESETN] [get_bd_pins applicationRegion/axi_interconnect_ctrl/ARESETN]
# /middleware/python/tclFileGenerator.py:69
connect_bd_net [get_bd_ports ARESETN] [get_bd_pins applicationRegion/axi_interconnect_ctrl/S00_ARESETN]
# /middleware/python/tclFileGenerator.py:69
connect_bd_net [get_bd_ports ARESETN] [get_bd_pins applicationRegion/axi_interconnect_ctrl/M00_ARESETN]
# /middleware/python/tclFileGenerator.py:69
connect_bd_net [get_bd_ports ARESETN] [get_bd_pins applicationRegion/axi_interconnect_ctrl/M01_ARESETN]
# /middleware/python/tclFileGenerator.py:81
connect_bd_intf_net [get_bd_intf_ports S_AXI_CONTROL] [get_bd_intf_pins applicationRegion/axi_interconnect_ctrl/S00_AXI]
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
# /middleware/python/tclFileGenerator.py:552
set_property -dict [list CONFIG.Memory_Type {Single_Port_ROM} CONFIG.Enable_32bit_Address {true} CONFIG.Use_Byte_Write_Enable {false} CONFIG.Byte_Size {8} CONFIG.Write_Depth_A {256} CONFIG.Register_PortA_Output_of_Memory_Primitives {false} CONFIG.Use_RSTA_Pin {true} CONFIG.Port_A_Write_Rate {0} CONFIG.use_bram_block {BRAM_Controller} CONFIG.EN_SAFETY_CKT {true} CONFIG.Load_Init_File {true} CONFIG.Coe_File $top_path/projects/$default_dir/ip.coe ] [get_bd_cells applicationRegion/blk_mem_switch_rom]
# /middleware/python/tclFileGenerator.py:559
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl applicationRegion/ctrl_blk_mem_switch_rom
# /middleware/python/tclFileGenerator.py:559
connect_bd_net [get_bd_ports CLK] [get_bd_pins applicationRegion/ctrl_blk_mem_switch_rom/s_axi_aclk]
# /middleware/python/tclFileGenerator.py:559
connect_bd_net [get_bd_ports ARESETN] [get_bd_pins applicationRegion/ctrl_blk_mem_switch_rom/s_axi_aresetn]
# /middleware/python/tclFileGenerator.py:562
set_property -dict [list CONFIG.SINGLE_PORT_BRAM {1} ] [get_bd_cells applicationRegion/ctrl_blk_mem_switch_rom]
# /middleware/python/tclFileGenerator.py:568
create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen applicationRegion/blk_mem_switch_rom_mac
# /middleware/python/tclFileGenerator.py:577
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl applicationRegion/ctrl_blk_mem_switch_rom_mac
# /middleware/python/tclFileGenerator.py:577
connect_bd_net [get_bd_ports CLK] [get_bd_pins applicationRegion/ctrl_blk_mem_switch_rom_mac/s_axi_aclk]
# /middleware/python/tclFileGenerator.py:577
connect_bd_net [get_bd_ports ARESETN] [get_bd_pins applicationRegion/ctrl_blk_mem_switch_rom_mac/s_axi_aresetn]
# /middleware/python/tclFileGenerator.py:580
set_property -dict [list CONFIG.SINGLE_PORT_BRAM {1} CONFIG.DATA_WIDTH {64} ] [get_bd_cells applicationRegion/ctrl_blk_mem_switch_rom_mac]
# /middleware/python/tclFileGenerator.py:600
set_property -dict [list CONFIG.Memory_Type {Single_Port_ROM} CONFIG.Enable_32bit_Address {true} CONFIG.Use_Byte_Write_Enable {false} CONFIG.Byte_Size {8} CONFIG.Write_Width_A {64} CONFIG.Write_Depth_A {256} CONFIG.Read_Width_A {64} CONFIG.Write_Width_B {64} CONFIG.Read_Width_B {64} CONFIG.Register_PortA_Output_of_Memory_Primitives {false} CONFIG.Use_RSTA_Pin {true} CONFIG.Port_A_Write_Rate {0} CONFIG.use_bram_block {BRAM_Controller} CONFIG.EN_SAFETY_CKT {true} CONFIG.Load_init_file {true} CONFIG.Coe_File $top_path/projects/$default_dir/mac.coe ] [get_bd_cells applicationRegion/blk_mem_switch_rom_mac]
# /middleware/python/tclFileGenerator.py:614
connect_bd_intf_net [get_bd_intf_pins applicationRegion/axi_interconnect_ctrl/M00_AXI] [get_bd_intf_pins applicationRegion/ctrl_blk_mem_switch_rom/S_AXI]
# /middleware/python/tclFileGenerator.py:627
connect_bd_intf_net [get_bd_intf_pins applicationRegion/axi_interconnect_ctrl/M01_AXI] [get_bd_intf_pins applicationRegion/ctrl_blk_mem_switch_rom_mac/S_AXI]
# /middleware/python/tclFileGenerator.py:642
connect_bd_intf_net [get_bd_intf_pins applicationRegion/ctrl_blk_mem_switch_rom/BRAM_PORTA] [get_bd_intf_pins applicationRegion/blk_mem_switch_rom/BRAM_PORTA]
# /middleware/python/tclFileGenerator.py:655
connect_bd_intf_net [get_bd_intf_pins applicationRegion/ctrl_blk_mem_switch_rom_mac/BRAM_PORTA] [get_bd_intf_pins applicationRegion/blk_mem_switch_rom_mac/BRAM_PORTA]
# /middleware/python/tclFileGenerator.py:1150
assign_bd_address [get_bd_addr_segs {S_AXI_MEM_0/Reg}]
# /middleware/python/tclFileGenerator.py:1196
assign_bd_address [get_bd_addr_segs {applicationRegion/ctrl_blk_mem_switch_rom/S_AXI/Mem0}]
# /middleware/python/tclFileGenerator.py:1200
set_property  range 4K [get_bd_addr_segs {S_AXI_CONTROL/SEG_ctrl_blk_mem_switch_rom_Mem0}]
# /middleware/python/tclFileGenerator.py:1202
set_property  offset 0x0000 [get_bd_addr_segs {S_AXI_CONTROL/SEG_ctrl_blk_mem_switch_rom_Mem0}]
# /middleware/python/tclFileGenerator.py:1204
assign_bd_address [get_bd_addr_segs {applicationRegion/ctrl_blk_mem_switch_rom_mac/S_AXI/Mem0}]
# /middleware/python/tclFileGenerator.py:1207
set_property  range 4K [get_bd_addr_segs {S_AXI_CONTROL/SEG_ctrl_blk_mem_switch_rom_mac_Mem0}]
# /middleware/python/tclFileGenerator.py:1209
set_property  offset 0x1000 [get_bd_addr_segs {S_AXI_CONTROL/SEG_ctrl_blk_mem_switch_rom_mac_Mem0}]
