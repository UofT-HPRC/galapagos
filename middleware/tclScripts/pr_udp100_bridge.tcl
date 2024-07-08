#comment out when running full script
#create_bd_cell -type hier network
source $top_path/middleware/tclScripts/pr_fetch_bypass.tcl

connect_bd_net [get_bd_pins network/dns_server_info/dout] [get_bd_pins network/fetch/dns_addr]

set netBridge_from_app S_AXIS 
set netBridge_to_app M_AXIS

add_files -norecurse $top_path/middleware/verilog/receptionist.v
update_compile_order -fileset sources_1
create_bd_cell -type module -reference receptionist network/receptionist

addip GULF_Stream network/GULF_Stream_0
addip network_bridge_udp_100g network/network_bridge_udp_1_0
addip gulf_input_switch network/gulf_input_switch_0
addip axis_data_fifo network/fifo_gulf
addip axis_switch network/direct_ip_switch
addip axis_switch network/direct_ip_rx_switch
addip axis_data_fifo network/fetch_clock_converter

set_property -dict [list CONFIG.IP_ADDR $ip_addr] [get_bd_cells network/GULF_Stream_0]
set_property -dict [list CONFIG.GATEWAY $ip_gateway] [get_bd_cells network/GULF_Stream_0]
set_property -dict [list CONFIG.MAC_ADDR $mac_addr] [get_bd_cells network/GULF_Stream_0]
set_property -dict [list CONFIG.NETMASK $net_mask] [get_bd_cells network/GULF_Stream_0]
addip axis_endianness_converter network/axis_endianness_conv_0
addip axis_endianness_converter network/axis_endianness_conv_1
set_property -dict [list CONFIG.DATA_WIDTH {512}] [get_bd_cells network/axis_endianness_conv_0]
set_property -dict [list CONFIG.DATA_WIDTH {512}] [get_bd_cells network/axis_endianness_conv_1]
set_property -dict [list CONFIG.HAS_KEEP {true} CONFIG.HAS_LAST {true} CONFIG.HAS_READY {true}] [get_bd_cells network/axis_endianness_conv_0]
set_property -dict [list CONFIG.HAS_KEEP {true} CONFIG.HAS_LAST {true} CONFIG.HAS_READY {true}] [get_bd_cells network/axis_endianness_conv_1]
set_property -dict [list CONFIG.TDATA_NUM_BYTES.VALUE_SRC PROPAGATED CONFIG.HAS_TLAST.VALUE_SRC USER] [get_bd_cells network/direct_ip_switch]
set_property -dict [list \
  CONFIG.ARB_ALGORITHM {1} \
  CONFIG.ARB_ON_MAX_XFERS {0} \
  CONFIG.ARB_ON_TLAST {1} \
  CONFIG.HAS_TLAST {1} \
  CONFIG.M00_AXIS_HIGHTDEST {0xFFFFFFFF} \
  CONFIG.NUM_SI {3} \
] [get_bd_cells network/direct_ip_switch]

set_property -dict [list \
  CONFIG.NUM_MI {3} \
  CONFIG.M00_AXIS_BASETDEST {0x0} \
  CONFIG.M00_AXIS_HIGHTDEST {0x2328} \
  CONFIG.M01_AXIS_BASETDEST {0x7531} \
  CONFIG.M01_AXIS_HIGHTDEST {0xFFFFFFFF} \
  CONFIG.M02_AXIS_BASETDEST {0x2329} \
  CONFIG.M02_AXIS_HIGHTDEST {0x2329} \
  CONFIG.NUM_SI {1} \
] [get_bd_cells network/direct_ip_rx_switch]

set_property -dict [list \
  CONFIG.FIFO_DEPTH {32} \
  CONFIG.IS_ACLK_ASYNC {1} \
] [get_bd_cells network/fetch_clock_converter]

