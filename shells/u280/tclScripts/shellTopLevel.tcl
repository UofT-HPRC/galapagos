# Create ports
create_bd_intf_port -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 eth_rx
create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gt_rtl:1.0 qsfp1_4x

create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 init_clk
create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 gt_ref
create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 eth_tx

create_bd_port -dir O -type rst rstn
create_bd_port -dir O -type rst rstn300
create_bd_port -dir O -type clk CLK
create_bd_port -dir O -type clk CLK300

set_property CONFIG.ASSOCIATED_RESET {rstn} [get_bd_ports /CLK]
set_property CONFIG.ASSOCIATED_RESET {rstn300} [get_bd_ports /CLK300]

# Configure external ports

set_property CONFIG.FREQ_HZ 156250000 [get_bd_intf_ports /gt_ref]
set_property CONFIG.FREQ_HZ 100000000 [get_bd_intf_ports /init_clk]
set_property CONFIG.ASSOCIATED_RESET {rstn} [get_bd_ports /CLK]

addIfToClock CLK300 eth_rx
addIfToClock CLK300 eth_tx

set_property CONFIG.TDATA_NUM_BYTES 64 [get_bd_intf_ports /eth_tx]
set_property CONFIG.HAS_TKEEP 1 [get_bd_intf_ports /eth_tx]
set_property CONFIG.HAS_TLAST 1 [get_bd_intf_ports /eth_tx]

# Create cells

create_bd_cell -type hier ethernet
create_bd_cell -type hier clock_reset_generator

# Add ports to hierarchies

create_bd_pin -dir O ethernet/CLK_322
create_bd_pin -dir O ethernet/rstn_322
create_bd_pin -dir I ethernet/rst
create_bd_pin -dir I ethernet/rstn
create_bd_pin -dir I ethernet/init_clk_200

create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 ethernet/eth_rx
create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:gt_rtl:1.0 ethernet/gt_serial_port_eth

create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 ethernet/gt_ref
create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 ethernet/eth_tx

create_bd_pin -dir O -from 0 -to 0 clock_reset_generator/rst
create_bd_pin -dir O -from 0 -to 0 clock_reset_generator/rstn
create_bd_pin -dir O -type clk clock_reset_generator/init_clk_200

create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 clock_reset_generator/init_clk

# Connect pins

connect_bd_net [get_bd_pins clock_reset_generator/rstn] [get_bd_ports rstn]
connect_bd_net [get_bd_pins clock_reset_generator/init_clk_200] [get_bd_ports CLK]

connect_bd_net [get_bd_pins clock_reset_generator/rst] [get_bd_pins ethernet/rst]
connect_bd_net [get_bd_pins clock_reset_generator/rstn] [get_bd_pins ethernet/rstn]
connect_bd_net [get_bd_pins clock_reset_generator/init_clk_200] [get_bd_pins ethernet/init_clk_200]

connect_bd_net [get_bd_pins ethernet/CLK_322] [get_bd_ports CLK300]
connect_bd_net [get_bd_pins ethernet/rstn_322] [get_bd_ports rstn300]

# Connect interfaces

connect_bd_intf_net [get_bd_intf_ports init_clk] -boundary_type upper [get_bd_intf_pins clock_reset_generator/init_clk]

connect_bd_intf_net [get_bd_intf_ports eth_tx] -boundary_type upper [get_bd_intf_pins ethernet/eth_tx]
connect_bd_intf_net [get_bd_intf_ports gt_ref] -boundary_type upper [get_bd_intf_pins ethernet/gt_ref]
connect_bd_intf_net [get_bd_intf_ports eth_rx] -boundary_type upper [get_bd_intf_pins ethernet/eth_rx]
connect_bd_intf_net [get_bd_intf_ports qsfp1_4x] -boundary_type upper [get_bd_intf_pins ethernet/gt_serial_port_eth]

