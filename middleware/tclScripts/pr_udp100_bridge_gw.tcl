#comment out when running full script
#create_bd_cell -type hier network


set netBridge_from_app S_AXIS 
set netBridge_to_app M_AXIS

add_files -norecurse $top_path/middleware/verilog/receptionist.v
update_compile_order -fileset sources_1
create_bd_cell -type module -reference receptionist network/receptionist

create_bd_cell -type hier network/network_bridge_inst

addip GULF_Stream network/GULF_Stream_0
addip network_bridge_udp_100g network/network_bridge_udp
addip gulf_input_switch network/gulf_input_switch_0
addip axis_data_fifo network/fifo_gulf
addip axis_switch network/direct_ip_switch
addip axis_register_slice network/NBU_DIS
addip axis_clock_converter network/network_bridge_inst/direct_cc

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
  CONFIG.NUM_SI {2} \
] [get_bd_cells network/direct_ip_switch]

set_property CONFIG.SYNCHRONIZATION_STAGES {5} [get_bd_cells network/network_bridge_inst/direct_cc]


connect_bd_intf_net [get_bd_intf_pins network/network_bridge_inst/direct_cc/M_AXIS] [get_bd_intf_pins network/direct_ip_switch/S00_AXIS]

connect_bd_intf_net [get_bd_intf_pins network/network_bridge_udp/lbTxDataOut] [get_bd_intf_pins network/NBU_DIS/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins network/NBU_DIS/M_AXIS] [get_bd_intf_pins network/direct_ip_switch/S01_AXIS]

connect_bd_intf_net [get_bd_intf_pins network/axis_endianness_conv_0/s_axis] [get_bd_intf_pins network/GULF_Stream_0/payload_to_user]
connect_bd_intf_net [get_bd_intf_pins network/axis_endianness_conv_0/m_axis] [get_bd_intf_pins network/receptionist/gulf]
connect_bd_intf_net [get_bd_intf_pins network/direct_ip_switch/M00_AXIS] [get_bd_intf_pins network/fifo_gulf/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins network/fifo_gulf/M_AXIS] [get_bd_intf_pins network/gulf_input_switch_0/in_network]
connect_bd_intf_net [get_bd_intf_pins network/gulf_input_switch_0/out_r] [get_bd_intf_pins network/axis_endianness_conv_1/s_axis]
connect_bd_intf_net [get_bd_intf_pins network/axis_endianness_conv_1/m_axis] [get_bd_intf_pins network/GULF_Stream_0/payload_from_user]
connect_bd_net [get_bd_ports CLK300] [get_bd_pins network/axis_endianness_conv_0/clk]
connect_bd_net [get_bd_ports CLK300] [get_bd_pins network/axis_endianness_conv_1/clk]

connect_bd_net [get_bd_pins network/GULF_Stream_0/remote_ip_rx] [get_bd_pins network/receptionist/ip]
connect_bd_net [get_bd_pins network/GULF_Stream_0/remote_port_rx] [get_bd_pins network/receptionist/src_prt]
connect_bd_net [get_bd_pins network/GULF_Stream_0/local_port_rx] [get_bd_pins network/receptionist/dst_prt]

connect_bd_net [get_bd_ports CLK300] [get_bd_pins network/GULF_Stream_0/clk]
connect_bd_net [get_bd_ports CLK300] [get_bd_pins network/network_bridge_udp/ap_clk]
connect_bd_net [get_bd_ports CLK300] [get_bd_pins network/gulf_input_switch_0/ap_clk]


connect_bd_net [get_bd_pins network/gulf_input_switch_0/out_ip] [get_bd_pins network/GULF_Stream_0/remote_ip_tx]
connect_bd_net [get_bd_pins network/gulf_input_switch_0/out_dest_prt] [get_bd_pins network/GULF_Stream_0/remote_port_tx]
connect_bd_net [get_bd_pins network/gulf_input_switch_0/out_source_prt] [get_bd_pins network/GULF_Stream_0/local_port_tx]

addip util_vector_logic network/not_aresetn
set_property -dict [list CONFIG.C_OPERATION {not} CONFIG.LOGO_FILE {data/sym_notgate.png}] [get_bd_cells network/not_aresetn]
connect_bd_net [get_bd_ports rstn300] [get_bd_pins network/not_aresetn/Op1]
connect_bd_net [get_bd_pins network/GULF_Stream_0/rst] [get_bd_pins network/not_aresetn/Res]
connect_bd_net [get_bd_ports rstn300] [get_bd_pins network/network_bridge_udp/ap_rst_n]
connect_bd_net [get_bd_ports rstn300] [get_bd_pins network/gulf_input_switch_0/ap_rst_n]

connect_bd_net [get_bd_ports CLK300] [get_bd_pins network/NBU_DIS/aclk]

