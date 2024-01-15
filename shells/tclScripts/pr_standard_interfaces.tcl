if {[info exists HUNDREDG]} {
    create_bd_port -dir I -type clk CLK
    set_property CONFIG.FREQ_HZ 199498000 [get_bd_ports CLK]
    create_bd_port -dir I -type clk CLK300
    set_property CONFIG.FREQ_HZ 322265625 [get_bd_ports CLK300]
    create_bd_port -dir I -type rst rst
    create_bd_port -dir I -type rst rst300
    set_property CONFIG.POLARITY ACTIVE_LOW [get_bd_ports rst]
    set_property CONFIG.POLARITY ACTIVE_LOW [get_bd_ports rst300]
    startgroup
    set_property CONFIG.ASSOCIATED_RESET {rst} [get_bd_ports /CLK]
    set_property CONFIG.ASSOCIATED_RESET {rst300} [get_bd_ports /CLK300]
    endgroup
} else {
    create_bd_port -dir I -type clk CLK
    set_property CONFIG.FREQ_HZ 156250000 [get_bd_ports CLK]
}
create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_CONTROL
create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS
create_bd_intf_port -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS


if {[info exists HUNDREDG]} {
    set_property -dict [list CONFIG.MAX_BURST_LENGTH {1} CONFIG.NUM_WRITE_OUTSTANDING {2} CONFIG.NUM_READ_OUTSTANDING {2} CONFIG.SUPPORTS_NARROW_BURST {0} CONFIG.ADDR_WIDTH {16} CONFIG.FREQ_HZ {199498000} CONFIG.PROTOCOL {AXI4LITE} CONFIG.HAS_QOS {0} CONFIG.HAS_REGION {0}] [get_bd_intf_ports S_AXI_CONTROL]
    set_property -dict [list CONFIG.TDATA_NUM_BYTES {64} CONFIG.HAS_TLAST {1} CONFIG.HAS_TKEEP {1}] [get_bd_intf_ports S_AXIS]
    set_property -dict [list CONFIG.TDATA_NUM_BYTES {64} CONFIG.HAS_TLAST {1} CONFIG.HAS_TKEEP {1}] [get_bd_intf_ports M_AXIS]
    set_property CONFIG.ASSOCIATED_BUSIF {S_AXIS:M_AXIS} [get_bd_ports /CLK300]
} else {
    set_property -dict [list CONFIG.MAX_BURST_LENGTH {1} CONFIG.NUM_WRITE_OUTSTANDING {2} CONFIG.NUM_READ_OUTSTANDING {2} CONFIG.SUPPORTS_NARROW_BURST {0} CONFIG.ADDR_WIDTH {16} CONFIG.FREQ_HZ {156250000} CONFIG.PROTOCOL {AXI4LITE} CONFIG.HAS_QOS {0} CONFIG.HAS_REGION {0}] [get_bd_intf_ports S_AXI_CONTROL]
    set_property -dict [list CONFIG.TDATA_NUM_BYTES {8} CONFIG.HAS_TLAST {1} CONFIG.HAS_TKEEP {1}] [get_bd_intf_ports S_AXIS]
    set_property -dict [list CONFIG.TDATA_NUM_BYTES {8} CONFIG.HAS_TLAST {1} CONFIG.HAS_TKEEP {1}] [get_bd_intf_ports M_AXIS]
    set_property CONFIG.ASSOCIATED_BUSIF {S_AXIS:M_AXIS} [get_bd_ports /CLK]
}
    

return 0
