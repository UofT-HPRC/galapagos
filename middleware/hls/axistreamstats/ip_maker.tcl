# Call as:
# vivado -mode tcl -nolog -nojournal -source scripts/ip_package.tcl -tclargs $out_dir $ip_name $part_name


# INSTRUCTIONS
# ------------
# The first time you run this tcl, it will open the Vivado GUI in the IP 
# packaging mode. Go ahead and edit your IP the way you normally would, taking 
# care to copy and paste all the TCL commands that Vivado generates into the
# location labeled below.
# When you're finished, remove the "start_gui" line and uncomment all the lines
# at the end of this script


# start_gui; # Remove this line after copying TCL commands (see below)

set out_dir [lindex $argv 0]
set ip_name [lindex $argv 1]
set part_name [lindex $argv 2]
set project_name ${ip_name}_tmp_proj
create_project ${project_name} ${project_name} -part ${part_name}
add_files ${out_dir}/src
ipx::package_project -root_dir ${out_dir} -vendor mmerlini.ca -library galapagos -taxonomy /UserIP

set_property tooltip {Width of AXI Stream channel} [ipgui::get_guiparamspec -name "DATA_WIDTH" -component [ipx::current_core] ]
set_property widget {textEdit} [ipgui::get_guiparamspec -name "DATA_WIDTH" -component [ipx::current_core] ]

set_property display_name {Counter Width} [ipgui::get_guiparamspec -name "CNT_WIDTH" -component [ipx::current_core] ]
set_property tooltip {Number of bits in packet/flit count} [ipgui::get_guiparamspec -name "CNT_WIDTH" -component [ipx::current_core] ]
set_property widget {textEdit} [ipgui::get_guiparamspec -name "CNT_WIDTH" -component [ipx::current_core] ]

set_property widget {comboBox} [ipgui::get_guiparamspec -name "RESET_TYPE" -component [ipx::current_core] ]
set_property value_validation_type pairs [ipx::get_user_parameters RESET_TYPE -of_objects [ipx::current_core]]
set_property value_validation_pairs {{No reset} 0 {Active high} 1 {Active low} 2} [ipx::get_user_parameters RESET_TYPE -of_objects [ipx::current_core]]

set_property enablement_dependency {spirit:decode(id('MODELPARAM_VALUE.RESET_TYPE')) = 1} [ipx::get_bus_interfaces rst -of_objects [ipx::current_core]]

set_property enablement_dependency {spirit:decode(id('MODELPARAM_VALUE.RESET_TYPE')) = 2} [ipx::get_bus_interfaces rstn -of_objects [ipx::current_core]]

# Uncomment these lines after copying TCL commands from gui

ipx::create_xgui_files [ipx::current_core]
ipx::update_checksums [ipx::current_core]
ipx::save_core [ipx::current_core]
close_project 
exit



