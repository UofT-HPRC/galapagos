set kernel_name benchmark

create_bd_cell -type ip -vlnv varun.org:varun:GAScore:1.0 applicationRegion/GAScore_0
set_property -dict [list \
    CONFIG.ADDRESS_LOW {1} \
    CONFIG.ADDRESS_HIGH {1} \
    CONFIG.NUM_KERNELS $CUSTOM_kernels_stream_in \
    CONFIG.ADDR_WIDTH {12} \
    CONFIG.DATA_WIDTH {32} \
    CONFIG.STRB_WIDTH {4}
] [get_bd_cells applicationRegion/GAScore_0]

# disconnect network connection to input_switch and connect to GAScore/net_in
delete_bd_objs [get_bd_intf_nets -boundary_type lower -of_objects [get_bd_intf_pins applicationRegion/S00_AXIS]]
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins applicationRegion/S00_AXIS] [get_bd_intf_pins applicationRegion/GAScore_0/net_in]

connect_bd_intf_net [get_bd_intf_pins applicationRegion/GAScore_0/kernel_out] [get_bd_intf_pins applicationRegion/input_switch/S00_AXIS]

# disconnect out_r from kernel -> router, connect to kernel_in
delete_bd_objs [get_bd_intf_nets applicationRegion/${kernel_name}_inst_1_out_r]
connect_bd_intf_net [get_bd_intf_pins applicationRegion/${kernel_name}_inst_1/out_r] [get_bd_intf_pins applicationRegion/GAScore_0/kernel_in]

# disconnect stream network out and connect network out to GAScore
delete_bd_objs [get_bd_intf_nets applicationRegion/custom_switch_inst_stream_out_network]
connect_bd_intf_net [get_bd_intf_pins applicationRegion/stream_out_network] [get_bd_intf_pins applicationRegion/GAScore_0/net_out]

# delete router
delete_bd_objs [get_bd_intf_nets applicationRegion/custom_switch_inst_network_table_V_PORTA] [get_bd_cells applicationRegion/blk_mem_switch_rom]
delete_bd_objs [get_bd_nets applicationRegion/network_addr_V_1] [get_bd_intf_nets applicationRegion/custom_switch_inst_stream_out_switch] [get_bd_cells applicationRegion/custom_switch_inst]

# hook up memory
delete_bd_objs [get_bd_intf_nets applicationRegion/${kernel_name}_inst_1_m_axi_handler_ctrl]
delete_bd_objs [get_bd_intf_nets applicationRegion/${kernel_name}_inst_1_m_axi_local_mem]
delete_bd_objs [get_bd_addr_segs S_AXI_CONTROL/SEG_axi_vip_ctrl_Reg]
delete_bd_objs [get_bd_addr_segs applicationRegion/${kernel_name}_inst_1/Data_m_axi_handler_ctrl/SEG_S_AXI_MEM_0_Reg]
delete_bd_objs [get_bd_addr_segs applicationRegion/${kernel_name}_inst_1/Data_m_axi_local_mem/SEG_S_AXI_MEM_0_Reg]

# connect_bd_intf_net [get_bd_intf_pins $CUSTOM_net_in] [get_bd_intf_pins applicationRegion/GAScore_0/net_in]
# connect_bd_intf_net [get_bd_intf_pins $CUSTOM_net_out] [get_bd_intf_pins applicationRegion/GAScore_0/net_out]

# connect_bd_intf_net [get_bd_intf_pins applicationRegion/GAScore_0/kernel_in] [get_bd_intf_pins $CUSTOM_kernel_out]
# connect_bd_intf_net [get_bd_intf_pins applicationRegion/GAScore_0/kernel_out] [get_bd_intf_pins $CUSTOM_kernel_in]

