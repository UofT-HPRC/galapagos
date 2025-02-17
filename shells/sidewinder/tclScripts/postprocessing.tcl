

#PS_LINK addressing

#assign_bd_address [get_bd_addr_segs {ps_sector/debug_bridge_0/S_AXI/Reg0 }]
assign_bd_address -target_address_space /ps_sector/ps_link/Data [get_bd_addr_segs S_AXI_CONTROL/Reg] -force

set_property range 4K [get_bd_addr_segs {ps_sector/ps_link/Data/SEG_S_AXI_CONTROL_Reg}]
set_property offset 0xA0000000 [get_bd_addr_segs {ps_sector/ps_link/Data/SEG_S_AXI_CONTROL_Reg}]
set_property range 256M [get_bd_addr_segs {ps_sector/ps_link/Data/SEG_S_AXI_CONTROL_Reg}]