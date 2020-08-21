# /middleware/python/tclFileGenerator.py:1641
create_bd_cell -type ip -vlnv xilinx.com:hls:galapagos_bridge network/galapagos_bridge_inst
# /middleware/python/tclFileGenerator.py:1641
connect_bd_net [get_bd_ports CLK] [get_bd_pins network/galapagos_bridge_inst/aclk]
# /middleware/python/tclFileGenerator.py:1641
connect_bd_net [get_bd_ports ARESETN] [get_bd_pins network/galapagos_bridge_inst/aresetn]
# /middleware/python/tclFileGenerator.py:1647
create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen network/galapagos_bridge_buffer
# /middleware/python/tclFileGenerator.py:1658
set_property -dict [list CONFIG.Memory_Type {True_Dual_Port_RAM} CONFIG.Enable_B {Use_ENB_Pin} CONFIG.Use_RSTB_Pin {true} CONFIG.Port_B_Clock {100} CONFIG.Port_B_Write_Rate {50} CONFIG.Port_B_Enable_Rate {100} ] [get_bd_cells network/galapagos_bridge_buffer]
# /middleware/python/tclFileGenerator.py:1670
connect_bd_intf_net [get_bd_intf_pins network/galapagos_bridge_inst/buffer_storage_A_V_PORTA] [get_bd_intf_pins network/galapagos_bridge_buffer/BRAM_PORTA]
# /middleware/python/tclFileGenerator.py:1684
connect_bd_intf_net [get_bd_intf_pins network/galapagos_bridge_inst/buffer_storage_B_V_PORTA] [get_bd_intf_pins network/galapagos_bridge_buffer/BRAM_PORTB]
# /middleware/python/tclFileGenerator.py:1704
connect_bd_intf_net [get_bd_intf_pins applicationRegion/custom_switch_inst/stream_out_network_V] [get_bd_intf_pins network/galapagos_bridge_inst/s_axis_g2N]
# /middleware/python/tclFileGenerator.py:1718
connect_bd_intf_net [get_bd_intf_pins network/galapagos_bridge_inst/m_axis_g2N] [get_bd_intf_pins network/network_bridge_inst/${netBridge_from_app}]
# /middleware/python/tclFileGenerator.py:1834
connect_bd_intf_net [get_bd_intf_pins network/network_bridge_inst/${netBridge_to_app}] [get_bd_intf_pins network/galapagos_bridge_inst/s_axis_n2G]
# /middleware/python/tclFileGenerator.py:1847
connect_bd_intf_net [get_bd_intf_pins network/galapagos_bridge_inst/m_axis_n2G] [get_bd_intf_pins applicationRegion/input_switch/S00_AXIS]
