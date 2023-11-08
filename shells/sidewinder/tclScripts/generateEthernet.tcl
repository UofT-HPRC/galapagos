#create ethernet hierarchy
create_bd_cell -type hier ethernet/network_$net_num


#add ports

create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 ethernet/network_$net_num/network_rx

create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 ethernet/network_$net_num/network_tx

create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 ethernet/network_$net_num/gt_ref

create_bd_pin -dir I ethernet/network_$net_num/general_reset

create_bd_pin -dir I ethernet/network_$net_num/init

create_bd_pin -dir O ethernet/network_$net_num/network_clk
create_bd_pin -dir O ethernet/network_$net_num/network_resetn
create_bd_pin -dir O ethernet/network_$net_num/network_resetp

#add cores

addip axis_register_slice ethernet/network_$net_num/rx_slice
addip axis_register_slice ethernet/network_$net_num/tx_slice
addip cmac_usplus ethernet/network_$net_num/cmac
addip xlconstant ethernet/network_$net_num/w1v0
addip xlconstant ethernet/network_$net_num/w1v1
addip xlconstant ethernet/network_$net_num/w10v0
addip xlconstant ethernet/network_$net_num/w12v0
addip xlconstant ethernet/network_$net_num/w16v0
addip xlconstant ethernet/network_$net_num/w56v0
addip proc_sys_reset ethernet/network_$net_num/network_reset_hub


create_bd_cell -type ip -vlnv clarkshen.com:user:lbus_axis_converter:1.0 ethernet/network_$net_num/lbus_axis_converter

#configure the cores
set_property -dict [list CONFIG.TDATA_NUM_BYTES.VALUE_SRC USER CONFIG.HAS_TKEEP.VALUE_SRC USER CONFIG.HAS_TLAST.VALUE_SRC USER] [get_bd_cells ethernet/network_$net_num/rx_slice]
set_property -dict [list CONFIG.TDATA_NUM_BYTES {64} CONFIG.HAS_TKEEP {1} CONFIG.HAS_TLAST {1}] [get_bd_cells ethernet/network_$net_num/rx_slice]
set_property -dict [list CONFIG.TDATA_NUM_BYTES.VALUE_SRC USER CONFIG.HAS_TKEEP.VALUE_SRC USER CONFIG.HAS_TLAST.VALUE_SRC USER] [get_bd_cells ethernet/network_$net_num/tx_slice]
set_property -dict [list CONFIG.TDATA_NUM_BYTES {64} CONFIG.HAS_TKEEP {1} CONFIG.HAS_TLAST {1}] [get_bd_cells ethernet/network_$net_num/tx_slice]
set_property -dict [list CONFIG.CMAC_CAUI4_MODE {1} CONFIG.NUM_LANES {4x25} CONFIG.GT_REF_CLK_FREQ {322.265625} CONFIG.GT_DRP_CLK {200.00} CONFIG.RX_CHECK_PREAMBLE {1} CONFIG.RX_CHECK_SFD {1} CONFIG.TX_FLOW_CONTROL {0} CONFIG.RX_FLOW_CONTROL {0} CONFIG.CMAC_CORE_SELECT $CMAC_CORE_SELECT CONFIG.GT_GROUP_SELECT $GT_GROUP_SELECT CONFIG.LANE1_GT_LOC $LANE1_GT_LOC CONFIG.LANE2_GT_LOC $LANE2_GT_LOC CONFIG.LANE3_GT_LOC $LANE3_GT_LOC CONFIG.LANE4_GT_LOC $LANE4_GT_LOC CONFIG.LANE5_GT_LOC {NA} CONFIG.LANE6_GT_LOC {NA} CONFIG.LANE7_GT_LOC {NA} CONFIG.LANE8_GT_LOC {NA} CONFIG.LANE9_GT_LOC {NA} CONFIG.LANE10_GT_LOC {NA}] [get_bd_cells ethernet/network_$net_num/cmac]
set_property -dict [list CONFIG.CONST_WIDTH {1} CONFIG.CONST_VAL {0}] [get_bd_cells ethernet/network_$net_num/w1v0]
set_property -dict [list CONFIG.CONST_WIDTH {1} CONFIG.CONST_VAL {1}] [get_bd_cells ethernet/network_$net_num/w1v1]
set_property -dict [list CONFIG.CONST_WIDTH {10} CONFIG.CONST_VAL {0}] [get_bd_cells ethernet/network_$net_num/w10v0]
set_property -dict [list CONFIG.CONST_WIDTH {12} CONFIG.CONST_VAL {0}] [get_bd_cells ethernet/network_$net_num/w12v0]
set_property -dict [list CONFIG.CONST_WIDTH {16} CONFIG.CONST_VAL {0}] [get_bd_cells ethernet/network_$net_num/w16v0]
set_property -dict [list CONFIG.CONST_WIDTH {56} CONFIG.CONST_VAL {0}] [get_bd_cells ethernet/network_$net_num/w56v0]

