# Create instance clk_wiz_0 and set properties

addip clk_wiz clock_reset_generator/clk_wiz_0
set_property -dict [list CONFIG.PRIM_IN_FREQ.VALUE_SRC USER] [get_bd_cells clock_reset_generator/clk_wiz_0]
set_property -dict [list \
  CONFIG.CLKIN1_JITTER_PS {33.330000000000005} \
  CONFIG.CLKOUT1_JITTER {88.577} \
  CONFIG.CLKOUT1_PHASE_ERROR {77.836} \
  CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {200.000} \
  CONFIG.PRIM_IN_FREQ {100.000} \
  CONFIG.PRIM_SOURCE {Differential_clock_capable_pin} \
  CONFIG.PRIM_IN_FREQ.VALUE_SRC PROPAGATED \
] [get_bd_cells clock_reset_generator/clk_wiz_0]

# Create instance clk_wiz_rst and set properties

addip xlconstant clock_reset_generator/clk_wiz_rst
set_property CONFIG.CONST_VAL {0} [get_bd_cells clock_reset_generator/clk_wiz_rst]

# Create instance locked_inv and set properties

addip util_vector_logic clock_reset_generator/locked_inv
set_property -dict [list \
  CONFIG.C_OPERATION {not} \
  CONFIG.C_SIZE {1} \
] [get_bd_cells clock_reset_generator/locked_inv]

# Set connections

connect_bd_intf_net [get_bd_intf_pins clock_reset_generator/init_clk] [get_bd_intf_pins clock_reset_generator/clk_wiz_0/CLK_IN1_D]
connect_bd_net [get_bd_pins clock_reset_generator/clk_wiz_rst/dout] [get_bd_pins clock_reset_generator/clk_wiz_0/reset]
connect_bd_net [get_bd_pins clock_reset_generator/locked_inv/Op1] [get_bd_pins clock_reset_generator/clk_wiz_0/locked]
connect_bd_net [get_bd_pins clock_reset_generator/init_clk_200] [get_bd_pins clock_reset_generator/clk_wiz_0/clk_out1]
connect_bd_net [get_bd_pins clock_reset_generator/rstn] [get_bd_pins clock_reset_generator/clk_wiz_0/locked]
connect_bd_net [get_bd_pins clock_reset_generator/rst] [get_bd_pins clock_reset_generator/locked_inv/Res]