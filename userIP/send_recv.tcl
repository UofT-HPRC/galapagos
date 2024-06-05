proc addip {ipName displayName} {
  #query the ip repository to find a block called ipName
  set vlnv_version_independent [lindex [get_ipdefs -all *${ipName}:* -filter {UPGRADE_VERSIONS == ""}] end]
  create_bd_cell -type ip -vlnv $vlnv_version_independent $displayName
}

#Create the cells

addip axi_interconnect user_interconnect
addip sender sender
addip hls:receiver receiver
addip gpio fof_fob
addip gpio good_total
addip gpio dest_id
addip gpio user_cnt
addip gpio run_penalty
addip network_throttle network_throttle
addip axis_data_fifo in_fifo
addip axis_data_fifo out_fifo

addip sender sender_wan
addip gpio dest_id_wan
addip gpio user_cnt_wan
addip gpio run_penalty_wan
addip network_throttle network_throttle_wan
addip axis_data_fifo out_fifo_wan


#Configure the cells
set_property -dict [list CONFIG.C_ALL_INPUTS {1} CONFIG.C_ALL_INPUTS_2 {1} CONFIG.C_IS_DUAL {1} ] [get_bd_cells fof_fob]
set_property -dict [list CONFIG.C_ALL_INPUTS {1} CONFIG.C_ALL_INPUTS_2 {1} CONFIG.C_IS_DUAL {1} ] [get_bd_cells good_total]
set_property -dict [list CONFIG.C_ALL_OUTPUTS {1} CONFIG.C_ALL_OUTPUTS_2 {1} CONFIG.C_IS_DUAL {1} CONFIG.C_GPIO_WIDTH {24} CONFIG.C_GPIO2_WIDTH {24} ] [get_bd_cells dest_id]
set_property -dict [list CONFIG.C_ALL_OUTPUTS {1} CONFIG.C_ALL_INPUTS_2 {1} CONFIG.C_IS_DUAL {1} CONFIG.C_GPIO_WIDTH {16} ] [get_bd_cells user_cnt]
set_property -dict [list CONFIG.C_ALL_OUTPUTS {1} CONFIG.C_ALL_OUTPUTS_2 {1} CONFIG.C_IS_DUAL {1} CONFIG.C_GPIO_WIDTH {1} ] [get_bd_cells run_penalty]

set_property -dict [list CONFIG.C_ALL_OUTPUTS {1} CONFIG.C_ALL_OUTPUTS_2 {1} CONFIG.C_IS_DUAL {1} CONFIG.C_GPIO_WIDTH {24} CONFIG.C_GPIO2_WIDTH {24} ] [get_bd_cells dest_id_wan]
set_property -dict [list CONFIG.C_ALL_OUTPUTS {1} CONFIG.C_ALL_INPUTS_2 {1} CONFIG.C_IS_DUAL {1} CONFIG.C_GPIO_WIDTH {16} ] [get_bd_cells user_cnt_wan]
set_property -dict [list CONFIG.C_ALL_OUTPUTS {1} CONFIG.C_ALL_OUTPUTS_2 {1} CONFIG.C_IS_DUAL {1} CONFIG.C_GPIO_WIDTH {1} ] [get_bd_cells run_penalty_wan]

set_property -dict [list CONFIG.S00_HAS_REGSLICE {1} CONFIG.NUM_MI {8} ] [get_bd_cells user_interconnect]

#Connect Interfaces

connect_bd_intf_net [get_bd_intf_ports AXI_CONTROL] -boundary_type upper [get_bd_intf_pins user_interconnect/S00_AXI]

connect_bd_intf_net -boundary_type upper [get_bd_intf_pins user_interconnect/M00_AXI] [get_bd_intf_pins dest_id/S_AXI]
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins user_interconnect/M01_AXI] [get_bd_intf_pins fof_fob/S_AXI]
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins user_interconnect/M02_AXI] [get_bd_intf_pins good_total/S_AXI]
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins user_interconnect/M03_AXI] [get_bd_intf_pins run_penalty/S_AXI]
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins user_interconnect/M04_AXI] [get_bd_intf_pins user_cnt/S_AXI]

connect_bd_intf_net -boundary_type upper [get_bd_intf_pins user_interconnect/M05_AXI] [get_bd_intf_pins dest_id_wan/S_AXI]
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins user_interconnect/M06_AXI] [get_bd_intf_pins run_penalty_wan/S_AXI]
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins user_interconnect/M07_AXI] [get_bd_intf_pins user_cnt_wan/S_AXI]

connect_bd_intf_net [get_bd_intf_pins sender/pkt_out_V] [get_bd_intf_pins network_throttle/data_in_V]
connect_bd_intf_net [get_bd_intf_ports in_r] [get_bd_intf_pins in_fifo/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins in_fifo/M_AXIS] [get_bd_intf_pins receiver/pkt_in_V]
connect_bd_intf_net [get_bd_intf_pins network_throttle/data_out_V] [get_bd_intf_pins out_fifo/S_AXIS]
connect_bd_intf_net [get_bd_intf_ports out_r] [get_bd_intf_pins out_fifo/M_AXIS]

connect_bd_intf_net [get_bd_intf_pins sender_wan/pkt_out_V] [get_bd_intf_pins network_throttle_wan/data_in_V]
connect_bd_intf_net [get_bd_intf_pins network_throttle_wan/data_out_V] [get_bd_intf_pins out_fifo_wan/S_AXIS]
connect_bd_intf_net [get_bd_intf_ports laniakea_wan] [get_bd_intf_pins out_fifo_wan/M_AXIS]


#connect Ports

