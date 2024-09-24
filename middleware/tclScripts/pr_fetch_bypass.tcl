create_bd_cell -type hier network/fetch

create_bd_pin -dir I network/fetch/CLK
create_bd_pin -dir I network/fetch/CLK322
create_bd_pin -dir I network/fetch/reset
create_bd_pin -dir I network/fetch/reset322

create_bd_pin -dir I -from 31 -to 0 network/fetch/dns_addr

create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 network/fetch/g2N_output
create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 network/fetch/in_network
create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 network/fetch/Net_TX

connect_bd_net [get_bd_pins network/fetch/CLK] [get_bd_ports CLK]
connect_bd_net [get_bd_pins network/fetch/CLK322] [get_bd_ports CLK300]
connect_bd_net [get_bd_pins network/fetch/reset] [get_bd_ports rstn]
connect_bd_net [get_bd_pins network/fetch/reset322] [get_bd_ports rstn300]

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
addip axis_clock_converter network/fetch/net_out_clk_conv

addip axis_register_slice network/fetch/DP_FF
addip axis_register_slice network/fetch/SF_FF
addip axis_register_slice network/fetch/FF_C
addip axis_register_slice network/fetch/FF_SF
addip axis_register_slice network/fetch/FF_B1
addip axis_register_slice network/fetch/FF_B2
addip axis_register_slice network/fetch/FF_B3
addip axis_register_slice network/fetch/B1_NOS
addip axis_register_slice network/fetch/B2_NOS
addip axis_register_slice network/fetch/B3_NOS
addip axis_register_slice network/fetch/SF_NOS
addip axis_register_slice network/fetch/WNC_BB
addip axis_register_slice network/fetch/D_MB



addip axis_data_fifo network/fetch/main_buffer



#Configure the cells
set_property -dict [list CONFIG.HAS_TLAST.VALUE_SRC USER] [get_bd_cells network/fetch/net_out_switch]
set_property -dict [list CONFIG.ARB_ON_MAX_XFERS {0} CONFIG.ARB_ON_TLAST {1} CONFIG.HAS_TLAST {1} CONFIG.M00_AXIS_HIGHTDEST {0xFFFFFFFF} CONFIG.NUM_SI {5} ] [get_bd_cells network/fetch/net_out_switch]
set_property CONFIG.SYNCHRONIZATION_STAGES {5} [get_bd_cells network/fetch/net_out_clk_conv]

#Connect Ports

