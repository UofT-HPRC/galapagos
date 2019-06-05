# /middleware/python/tclFileGenerator.py:1533
create_bd_cell -type ip -vlnv xilinx.com:hls:communication_bridge_eth_mpi application_bridge_inst
# /middleware/python/tclFileGenerator.py:1533
connect_bd_net [get_bd_ports CLK] [get_bd_pins application_bridge_inst/aclk]
# /middleware/python/tclFileGenerator.py:1533
connect_bd_net [get_bd_ports ARESETN] [get_bd_pins application_bridge_inst/aresetn]
# /middleware/python/tclFileGenerator.py:1561
connect_bd_intf_net [get_bd_intf_pins application_bridge_inst/to_app_V] [get_bd_intf_pins applicationRegion/input_switch/S00_AXIS]
# /middleware/python/tclFileGenerator.py:1575
connect_bd_intf_net [get_bd_intf_pins applicationRegion/custom_switch_inst/stream_out_network_V] [get_bd_intf_pins application_bridge_inst/from_app_V]
# /middleware/python/tclFileGenerator.py:1620
connect_bd_intf_net [get_bd_intf_pins application_bridge_inst/to_net_V] [get_bd_intf_pins network/network_bridge_inst/${netBridge_from_app}]
# /middleware/python/tclFileGenerator.py:1634
connect_bd_intf_net [get_bd_intf_pins network/network_bridge_inst/${netBridge_to_app}] [get_bd_intf_pins application_bridge_inst/from_net_V]