set app_indices [array names CUSTOM_arr *,0]
set app_count [llength app_indices]
foreach app_coordinate $app_indices {
    set app $CUSTOM_arr($app_coordinate)
    set app_index [lindex [split $app_coordinate ,] 0]
    set mem_coordinates [array names CUSTOM_arr $app_index,*]
    set mem_count [llength mem_coordinates]

    create_bd_cell -type hier ${app}_mem_xbar

    set ctrl_bus_index [format "%02d" $app_index]


    # TODO assuming only 2 memory interfaces on each IP
    for {set i 1; set j 0} {$i < 3} {incr i; incr j} {
        set mem_coordinate [lindex $mem_coordinates $i]

        set interconnect_name ${app}_mem_xbar/axi_interconnect_${j}
        create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 $interconnect_name
        set_property -dict [list CONFIG.NUM_MI {1}] [get_bd_cells $interconnect_name]
        connect_bd_intf_net [get_bd_intf_pins $app/$CUSTOM_arr($mem_coordinate)] [get_bd_intf_pins $interconnect_name/S00_AXI]
        if { $i == 1 } {
            connect_bd_intf_net [get_bd_intf_pins applicationRegion/GAScore_0/ctrl_bus_${app_index}] [get_bd_intf_pins $interconnect_name/M00_AXI]
            assign_bd_address [get_bd_addr_segs {applicationRegion/GAScore_0/s_axi_ctrl_bus_$ctrl_bus_index/reg0 }]
            include_bd_addr_seg [get_bd_addr_segs -excluded $app/Data_$CUSTOM_arr($mem_coordinate)/SEG_GAScore_0_reg0]
            set_property offset 0x44B00000 [get_bd_addr_segs $app/Data_$CUSTOM_arr($mem_coordinate)/SEG_GAScore_0_reg0]
            set_property range 4K [get_bd_addr_segs $app/Data_$CUSTOM_arr($mem_coordinate)/SEG_GAScore_0_reg0]
        } else {
            connect_bd_intf_net [get_bd_intf_pins applicationRegion/GAScore_0/kernel_mem_${app_index}] [get_bd_intf_pins $interconnect_name/M00_AXI]
            assign_bd_address [get_bd_addr_segs {applicationRegion/GAScore_0/s_axi_$ctrl_bus_index/reg0 }]
            include_bd_addr_seg [get_bd_addr_segs -excluded $app/Data_$CUSTOM_arr($mem_coordinate)/SEG_GAScore_0_reg0]
            set_property offset 0x00000000 [get_bd_addr_segs $app/Data_$CUSTOM_arr($mem_coordinate)/SEG_GAScore_0_reg0]
            set_property range 4G [get_bd_addr_segs $app/Data_$CUSTOM_arr($mem_coordinate)/SEG_GAScore_0_reg0]
        }
        connect_bd_net [get_bd_pins applicationRegion/CLK] [get_bd_pins $interconnect_name/ACLK]
        connect_bd_net [get_bd_pins applicationRegion/CLK] [get_bd_pins $interconnect_name/S00_ACLK]
        connect_bd_net [get_bd_pins applicationRegion/CLK] [get_bd_pins $interconnect_name/M00_ACLK]
        connect_bd_net [get_bd_pins applicationRegion/ARESETN] [get_bd_pins $interconnect_name/ARESETN]
        connect_bd_net [get_bd_pins applicationRegion/ARESETN] [get_bd_pins $interconnect_name/S00_ARESETN]
        connect_bd_net [get_bd_pins applicationRegion/ARESETN] [get_bd_pins $interconnect_name/M00_ARESETN]
    }
}

# create_bd_cell -type hier applicationRegion/GAScore_mem_xbar
# for {set i 0} {$i < 2} {incr i} {
#     set interconnect_name applicationRegion/GAScore_mem_xbar/axi_interconnect_${i}
#     create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 $interconnect_name
#     set_property -dict [list CONFIG.NUM_MI {1}] [get_bd_cells $interconnect_name]
#     if { $i == 0 } {
#         connect_bd_intf_net [get_bd_intf_pins applicationRegion/GAScore_0/axi_local] [get_bd_intf_pins $interconnect_name/S00_AXI]
#         connect_bd_intf_net [get_bd_intf_ports S_AXI_MEM_0] [get_bd_intf_pins $interconnect_name/M00_AXI]
#     } else {
#         connect_bd_intf_net [get_bd_intf_pins applicationRegion/GAScore_0/axi_remote] [get_bd_intf_pins $interconnect_name/S00_AXI]
#         connect_bd_intf_net [get_bd_intf_ports S_AXI_MEM_1] [get_bd_intf_pins $interconnect_name/M00_AXI]
#     }
#     connect_bd_net [get_bd_pins applicationRegion/CLK] [get_bd_pins $interconnect_name/ACLK]
#     connect_bd_net [get_bd_pins applicationRegion/CLK] [get_bd_pins $interconnect_name/S00_ACLK]
#     connect_bd_net [get_bd_pins applicationRegion/CLK] [get_bd_pins $interconnect_name/M00_ACLK]
#     connect_bd_net [get_bd_pins applicationRegion/ARESETN] [get_bd_pins $interconnect_name/ARESETN]
#     connect_bd_net [get_bd_pins applicationRegion/ARESETN] [get_bd_pins $interconnect_name/S00_ARESETN]
#     connect_bd_net [get_bd_pins applicationRegion/ARESETN] [get_bd_pins $interconnect_name/M00_ARESETN]
# }