connect_bd_net [get_bd_pins network/fetch/CLK] [get_bd_pins network/fetch/dispatcher/ap_clk]
connect_bd_net [get_bd_pins network/fetch/CLK] [get_bd_pins network/fetch/main_buffer/s_axis_aclk]
connect_bd_net [get_bd_pins network/fetch/CLK] [get_bd_pins network/fetch/collector/ap_clk]
connect_bd_net [get_bd_pins network/fetch/CLK] [get_bd_pins network/fetch/net_out_switch/aclk]
connect_bd_net [get_bd_pins network/fetch/CLK] [get_bd_pins network/fetch/slow_fetcher/ap_clk]
connect_bd_net [get_bd_pins network/fetch/CLK] [get_bd_pins network/fetch/fast_fetcher/ap_clk]
connect_bd_net [get_bd_pins network/fetch/CLK] [get_bd_pins network/fetch/net_out_clk_conv/s_axis_aclk]
connect_bd_net [get_bd_pins network/fetch/CLK] [get_bd_pins network/fetch/bin_bypass/s_axis_aclk]
connect_bd_net [get_bd_pins network/fetch/CLK] [get_bd_pins network/fetch/bin1/s_axis_aclk]
connect_bd_net [get_bd_pins network/fetch/CLK] [get_bd_pins network/fetch/bin2/s_axis_aclk]
connect_bd_net [get_bd_pins network/fetch/CLK] [get_bd_pins network/fetch/bin3/s_axis_aclk]
connect_bd_net [get_bd_pins network/fetch/CLK] [get_bd_pins network/fetch/bin_door_1/ap_clk]
connect_bd_net [get_bd_pins network/fetch/CLK] [get_bd_pins network/fetch/bin_door_2/ap_clk]
connect_bd_net [get_bd_pins network/fetch/CLK] [get_bd_pins network/fetch/bin_door_3/ap_clk]
connect_bd_net [get_bd_pins network/fetch/CLK] [get_bd_pins network/fetch/DP_FF/aclk]
connect_bd_net [get_bd_pins network/fetch/CLK] [get_bd_pins network/fetch/SF_FF/aclk]
connect_bd_net [get_bd_pins network/fetch/CLK] [get_bd_pins network/fetch/FF_C/aclk]
connect_bd_net [get_bd_pins network/fetch/CLK] [get_bd_pins network/fetch/FF_SF/aclk]
connect_bd_net [get_bd_pins network/fetch/CLK] [get_bd_pins network/fetch/FF_B1/aclk]
connect_bd_net [get_bd_pins network/fetch/CLK] [get_bd_pins network/fetch/FF_B2/aclk]
connect_bd_net [get_bd_pins network/fetch/CLK] [get_bd_pins network/fetch/FF_B3/aclk]
connect_bd_net [get_bd_pins network/fetch/CLK] [get_bd_pins network/fetch/B1_NOS/aclk]
connect_bd_net [get_bd_pins network/fetch/CLK] [get_bd_pins network/fetch/B2_NOS/aclk]
connect_bd_net [get_bd_pins network/fetch/CLK] [get_bd_pins network/fetch/B3_NOS/aclk]
connect_bd_net [get_bd_pins network/fetch/CLK] [get_bd_pins network/fetch/SF_NOS/aclk]
connect_bd_net [get_bd_pins network/fetch/CLK] [get_bd_pins network/fetch/WNC_BB/aclk]
connect_bd_net [get_bd_pins network/fetch/CLK] [get_bd_pins network/fetch/D_MB/aclk]

connect_bd_net [get_bd_pins network/fetch/reset] [get_bd_pins network/fetch/dispatcher/ap_rst_n]
connect_bd_net [get_bd_pins network/fetch/reset] [get_bd_pins network/fetch/main_buffer/s_axis_aresetn]
connect_bd_net [get_bd_pins network/fetch/reset] [get_bd_pins network/fetch/collector/ap_rst_n]
connect_bd_net [get_bd_pins network/fetch/reset] [get_bd_pins network/fetch/fast_fetcher/ap_rst_n]
connect_bd_net [get_bd_pins network/fetch/reset] [get_bd_pins network/fetch/bin_bypass/s_axis_aresetn]
connect_bd_net [get_bd_pins network/fetch/reset] [get_bd_pins network/fetch/net_out_switch/aresetn]
connect_bd_net [get_bd_pins network/fetch/reset] [get_bd_pins network/fetch/slow_fetcher/ap_rst_n]
connect_bd_net [get_bd_pins network/fetch/reset] [get_bd_pins network/fetch/net_out_clk_conv/s_axis_aresetn]
connect_bd_net [get_bd_pins network/fetch/reset] [get_bd_pins network/fetch/bin1/s_axis_aresetn]
connect_bd_net [get_bd_pins network/fetch/reset] [get_bd_pins network/fetch/bin2/s_axis_aresetn]
connect_bd_net [get_bd_pins network/fetch/reset] [get_bd_pins network/fetch/bin3/s_axis_aresetn]
connect_bd_net [get_bd_pins network/fetch/reset] [get_bd_pins network/fetch/bin_door_1/ap_rst_n]
connect_bd_net [get_bd_pins network/fetch/reset] [get_bd_pins network/fetch/bin_door_2/ap_rst_n]
connect_bd_net [get_bd_pins network/fetch/reset] [get_bd_pins network/fetch/bin_door_3/ap_rst_n]
connect_bd_net [get_bd_pins network/fetch/reset] [get_bd_pins network/fetch/DP_FF/aresetn]
connect_bd_net [get_bd_pins network/fetch/reset] [get_bd_pins network/fetch/SF_FF/aresetn]
connect_bd_net [get_bd_pins network/fetch/reset] [get_bd_pins network/fetch/FF_C/aresetn]
connect_bd_net [get_bd_pins network/fetch/reset] [get_bd_pins network/fetch/FF_SF/aresetn]
connect_bd_net [get_bd_pins network/fetch/reset] [get_bd_pins network/fetch/FF_B1/aresetn]
connect_bd_net [get_bd_pins network/fetch/reset] [get_bd_pins network/fetch/FF_B2/aresetn]
connect_bd_net [get_bd_pins network/fetch/reset] [get_bd_pins network/fetch/FF_B3/aresetn]
connect_bd_net [get_bd_pins network/fetch/reset] [get_bd_pins network/fetch/B1_NOS/aresetn]
connect_bd_net [get_bd_pins network/fetch/reset] [get_bd_pins network/fetch/B2_NOS/aresetn]
connect_bd_net [get_bd_pins network/fetch/reset] [get_bd_pins network/fetch/B3_NOS/aresetn]
connect_bd_net [get_bd_pins network/fetch/reset] [get_bd_pins network/fetch/SF_NOS/aresetn]
connect_bd_net [get_bd_pins network/fetch/reset] [get_bd_pins network/fetch/WNC_BB/aresetn]
connect_bd_net [get_bd_pins network/fetch/reset] [get_bd_pins network/fetch/D_MB/aresetn]

