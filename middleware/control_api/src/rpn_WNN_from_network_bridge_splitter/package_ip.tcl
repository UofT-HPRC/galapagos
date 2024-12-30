set ip_name $::env(IP_NAME)
set project_name $::env(PROJECT_NAME)
set source_path $::env(SOURCE_PATH)
set parameter_source_path $::env(PARAMETER_SOURCE_PATH)
set ip_path $::env(IP_PATH)
set project_part $::env(CTRL_PROJECT_PART)

create_project $project_name $ip_path/$project_name -part $project_part
add_files -norecurse [list $source_path/$ip_name.sv $parameter_source_path]
update_compile_order -fileset sources_1
set_property SOURCE_SET sources_1 [get_filesets sim_1]
add_files -fileset sim_1 -norecurse [list $source_path/tb_$ip_name.sv $parameter_source_path]
update_compile_order -fileset sim_1

ipx::package_project -root_dir $ip_path/ip -vendor user.org -library user -taxonomy /UserIP -import_files -force
set_property vendor uoft-hprc [ipx::current_core]
set_property library control_api [ipx::current_core]
set_property version 2.0 [ipx::current_core]
set_property display_name $ip_name [ipx::current_core]
set_property description $ip_name [ipx::current_core]
ipx::associate_bus_interfaces -busif from_network_bridge -clock i_clk [ipx::current_core]
ipx::associate_bus_interfaces -busif to_rpn_WNN_repo -clock i_clk [ipx::current_core]
ipx::associate_bus_interfaces -busif to_rpn_WNN_node -clock i_clk [ipx::current_core]
ipgui::remove_param -component [ipx::current_core] [ipgui::get_guiparamspec -name "AXIS_FROM_NB_TDEST_WIDTH" -component [ipx::current_core]]
ipgui::remove_param -component [ipx::current_core] [ipgui::get_guiparamspec -name "AXIS_FROM_NB_TUSER_WIDTH" -component [ipx::current_core]]
ipgui::remove_param -component [ipx::current_core] [ipgui::get_guiparamspec -name "AXI_LITE_ADDR_WIDTH" -component [ipx::current_core]]
set_property core_revision 2 [ipx::current_core]
ipx::create_xgui_files [ipx::current_core]
ipx::update_checksums [ipx::current_core]
ipx::check_integrity [ipx::current_core]
ipx::save_core [ipx::current_core]
#update_ip_catalog -rebuild -repo_path $ip_source_path/ip
