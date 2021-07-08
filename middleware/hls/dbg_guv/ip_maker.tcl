# Call as:
# vivado -mode tcl -nolog -nojournal -source scripts/ip_package.tcl -tclargs $out_dir $ip_name $part_name

set out_dir [lindex $argv 0]
set ip_name [lindex $argv 1]
set part_name [lindex $argv 2]
set project_name ${ip_name}_tmp_proj
create_project ${project_name} ${project_name} -part ${part_name}
add_files ${out_dir}/src
ipx::package_project -root_dir ${out_dir} -vendor mmerlini -library yov -taxonomy /UserIP


# Fix up 'rst' interface
set_property enablement_dependency {spirit:decode(id('MODELPARAM_VALUE.RESET_TYPE')) = 1} [ipx::get_bus_interfaces rst -of_objects [ipx::current_core]]
ipx::add_bus_parameter POLARITY [ipx::get_bus_interfaces rst -of_objects [ipx::current_core]]
set_property VALUE ACTIVE_HIGH [ipx::get_bus_parameters POLARITY -of_objects [ipx::get_bus_interfaces rst -of_objects [ipx::current_core]]]

# Add 'rstn' interface
ipx::add_bus_interface rstn [ipx::current_core]
set_property abstraction_type_vlnv xilinx.com:signal:reset_rtl:1.0 [ipx::get_bus_interfaces rstn -of_objects [ipx::current_core]]
set_property bus_type_vlnv xilinx.com:signal:reset:1.0 [ipx::get_bus_interfaces rstn -of_objects [ipx::current_core]]
set_property enablement_dependency {spirit:decode(id('MODELPARAM_VALUE.RESET_TYPE')) = 2} [ipx::get_bus_interfaces rstn -of_objects [ipx::current_core]]
ipx::add_port_map RST [ipx::get_bus_interfaces rstn -of_objects [ipx::current_core]]
set_property physical_name rst [ipx::get_port_maps RST -of_objects [ipx::get_bus_interfaces rstn -of_objects [ipx::current_core]]]
ipx::add_bus_parameter POLARITY [ipx::get_bus_interfaces rstn -of_objects [ipx::current_core]]
set_property VALUE ACTIVE_LOW [ipx::get_bus_parameters POLARITY -of_objects [ipx::get_bus_interfaces rstn -of_objects [ipx::current_core]]]

# CNT_SIZE parameter
set_property display_name {Counter size} [ipgui::get_guiparamspec -name "CNT_SIZE" -component [ipx::current_core] ]
set_property tooltip {Width of drop_cnt and log_cnt} [ipgui::get_guiparamspec -name "CNT_SIZE" -component [ipx::current_core] ]
set_property widget {textEdit} [ipgui::get_guiparamspec -name "CNT_SIZE" -component [ipx::current_core] ]
set_property value 10 [ipx::get_user_parameters CNT_SIZE -of_objects [ipx::current_core]]
set_property value 10 [ipx::get_hdl_parameters CNT_SIZE -of_objects [ipx::current_core]]

# ADDR_WIDTH parameter
set_property display_name {Address width} [ipgui::get_guiparamspec -name "ADDR_WIDTH" -component [ipx::current_core] ]
set_property tooltip {The width in bits of debug core addresses} [ipgui::get_guiparamspec -name "ADDR_WIDTH" -component [ipx::current_core] ]
set_property widget {textEdit} [ipgui::get_guiparamspec -name "ADDR_WIDTH" -component [ipx::current_core] ]
set_property value 8 [ipx::get_user_parameters ADDR_WIDTH -of_objects [ipx::current_core]]
set_property value 8 [ipx::get_hdl_parameters ADDR_WIDTH -of_objects [ipx::current_core]]

# ADDR parameter
set_property display_name {Address} [ipgui::get_guiparamspec -name "ADDR" -component [ipx::current_core] ]
set_property tooltip {The unique address identifying this particular debug core} [ipgui::get_guiparamspec -name "ADDR" -component [ipx::current_core] ]
set_property widget {textEdit} [ipgui::get_guiparamspec -name "ADDR" -component [ipx::current_core] ]

# RESET_TYPE parameter
set_property display_name {Reset type} [ipgui::get_guiparamspec -name "RESET_TYPE" -component [ipx::current_core] ]
set_property tooltip {} [ipgui::get_guiparamspec -name "RESET_TYPE" -component [ipx::current_core] ]
set_property widget {comboBox} [ipgui::get_guiparamspec -name "RESET_TYPE" -component [ipx::current_core] ]
set_property value_validation_type pairs [ipx::get_user_parameters RESET_TYPE -of_objects [ipx::current_core]]
set_property value_validation_pairs {None 0 {Active high} 1 {Active low} 2} [ipx::get_user_parameters RESET_TYPE -of_objects [ipx::current_core]]

# STICKY_MODE parameter
set_property display_name {Enable sticky mode} [ipgui::get_guiparamspec -name "STICKY_MODE" -component [ipx::current_core] ]
set_property tooltip {When active, control registers are not reset to zero when latched} [ipgui::get_guiparamspec -name "STICKY_MODE" -component [ipx::current_core] ]
set_property widget {checkBox} [ipgui::get_guiparamspec -name "STICKY_MODE" -component [ipx::current_core] ]
set_property value true [ipx::get_user_parameters STICKY_MODE -of_objects [ipx::current_core]]
set_property value true [ipx::get_hdl_parameters STICKY_MODE -of_objects [ipx::current_core]]
set_property value_format bool [ipx::get_user_parameters STICKY_MODE -of_objects [ipx::current_core]]
set_property value_format bool [ipx::get_hdl_parameters STICKY_MODE -of_objects [ipx::current_core]]

# PIPE_STAGE parameter
set_property display_name {Enable pipe stage} [ipgui::get_guiparamspec -name "PIPE_STAGE" -component [ipx::current_core] ]
set_property tooltip {Adds a pipe stage to reduce fanout on command stream daisy chain} [ipgui::get_guiparamspec -name "PIPE_STAGE" -component [ipx::current_core] ]
set_property widget {checkBox} [ipgui::get_guiparamspec -name "PIPE_STAGE" -component [ipx::current_core] ]
set_property value true [ipx::get_user_parameters PIPE_STAGE -of_objects [ipx::current_core]]
set_property value true [ipx::get_hdl_parameters PIPE_STAGE -of_objects [ipx::current_core]]
set_property value_format bool [ipx::get_user_parameters PIPE_STAGE -of_objects [ipx::current_core]]
set_property value_format bool [ipx::get_hdl_parameters PIPE_STAGE -of_objects [ipx::current_core]]

ipx::create_xgui_files [ipx::current_core]
ipx::update_checksums [ipx::current_core]
ipx::save_core [ipx::current_core]
close_project 
exit