connect_bd_intf_net [get_bd_intf_pins network/axis_endianness_conv_0/s_axis] [get_bd_intf_pins network/GULF_Stream_0/payload_to_user]
connect_bd_intf_net [get_bd_intf_pins network/axis_endianness_conv_0/m_axis] [get_bd_intf_pins network/receptionist/gulf]
connect_bd_intf_net [get_bd_intf_pins network/receptionist/gal] [get_bd_intf_pins network/direct_ip_rx_switch/S00_AXIS]
connect_bd_intf_net [get_bd_intf_pins network/direct_ip_rx_switch/M00_AXIS] [get_bd_intf_pins network/network_bridge_udp_1_0/lbRxDataIn]
connect_bd_intf_net [get_bd_intf_pins network/direct_ip_rx_switch/M02_AXIS] [get_bd_intf_pins network/fetch_clock_converter/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins network/fetch_clock_converter/M_AXIS] -boundary_type upper [get_bd_intf_pins network/fetch/in_network]
connect_bd_intf_net [get_bd_intf_pins network/direct_ip_switch/M00_AXIS] [get_bd_intf_pins network/fifo_gulf/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins network/network_bridge_udp_1_0/lbTxDataOut] [get_bd_intf_pins network/direct_ip_switch/S01_AXIS]
connect_bd_intf_net [get_bd_intf_pins network/fetch/Net_TX] [get_bd_intf_pins network/direct_ip_switch/S02_AXIS]
connect_bd_intf_net [get_bd_intf_pins network/fifo_gulf/M_AXIS] [get_bd_intf_pins network/gulf_input_switch_0/in_network]
connect_bd_intf_net [get_bd_intf_pins network/gulf_input_switch_0/out_r] [get_bd_intf_pins network/axis_endianness_conv_1/s_axis]
connect_bd_intf_net [get_bd_intf_pins network/axis_endianness_conv_1/m_axis] [get_bd_intf_pins network/GULF_Stream_0/payload_from_user]
connect_bd_net [get_bd_ports CLK300] [get_bd_pins network/axis_endianness_conv_0/clk]
connect_bd_net [get_bd_ports CLK300] [get_bd_pins network/axis_endianness_conv_1/clk]

connect_bd_net [get_bd_pins network/GULF_Stream_0/remote_ip_rx] [get_bd_pins network/receptionist/ip]
connect_bd_net [get_bd_pins network/GULF_Stream_0/remote_port_rx] [get_bd_pins network/receptionist/src_prt]
connect_bd_net [get_bd_pins network/GULF_Stream_0/local_port_rx] [get_bd_pins network/receptionist/dst_prt]

connect_bd_net [get_bd_ports CLK300] [get_bd_pins network/GULF_Stream_0/clk]
connect_bd_net [get_bd_ports CLK300] [get_bd_pins network/network_bridge_udp_1_0/ap_clk]
connect_bd_net [get_bd_ports CLK300] [get_bd_pins network/gulf_input_switch_0/ap_clk]


connect_bd_net [get_bd_pins network/gulf_input_switch_0/out_ip] [get_bd_pins network/GULF_Stream_0/remote_ip_tx]
connect_bd_net [get_bd_pins network/gulf_input_switch_0/out_dest_prt] [get_bd_pins network/GULF_Stream_0/remote_port_tx]
connect_bd_net [get_bd_pins network/gulf_input_switch_0/out_source_prt] [get_bd_pins network/GULF_Stream_0/local_port_tx]

create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic network/not_aresetn
set_property -dict [list CONFIG.C_OPERATION {not} CONFIG.LOGO_FILE {data/sym_notgate.png}] [get_bd_cells network/not_aresetn]
connect_bd_net [get_bd_ports rstn300] [get_bd_pins network/not_aresetn/Op1]
connect_bd_net [get_bd_pins network/GULF_Stream_0/rst] [get_bd_pins network/not_aresetn/Res]
connect_bd_net [get_bd_ports rstn300] [get_bd_pins network/network_bridge_udp_1_0/ap_rst_n]
connect_bd_net [get_bd_ports rstn300] [get_bd_pins network/gulf_input_switch_0/ap_rst_n]

connect_bd_net [get_bd_ports CLK300] [get_bd_pins network/direct_ip_rx_switch/aclk]
connect_bd_net [get_bd_ports rstn300] [get_bd_pins network/direct_ip_rx_switch/aresetn]

