#Create the cells

addip axi_interconnect mem_sector/mem_interconnect
addip axi_bram_ctrl mem_sector/axi_bram_ctrl_0
addip blk_mem_gen mem_sector/blk_mem_gen_0



#Configure the cells

set_property -dict [list CONFIG.NUM_SI {2} CONFIG.NUM_MI {1}] [get_bd_cells mem_sector/mem_interconnect]
set_property -dict [list CONFIG.Memory_Type {True_Dual_Port_RAM} CONFIG.Enable_B {Use_ENB_Pin} CONFIG.Use_RSTB_Pin {true} CONFIG.Port_B_Clock {100} CONFIG.Port_B_Write_Rate {50} CONFIG.Port_B_Enable_Rate {100}] [get_bd_cells mem_sector/blk_mem_gen_0]

#Connect Ports

connect_bd_net [get_bd_pins mem_sector/CLK_200] [get_bd_pins mem_sector/mem_interconnect/ACLK]
connect_bd_net [get_bd_pins mem_sector/CLK_200] [get_bd_pins mem_sector/mem_interconnect/S00_ACLK]
connect_bd_net [get_bd_pins mem_sector/CLK_200] [get_bd_pins mem_sector/mem_interconnect/M00_ACLK]
connect_bd_net [get_bd_pins mem_sector/CLK_200] [get_bd_pins mem_sector/mem_interconnect/S01_ACLK]
connect_bd_net [get_bd_pins mem_sector/CLK_200] [get_bd_pins mem_sector/axi_bram_ctrl_0/s_axi_aclk]

connect_bd_net [get_bd_pins mem_sector/ARESETN] [get_bd_pins mem_sector/mem_interconnect/ARESETN]
connect_bd_net [get_bd_pins mem_sector/ARESETN] [get_bd_pins mem_sector/mem_interconnect/S00_ARESETN]
connect_bd_net [get_bd_pins mem_sector/ARESETN] [get_bd_pins mem_sector/mem_interconnect/M00_ARESETN]
connect_bd_net [get_bd_pins mem_sector/ARESETN] [get_bd_pins mem_sector/mem_interconnect/S01_ARESETN]
connect_bd_net [get_bd_pins mem_sector/ARESETN] [get_bd_pins mem_sector/axi_bram_ctrl_0/s_axi_aresetn]

#Connect Interfaces

connect_bd_intf_net [get_bd_intf_pins mem_sector/axi_bram_ctrl_0/BRAM_PORTA] [get_bd_intf_pins mem_sector/blk_mem_gen_0/BRAM_PORTA]
connect_bd_intf_net [get_bd_intf_pins mem_sector/axi_bram_ctrl_0/BRAM_PORTB] [get_bd_intf_pins mem_sector/blk_mem_gen_0/BRAM_PORTB]
connect_bd_intf_net [get_bd_intf_pins mem_sector/axi_bram_ctrl_0/S_AXI] -boundary_type upper [get_bd_intf_pins mem_sector/mem_interconnect/M00_AXI]
connect_bd_intf_net [get_bd_intf_pins mem_sector/S_AXI_MEM_0] -boundary_type upper [get_bd_intf_pins mem_sector/mem_interconnect/S00_AXI]
connect_bd_intf_net [get_bd_intf_pins mem_sector/S_AXI_MEM_1] -boundary_type upper [get_bd_intf_pins mem_sector/mem_interconnect/S01_AXI]