#Need GULF and Endian Converter to payload from user and payload to user 

#set_property -dict [list CONFIG.IP_ADDR $ip_addr] [get_bd_cells network/GULF_Stream_0]
#set_property -dict [list CONFIG.GATEWAY $ip_gateway] [get_bd_cells network/GULF_Stream_0]
#set_property -dict [list CONFIG.MAC_ADDR $mac_addr] [get_bd_cells network/GULF_Stream_0]
#set_property -dict [list CONFIG.NETMASK $net_mask] [get_bd_cells network/GULF_Stream_0]

#set_property -dict [list CONFIG.DATA_WIDTH {512}] [get_bd_cells network/axis_endianness_conv_0]
#set_property -dict [list CONFIG.DATA_WIDTH {512}] [get_bd_cells network/axis_endianness_conv_1]
#set_property -dict [list CONFIG.HAS_KEEP {true} CONFIG.HAS_LAST {true} CONFIG.HAS_READY {true}] [get_bd_cells network/axis_endianness_conv_0]
#set_property -dict [list CONFIG.HAS_KEEP {true} CONFIG.HAS_LAST {true} CONFIG.HAS_READY {true}] [get_bd_cells network/axis_endianness_conv_1]