connect_bd_net [get_bd_pins network/fetch/CLK322] [get_bd_pins network/fetch/net_out_clk_conv/m_axis_aclk]

connect_bd_net [get_bd_pins network/fetch/reset322] [get_bd_pins network/fetch/net_out_clk_conv/m_axis_aresetn]

connect_bd_net [get_bd_pins network/fetch/dns_addr] [get_bd_pins network/fetch/slow_fetcher/ip_server_addr]

#Connect Interfaces



connect_bd_intf_net [get_bd_intf_pins network/fetch/g2N_output] [get_bd_intf_pins network/fetch/dispatcher/rxGalapagosBridge]

connect_bd_intf_net [get_bd_intf_pins network/fetch/fast_fetcher/to_collector] [get_bd_intf_pins network/fetch/FF_C/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins network/fetch/FF_C/M_AXIS] [get_bd_intf_pins network/fetch/collector/fetch_in]


connect_bd_intf_net [get_bd_intf_pins network/fetch/in_network] [get_bd_intf_pins network/fetch/slow_fetcher/in_network]

connect_bd_intf_net [get_bd_intf_pins network/fetch/dispatcher/lbTxDataOut] [get_bd_intf_pins network/fetch/D_MB/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins network/fetch/D_MB/M_AXIS] [get_bd_intf_pins network/fetch/main_buffer/S_AXIS]


connect_bd_intf_net [get_bd_intf_pins network/fetch/main_buffer/M_AXIS] [get_bd_intf_pins network/fetch/collector/lbTxDataIn]

connect_bd_intf_net [get_bd_intf_pins network/fetch/fast_fetcher/to_slow_fetch] [get_bd_intf_pins network/fetch/FF_SF/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins network/fetch/FF_SF/M_AXIS] [get_bd_intf_pins network/fetch/slow_fetcher/from_fast_fetch]


connect_bd_intf_net [get_bd_intf_pins network/fetch/slow_fetcher/update] [get_bd_intf_pins network/fetch/SF_FF/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins network/fetch/SF_FF/M_AXIS] [get_bd_intf_pins network/fetch/fast_fetcher/update]

connect_bd_intf_net [get_bd_intf_pins network/fetch/dispatcher/fetch_out] [get_bd_intf_pins network/fetch/DP_FF/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins network/fetch/DP_FF/M_AXIS] [get_bd_intf_pins network/fetch/fast_fetcher/from_dispatch]


