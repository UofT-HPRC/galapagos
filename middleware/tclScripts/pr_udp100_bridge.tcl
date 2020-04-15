#comment out when running full script
#create_bd_cell -type hier network
set netBridge_from_app S_AXIS 
set netBridge_to_app M_AXIS


create_bd_cell -type ip -vlnv clarkshen.com:user:GULF_Stream network/GULF_Stream_0
create_bd_cell -type ip -vlnv xilinx.com:hls:network_bridge_udp_100g network/network_bridge_udp_1_0


create_bd_cell -type ip -vlnv clarkshen.com:user:axis_endianness_converter network/axis_endianness_conv_0
create_bd_cell -type ip -vlnv clarkshen.com:user:axis_endianness_converter network/axis_endianness_conv_1
set_property -dict [list CONFIG.DATA_WIDTH {512}] [get_bd_cells network/axis_endianness_conv_0]
set_property -dict [list CONFIG.DATA_WIDTH {512}] [get_bd_cells network/axis_endianness_conv_1]
connect_bd_intf_net [get_bd_intf_pins network/axis_endianness_conv_0/s_axis] [get_bd_intf_pins network/GULF_Stream_0/payload_to_user]
connect_bd_intf_net [get_bd_intf_pins network/axis_endianness_conv_0/m_axis] [get_bd_intf_pins network/network_bridge_udp_1_0/lbRxDataIn]
connect_bd_intf_net [get_bd_intf_pins network/network_bridge_udp_1_0/lbTxDataOut] [get_bd_intf_pins network/axis_endianness_conv_1/s_axis]
connect_bd_intf_net [get_bd_intf_pins network/axis_endianness_conv_1/m_axis] [get_bd_intf_pins network/GULF_Stream_0/payload_from_user]
connect_bd_net [get_bd_pins CLK_300] [get_bd_pins network/axis_endianness_conv_0/clk]
connect_bd_net [get_bd_pins CLK_300] [get_bd_pins network/axis_endianness_conv_1/clk]


connect_bd_net [get_bd_pins network/network_bridge_udp_1_0/remote_ip_tx_V] [get_bd_pins network/GULF_Stream_0/remote_ip_tx]
connect_bd_net [get_bd_ports CLK_300] [get_bd_pins network/GULF_Stream_0/clk]
connect_bd_net [get_bd_ports CLK_300] [get_bd_pins network/network_bridge_udp_1_0/ap_clk]

create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant network/galapagos_port 
set_property -dict [list CONFIG.CONST_WIDTH {16} CONFIG.CONST_VAL {640}] [get_bd_cells network/galapagos_port]
connect_bd_net [get_bd_pins network/galapagos_port/dout] [get_bd_pins network/GULF_Stream_0/remote_port_tx]
connect_bd_net [get_bd_pins network/GULF_Stream_0/local_port_tx] [get_bd_pins network/galapagos_port/dout]

create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic network/not_aresetn
set_property -dict [list CONFIG.C_OPERATION {not} CONFIG.LOGO_FILE {data/sym_notgate.png}] [get_bd_cells network/not_aresetn]
connect_bd_net [get_bd_ports ARESETN] [get_bd_pins network/not_aresetn/Op1]
connect_bd_net [get_bd_pins network/GULF_Stream_0/rst] [get_bd_pins network/not_aresetn/Res]
connect_bd_net [get_bd_ports ARESETN] [get_bd_pins network/network_bridge_udp_1_0/ap_rst_n]

create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen network/blk_mem_bridge_rom
#set_property -dict [list CONFIG.Memory_Type {Dual_Port_ROM} CONFIG.Enable_32bit_Address {false} CONFIG.Use_Byte_Write_Enable {false} CONFIG.Byte_Size {9} CONFIG.Enable_B {Use_ENB_Pin} CONFIG.Register_PortA_Output_of_Memory_Primitives {true} CONFIG.Register_PortB_Output_of_Memory_Primitives {true} CONFIG.Use_RSTA_Pin {false} CONFIG.Use_RSTB_Pin {false} CONFIG.Port_A_Write_Rate {0} CONFIG.Port_B_Clock {100} CONFIG.Port_B_Enable_Rate {100} CONFIG.use_bram_block{Stand_Alone} CONFIG.EN_SAFETY_CKT {false}] [get_bd_cells network/blk_mem_bridge_rom]

