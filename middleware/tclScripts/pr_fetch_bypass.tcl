create_bd_cell -type hier network/fetch

create_bd_pin -dir I network/fetch/CLK
create_bd_pin -dir I network/fetch/CLK322
create_bd_pin -dir I network/fetch/reset

create_bd_pin -dir I -from 31 -to 0 network/fetch/dns_addr

create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 network/fetch/g2N_output
create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 network/fetch/in_network

create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 network/fetch/Net_TX

connect_bd_net [get_bd_pins network/fetch/CLK] [get_bd_ports CLK]
connect_bd_net [get_bd_pins network/fetch/CLK322] [get_bd_ports CLK300]
connect_bd_net [get_bd_pins network/fetch/reset] [get_bd_ports rstn]

#Create the cells
addip WAN_network_dispatch network/fetch/dispatcher
addip WAN_network_collector network/fetch/collector
addip WAN_fast_fetch network/fetch/fast_fetcher
addip WAN_slow_fetch network/fetch/slow_fetcher
addip WAN_bin_door network/fetch/bin_door_1
addip WAN_bin_door network/fetch/bin_door_2
addip WAN_bin_door network/fetch/bin_door_3
addip axis_data_fifo network/fetch/bin_bypass
addip axis_data_fifo network/fetch/bin1
addip axis_data_fifo network/fetch/bin2
addip axis_data_fifo network/fetch/bin3
addip axis_switch network/fetch/net_out_switch
addip axis_data_fifo network/fetch/net_out_clk_conv


addip axis_data_fifo network/fetch/main_buffer



#Configure the cells
set_property -dict [list CONFIG.HAS_TLAST.VALUE_SRC USER] [get_bd_cells network/fetch/net_out_switch]
set_property -dict [list CONFIG.ARB_ON_MAX_XFERS {0} CONFIG.ARB_ON_TLAST {1} CONFIG.HAS_TLAST {1} CONFIG.M00_AXIS_HIGHTDEST {0xFFFFFFFF} CONFIG.NUM_SI {5} ] [get_bd_cells network/fetch/net_out_switch]
set_property CONFIG.IS_ACLK_ASYNC {1} [get_bd_cells network/fetch/net_out_clk_conv]

#Connect Ports

connect_bd_net [get_bd_pins network/fetch/CLK] [get_bd_pins network/fetch/dispatcher/aclk]
connect_bd_net [get_bd_pins network/fetch/CLK] [get_bd_pins network/fetch/main_buffer/s_axis_aclk]
connect_bd_net [get_bd_pins network/fetch/CLK] [get_bd_pins network/fetch/collector/aclk]
connect_bd_net [get_bd_pins network/fetch/CLK] [get_bd_pins network/fetch/net_out_switch/aclk]
connect_bd_net [get_bd_pins network/fetch/CLK] [get_bd_pins network/fetch/slow_fetcher/aclk]
connect_bd_net [get_bd_pins network/fetch/CLK] [get_bd_pins network/fetch/fast_fetcher/aclk]
connect_bd_net [get_bd_pins network/fetch/CLK] [get_bd_pins network/fetch/net_out_clk_conv/s_axis_aclk]
connect_bd_net [get_bd_pins network/fetch/CLK] [get_bd_pins network/fetch/bin_bypass/s_axis_aclk]
connect_bd_net [get_bd_pins network/fetch/CLK] [get_bd_pins network/fetch/bin1/s_axis_aclk]
connect_bd_net [get_bd_pins network/fetch/CLK] [get_bd_pins network/fetch/bin2/s_axis_aclk]
connect_bd_net [get_bd_pins network/fetch/CLK] [get_bd_pins network/fetch/bin3/s_axis_aclk]
connect_bd_net [get_bd_pins network/fetch/CLK] [get_bd_pins network/fetch/bin_door_1/aclk]
connect_bd_net [get_bd_pins network/fetch/CLK] [get_bd_pins network/fetch/bin_door_2/aclk]
connect_bd_net [get_bd_pins network/fetch/CLK] [get_bd_pins network/fetch/bin_door_3/aclk]

connect_bd_net [get_bd_pins network/fetch/reset] [get_bd_pins network/fetch/dispatcher/aresetn]
connect_bd_net [get_bd_pins network/fetch/reset] [get_bd_pins network/fetch/main_buffer/s_axis_aresetn]
connect_bd_net [get_bd_pins network/fetch/reset] [get_bd_pins network/fetch/collector/aresetn]
connect_bd_net [get_bd_pins network/fetch/reset] [get_bd_pins network/fetch/fast_fetcher/aresetn]
connect_bd_net [get_bd_pins network/fetch/reset] [get_bd_pins network/fetch/bin_bypass/s_axis_aresetn]
connect_bd_net [get_bd_pins network/fetch/reset] [get_bd_pins network/fetch/net_out_switch/aresetn]
connect_bd_net [get_bd_pins network/fetch/reset] [get_bd_pins network/fetch/slow_fetcher/aresetn]
connect_bd_net [get_bd_pins network/fetch/reset] [get_bd_pins network/fetch/net_out_clk_conv/s_axis_aresetn]
connect_bd_net [get_bd_pins network/fetch/reset] [get_bd_pins network/fetch/bin1/s_axis_aresetn]
connect_bd_net [get_bd_pins network/fetch/reset] [get_bd_pins network/fetch/bin2/s_axis_aresetn]
connect_bd_net [get_bd_pins network/fetch/reset] [get_bd_pins network/fetch/bin3/s_axis_aresetn]
connect_bd_net [get_bd_pins network/fetch/reset] [get_bd_pins network/fetch/bin_door_1/aresetn]
connect_bd_net [get_bd_pins network/fetch/reset] [get_bd_pins network/fetch/bin_door_2/aresetn]
connect_bd_net [get_bd_pins network/fetch/reset] [get_bd_pins network/fetch/bin_door_3/aresetn]