#connect Interfaces

connect_bd_intf_net [get_bd_intf_pins ethernet/network_$net_num/gt_ref] [get_bd_intf_pins ethernet/network_$net_num/cmac/gt_ref_clk]
connect_bd_intf_net [get_bd_intf_pins ethernet/network_$net_num/cmac/lbus_tx] [get_bd_intf_pins ethernet/network_$net_num/lbus_axis_converter/lbus_tx]
connect_bd_intf_net [get_bd_intf_pins ethernet/network_$net_num/cmac/lbus_rx] [get_bd_intf_pins ethernet/network_$net_num/lbus_axis_converter/lbus_rx]
connect_bd_intf_net [get_bd_intf_pins ethernet/network_$net_num/network_tx] [get_bd_intf_pins ethernet/network_$net_num/tx_slice/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins ethernet/network_$net_num/network_rx] [get_bd_intf_pins ethernet/network_$net_num/rx_slice/M_AXIS]
connect_bd_intf_net [get_bd_intf_pins ethernet/network_$net_num/lbus_axis_converter/m_axis] [get_bd_intf_pins ethernet/network_$net_num/rx_slice/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins ethernet/network_$net_num/lbus_axis_converter/s_axis] [get_bd_intf_pins ethernet/network_$net_num/tx_slice/M_AXIS]

#connect Clocks and resets

connect_bd_net [get_bd_pins ethernet/network_$net_num/init] [get_bd_pins ethernet/network_$net_num/cmac/init_clk]

connect_bd_net [get_bd_pins ethernet/network_$net_num/cmac/gt_txusrclk2] [get_bd_pins ethernet/network_$net_num/cmac/rx_clk]
connect_bd_net [get_bd_pins ethernet/network_$net_num/cmac/gt_txusrclk2] [get_bd_pins ethernet/network_$net_num/network_clk]
connect_bd_net [get_bd_pins ethernet/network_$net_num/cmac/gt_txusrclk2] [get_bd_pins ethernet/network_$net_num/lbus_axis_converter/clk]
connect_bd_net [get_bd_pins ethernet/network_$net_num/cmac/gt_txusrclk2] [get_bd_pins ethernet/network_$net_num/network_reset_hub/slowest_sync_clk]
connect_bd_net [get_bd_pins ethernet/network_$net_num/cmac/gt_txusrclk2] [get_bd_pins ethernet/network_$net_num/tx_slice/aclk]
connect_bd_net [get_bd_pins ethernet/network_$net_num/cmac/gt_txusrclk2] [get_bd_pins ethernet/network_$net_num/rx_slice/aclk]

connect_bd_net [get_bd_pins ethernet/network_$net_num/network_reset_hub/interconnect_aresetn] [get_bd_pins ethernet/network_$net_num/network_resetn]
connect_bd_net [get_bd_pins ethernet/network_$net_num/network_reset_hub/interconnect_aresetn] [get_bd_pins ethernet/network_$net_num/tx_slice/aresetn]
connect_bd_net [get_bd_pins ethernet/network_$net_num/network_reset_hub/interconnect_aresetn] [get_bd_pins ethernet/network_$net_num/rx_slice/aresetn]

connect_bd_net [get_bd_pins ethernet/network_$net_num/network_resetp] [get_bd_pins ethernet/network_$net_num/network_reset_hub/peripheral_reset]