connect_bd_intf_net [get_bd_intf_pins network/fetch/fast_fetcher/bin1_send] [get_bd_intf_pins network/fetch/FF_B1/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins network/fetch/fast_fetcher/bin2_send] [get_bd_intf_pins network/fetch/FF_B2/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins network/fetch/fast_fetcher/bin3_send] [get_bd_intf_pins network/fetch/FF_B3/S_AXIS]

connect_bd_intf_net [get_bd_intf_pins network/fetch/FF_B1/M_AXIS] [get_bd_intf_pins network/fetch/bin_door_1/fetch_in]
connect_bd_intf_net [get_bd_intf_pins network/fetch/FF_B2/M_AXIS] [get_bd_intf_pins network/fetch/bin_door_2/fetch_in]
connect_bd_intf_net [get_bd_intf_pins network/fetch/FF_B3/M_AXIS] [get_bd_intf_pins network/fetch/bin_door_3/fetch_in]

connect_bd_intf_net [get_bd_intf_pins network/fetch/collector/bin_1] [get_bd_intf_pins network/fetch/bin1/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins network/fetch/collector/bin_2] [get_bd_intf_pins network/fetch/bin2/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins network/fetch/collector/bin_3] [get_bd_intf_pins network/fetch/bin3/S_AXIS]

connect_bd_intf_net [get_bd_intf_pins network/fetch/bin1/M_AXIS] [get_bd_intf_pins network/fetch/bin_door_1/bin_in]
connect_bd_intf_net [get_bd_intf_pins network/fetch/bin2/M_AXIS] [get_bd_intf_pins network/fetch/bin_door_2/bin_in]
connect_bd_intf_net [get_bd_intf_pins network/fetch/bin3/M_AXIS] [get_bd_intf_pins network/fetch/bin_door_3/bin_in]

connect_bd_intf_net [get_bd_intf_pins network/fetch/WNC_BB/S_AXIS] [get_bd_intf_pins network/fetch/collector/lbTxDataOut]
connect_bd_intf_net [get_bd_intf_pins network/fetch/bin_bypass/S_AXIS] [get_bd_intf_pins network/fetch/WNC_BB/M_AXIS]

connect_bd_intf_net [get_bd_intf_pins network/fetch/net_out_switch/S00_AXIS] [get_bd_intf_pins network/fetch/bin_bypass/M_AXIS]

connect_bd_intf_net [get_bd_intf_pins network/fetch/bin_door_1/lbTxDataOut] [get_bd_intf_pins network/fetch/B1_NOS/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins network/fetch/bin_door_2/lbTxDataOut] [get_bd_intf_pins network/fetch/B2_NOS/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins network/fetch/bin_door_3/lbTxDataOut] [get_bd_intf_pins network/fetch/B3_NOS/S_AXIS]

connect_bd_intf_net [get_bd_intf_pins network/fetch/B1_NOS/M_AXIS] [get_bd_intf_pins network/fetch/net_out_switch/S01_AXIS]
connect_bd_intf_net [get_bd_intf_pins network/fetch/B2_NOS/M_AXIS] [get_bd_intf_pins network/fetch/net_out_switch/S02_AXIS]
connect_bd_intf_net [get_bd_intf_pins network/fetch/B3_NOS/M_AXIS] [get_bd_intf_pins network/fetch/net_out_switch/S03_AXIS]

connect_bd_intf_net [get_bd_intf_pins network/fetch/slow_fetcher/out_network] [get_bd_intf_pins network/fetch/SF_NOS/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins network/fetch/SF_NOS/M_AXIS] [get_bd_intf_pins network/fetch/net_out_switch/S04_AXIS]

connect_bd_intf_net [get_bd_intf_pins network/fetch/net_out_clk_conv/S_AXIS] [get_bd_intf_pins network/fetch/net_out_switch/M00_AXIS]
connect_bd_intf_net [get_bd_intf_pins network/fetch/net_out_clk_conv/M_AXIS] [get_bd_intf_pins network/fetch/Net_TX]
