create_clock -period 10.000 [get_ports init_clk_p]
set_property PACKAGE_PIN F31 [get_ports {init_clk_n[0]}]
set_property IOSTANDARD  LVDS [get_ports {init_clk_n[0]}]
set_property PACKAGE_PIN G31 [get_ports {init_clk_p[0]}]
set_property IOSTANDARD  LVDS [get_ports {init_clk_p[0]}]

create_clock -period 6.400 [get_ports gt_1_ref_clk_p]
set_property PACKAGE_PIN P43 [get_ports gt_1_ref_clk_n]
set_property PACKAGE_PIN P42 [get_ports gt_1_ref_clk_p]

set_property PACKAGE_PIN G49  [get_ports {qsfp1_4x_gtx_n[0]}]
set_property PACKAGE_PIN G48  [get_ports {qsfp1_4x_gtx_p[0]}]
set_property PACKAGE_PIN G54  [get_ports {qsfp1_4x_grx_n[0]}]
set_property PACKAGE_PIN G53  [get_ports {qsfp1_4x_grx_p[0]}]
set_property PACKAGE_PIN E49  [get_ports {qsfp1_4x_gtx_n[1]}]
set_property PACKAGE_PIN E48  [get_ports {qsfp1_4x_gtx_p[1]}]
set_property PACKAGE_PIN F52  [get_ports {qsfp1_4x_grx_n[1]}]
set_property PACKAGE_PIN F51  [get_ports {qsfp1_4x_grx_p[1]}]
set_property PACKAGE_PIN C49  [get_ports {qsfp1_4x_gtx_n[2]}]
set_property PACKAGE_PIN C48  [get_ports {qsfp1_4x_gtx_p[2]}]
set_property PACKAGE_PIN E54  [get_ports {qsfp1_4x_grx_n[2]}]
set_property PACKAGE_PIN E53  [get_ports {qsfp1_4x_grx_p[2]}]
set_property PACKAGE_PIN A50  [get_ports {qsfp1_4x_gtx_n[3]}]
set_property PACKAGE_PIN A49  [get_ports {qsfp1_4x_gtx_p[3]}]
set_property PACKAGE_PIN D52  [get_ports {qsfp1_4x_grx_n[3]}]
set_property PACKAGE_PIN D51  [get_ports {qsfp1_4x_grx_p[3]}]