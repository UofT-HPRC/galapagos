# Call as:
# vivado -mode tcl -nolog -nojournal -source scripts/ip_package.tcl -tclargs $out_dir $ip_name $part_name

set out_dir [lindex $argv 0]
set ip_name [lindex $argv 1]
set part_name [lindex $argv 2]
set project_name ${ip_name}_tmp_proj
create_project ${project_name} ${project_name} -part ${part_name}
add_files ${out_dir}/src
ipx::package_project -root_dir ${out_dir} -vendor Marco_Merlini -library fpga_bpf -taxonomy /UserIP

# DATA_WIDTH parameter GUI
set_property tooltip {Width of TDATA input} [ipgui::get_guiparamspec -name "DATA_WIDTH" -component [ipx::current_core] ]
set_property widget {textEdit} [ipgui::get_guiparamspec -name "DATA_WIDTH" -component [ipx::current_core] ]

# PIPE_STAGE parameter GUI
set_property display_name {Enable pipeline registers} [ipgui::get_guiparamspec -name "PIPE_STAGE" -component [ipx::current_core] ]
set_property tooltip {Adds a cycle of latency to ease timing} [ipgui::get_guiparamspec -name "PIPE_STAGE" -component [ipx::current_core] ]
set_property widget {checkBox} [ipgui::get_guiparamspec -name "PIPE_STAGE" -component [ipx::current_core] ]
set_property value true [ipx::get_user_parameters PIPE_STAGE -of_objects [ipx::current_core]]
set_property value true [ipx::get_hdl_parameters PIPE_STAGE -of_objects [ipx::current_core]]
set_property value_format bool [ipx::get_user_parameters PIPE_STAGE -of_objects [ipx::current_core]]
set_property value_format bool [ipx::get_hdl_parameters PIPE_STAGE -of_objects [ipx::current_core]]

# RESET_TYPE parameter GUI
set_property display_name {Reset type} [ipgui::get_guiparamspec -name "RESET_TYPE" -component [ipx::current_core] ]
set_property widget {comboBox} [ipgui::get_guiparamspec -name "RESET_TYPE" -component [ipx::current_core] ]
set_property value 1 [ipx::get_user_parameters RESET_TYPE -of_objects [ipx::current_core]]
set_property value 1 [ipx::get_hdl_parameters RESET_TYPE -of_objects [ipx::current_core]]
set_property value_validation_type pairs [ipx::get_user_parameters RESET_TYPE -of_objects [ipx::current_core]]
set_property value_validation_pairs {None 0 {Active high} 1 {Active low} 2} [ipx::get_user_parameters RESET_TYPE -of_objects [ipx::current_core]]

# TLAST_ARB parameter GUI
set_property display_name {Arbitrate on TLAST} [ipgui::get_guiparamspec -name "TLAST_ARB" -component [ipx::current_core] ]
set_property tooltip {} [ipgui::get_guiparamspec -name "TLAST_ARB" -component [ipx::current_core] ]
set_property widget {checkBox} [ipgui::get_guiparamspec -name "TLAST_ARB" -component [ipx::current_core] ]
set_property value true [ipx::get_user_parameters TLAST_ARB -of_objects [ipx::current_core]]
set_property value true [ipx::get_hdl_parameters TLAST_ARB -of_objects [ipx::current_core]]
set_property value_format bool [ipx::get_user_parameters TLAST_ARB -of_objects [ipx::current_core]]
set_property value_format bool [ipx::get_hdl_parameters TLAST_ARB -of_objects [ipx::current_core]]

# Clean up 'rst' interface bus
set_property enablement_dependency {spirit:decode(id('MODELPARAM_VALUE.RESET_TYPE')) = 1} [ipx::get_bus_interfaces rst -of_objects [ipx::current_core]]
ipx::add_bus_parameter POLARITY [ipx::get_bus_interfaces rst -of_objects [ipx::current_core]]
set_property VALUE ACTIVE_HIGH [ipx::get_bus_parameters POLARITY -of_objects [ipx::get_bus_interfaces rst -of_objects [ipx::current_core]]]

# Create 'rstn' interface bus
ipx::add_bus_interface rstn [ipx::current_core]
set_property abstraction_type_vlnv xilinx.com:signal:reset_rtl:1.0 [ipx::get_bus_interfaces rstn -of_objects [ipx::current_core]]
set_property bus_type_vlnv xilinx.com:signal:reset:1.0 [ipx::get_bus_interfaces rstn -of_objects [ipx::current_core]]
set_property enablement_dependency {spirit:decode(id('MODELPARAM_VALUE.RESET_TYPE')) = 2} [ipx::get_bus_interfaces rstn -of_objects [ipx::current_core]]
ipx::add_port_map RST [ipx::get_bus_interfaces rstn -of_objects [ipx::current_core]]
set_property physical_name rst [ipx::get_port_maps RST -of_objects [ipx::get_bus_interfaces rstn -of_objects [ipx::current_core]]]
ipx::add_bus_parameter POLARITY [ipx::get_bus_interfaces rstn -of_objects [ipx::current_core]]
set_property VALUE ACTIVE_LOW [ipx::get_bus_parameters POLARITY -of_objects [ipx::get_bus_interfaces rstn -of_objects [ipx::current_core]]]

ipx::create_xgui_files [ipx::current_core]
ipx::update_checksums [ipx::current_core]
ipx::save_core [ipx::current_core]
close_project 
exit
