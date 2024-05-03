#Create the cells

addip zynq_ultra_ps_e ps_sector/ps_link
addip proc_sys_reset ps_sector/CLK_200_RES


#Configure the cells

#Load the presets of the ps_link core
source ${::env(GALAPAGOS_PATH)}/shells/sidewinder/tclScripts/reconfig_galapagos_ps.tcl
set_property -dict [concat [apply_preset [get_bd_cells ps_sector/ps_link]]] [get_bd_cells ps_sector/ps_link]

#Connect Ports

connect_bd_net [get_bd_pins ps_sector/ps_link/pl_clk0] [get_bd_pins ps_sector/ps_link/maxihpm0_fpd_aclk]

connect_bd_net [get_bd_pins ps_sector/ps_link/pl_clk0] [get_bd_pins ps_sector/CLK_200]
connect_bd_net [get_bd_pins ps_sector/ps_link/pl_clk0] [get_bd_pins ps_sector/CLK_200_RES/slowest_sync_clk]

connect_bd_net [get_bd_pins ps_sector/ps_link/pl_resetn0] [get_bd_pins ps_sector/ARESETN]


connect_bd_net [get_bd_pins ps_sector/ps_link/pl_resetn0] [get_bd_pins ps_sector/CLK_200_RES/ext_reset_in]

<<<<<<< HEAD
connect_bd_net [get_bd_pins ps_sector/CLK_200_RES/interconnect_aresetn] [get_bd_pins ps_sector/rstn]
=======
# connect_bd_net [get_bd_pins ps_sector/CLK_200_RES/interconnect_aresetn] [get_bd_pins ps_sector/PS_to_PL_AXI/ARESETN]
# connect_bd_net [get_bd_pins ps_sector/CLK_200_RES/interconnect_aresetn] [get_bd_pins ps_sector/PS_to_PL_AXI/S00_ARESETN]
# connect_bd_net [get_bd_pins ps_sector/CLK_200_RES/interconnect_aresetn] [get_bd_pins ps_sector/PS_to_PL_AXI/M00_ARESETN]
# connect_bd_net [get_bd_pins ps_sector/CLK_200_RES/interconnect_aresetn] [get_bd_pins ps_sector/PS_to_PL_AXI/M01_ARESETN]
connect_bd_net [get_bd_pins ps_sector/CLK_200_RES/interconnect_aresetn] [get_bd_pins ps_sector/rst]

#Connect Interfaces

# connect_bd_intf_net [get_bd_intf_pins ps_sector/ps_link/M_AXI_HPM0_FPD] -boundary_type upper [get_bd_intf_pins ps_sector/PS_to_PL_AXI/S00_AXI]
# connect_bd_intf_net [get_bd_intf_pins ps_sector/S_AXI_PS_CONTROL] -boundary_type upper [get_bd_intf_pins ps_sector/PS_to_PL_AXI/M00_AXI]
>>>>>>> Added Control to Scripting