create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen network/blk_mem_bridge_rom
#set_property -dict [list CONFIG.Memory_Type {Dual_Port_ROM} CONFIG.Enable_32bit_Address {false} CONFIG.Use_Byte_Write_Enable {false} CONFIG.Byte_Size {9} CONFIG.Enable_B {Use_ENB_Pin} CONFIG.Register_PortA_Output_of_Memory_Primitives {true} CONFIG.Register_PortB_Output_of_Memory_Primitives {true} CONFIG.Use_RSTA_Pin {false} CONFIG.Use_RSTB_Pin {false} CONFIG.Port_A_Write_Rate {0} CONFIG.Port_B_Clock {100} CONFIG.Port_B_Enable_Rate {100} CONFIG.use_bram_block{Stand_Alone} CONFIG.EN_SAFETY_CKT {false}] [get_bd_cells network/blk_mem_bridge_rom]

#set_property -dict [list CONFIG.Memory_Type {Dual_Port_ROM} CONFIG.Enable_32bit_Address {true} CONFIG.Use_Byte_Write_Enable {false} CONFIG.Byte_Size {8} CONFIG.Write_Depth_A {256} CONFIG.Enable_B {Use_ENB_Pin} CONFIG.Register_PortA_Output_of_Memory_Primitives {false} CONFIG.Register_PortB_Output_of_Memory_Primitives {false} CONFIG.Use_RSTA_Pin {true} CONFIG.Use_RSTB_Pin {true} CONFIG.Port_A_Write_Rate {0} CONFIG.Port_B_Clock {100} CONFIG.Port_B_Enable_Rate {100} CONFIG.use_bram_block {BRAM_Controller} CONFIG.EN_SAFETY_CKT {true} CONFIG.Load_Init_File {true} CONFIG.Coe_File {../../../../../../../ip.coe}] [get_bd_cells network/network/blk_mem_bridge_rom]
#set_property -dict [list CONFIG.Memory_Type {Dual_Port_ROM} CONFIG.Enable_32bit_Address {true} CONFIG.Use_Byte_Write_Enable {false} CONFIG.Byte_Size {8} CONFIG.Write_Depth_A {256} CONFIG.Enable_B {Use_ENB_Pin} CONFIG.Register_PortA_Output_of_Memory_Primitives {false} CONFIG.Register_PortB_Output_of_Memory_Primitives {false} CONFIG.Use_RSTA_Pin {true} CONFIG.Use_RSTB_Pin {true} CONFIG.Port_A_Write_Rate {0} CONFIG.Port_B_Clock {100} CONFIG.Port_B_Enable_Rate {100} CONFIG.use_bram_block {BRAM_Controller} CONFIG.EN_SAFETY_CKT {true}] [get_bd_cells network/blk_mem_bridge_rom]
#set_property -dict [list CONFIG.Memory_Type {Dual_Port_ROM} CONFIG.Use_Byte_Write_Enable {false} CONFIG.Enable_B {Use_ENB_Pin} CONFIG.Load_Init_File {true} CONFIG.Coe_File {/home/tarafdar/workDir/galapagos/projects/aegean_2/ip.coe} CONFIG.Use_RSTB_Pin {true} CONFIG.Port_A_Write_Rate {0} CONFIG.Port_B_Clock {100} CONFIG.Port_B_Enable_Rate {100}] [get_bd_cells network/blk_mem_bridge_rom]
#set_property -dict [list CONFIG.Memory_Type {Dual_Port_ROM} CONFIG.Enable_32bit_Address {true} CONFIG.Use_Byte_Write_Enable {false} CONFIG.Byte_Size {8} CONFIG.Write_Depth_A {256} CONFIG.Enable_B {Use_ENB_Pin} CONFIG.Register_PortA_Output_of_Memory_Primitives {false} CONFIG.Register_PortB_Output_of_Memory_Primitives {false} CONFIG.Use_RSTA_Pin {true} CONFIG.Use_RSTB_Pin {true} CONFIG.Port_A_Write_Rate {0} CONFIG.Port_B_Clock {100} CONFIG.Port_B_Enable_Rate {100} CONFIG.use_bram_block {BRAM_Controller} CONFIG.EN_SAFETY_CKT {true} CONFIG.Load_Init_File {true} CONFIG.Coe_File {/home/tarafdar/workDir/galapagos/projects/aegean_2/ip.coe}] [get_bd_cells network/blk_mem_bridge_rom]