connect_bd_net [get_bd_pins dest_id/gpio_io_o] [get_bd_pins sender/dest_prt_V]
connect_bd_net [get_bd_pins dest_id/gpio2_io_o] [get_bd_pins sender/id_prt_V]
connect_bd_net [get_bd_pins user_cnt/gpio_io_o] [get_bd_pins sender/user_prt_V]
connect_bd_net [get_bd_pins user_cnt/gpio2_io_i] [get_bd_pins sender/pkt_sent_V]

connect_bd_net [get_bd_pins dest_id_wan/gpio_io_o] [get_bd_pins sender_wan/dest_prt_V]
connect_bd_net [get_bd_pins dest_id_wan/gpio2_io_o] [get_bd_pins sender_wan/id_prt_V]
connect_bd_net [get_bd_pins user_cnt_wan/gpio_io_o] [get_bd_pins sender_wan/user_prt_V]
connect_bd_net [get_bd_pins user_cnt_wan/gpio2_io_i] [get_bd_pins sender_wan/pkt_sent_V]

connect_bd_net [get_bd_pins fof_fob/gpio_io_i] [get_bd_pins receiver/fof_V]
connect_bd_net [get_bd_pins fof_fob/gpio2_io_i] [get_bd_pins receiver/fob_V]
connect_bd_net [get_bd_pins good_total/gpio_io_i] [get_bd_pins receiver/good_received_V]
connect_bd_net [get_bd_pins good_total/gpio2_io_i] [get_bd_pins receiver/total_received_V]

connect_bd_net [get_bd_pins run_penalty/gpio_io_o] [get_bd_pins sender/run_V]
connect_bd_net [get_bd_pins run_penalty/gpio2_io_o] [get_bd_pins network_throttle/penalty_V]

connect_bd_net [get_bd_pins run_penalty_wan/gpio_io_o] [get_bd_pins sender_wan/run_V]
connect_bd_net [get_bd_pins run_penalty_wan/gpio2_io_o] [get_bd_pins network_throttle_wan/penalty_V]

connect_bd_net [get_bd_ports ap_clk] [get_bd_pins user_interconnect/ACLK]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins user_interconnect/S00_ACLK]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins user_interconnect/M00_ACLK]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins user_interconnect/M01_ACLK]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins user_interconnect/M02_ACLK]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins user_interconnect/M03_ACLK]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins user_interconnect/M04_ACLK]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins user_interconnect/M05_ACLK]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins user_interconnect/M06_ACLK]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins user_interconnect/M07_ACLK]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins receiver/aclk]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins dest_id/s_axi_aclk]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins user_cnt/s_axi_aclk]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins run_penalty/s_axi_aclk]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins fof_fob/s_axi_aclk]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins good_total/s_axi_aclk]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins sender/aclk]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins network_throttle/aclk]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins out_fifo/s_axis_aclk]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins in_fifo/s_axis_aclk]

connect_bd_net [get_bd_ports ap_clk] [get_bd_pins dest_id_wan/s_axi_aclk]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins user_cnt_wan/s_axi_aclk]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins run_penalty_wan/s_axi_aclk]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins sender_wan/aclk]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins network_throttle_wan/aclk]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins out_fifo_wan/s_axis_aclk]

connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins user_interconnect/ARESETN]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins user_interconnect/M00_ARESETN]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins user_interconnect/S00_ARESETN]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins user_interconnect/M01_ARESETN]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins user_interconnect/M02_ARESETN]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins user_interconnect/M03_ARESETN]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins user_interconnect/M04_ARESETN]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins user_interconnect/M05_ARESETN]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins user_interconnect/M06_ARESETN]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins user_interconnect/M07_ARESETN]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins fof_fob/s_axi_aresetn]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins good_total/s_axi_aresetn]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins in_fifo/s_axis_aresetn]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins dest_id/s_axi_aresetn]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins run_penalty/s_axi_aresetn]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins user_cnt/s_axi_aresetn]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins receiver/aresetn]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins sender/aresetn]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins network_throttle/aresetn]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins out_fifo/s_axis_aresetn]

connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins dest_id_wan/s_axi_aresetn]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins user_cnt_wan/s_axi_aresetn]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins run_penalty_wan/s_axi_aresetn]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins sender_wan/aresetn]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins network_throttle_wan/aresetn]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins out_fifo_wan/s_axis_aresetn]

assign_bd_address

set kernel_number_insert 00

set_property offset 0xA${kernel_number_insert}00000 [get_bd_addr_segs {AXI_CONTROL/SEG_run_penalty_Reg}]
set_property offset 0xA${kernel_number_insert}10000 [get_bd_addr_segs {AXI_CONTROL/SEG_dest_id_Reg}]
set_property offset 0xA${kernel_number_insert}20000 [get_bd_addr_segs {AXI_CONTROL/SEG_good_total_Reg}]
set_property offset 0xA${kernel_number_insert}30000 [get_bd_addr_segs {AXI_CONTROL/SEG_fof_fob_Reg}]
set_property offset 0xA${kernel_number_insert}40000 [get_bd_addr_segs {AXI_CONTROL/SEG_good_total_Reg}]

set_property offset 0xA${kernel_number_insert}20000 [get_bd_addr_segs {AXI_CONTROL/SEG_user_cnt_Reg}]

set_property offset 0xA${kernel_number_insert}60000 [get_bd_addr_segs {AXI_CONTROL/SEG_dest_id_wan_Reg}]
set_property offset 0xA${kernel_number_insert}50000 [get_bd_addr_segs {AXI_CONTROL/SEG_run_penalty_wan_Reg}]
set_property offset 0xA${kernel_number_insert}70000 [get_bd_addr_segs {AXI_CONTROL/SEG_user_cnt_wan_Reg}]