connect_bd_net [get_bd_pins ethernet/network_$net_num/general_reset] [get_bd_pins ethernet/network_$net_num/network_reset_hub/ext_reset_in]


#connect others
connect_bd_net [get_bd_pins ethernet/network_$net_num/w1v0/dout] [get_bd_pins ethernet/network_$net_num/lbus_axis_converter/rst]
connect_bd_net [get_bd_pins ethernet/network_$net_num/w1v0/dout] [get_bd_pins ethernet/network_$net_num/cmac/ctl_tx_test_pattern]
connect_bd_net [get_bd_pins ethernet/network_$net_num/w1v0/dout] [get_bd_pins ethernet/network_$net_num/cmac/ctl_tx_send_idle]
connect_bd_net [get_bd_pins ethernet/network_$net_num/w1v0/dout] [get_bd_pins ethernet/network_$net_num/cmac/ctl_tx_send_lfi]
connect_bd_net [get_bd_pins ethernet/network_$net_num/w1v0/dout] [get_bd_pins ethernet/network_$net_num/cmac/ctl_tx_send_rfi]
connect_bd_net [get_bd_pins ethernet/network_$net_num/w1v0/dout] [get_bd_pins ethernet/network_$net_num/cmac/ctl_rx_force_resync]
connect_bd_net [get_bd_pins ethernet/network_$net_num/w1v0/dout] [get_bd_pins ethernet/network_$net_num/cmac/ctl_rx_test_pattern]
connect_bd_net [get_bd_pins ethernet/network_$net_num/w1v0/dout] [get_bd_pins ethernet/network_$net_num/cmac/drp_en]
connect_bd_net [get_bd_pins ethernet/network_$net_num/w1v0/dout] [get_bd_pins ethernet/network_$net_num/cmac/drp_we]
connect_bd_net [get_bd_pins ethernet/network_$net_num/w1v0/dout] [get_bd_pins ethernet/network_$net_num/cmac/gtwiz_reset_tx_datapath]
connect_bd_net [get_bd_pins ethernet/network_$net_num/w1v0/dout] [get_bd_pins ethernet/network_$net_num/cmac/gtwiz_reset_rx_datapath]
connect_bd_net [get_bd_pins ethernet/network_$net_num/w1v0/dout] [get_bd_pins ethernet/network_$net_num/cmac/sys_reset]
connect_bd_net [get_bd_pins ethernet/network_$net_num/w1v0/dout] [get_bd_pins ethernet/network_$net_num/cmac/core_rx_reset]
connect_bd_net [get_bd_pins ethernet/network_$net_num/w1v0/dout] [get_bd_pins ethernet/network_$net_num/cmac/core_tx_reset]
connect_bd_net [get_bd_pins ethernet/network_$net_num/w1v0/dout] [get_bd_pins ethernet/network_$net_num/cmac/core_drp_reset]
connect_bd_net [get_bd_pins ethernet/network_$net_num/w1v0/dout] [get_bd_pins ethernet/network_$net_num/cmac/drp_clk]

connect_bd_net [get_bd_pins ethernet/network_$net_num/w1v1/dout] [get_bd_pins ethernet/network_$net_num/cmac/ctl_tx_enable]
connect_bd_net [get_bd_pins ethernet/network_$net_num/w1v1/dout] [get_bd_pins ethernet/network_$net_num/cmac/ctl_rx_enable]

connect_bd_net [get_bd_pins ethernet/network_$net_num/w10v0/dout] [get_bd_pins ethernet/network_$net_num/cmac/drp_addr]

connect_bd_net [get_bd_pins ethernet/network_$net_num/w12v0/dout] [get_bd_pins ethernet/network_$net_num/cmac/gt_loopback_in]

connect_bd_net [get_bd_pins ethernet/network_$net_num/w16v0/dout] [get_bd_pins ethernet/network_$net_num/cmac/drp_di]

connect_bd_net [get_bd_pins ethernet/network_$net_num/w56v0/dout] [get_bd_pins ethernet/network_$net_num/cmac/tx_preamblein]
