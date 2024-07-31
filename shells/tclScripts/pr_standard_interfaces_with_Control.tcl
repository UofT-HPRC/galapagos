create_bd_port -dir I -type clk CLK
set_property CONFIG.FREQ_HZ 199998001 [get_bd_ports CLK]
create_bd_port -dir I -type clk CLK300
set_property CONFIG.FREQ_HZ 322265625 [get_bd_ports CLK300]
create_bd_port -dir I -type rst rstn
create_bd_port -dir I -type rst rstn300
set_property CONFIG.POLARITY ACTIVE_LOW [get_bd_ports rstn]
set_property CONFIG.POLARITY ACTIVE_LOW [get_bd_ports rstn300]
startgroup
set_property CONFIG.ASSOCIATED_RESET {rstn} [get_bd_ports /CLK]
set_property CONFIG.ASSOCIATED_RESET {rstn300} [get_bd_ports /CLK300]
endgroup

create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_CONTROL
create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS
create_bd_intf_port -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS


set_property -dict [list CONFIG.MAX_BURST_LENGTH {1} CONFIG.NUM_WRITE_OUTSTANDING {2} CONFIG.NUM_READ_OUTSTANDING {2} CONFIG.SUPPORTS_NARROW_BURST {0} CONFIG.ADDR_WIDTH {16} CONFIG.FREQ_HZ {199498000} CONFIG.PROTOCOL {AXI4LITE} CONFIG.HAS_QOS {0} CONFIG.HAS_REGION {0}] [get_bd_intf_ports S_AXI_CONTROL]
set_property -dict [list CONFIG.TDATA_NUM_BYTES {64} CONFIG.HAS_TLAST {1} CONFIG.HAS_TKEEP {1}] [get_bd_intf_ports S_AXIS]
set_property -dict [list CONFIG.TDATA_NUM_BYTES {64} CONFIG.HAS_TLAST {1} CONFIG.HAS_TKEEP {1}] [get_bd_intf_ports M_AXIS]
set_property CONFIG.ASSOCIATED_BUSIF {S_AXIS:M_AXIS} [get_bd_ports /CLK300]
  

return 0