#set_property -dict [list CONFIG.Memory_Type {Dual_Port_ROM} CONFIG.Enable_32bit_Address {true} CONFIG.Use_Byte_Write_Enable {false} CONFIG.Byte_Size {8} CONFIG.Write_Depth_A {8192} CONFIG.Enable_B {Use_ENB_Pin} CONFIG.Register_PortA_Output_of_Memory_Primitives {false} CONFIG.Register_PortB_Output_of_Memory_Primitives {false} CONFIG.Use_RSTA_Pin {true} CONFIG.Use_RSTB_Pin {true} CONFIG.Port_A_Write_Rate {0} CONFIG.Port_B_Clock {100} CONFIG.Port_B_Enable_Rate {100} CONFIG.use_bram_block {BRAM_Controller} CONFIG.EN_SAFETY_CKT {true} CONFIG.Load_Init_File {true} CONFIG.Coe_File {../../../../../../../ip.coe}] [get_bd_cells network/blk_mem_bridge_rom]
#set_property -dict [list CONFIG.Enable_32bit_Address {true} CONFIG.Byte_Size {8} CONFIG.Register_PortA_Output_of_Memory_Primitives {true} CONFIG.Register_PortB_Output_of_Memory_Primitives {true} CONFIG.Use_RSTA_Pin {true} CONFIG.Use_RSTB_Pin {true} CONFIG.use_bram_block {Stand_Alone} CONFIG.EN_SAFETY_CKT {true}] [get_bd_cells network/blk_mem_bridge_rom]

#if {[info exists $nocoe]} {
#    set_property -dict [list CONFIG.Memory_Type {Dual_Port_ROM} CONFIG.Enable_32bit_Address {false} CONFIG.Use_Byte_Write_Enable {false} CONFIG.Byte_Size {9} CONFIG.Enable_B {Use_ENB_Pin} CONFIG.Register_PortA_Output_of_Memory_Primitives {true} CONFIG.Register_PortB_Output_of_Memory_Primitives {true} CONFIG.Use_RSTA_Pin {false} CONFIG.Port_A_Write_Rate {0} CONFIG.Port_B_Clock {100} CONFIG.Port_B_Enable_Rate {100} CONFIG.use_bram_block {Stand_Alone} CONFIG.EN_SAFETY_CKT {false}] [get_bd_cells network/blk_mem_bridge_rom]
#} else {    
#    set_property -dict [list CONFIG.Memory_Type {Dual_Port_ROM} CONFIG.Enable_32bit_Address {false} CONFIG.Use_Byte_Write_Enable {false} CONFIG.Byte_Size {9} CONFIG.Enable_B {Use_ENB_Pin} CONFIG.Register_PortA_Output_of_Memory_Primitives {true} CONFIG.Register_PortB_Output_of_Memory_Primitives {true} CONFIG.Load_Init_File {true} CONFIG.Coe_File {../../../../../../../ip.coe} CONFIG.Use_RSTA_Pin {false} CONFIG.Port_A_Write_Rate {0} CONFIG.Port_B_Clock {100} CONFIG.Port_B_Enable_Rate {100} CONFIG.use_bram_block {Stand_Alone} CONFIG.EN_SAFETY_CKT {false}] [get_bd_cells network/blk_mem_bridge_rom]
#}
#

#set_property -dict [list CONFIG.Memory_Type {Single_Port_ROM} CONFIG.Enable_32bit_Address {true} CONFIG.Use_Byte_Write_Enable {false} CONFIG.Byte_Size {8} CONFIG.Write_Depth_A {8192} CONFIG.Register_PortA_Output_of_Memory_Primitives {false} CONFIG.Use_RSTA_Pin {true} CONFIG.Port_A_Write_Rate {0} CONFIG.use_bram_block {Stand_Alone} CONFIG.EN_SAFETY_CKT {true} ] [get_bd_cells network/blk_mem_bridge_rom]

