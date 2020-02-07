# Call as:
# vivado -mode tcl -nolog -nojournal -source scripts/ip_package.tcl -tclargs $out_dir $ip_name $part_name

set out_dir [lindex $argv 0]
set ip_name [lindex $argv 1]
set part_name [lindex $argv 2]
set project_name ${ip_name}_tmp_proj
create_project ${project_name} ${project_name} -part ${part_name}
add_files ${out_dir}/src
ipx::package_project -root_dir ${out_dir} -vendor Marco_Merlini -library fpga_bpf -taxonomy /UserIP

# Create dropdown box for reset type
set_property widget {comboBox} [ipgui::get_guiparamspec -name "RESET_TYPE" -component [ipx::current_core] ]
set_property value_validation_type pairs [ipx::get_user_parameters RESET_TYPE -of_objects [ipx::current_core]]
set_property value_validation_pairs {{No reset} 0 {Active high} 1 {Active low} 2} [ipx::get_user_parameters RESET_TYPE -of_objects [ipx::current_core]]

# Auto-hide rst port when unused
set_property enablement_dependency {spirit:decode(id('MODELPARAM_VALUE.RESET_TYPE')) = 1} [ipx::get_bus_interfaces rst -of_objects [ipx::current_core]]

# Auto-hide rstn port when unused
set_property enablement_dependency {spirit:decode(id('MODELPARAM_VALUE.RESET_TYPE')) = 2} [ipx::get_bus_interfaces rstn -of_objects [ipx::current_core]]

ipx::create_xgui_files [ipx::current_core]
ipx::update_checksums [ipx::current_core]
ipx::save_core [ipx::current_core]
close_project 
exit