#set_property -dict [list CONFIG.Memory_Type {Dual_Port_ROM} CONFIG.Enable_32bit_Address {true} CONFIG.Use_Byte_Write_Enable {false} CONFIG.Byte_Size {8} CONFIG.Write_Depth_A {256} CONFIG.Enable_B {Use_ENB_Pin} CONFIG.Register_PortA_Output_of_Memory_Primitives {false} CONFIG.Register_PortB_Output_of_Memory_Primitives {false} CONFIG.Use_RSTA_Pin {true} CONFIG.Use_RSTB_Pin {true} CONFIG.Port_A_Write_Rate {0} CONFIG.Port_B_Clock {100} CONFIG.Port_B_Enable_Rate {100} CONFIG.use_bram_block {BRAM_Controller} CONFIG.EN_SAFETY_CKT {true} CONFIG.Load_Init_File {true} CONFIG.Coe_File {../../../../../../../ip.coe}] [get_bd_cells network/network/blk_mem_bridge_rom]
#set_property -dict [list CONFIG.Memory_Type {Dual_Port_ROM} CONFIG.Enable_32bit_Address {true} CONFIG.Use_Byte_Write_Enable {false} CONFIG.Byte_Size {8} CONFIG.Write_Depth_A {256} CONFIG.Enable_B {Use_ENB_Pin} CONFIG.Register_PortA_Output_of_Memory_Primitives {false} CONFIG.Register_PortB_Output_of_Memory_Primitives {false} CONFIG.Use_RSTA_Pin {true} CONFIG.Use_RSTB_Pin {true} CONFIG.Port_A_Write_Rate {0} CONFIG.Port_B_Clock {100} CONFIG.Port_B_Enable_Rate {100} CONFIG.use_bram_block {BRAM_Controller} CONFIG.EN_SAFETY_CKT {true}] [get_bd_cells network/blk_mem_bridge_rom]
#set_property -dict [list CONFIG.Memory_Type {Dual_Port_ROM} CONFIG.Use_Byte_Write_Enable {false} CONFIG.Enable_B {Use_ENB_Pin} CONFIG.Load_Init_File {true} CONFIG.Coe_File {/home/tarafdar/workDir/galapagos/projects/aegean_2/ip.coe} CONFIG.Use_RSTB_Pin {true} CONFIG.Port_A_Write_Rate {0} CONFIG.Port_B_Clock {100} CONFIG.Port_B_Enable_Rate {100}] [get_bd_cells network/blk_mem_bridge_rom]
#set_property -dict [list CONFIG.Memory_Type {Dual_Port_ROM} CONFIG.Enable_32bit_Address {true} CONFIG.Use_Byte_Write_Enable {false} CONFIG.Byte_Size {8} CONFIG.Write_Depth_A {256} CONFIG.Enable_B {Use_ENB_Pin} CONFIG.Register_PortA_Output_of_Memory_Primitives {false} CONFIG.Register_PortB_Output_of_Memory_Primitives {false} CONFIG.Use_RSTA_Pin {true} CONFIG.Use_RSTB_Pin {true} CONFIG.Port_A_Write_Rate {0} CONFIG.Port_B_Clock {100} CONFIG.Port_B_Enable_Rate {100} CONFIG.use_bram_block {BRAM_Controller} CONFIG.EN_SAFETY_CKT {true} CONFIG.Load_Init_File {true} CONFIG.Coe_File {/home/tarafdar/workDir/galapagos/projects/aegean_2/ip.coe}] [get_bd_cells network/blk_mem_bridge_rom]
set_property -dict [list CONFIG.Memory_Type {Dual_Port_ROM} CONFIG.Enable_32bit_Address {false} CONFIG.Use_Byte_Write_Enable {false} CONFIG.Byte_Size {9} CONFIG.Enable_B {Use_ENB_Pin} CONFIG.Register_PortA_Output_of_Memory_Primitives {true} CONFIG.Register_PortB_Output_of_Memory_Primitives {true} CONFIG.Load_Init_File {true} CONFIG.Coe_File {../../../../../../../ip.coe} CONFIG.Use_RSTA_Pin {false} CONFIG.Port_A_Write_Rate {0} CONFIG.Port_B_Clock {100} CONFIG.Port_B_Enable_Rate {100} CONFIG.use_bram_block {Stand_Alone} CONFIG.EN_SAFETY_CKT {false}] [get_bd_cells network/blk_mem_bridge_rom]



