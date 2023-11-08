#QSFP0

set net_num 0
set GT_GROUP_SELECT X0Y12~X0Y15
set CMAC_CORE_SELECT CMACE4_X0Y1
set LANE1_GT_LOC X0Y12
set LANE2_GT_LOC X0Y13
set LANE3_GT_LOC X0Y14
set LANE4_GT_LOC X0Y15
#source $project_dir/tcl/shell/generateEthernet.tcl

#QSFP1

set net_num 1
set GT_GROUP_SELECT X0Y16~X0Y19
set CMAC_CORE_SELECT CMACE4_X0Y2
set LANE1_GT_LOC X0Y16
set LANE2_GT_LOC X0Y17
set LANE3_GT_LOC X0Y18
set LANE4_GT_LOC X0Y19

source ${::env(GALAPAGOS_PATH)}/shells/sidewinder/tclScripts/generateEthernet.tcl

#create the cells

addip util_ds_buf ethernet/util_ds_buf_0
set_property -dict [list CONFIG.C_BUF_TYPE {IBUFDS}] [get_bd_cells ethernet/util_ds_buf_0]

#Connect Ports
connect_bd_net [get_bd_pins ethernet/ARESETN] [get_bd_pins ethernet/network_1/general_reset]

connect_bd_net [get_bd_pins ethernet/util_ds_buf_0/IBUF_OUT] [get_bd_pins ethernet/network_1/init]

connect_bd_net [get_bd_pins ethernet/CLK_322] [get_bd_pins ethernet/network_1/network_clk]

connect_bd_net [get_bd_pins ethernet/rst_322] [get_bd_pins ethernet/network_1/network_resetn]


#Connect Interfaces

connect_bd_intf_net [get_bd_intf_pins ethernet/init_clk] [get_bd_intf_pins ethernet/util_ds_buf_0/CLK_IN_D]

connect_bd_intf_net [get_bd_intf_pins ethernet/gt_ref] -boundary_type upper [get_bd_intf_pins ethernet/network_1/gt_ref]

connect_bd_intf_net [get_bd_intf_pins ethernet/eth_tx] -boundary_type upper [get_bd_intf_pins ethernet/network_1/network_tx]

connect_bd_intf_net [get_bd_intf_pins ethernet/eth_rx] -boundary_type upper [get_bd_intf_pins ethernet/network_1/network_rx]
