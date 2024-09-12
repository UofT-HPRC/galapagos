# Create instance cmac_usplus_0 and set properties

addip cmac_usplus ethernet/cmac_usplus_0
set_property -dict [list \
  CONFIG.CMAC_CAUI4_MODE {1} \
  CONFIG.GT_DRP_CLK {200.00} \
  CONFIG.GT_REF_CLK_FREQ {156.25} \
  CONFIG.RX_CHECK_PREAMBLE {1} \
  CONFIG.RX_CHECK_SFD {1} \
  CONFIG.RX_FLOW_CONTROL {0} \
  CONFIG.TX_FLOW_CONTROL {0} \
  CONFIG.CMAC_CORE_SELECT {CMACE4_X0Y6} \
  CONFIG.GT_GROUP_SELECT {X0Y44~X0Y47} \
] [get_bd_cells ethernet/cmac_usplus_0]

# Create multiple instances of axis_register_slice and set properties

addip axis_register_slice ethernet/axis_register_slice_0
addip axis_register_slice ethernet/axis_register_slice_1
set_property CONFIG.REG_CONFIG {0} [get_bd_cells ethernet/axis_register_slice_0]
set_property CONFIG.REG_CONFIG {0} [get_bd_cells ethernet/axis_register_slice_1]

# Create instance lbus_axis_converter_0 and set properties

addip lbus_axis_converter ethernet/lbus_axis_converter_0

# Create multiple instances of constants and set properties

addip xlconstant ethernet/one_1
set_property CONFIG.CONST_VAL {1} [get_bd_cells ethernet/one_1]
set_property CONFIG.CONST_WIDTH {1} [get_bd_cells ethernet/one_1]
addip xlconstant ethernet/zero_1
set_property CONFIG.CONST_VAL {0} [get_bd_cells ethernet/zero_1]
set_property CONFIG.CONST_WIDTH {1} [get_bd_cells ethernet/zero_1]
addip xlconstant ethernet/zero_10
set_property CONFIG.CONST_VAL {0} [get_bd_cells ethernet/zero_10]
set_property CONFIG.CONST_WIDTH {10} [get_bd_cells ethernet/zero_10]
addip xlconstant ethernet/zero_12
set_property CONFIG.CONST_VAL {0} [get_bd_cells ethernet/zero_12]
set_property CONFIG.CONST_WIDTH {12} [get_bd_cells ethernet/zero_12]
addip xlconstant ethernet/zero_16
set_property CONFIG.CONST_VAL {0} [get_bd_cells ethernet/zero_16]
set_property CONFIG.CONST_WIDTH {16} [get_bd_cells ethernet/zero_16]
addip xlconstant ethernet/zero_56
set_property CONFIG.CONST_VAL {0} [get_bd_cells ethernet/zero_56]
set_property CONFIG.CONST_WIDTH {56} [get_bd_cells ethernet/zero_56]

# Create instance proc_sys_reset_0 and set properties

addip proc_sys_reset ethernet/proc_sys_reset_0
set_property -dict [list CONFIG.C_EXT_RESET_HIGH.VALUE_SRC PROPAGATED] [get_bd_cells ethernet/proc_sys_reset_0]
set_property -dict [list CONFIG.C_AUX_RESET_HIGH.VALUE_SRC PROPAGATED] [get_bd_cells ethernet/proc_sys_reset_0]

# Set connections