connect_bd_net [get_bd_ports rstn300] [get_bd_pins network/NBU_DIS/aresetn]

connect_bd_net [get_bd_ports CLK300] [get_bd_pins network/network_bridge_inst/direct_cc/m_axis_aclk]
connect_bd_net [get_bd_ports rstn300] [get_bd_pins network/network_bridge_inst/direct_cc/m_axis_aresetn]
connect_bd_net [get_bd_ports CLK] [get_bd_pins network/network_bridge_inst/direct_cc/s_axis_aclk]
connect_bd_net [get_bd_ports rstn] [get_bd_pins network/network_bridge_inst/direct_cc/s_axis_aresetn]

addip blk_mem_gen network/blk_mem_bridge_rom

set_property -dict [list CONFIG.Memory_Type {Dual_Port_ROM} CONFIG.Enable_32bit_Address {true} CONFIG.Use_Byte_Write_Enable {false} CONFIG.Byte_Size {8} CONFIG.Write_Depth_A {8192} CONFIG.Register_PortA_Output_of_Memory_Primitives {false} CONFIG.Use_RSTA_Pin {true} CONFIG.Port_A_Write_Rate {0} CONFIG.use_bram_block {Stand_Alone} CONFIG.EN_SAFETY_CKT {true} CONFIG.Load_Init_File {true} CONFIG.Coe_File {../../../../../../../ip.coe} ] [get_bd_cells network/blk_mem_bridge_rom]


connect_bd_intf_net [get_bd_intf_pins network/blk_mem_bridge_rom/BRAM_PORTA] [get_bd_intf_pins network/network_bridge_udp/ip_table_PORTA]
connect_bd_intf_net [get_bd_intf_pins network/blk_mem_bridge_rom/BRAM_PORTB] [get_bd_intf_pins network/network_bridge_udp/ip_table_PORTB]

connect_bd_intf_net [get_bd_intf_ports S_AXIS] [get_bd_intf_pins network/GULF_Stream_0/s_axis]
connect_bd_intf_net [get_bd_intf_ports M_AXIS] [get_bd_intf_pins network/GULF_Stream_0/m_axis]




addip axis_clock_converter network/network_bridge_inst/axis_clock_converter_0
addip axis_clock_converter network/network_bridge_inst/axis_clock_converter_1

set_property CONFIG.SYNCHRONIZATION_STAGES {5} [get_bd_cells network/network_bridge_inst/axis_clock_converter_0]
set_property CONFIG.SYNCHRONIZATION_STAGES {5} [get_bd_cells network/network_bridge_inst/axis_clock_converter_1]

connect_bd_intf_net [get_bd_intf_pins network/network_bridge_inst/axis_clock_converter_0/M_AXIS] [get_bd_intf_pins network/network_bridge_udp/rxGalapagosBridge]

connect_bd_net [get_bd_ports CLK] [get_bd_pins network/network_bridge_inst/axis_clock_converter_0/s_axis_aclk]
connect_bd_net [get_bd_ports CLK300] [get_bd_pins network/network_bridge_inst/axis_clock_converter_0/m_axis_aclk]
connect_bd_net [get_bd_ports rstn] [get_bd_pins network/network_bridge_inst/axis_clock_converter_0/s_axis_aresetn]
connect_bd_net [get_bd_ports rstn300] [get_bd_pins network/network_bridge_inst/axis_clock_converter_0/m_axis_aresetn]

connect_bd_net [get_bd_ports CLK300] [get_bd_pins network/network_bridge_inst/axis_clock_converter_1/s_axis_aclk]
connect_bd_net [get_bd_ports CLK] [get_bd_pins network/network_bridge_inst/axis_clock_converter_1/m_axis_aclk]
connect_bd_net [get_bd_ports rstn300] [get_bd_pins network/network_bridge_inst/axis_clock_converter_1/s_axis_aresetn]
connect_bd_net [get_bd_ports rstn] [get_bd_pins network/network_bridge_inst/axis_clock_converter_1/m_axis_aresetn]


connect_bd_net [get_bd_ports CLK300] [get_bd_pins network/fifo_gulf/s_axis_aclk]
connect_bd_net [get_bd_ports rstn300] [get_bd_pins network/fifo_gulf/s_axis_aresetn]
connect_bd_net [get_bd_ports CLK300] [get_bd_pins network/direct_ip_switch/aclk]
connect_bd_net [get_bd_ports rstn300] [get_bd_pins network/direct_ip_switch/aresetn]
connect_bd_net [get_bd_ports CLK300] [get_bd_pins network/receptionist/clk]
connect_bd_net [get_bd_ports rstn300] [get_bd_pins network/receptionist/resetn]




connect_bd_intf_net [get_bd_intf_pins network/network_bridge_inst/axis_clock_converter_1/S_AXIS] [get_bd_intf_pins network/receptionist/gal]
