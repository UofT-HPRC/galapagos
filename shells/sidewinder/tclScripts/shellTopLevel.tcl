#create the ports
create_bd_intf_port -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 eth_rx

create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 init_clk
create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 gt_ref
create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 eth_tx


create_bd_intf_port -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_CONTROL

create_bd_port -dir O -type rst rst
create_bd_port -dir O -type rst rst300
create_bd_port -dir O -type clk CLK
create_bd_port -dir O -type clk CLK300

startgroup
set_property CONFIG.ASSOCIATED_RESET {rst} [get_bd_ports /CLK]
set_property CONFIG.ASSOCIATED_RESET {rst300} [get_bd_ports /CLK300]
endgroup

#configure external ports

set_property CONFIG.FREQ_HZ 322265625 [get_bd_intf_ports /gt_ref]
set_property CONFIG.FREQ_HZ 200000000 [get_bd_intf_ports /init_clk]
set_property CONFIG.ASSOCIATED_RESET {rst} [get_bd_ports /CLK]

set_property CONFIG.DATA_WIDTH 128 [get_bd_intf_ports /S_AXI_CONTROL]
set_property CONFIG.ADDR_WIDTH 40 [get_bd_intf_ports /S_AXI_CONTROL]

addIfToClock CLK S_AXI_CONTROL

addIfToClock CLK300 eth_rx
addIfToClock CLK300 eth_tx

set_property CONFIG.TDATA_NUM_BYTES 64 [get_bd_intf_ports /eth_tx]
set_property CONFIG.HAS_TKEEP 1 [get_bd_intf_ports /eth_tx]
set_property CONFIG.HAS_TLAST 1 [get_bd_intf_ports /eth_tx]

#create the cells

create_bd_cell -type hier ps_sector
create_bd_cell -type hier ethernet

#Add ports to the hierarchies
create_bd_pin -dir O ps_sector/CLK_200
create_bd_pin -dir O ps_sector/ARESETN
create_bd_pin -dir O ps_sector/rst

create_bd_pin -dir O ethernet/CLK_322
create_bd_pin -dir O ethernet/rst_322
create_bd_pin -dir I ethernet/ARESETN

create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 ps_sector/S_AXI_PS_CONTROL


create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 ethernet/eth_rx

create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 ethernet/init_clk
create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 ethernet/gt_ref
create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 ethernet/eth_tx

#Connect Pins

connect_bd_net [get_bd_pins ethernet/CLK_322] [get_bd_ports CLK300]

connect_bd_net [get_bd_pins ps_sector/CLK_200] [get_bd_ports CLK]

connect_bd_net [get_bd_pins ps_sector/rst] [get_bd_ports rst]

connect_bd_net [get_bd_pins ethernet/rst_322] [get_bd_ports rst300]

connect_bd_net [get_bd_pins ps_sector/ARESETN] [get_bd_pins ethernet/ARESETN] -boundary_type upper

#Connect Interfaces

connect_bd_intf_net [get_bd_intf_ports eth_tx] -boundary_type upper [get_bd_intf_pins ethernet/eth_tx]
connect_bd_intf_net [get_bd_intf_ports gt_ref] -boundary_type upper [get_bd_intf_pins ethernet/gt_ref]
connect_bd_intf_net [get_bd_intf_ports init_clk] -boundary_type upper [get_bd_intf_pins ethernet/init_clk]
connect_bd_intf_net [get_bd_intf_ports eth_rx] -boundary_type upper [get_bd_intf_pins ethernet/eth_rx]
connect_bd_intf_net [get_bd_intf_ports S_AXI_CONTROL] -boundary_type upper [get_bd_intf_pins ps_sector/S_AXI_PS_CONTROL]


