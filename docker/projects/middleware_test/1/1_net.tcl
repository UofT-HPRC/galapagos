# /middleware/python/tclFileGenerator.py:1615
create_bd_cell -type hier network
# /middleware/python/tclFileGenerator.py:1567
create_bd_cell -type ip -vlnv user.org:user:ip_constant_block network/ip_constant_block_inst
# /middleware/python/tclFileGenerator.py:1591
set_property -dict [list CONFIG.C_IP_B0 {156} CONFIG.C_IP_B1 {2} CONFIG.C_IP_B2 {1} CONFIG.C_IP_B3 {10} CONFIG.C_GATEWAY_B0 {100} CONFIG.C_GATEWAY_B1 {2} CONFIG.C_GATEWAY_B2 {1} CONFIG.C_GATEWAY_B3 {10} CONFIG.C_SUBNET_B0 {0} CONFIG.C_SUBNET_B1 {255} CONFIG.C_SUBNET_B2 {255} CONFIG.C_SUBNET_B3 {255} CONFIG.C_MAC {0xfa163e55ca02} ] [get_bd_cells network/ip_constant_block_inst]
# /middleware/python/tclFileGenerator.py:1598
source /home/user/galapagos/middleware/tclScripts/pr_tcp_bridge.tcl