connect_bd_net [get_bd_pins applicationRegion/CLK] [get_bd_pins applicationRegion/GAScore_0/clock]
connect_bd_net [get_bd_pins applicationRegion/ARESETN] [get_bd_pins applicationRegion/GAScore_0/reset_n]

# hook up GAScore memory to interconnect
connect_bd_intf_net [get_bd_intf_pins applicationRegion/GAScore_0/axi_local] -boundary_type upper [get_bd_intf_pins applicationRegion/axi_interconnect_mem/S00_AXI]
connect_bd_intf_net [get_bd_intf_pins applicationRegion/GAScore_0/axi_remote] -boundary_type upper [get_bd_intf_pins applicationRegion/axi_interconnect_mem/S01_AXI]
assign_bd_address [get_bd_addr_segs {S_AXI_MEM_0/Reg }]
set_property offset 0x00000000 [get_bd_addr_segs {applicationRegion/GAScore_0/axi_local/SEG_S_AXI_MEM_0_Reg}]
set_property range 4G [get_bd_addr_segs {applicationRegion/GAScore_0/axi_local/SEG_S_AXI_MEM_0_Reg}]
assign_bd_address [get_bd_addr_segs {S_AXI_MEM_0/Reg }]
set_property offset 0x00000000 [get_bd_addr_segs {applicationRegion/GAScore_0/axi_remote/SEG_S_AXI_MEM_0_Reg}]
set_property range 4G [get_bd_addr_segs {applicationRegion/GAScore_0/axi_remote/SEG_S_AXI_MEM_0_Reg}]

# add constant for kernel ID
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 applicationRegion/xlconstant_0
set_property -dict [list CONFIG.CONST_WIDTH {16}] [get_bd_cells applicationRegion/xlconstant_0]
connect_bd_net [get_bd_pins applicationRegion/xlconstant_0/dout] [get_bd_pins applicationRegion/${kernel_name}_inst_1/id]

# add axi timer
set axi_timer_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_timer:2.0 applicationRegion/axi_timer_0 ]
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 applicationRegion/axi_interconnect_0
set_property -dict [list CONFIG.NUM_SI {2} CONFIG.NUM_MI {1}] [get_bd_cells applicationRegion/axi_interconnect_0]
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins applicationRegion/axi_interconnect_0/M00_AXI] [get_bd_intf_pins applicationRegion/axi_timer_0/S_AXI]
connect_bd_intf_net [get_bd_intf_pins applicationRegion/${kernel_name}_inst_1/m_axi_axi_timer] -boundary_type upper [get_bd_intf_pins applicationRegion/axi_interconnect_0/S00_AXI]
connect_bd_net [get_bd_pins applicationRegion/CLK] [get_bd_pins applicationRegion/axi_timer_0/s_axi_aclk]
connect_bd_net [get_bd_pins applicationRegion/ARESETN] [get_bd_pins applicationRegion/axi_timer_0/s_axi_aresetn]
assign_bd_address [get_bd_addr_segs {applicationRegion/axi_timer_0/S_AXI/Reg }]
include_bd_addr_seg [get_bd_addr_segs -excluded applicationRegion/${kernel_name}_inst_1/Data_m_axi_axi_timer/SEG_axi_timer_0_Reg]
set_property offset 0x00000000 [get_bd_addr_segs applicationRegion/${kernel_name}_inst_1/Data_m_axi_axi_timer/SEG_axi_timer_0_Reg]
connect_bd_net [get_bd_pins applicationRegion/axi_interconnect_0/ACLK] [get_bd_pins applicationRegion/axi_interconnect_0/S00_ACLK] -boundary_type upper
connect_bd_net [get_bd_pins applicationRegion/axi_interconnect_0/S00_ACLK] [get_bd_pins applicationRegion/axi_interconnect_0/M00_ACLK] -boundary_type upper
connect_bd_net [get_bd_pins applicationRegion/axi_interconnect_0/ARESETN] [get_bd_pins applicationRegion/axi_interconnect_0/S00_ARESETN] -boundary_type upper
connect_bd_net [get_bd_pins applicationRegion/axi_interconnect_0/S00_ARESETN] [get_bd_pins applicationRegion/axi_interconnect_0/M00_ARESETN] -boundary_type upper
connect_bd_net [get_bd_pins applicationRegion/CLK] [get_bd_pins applicationRegion/axi_interconnect_0/ACLK]
connect_bd_net [get_bd_pins applicationRegion/ARESETN] [get_bd_pins applicationRegion/axi_interconnect_0/M00_ARESETN]
connect_bd_net [get_bd_pins applicationRegion/CLK] [get_bd_pins applicationRegion/axi_interconnect_0/S01_ACLK]
connect_bd_net [get_bd_pins applicationRegion/ARESETN] [get_bd_pins applicationRegion/axi_interconnect_0/S01_ARESETN]