connect_bd_net [get_bd_pins network/fetch/CLK322] [get_bd_pins network/fetch/net_out_clk_conv/m_axis_aclk]

connect_bd_net [get_bd_pins network/fetch/dns_addr] [get_bd_pins network/fetch/slow_fetcher/ip_server_addr_V]

#Connect Interfaces



connect_bd_intf_net [get_bd_intf_pins network/fetch/g2N_output] [get_bd_intf_pins network/fetch/dispatcher/rxGalapagosBridge_V]

connect_bd_intf_net [get_bd_intf_pins network/fetch/fast_fetcher/to_collector_V] [get_bd_intf_pins network/fetch/collector/fetch_in_V]

connect_bd_intf_net [get_bd_intf_pins network/fetch/in_network] [get_bd_intf_pins network/fetch/slow_fetcher/in_network_V]

connect_bd_intf_net [get_bd_intf_pins network/fetch/main_buffer/S_AXIS] [get_bd_intf_pins network/fetch/dispatcher/lbTxDataOut_V]
connect_bd_intf_net [get_bd_intf_pins network/fetch/main_buffer/M_AXIS] [get_bd_intf_pins network/fetch/collector/lbTxDataIn_V]

connect_bd_intf_net [get_bd_intf_pins network/fetch/slow_fetcher/from_fast_fetch_V] [get_bd_intf_pins network/fetch/fast_fetcher/to_slow_fetch_V]
connect_bd_intf_net [get_bd_intf_pins network/fetch/slow_fetcher/update_V] [get_bd_intf_pins network/fetch/fast_fetcher/update_V]

connect_bd_intf_net [get_bd_intf_pins network/fetch/dispatcher/fetch_out_V_V] [get_bd_intf_pins network/fetch/fast_fetcher/from_dispatch_V_V]

connect_bd_intf_net [get_bd_intf_pins network/fetch/fast_fetcher/bin1_send_V] [get_bd_intf_pins network/fetch/bin_door_1/fetch_in_V]
connect_bd_intf_net [get_bd_intf_pins network/fetch/fast_fetcher/bin2_send_V] [get_bd_intf_pins network/fetch/bin_door_2/fetch_in_V]
connect_bd_intf_net [get_bd_intf_pins network/fetch/fast_fetcher/bin3_send_V] [get_bd_intf_pins network/fetch/bin_door_3/fetch_in_V]

connect_bd_intf_net [get_bd_intf_pins network/fetch/collector/bin_1_V] [get_bd_intf_pins network/fetch/bin1/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins network/fetch/collector/bin_2_V] [get_bd_intf_pins network/fetch/bin2/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins network/fetch/collector/bin_3_V] [get_bd_intf_pins network/fetch/bin3/S_AXIS]

connect_bd_intf_net [get_bd_intf_pins network/fetch/bin1/M_AXIS] [get_bd_intf_pins network/fetch/bin_door_1/bin_in_V]
connect_bd_intf_net [get_bd_intf_pins network/fetch/bin2/M_AXIS] [get_bd_intf_pins network/fetch/bin_door_2/bin_in_V]
connect_bd_intf_net [get_bd_intf_pins network/fetch/bin3/M_AXIS] [get_bd_intf_pins network/fetch/bin_door_3/bin_in_V]

connect_bd_intf_net [get_bd_intf_pins network/fetch/bin_bypass/S_AXIS] [get_bd_intf_pins network/fetch/collector/lbTxDataOut_V]

connect_bd_intf_net [get_bd_intf_pins network/fetch/net_out_switch/S00_AXIS] [get_bd_intf_pins network/fetch/bin_bypass/M_AXIS]
connect_bd_intf_net [get_bd_intf_pins network/fetch/net_out_switch/S01_AXIS] [get_bd_intf_pins network/fetch/bin_door_1/lbTxDataOut_V]
connect_bd_intf_net [get_bd_intf_pins network/fetch/net_out_switch/S02_AXIS] [get_bd_intf_pins network/fetch/bin_door_2/lbTxDataOut_V]
connect_bd_intf_net [get_bd_intf_pins network/fetch/net_out_switch/S03_AXIS] [get_bd_intf_pins network/fetch/bin_door_3/lbTxDataOut_V]
connect_bd_intf_net [get_bd_intf_pins network/fetch/net_out_switch/S04_AXIS] [get_bd_intf_pins network/fetch/slow_fetcher/out_network_V]

connect_bd_intf_net [get_bd_intf_pins network/fetch/net_out_clk_conv/S_AXIS] [get_bd_intf_pins network/fetch/net_out_switch/M00_AXIS]
connect_bd_intf_net [get_bd_intf_pins network/fetch/net_out_clk_conv/M_AXIS] [get_bd_intf_pins network/fetch/Net_TX]