connect_bd_intf_net [get_bd_intf_pins network/blk_mem_bridge_rom/BRAM_PORTA] [get_bd_intf_pins network/network_bridge_udp_1_0/ip_table_V_PORTA]
connect_bd_intf_net [get_bd_intf_pins network/blk_mem_bridge_rom/BRAM_PORTB] [get_bd_intf_pins network/network_bridge_udp_1_0/ip_table_V_PORTB]

connect_bd_intf_net [get_bd_intf_ports S_AXIS] [get_bd_intf_pins network/GULF_Stream_0/s_axis]
connect_bd_intf_net [get_bd_intf_ports M_AXIS] [get_bd_intf_pins network/GULF_Stream_0/m_axis]


create_bd_cell -type hier network/network_bridge_inst
create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo network/network_bridge_inst/axis_data_fifo_0
create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo network/network_bridge_inst/axis_data_fifo_1
set_property -dict [list CONFIG.IS_ACLK_ASYNC {1}] [get_bd_cells network/network_bridge_inst/axis_data_fifo_0]
set_property -dict [list CONFIG.IS_ACLK_ASYNC {1}] [get_bd_cells network/network_bridge_inst/axis_data_fifo_1]

set_property -dict [list CONFIG.FIFO_MODE {2}] [get_bd_cells network/network_bridge_inst/axis_data_fifo_0]
set_property -dict [list CONFIG.FIFO_MODE {2}] [get_bd_cells network/network_bridge_inst/axis_data_fifo_1]

create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo network/dummy_fifo_0
connect_bd_intf_net [get_bd_intf_pins network/network_bridge_inst/axis_data_fifo_1/M_AXIS] [get_bd_intf_pins network/dummy_fifo_0/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins network/dummy_fifo_0/M_AXIS] [get_bd_intf_pins network/network_bridge_inst/axis_data_fifo_0/S_AXIS]
delete_bd_objs [get_bd_intf_nets network/network_bridge_inst_M_AXIS1] [get_bd_intf_nets network/dummy_fifo_0_M_AXIS] [get_bd_cells network/dummy_fifo_0]
delete_bd_objs [get_bd_intf_nets network/network_bridge_inst_M_AXIS]


connect_bd_intf_net [get_bd_intf_pins network/network_bridge_inst/axis_data_fifo_0/M_AXIS] [get_bd_intf_pins network/network_bridge_udp_1_0/rxGalapagosBridge]
connect_bd_net [get_bd_ports CLK] [get_bd_pins network/network_bridge_inst/axis_data_fifo_0/s_axis_aclk]
connect_bd_net [get_bd_ports CLK_300] [get_bd_pins network/network_bridge_inst/axis_data_fifo_0/m_axis_aclk]
connect_bd_net [get_bd_ports ARESETN] [get_bd_pins network/network_bridge_inst/axis_data_fifo_0/s_axis_aresetn]

connect_bd_intf_net [get_bd_intf_pins network/network_bridge_inst/axis_data_fifo_1/S_AXIS] [get_bd_intf_pins network/network_bridge_udp_1_0/txGalapagosBridge]
connect_bd_net [get_bd_ports CLK_300] [get_bd_pins network/network_bridge_inst/axis_data_fifo_1/s_axis_aclk]
connect_bd_net [get_bd_ports CLK] [get_bd_pins network/network_bridge_inst/axis_data_fifo_1/m_axis_aclk]
connect_bd_net [get_bd_ports ARESETN] [get_bd_pins network/network_bridge_inst/axis_data_fifo_1/s_axis_aresetn]