# add instruction memory
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.0 applicationRegion/axi_bram_ctrl_0
connect_bd_intf_net [get_bd_intf_pins applicationRegion/axi_bram_ctrl_0/S_AXI] [get_bd_intf_pins applicationRegion/${kernel_name}_inst_1/m_axi_instr_mem]
connect_bd_net [get_bd_pins applicationRegion/CLK] [get_bd_pins applicationRegion/axi_bram_ctrl_0/s_axi_aclk]
connect_bd_net [get_bd_pins applicationRegion/ARESETN] [get_bd_pins applicationRegion/axi_bram_ctrl_0/s_axi_aresetn]
set_property -dict [list CONFIG.DATA_WIDTH {32} CONFIG.SINGLE_PORT_BRAM {1} CONFIG.ECC_TYPE {0}] [get_bd_cells applicationRegion/axi_bram_ctrl_0]
create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 applicationRegion/instr_blk_mem
connect_bd_intf_net [get_bd_intf_pins applicationRegion/instr_blk_mem/BRAM_PORTA] [get_bd_intf_pins applicationRegion/axi_bram_ctrl_0/BRAM_PORTA]
assign_bd_address [get_bd_addr_segs {applicationRegion/axi_bram_ctrl_0/S_AXI/Mem0 }]
set_property offset 0x00000000 [get_bd_addr_segs applicationRegion/${kernel_name}_inst_1/Data_m_axi_instr_mem/SEG_axi_bram_ctrl_0_Mem0]
set_property range 4K [get_bd_addr_segs applicationRegion/${kernel_name}_inst_1/Data_m_axi_instr_mem/SEG_axi_bram_ctrl_0_Mem0]

# extra commands to validate bd
connect_bd_net [get_bd_pins network/tcp_ip_inst/s_axis_close_connection_TVALID] [get_bd_pins network/xlconstant_disable/dout]
delete_bd_objs [get_bd_intf_nets applicationRegion/Conn1]
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins applicationRegion/S_AXI_CONTROL] [get_bd_intf_pins applicationRegion/axi_interconnect_0/S01_AXI]
delete_bd_objs [get_bd_cells applicationRegion/axi_vip_ctrl]
assign_bd_address [get_bd_addr_segs {applicationRegion/axi_timer_0/S_AXI/Reg }]

set constraints_path ${::env(SHOAL_PATH)}/repo/constraints/8k5
add_files -fileset constrs_1 -norecurse [list $constraints_path/ad_8k5.xdc $constraints_path/bitstream.xdc $constraints_path/ddr4_test.xdc $constraints_path/ddr4_test_axi4.xdc $constraints_path/ddr4sdram_b0_lane8.xdc $constraints_path/ddr4sdram_b0_unused.xdc $constraints_path/ddr4sdram_b1_lane8.xdc $constraints_path/ddr4sdram_b1_unused.xdc $constraints_path/ddr4sdram_locs_b0_twin_die.xdc $constraints_path/ddr4sdram_locs_b0_x64.xdc $constraints_path/ddr4sdram_locs_b0_x72.xdc $constraints_path/ddr4sdram_locs_b1_twin_die.xdc $constraints_path/ddr4sdram_locs_b1_x64.xdc $constraints_path/ddr4sdram_locs_b1_x72.xdc $constraints_path/ddr4sdram_props_b0_twin_die.xdc $constraints_path/ddr4sdram_props_b1_twin_die.xdc $constraints_path/pcie.xdc $constraints_path/refclk200.xdc]
import_files -fileset constrs_1 [list $constraints_path/ad_8k5.xdc $constraints_path/bitstream.xdc $constraints_path/ddr4_test.xdc $constraints_path/ddr4_test_axi4.xdc $constraints_path/ddr4sdram_b0_lane8.xdc $constraints_path/ddr4sdram_b0_unused.xdc $constraints_path/ddr4sdram_b1_lane8.xdc $constraints_path/ddr4sdram_b1_unused.xdc $constraints_path/ddr4sdram_locs_b0_twin_die.xdc $constraints_path/ddr4sdram_locs_b0_x64.xdc $constraints_path/ddr4sdram_locs_b0_x72.xdc $constraints_path/ddr4sdram_locs_b1_twin_die.xdc $constraints_path/ddr4sdram_locs_b1_x64.xdc $constraints_path/ddr4sdram_locs_b1_x72.xdc $constraints_path/ddr4sdram_props_b0_twin_die.xdc $constraints_path/ddr4sdram_props_b1_twin_die.xdc $constraints_path/pcie.xdc $constraints_path/refclk200.xdc]
