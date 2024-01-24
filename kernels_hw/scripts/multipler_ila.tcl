startgroup

current_bd_design [get_bd_designs pr]
move_bd_cells [get_bd_cells applicationRegion] [get_bd_cells network/galapagos_bridge_inst]

create_bd_cell -type ip -vlnv xilinx.com:ip:system_ila:1.1 applicationRegion/system_ila_0
set_property -dict [list \
  CONFIG.C_DATA_DEPTH {4096} \
  CONFIG.C_NUM_MONITOR_SLOTS {7} \
  CONFIG.C_SLOT {1} \
  CONFIG.C_SLOT_0_INTF_TYPE {xilinx.com:interface:axis_rtl:1.0} \
  CONFIG.C_SLOT_1_INTF_TYPE {xilinx.com:interface:axis_rtl:1.0} \
  CONFIG.C_SLOT_2_INTF_TYPE {xilinx.com:interface:axis_rtl:1.0} \
  CONFIG.C_SLOT_3_INTF_TYPE {xilinx.com:interface:axis_rtl:1.0} \
  CONFIG.C_SLOT_4_INTF_TYPE {xilinx.com:interface:axis_rtl:1.0} \
  CONFIG.C_SLOT_5_INTF_TYPE {xilinx.com:interface:axis_rtl:1.0} \
  CONFIG.C_SLOT_6_INTF_TYPE {xilinx.com:interface:axis_rtl:1.0} \
] [get_bd_cells applicationRegion/system_ila_0]

connect_bd_net [get_bd_pins applicationRegion/CLK] [get_bd_pins applicationRegion/system_ila_0/clk]
connect_bd_net [get_bd_pins applicationRegion/ARESETN] [get_bd_pins applicationRegion/system_ila_0/resetn]
connect_bd_intf_net [get_bd_intf_pins applicationRegion/system_ila_0/SLOT_0_AXIS] [get_bd_intf_pins applicationRegion/galapagos_bridge_inst/n2G_input]
connect_bd_intf_net [get_bd_intf_pins applicationRegion/system_ila_0/SLOT_1_AXIS] [get_bd_intf_pins applicationRegion/galapagos_bridge_inst/n2G_output]
connect_bd_intf_net [get_bd_intf_pins applicationRegion/system_ila_0/SLOT_2_AXIS] [get_bd_intf_pins applicationRegion/multiplierA_inst_1/pkt_in_V]
connect_bd_intf_net [get_bd_intf_pins applicationRegion/system_ila_0/SLOT_3_AXIS] [get_bd_intf_pins applicationRegion/multiplierB_inst_2/pkt_in_V]
connect_bd_intf_net [get_bd_intf_pins applicationRegion/system_ila_0/SLOT_4_AXIS] [get_bd_intf_pins applicationRegion/custom_switch_inst/stream_in]
connect_bd_intf_net [get_bd_intf_pins applicationRegion/system_ila_0/SLOT_5_AXIS] [get_bd_intf_pins applicationRegion/galapagos_bridge_inst/g2N_input]
connect_bd_intf_net [get_bd_intf_pins applicationRegion/system_ila_0/SLOT_6_AXIS] [get_bd_intf_pins applicationRegion/galapagos_bridge_inst/g2N_output]

save_bd_design

endgroup

startgroup

set_property name n2G_input [get_bd_intf_nets applicationRegion/n2G_input_1]
set_property name n2G_output [get_bd_intf_nets applicationRegion/galapagos_bridge_inst_n2G_output]
set_property name pkt_in [get_bd_intf_nets applicationRegion/input_switch_M00_AXIS]
set_property name pkt_out [get_bd_intf_nets applicationRegion/multiplierB_inst_2_pkt_out_V]
set_property name g2N_input [get_bd_intf_nets applicationRegion/custom_switch_inst_stream_out_network]
set_property name g2N_output [get_bd_intf_nets applicationRegion/galapagos_bridge_inst_g2N_output]
save_bd_design

endgroup