#set_property -dict [list CONFIG.Memory_Type {Dual_Port_ROM} CONFIG.Enable_32bit_Address {true} CONFIG.Use_Byte_Write_Enable {false} CONFIG.Byte_Size {8} CONFIG.Write_Depth_A {8192} CONFIG.Enable_B {Use_ENB_Pin} CONFIG.Register_PortA_Output_of_Memory_Primitives {false} CONFIG.Register_PortB_Output_of_Memory_Primitives {false} CONFIG.Use_RSTA_Pin {true} CONFIG.Use_RSTB_Pin {true} CONFIG.Port_A_Write_Rate {0} CONFIG.Port_B_Clock {100} CONFIG.Port_B_Enable_Rate {100} CONFIG.use_bram_block {BRAM_Controller} CONFIG.EN_SAFETY_CKT {true} CONFIG.Load_Init_File {true} CONFIG.Coe_File {../../../../../../../ip.coe}] [get_bd_cells network/blk_mem_bridge_rom]
set_property -dict [list CONFIG.Memory_Type {Dual_Port_ROM} CONFIG.Enable_32bit_Address {true} CONFIG.Use_Byte_Write_Enable {false} CONFIG.Byte_Size {8} CONFIG.Write_Depth_A {8192} CONFIG.Register_PortA_Output_of_Memory_Primitives {false} CONFIG.Use_RSTA_Pin {true} CONFIG.Port_A_Write_Rate {0} CONFIG.use_bram_block {Stand_Alone} CONFIG.EN_SAFETY_CKT {true} CONFIG.Load_Init_File {true} CONFIG.Coe_File {../../../../../../../ip.coe} ] [get_bd_cells network/blk_mem_bridge_rom]


connect_bd_intf_net [get_bd_intf_pins network/blk_mem_bridge_rom/BRAM_PORTA] [get_bd_intf_pins network/network_bridge_udp_1_0/ip_table_PORTA]
connect_bd_intf_net [get_bd_intf_pins network/blk_mem_bridge_rom/BRAM_PORTB] [get_bd_intf_pins network/network_bridge_udp_1_0/ip_table_PORTB]

connect_bd_intf_net [get_bd_intf_ports S_AXIS] [get_bd_intf_pins network/GULF_Stream_0/s_axis]
connect_bd_intf_net [get_bd_intf_ports M_AXIS] [get_bd_intf_pins network/GULF_Stream_0/m_axis]


create_bd_cell -type hier network/network_bridge_inst
create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo network/network_bridge_inst/axis_data_fifo_0
create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo network/network_bridge_inst/axis_data_fifo_0_1
create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo network/network_bridge_inst/axis_data_fifo_1
create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo network/network_bridge_inst/axis_data_fifo_1_1
set_property -dict [list CONFIG.FIFO_MODE {1} CONFIG.IS_ACLK_ASYNC {1}] [get_bd_cells network/network_bridge_inst/axis_data_fifo_0]
set_property -dict [list CONFIG.FIFO_MODE {1} CONFIG.IS_ACLK_ASYNC {1}] [get_bd_cells network/network_bridge_inst/axis_data_fifo_1]
set_property -dict [list CONFIG.FIFO_MODE {2}] [get_bd_cells network/network_bridge_inst/axis_data_fifo_0_1]
set_property -dict [list CONFIG.FIFO_MODE {2}] [get_bd_cells network/network_bridge_inst/axis_data_fifo_1_1]



#set_property -dict [list CONFIG.FIFO_MODE {2}] [get_bd_cells network/network_bridge_inst/axis_data_fifo_0]
#set_property -dict [list CONFIG.FIFO_MODE {2}] [get_bd_cells network/network_bridge_inst/axis_data_fifo_1]

