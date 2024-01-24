startgroup

current_bd_design [get_bd_designs pr]
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 applicationRegion/userprt
set_property -dict [list \
  CONFIG.CONST_VAL {0} \
  CONFIG.CONST_WIDTH {16} \
] [get_bd_cells applicationRegion/userprt]

create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 applicationRegion/idA
set_property -dict [list \
  CONFIG.CONST_VAL {1} \
  CONFIG.CONST_WIDTH {24} \
] [get_bd_cells applicationRegion/idA]

create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 applicationRegion/idB
set_property -dict [list \
  CONFIG.CONST_VAL {2} \
  CONFIG.CONST_WIDTH {24} \
] [get_bd_cells applicationRegion/idB]

create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 applicationRegion/destCPU
set_property -dict [list \
  CONFIG.CONST_VAL {3} \
  CONFIG.CONST_WIDTH {24} \
] [get_bd_cells applicationRegion/destCPU]

connect_bd_net [get_bd_pins applicationRegion/userprt/dout] [get_bd_pins applicationRegion/multiplierA_inst_1/user_prt]
connect_bd_net [get_bd_pins applicationRegion/userprt/dout] [get_bd_pins applicationRegion/multiplierB_inst_2/user_prt]

connect_bd_net [get_bd_pins applicationRegion/idA/dout] [get_bd_pins applicationRegion/multiplierA_inst_1/id_prt]
connect_bd_net [get_bd_pins applicationRegion/idB/dout] [get_bd_pins applicationRegion/multiplierA_inst_1/dest_prt]
connect_bd_net [get_bd_pins applicationRegion/idB/dout] [get_bd_pins applicationRegion/multiplierB_inst_2/id_prt]
connect_bd_net [get_bd_pins applicationRegion/destCPU/dout] [get_bd_pins applicationRegion/multiplierB_inst_2/dest_prt]

endgroup