connect_bd_net [get_bd_pins ethernet/rst] [get_bd_pins ethernet/cmac_usplus_0/sys_reset]
connect_bd_intf_net [get_bd_intf_pins ethernet/gt_ref] [get_bd_intf_pins ethernet/cmac_usplus_0/gt_ref_clk]
connect_bd_net [get_bd_pins ethernet/init_clk_200] [get_bd_pins ethernet/cmac_usplus_0/init_clk]
connect_bd_net [get_bd_pins ethernet/rstn] [get_bd_pins ethernet/proc_sys_reset_0/ext_reset_in]
connect_bd_net [get_bd_pins ethernet/cmac_usplus_0/gt_txusrclk2] [get_bd_pins ethernet/cmac_usplus_0/rx_clk]
connect_bd_net [get_bd_pins ethernet/cmac_usplus_0/gt_txusrclk2] [get_bd_pins ethernet/lbus_axis_converter_0/clk]
connect_bd_net [get_bd_pins ethernet/cmac_usplus_0/gt_txusrclk2] [get_bd_pins ethernet/proc_sys_reset_0/slowest_sync_clk]
connect_bd_net [get_bd_pins ethernet/CLK_322] [get_bd_pins ethernet/cmac_usplus_0/gt_txusrclk2]
connect_bd_net [get_bd_pins ethernet/rstn_322] [get_bd_pins ethernet/proc_sys_reset_0/interconnect_aresetn]
connect_bd_net [get_bd_pins ethernet/one_1/dout] [get_bd_pins ethernet/cmac_usplus_0/ctl_tx_enable]
connect_bd_net [get_bd_pins ethernet/one_1/dout] [get_bd_pins ethernet/cmac_usplus_0/ctl_rx_enable]
connect_bd_net [get_bd_pins ethernet/zero_1/dout] [get_bd_pins ethernet/lbus_axis_converter_0/rst]
connect_bd_net [get_bd_pins ethernet/zero_1/dout] [get_bd_pins ethernet/cmac_usplus_0/ctl_tx_test_pattern]
connect_bd_net [get_bd_pins ethernet/zero_1/dout] [get_bd_pins ethernet/cmac_usplus_0/ctl_tx_send_idle]
connect_bd_net [get_bd_pins ethernet/zero_1/dout] [get_bd_pins ethernet/cmac_usplus_0/ctl_tx_send_lfi]
connect_bd_net [get_bd_pins ethernet/zero_1/dout] [get_bd_pins ethernet/cmac_usplus_0/ctl_tx_send_rfi]
connect_bd_net [get_bd_pins ethernet/zero_1/dout] [get_bd_pins ethernet/cmac_usplus_0/ctl_rx_force_resync]
connect_bd_net [get_bd_pins ethernet/zero_1/dout] [get_bd_pins ethernet/cmac_usplus_0/ctl_rx_test_pattern]
connect_bd_net [get_bd_pins ethernet/zero_1/dout] [get_bd_pins ethernet/cmac_usplus_0/drp_en]
connect_bd_net [get_bd_pins ethernet/zero_1/dout] [get_bd_pins ethernet/cmac_usplus_0/drp_we]
connect_bd_net [get_bd_pins ethernet/zero_1/dout] [get_bd_pins ethernet/cmac_usplus_0/gtwiz_reset_tx_datapath]
connect_bd_net [get_bd_pins ethernet/zero_1/dout] [get_bd_pins ethernet/cmac_usplus_0/gtwiz_reset_rx_datapath]
connect_bd_net [get_bd_pins ethernet/zero_1/dout] [get_bd_pins ethernet/cmac_usplus_0/core_rx_reset]
connect_bd_net [get_bd_pins ethernet/zero_1/dout] [get_bd_pins ethernet/cmac_usplus_0/core_tx_reset]
connect_bd_net [get_bd_pins ethernet/zero_1/dout] [get_bd_pins ethernet/cmac_usplus_0/core_drp_reset]
connect_bd_net [get_bd_pins ethernet/zero_1/dout] [get_bd_pins ethernet/cmac_usplus_0/drp_clk]
connect_bd_net [get_bd_pins ethernet/zero_10/dout] [get_bd_pins ethernet/cmac_usplus_0/drp_addr]
connect_bd_net [get_bd_pins ethernet/zero_12/dout] [get_bd_pins ethernet/cmac_usplus_0/gt_loopback_in]
connect_bd_net [get_bd_pins ethernet/zero_16/dout] [get_bd_pins ethernet/cmac_usplus_0/drp_di]
connect_bd_net [get_bd_pins ethernet/zero_56/dout] [get_bd_pins ethernet/cmac_usplus_0/tx_preamblein]
connect_bd_intf_net [get_bd_intf_pins ethernet/lbus_axis_converter_0/lbus_tx] [get_bd_intf_pins ethernet/cmac_usplus_0/lbus_tx]
connect_bd_intf_net [get_bd_intf_pins ethernet/cmac_usplus_0/lbus_rx] [get_bd_intf_pins ethernet/lbus_axis_converter_0/lbus_rx]
connect_bd_intf_net [get_bd_intf_pins ethernet/gt_serial_port_eth] [get_bd_intf_pins ethernet/cmac_usplus_0/gt_serial_port]
connect_bd_intf_net [get_bd_intf_pins ethernet/eth_tx] [get_bd_intf_pins ethernet/axis_register_slice_0/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins ethernet/axis_register_slice_0/M_AXIS] [get_bd_intf_pins ethernet/lbus_axis_converter_0/s_axis]
connect_bd_intf_net [get_bd_intf_pins ethernet/axis_register_slice_1/S_AXIS] [get_bd_intf_pins ethernet/lbus_axis_converter_0/m_axis]
connect_bd_intf_net [get_bd_intf_pins ethernet/eth_rx] [get_bd_intf_pins ethernet/axis_register_slice_1/M_AXIS]
connect_bd_net [get_bd_pins ethernet/axis_register_slice_0/aclk] [get_bd_pins ethernet/cmac_usplus_0/gt_txusrclk2]
connect_bd_net [get_bd_pins ethernet/axis_register_slice_1/aclk] [get_bd_pins ethernet/cmac_usplus_0/gt_txusrclk2]
connect_bd_net [get_bd_pins ethernet/axis_register_slice_1/aresetn] [get_bd_pins ethernet/proc_sys_reset_0/interconnect_aresetn]
connect_bd_net [get_bd_pins ethernet/axis_register_slice_0/aresetn] [get_bd_pins ethernet/proc_sys_reset_0/interconnect_aresetn]