create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo network/dummy_fifo_0
connect_bd_intf_net [get_bd_intf_pins network/network_bridge_inst/axis_data_fifo_1_1/M_AXIS] [get_bd_intf_pins network/dummy_fifo_0/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins network/dummy_fifo_0/M_AXIS] [get_bd_intf_pins network/network_bridge_inst/axis_data_fifo_0_1/S_AXIS]
delete_bd_objs [get_bd_intf_nets network/network_bridge_inst_M_AXIS1] [get_bd_intf_nets network/dummy_fifo_0_M_AXIS] [get_bd_cells network/dummy_fifo_0]
delete_bd_objs [get_bd_intf_nets network/network_bridge_inst_M_AXIS]


connect_bd_intf_net [get_bd_intf_pins network/network_bridge_inst/axis_data_fifo_0/M_AXIS] [get_bd_intf_pins network/network_bridge_udp_1_0/rxGalapagosBridge]
connect_bd_intf_net [get_bd_intf_pins network/network_bridge_inst/axis_data_fifo_0_1/M_AXIS] [get_bd_intf_pins network/network_bridge_inst/axis_data_fifo_0/S_AXIS]
#connect_bd_intf_net [get_bd_intf_pins network/network_bridge_inst/axis_data_fifo_0_1/M_AXIS] [get_bd_intf_pins network/network_bridge_udp_1_0/rxGalapagosBridge]
connect_bd_net [get_bd_ports CLK] [get_bd_pins network/network_bridge_inst/axis_data_fifo_0/s_axis_aclk]
connect_bd_net [get_bd_ports CLK300] [get_bd_pins network/network_bridge_inst/axis_data_fifo_0/m_axis_aclk]
connect_bd_net [get_bd_ports rstn] [get_bd_pins network/network_bridge_inst/axis_data_fifo_0/s_axis_aresetn]
connect_bd_net [get_bd_ports CLK] [get_bd_pins network/network_bridge_inst/axis_data_fifo_0_1/s_axis_aclk]
connect_bd_net [get_bd_ports rstn] [get_bd_pins network/network_bridge_inst/axis_data_fifo_0_1/s_axis_aresetn]
connect_bd_net [get_bd_ports CLK300] [get_bd_pins network/fifo_gulf/s_axis_aclk]
connect_bd_net [get_bd_ports rstn300] [get_bd_pins network/fifo_gulf/s_axis_aresetn]
connect_bd_net [get_bd_ports CLK300] [get_bd_pins network/direct_ip_switch/aclk]
connect_bd_net [get_bd_ports rstn300] [get_bd_pins network/direct_ip_switch/aresetn]
connect_bd_net [get_bd_ports CLK300] [get_bd_pins network/receptionist/clk]
connect_bd_net [get_bd_ports rstn300] [get_bd_pins network/receptionist/resetn]

connect_bd_net [get_bd_ports CLK300] [get_bd_pins network/fetch_clock_converter/s_axis_aclk]
connect_bd_net [get_bd_ports rstn300] [get_bd_pins network/fetch_clock_converter/s_axis_aresetn]
connect_bd_net [get_bd_ports CLK] [get_bd_pins network/fetch_clock_converter/m_axis_aclk]


connect_bd_intf_net [get_bd_intf_pins network/network_bridge_inst/axis_data_fifo_1/S_AXIS] [get_bd_intf_pins network/network_bridge_udp_1_0/txGalapagosBridge]
connect_bd_intf_net [get_bd_intf_pins network/network_bridge_inst/axis_data_fifo_1/M_AXIS] [get_bd_intf_pins network/network_bridge_inst/axis_data_fifo_1_1/S_AXIS]
connect_bd_net [get_bd_ports CLK300] [get_bd_pins network/network_bridge_inst/axis_data_fifo_1/s_axis_aclk]
connect_bd_net [get_bd_ports CLK] [get_bd_pins network/network_bridge_inst/axis_data_fifo_1/m_axis_aclk]
connect_bd_net [get_bd_ports rstn300] [get_bd_pins network/network_bridge_inst/axis_data_fifo_1/s_axis_aresetn]
connect_bd_net [get_bd_ports CLK] [get_bd_pins network/network_bridge_inst/axis_data_fifo_1_1/s_axis_aclk]
connect_bd_net [get_bd_ports rstn] [get_bd_pins network/network_bridge_inst/axis_data_fifo_1_1/s_axis_aresetn]
