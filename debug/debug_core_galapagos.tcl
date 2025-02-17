set script_dir [file dirname [file normalize [info script]]]
proc addip {ipName displayName} {
        set vlnv_version_independent [get_ipdefs -filter "NAME == $ipName"]
        create_bd_cell -type ip -vlnv $vlnv_version_independent $displayName
}

delete_bd_objs [get_bd_nets ps_sector_ARESETN] [get_bd_nets ps_sector_rst] [get_bd_nets ps_sector_CLK_200] [get_bd_cells ps_sector]

create_bd_cell -type hier debug_core
addip zynq_ultra_ps_e debug_core/zynq_ultra_ps_e_0
source $script_dir/ps_set_clark.tcl
set_property -dict [apply_preset debug_core/zynq_ultra_ps_e_0] [get_bd_cells debug_core/zynq_ultra_ps_e_0]
set_property -dict [list CONFIG.PSU__USE__S_AXI_GP2 {0}] [get_bd_cells debug_core/zynq_ultra_ps_e_0]
connect_bd_net [get_bd_pins debug_core/zynq_ultra_ps_e_0/pl_clk0] [get_bd_pins debug_core/zynq_ultra_ps_e_0/maxihpm0_fpd_aclk]
create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 debug_core/proc_sys_reset_0
connect_bd_net [get_bd_pins debug_core/zynq_ultra_ps_e_0/pl_resetn0] [get_bd_pins debug_core/proc_sys_reset_0/ext_reset_in]
connect_bd_net [get_bd_pins debug_core/zynq_ultra_ps_e_0/pl_clk0] [get_bd_pins debug_core/proc_sys_reset_0/slowest_sync_clk]
create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 debug_core/smartconnect_0
set_property -dict [list CONFIG.NUM_SI {1}] [get_bd_cells debug_core/smartconnect_0]
connect_bd_intf_net [get_bd_intf_pins debug_core/zynq_ultra_ps_e_0/M_AXI_HPM0_FPD] [get_bd_intf_pins debug_core/smartconnect_0/S00_AXI]
create_bd_cell -type ip -vlnv xilinx.com:ip:debug_bridge:3.0 debug_core/debug_bridge_0
set_property -dict [list CONFIG.C_DEBUG_MODE {2}] [get_bd_cells debug_core/debug_bridge_0]
connect_bd_intf_net [get_bd_intf_pins debug_core/smartconnect_0/M00_AXI] [get_bd_intf_pins debug_core/debug_bridge_0/S_AXI]
connect_bd_net [get_bd_pins debug_core/zynq_ultra_ps_e_0/pl_clk0] [get_bd_pins debug_core/smartconnect_0/aclk]
connect_bd_net [get_bd_pins debug_core/zynq_ultra_ps_e_0/pl_clk0] [get_bd_pins debug_core/debug_bridge_0/s_axi_aclk]
connect_bd_net [get_bd_pins debug_core/proc_sys_reset_0/interconnect_aresetn] [get_bd_pins debug_core/smartconnect_0/aresetn]
connect_bd_net [get_bd_pins debug_core/proc_sys_reset_0/peripheral_aresetn] [get_bd_pins debug_core/debug_bridge_0/s_axi_aresetn]
assign_bd_address
create_bd_pin -dir O -from 0 -to 0 debug_core/rstn
connect_bd_net [get_bd_pins debug_core/rstn] [get_bd_pins debug_core/proc_sys_reset_0/interconnect_aresetn]
create_bd_pin -dir O debug_core/ARESETN
connect_bd_net [get_bd_pins debug_core/ARESETN] [get_bd_pins debug_core/zynq_ultra_ps_e_0/pl_resetn0]
create_bd_pin -dir O debug_core/CLK_200
connect_bd_net [get_bd_pins debug_core/CLK_200] [get_bd_pins debug_core/zynq_ultra_ps_e_0/pl_clk0]
set_property CONFIG.PSU__CRL_APB__PL0_REF_CTRL__DIVISOR0 {4} [get_bd_cells debug_core/zynq_ultra_ps_e_0]

connect_bd_net [get_bd_ports rstn] [get_bd_pins debug_core/rstn]
connect_bd_net [get_bd_pins debug_core/ARESETN] [get_bd_pins ethernet/ARESETN] -boundary_type upper
connect_bd_net [get_bd_ports CLK] [get_bd_pins debug_core/CLK_200]