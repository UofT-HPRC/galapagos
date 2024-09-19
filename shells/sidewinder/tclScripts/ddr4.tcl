### specifically for ddr4
#create cells within the ddr hierarchy

create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 ddr4/ddr_rst_hub
create_bd_cell -type ip -vlnv xilinx.com:ip:ddr4:2.2 ddr4/ddr4_hub
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 ddr4/ddr_inter

#configure the cells

set_property -dict [list CONFIG.C0.DDR4_TimePeriod {938} CONFIG.C0.DDR4_InputClockPeriod {3001} CONFIG.C0.DDR4_CLKOUT0_DIVIDE {5} CONFIG.C0.DDR4_MemoryType {SODIMMs} CONFIG.C0.DDR4_MemoryPart {MTA16ATF2G64HZ-2G3} CONFIG.C0.DDR4_DataWidth {64} CONFIG.C0.DDR4_CasLatency {15} CONFIG.C0.DDR4_AxiDataWidth {512} CONFIG.C0.DDR4_AxiAddressWidth {34} CONFIG.C0.CK_WIDTH {2} CONFIG.C0.CKE_WIDTH {2} CONFIG.C0.CS_WIDTH {2} CONFIG.C0.ODT_WIDTH {2}] [get_bd_cells ddr4/ddr4_hub]
set_property -dict [list CONFIG.NUM_SI {1} CONFIG.NUM_MI {2} CONFIG.ENABLE_ADVANCED_OPTIONS {1} CONFIG.XBAR_DATA_WIDTH {512} CONFIG.SYNCHRONIZATION_STAGES {5} CONFIG.S00_HAS_REGSLICE {1}] [get_bd_cells ddr4/ddr_inter]

#connect the cells and hierarchies

connect_bd_intf_net -boundary_type upper [get_bd_intf_pins ddr4_AXI] [get_bd_intf_pins ddr4/ddr_inter/S00_AXI]
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins ddr_clk_DS] [get_bd_intf_pins ddr4/ddr4_hub/C0_SYS_CLK]
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins C0_DDR4_0] [get_bd_intf_pins ddr4/ddr4_hub/C0_DDR4]

connect_bd_intf_net -boundary_type upper [get_bd_intf_pins ddr4/ddr_inter/M00_AXI] [get_bd_intf_pins ddr4/ddr4_hub/C0_DDR4_S_AXI]

connect_bd_net [get_bd_pins ddr4/ddr4_hub/c0_ddr4_ui_clk] [get_bd_pins ddr4/ddr_rst_hub/slowest_sync_clk]
connect_bd_net [get_bd_pins ddr4/ddr4_hub/c0_ddr4_ui_clk] [get_bd_pins ddr4/ddr_inter/ACLK]
connect_bd_net [get_bd_pins ddr4/ddr4_hub/c0_ddr4_ui_clk] [get_bd_pins ddr4/ddr_inter/M00_ACLK]
connect_bd_net [get_bd_pins ddr4/ddr4_hub/c0_ddr4_ui_clk] [get_bd_pins ddr4/ddr_inter/M01_ACLK]
connect_bd_net [get_bd_pins ddr4/ddr_inter/S00_ACLK] [get_bd_pins ps_sector/CLK_200] -boundary_type upper

connect_bd_net [get_bd_pins ddr4/ddr_rst_hub/ext_reset_in] [get_bd_pins ps_sector/ARESETN]
connect_bd_net [get_bd_pins ddr4/ddr_rst_hub/peripheral_reset] [get_bd_pins ddr4/ddr4_hub/sys_rst]
connect_bd_net [get_bd_pins ddr4/ddr_rst_hub/interconnect_aresetn] [get_bd_pins ddr4/ddr4_hub/c0_ddr4_aresetn]
connect_bd_net [get_bd_pins ddr4/ddr_rst_hub/interconnect_aresetn] [get_bd_pins ddr4/ddr_inter/ARESETN]
connect_bd_net [get_bd_pins ddr4/ddr_rst_hub/interconnect_aresetn] [get_bd_pins ddr4/ddr_inter/M00_ARESETN]
connect_bd_net [get_bd_pins ddr4/ddr_rst_hub/interconnect_aresetn] [get_bd_pins ddr4/ddr_inter/M01_ARESETN]
connect_bd_net [get_bd_pins ddr4/ddr_inter/S00_ARESETN] [get_bd_pins ps_sector/rstn] -boundary_type upper

assign_bd_address