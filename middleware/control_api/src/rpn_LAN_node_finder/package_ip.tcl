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
ipx::add_bus_interface kernel_to_node_ROM [ipx::current_core]
set_property abstraction_type_vlnv xilinx.com:interface:bram_rtl:1.0 [ipx::get_bus_interfaces kernel_to_node_ROM -of_objects [ipx::current_core]]
set_property bus_type_vlnv xilinx.com:interface:bram:1.0 [ipx::get_bus_interfaces kernel_to_node_ROM -of_objects [ipx::current_core]]
set_property interface_mode master [ipx::get_bus_interfaces kernel_to_node_ROM -of_objects [ipx::current_core]]
ipx::add_port_map RST [ipx::get_bus_interfaces kernel_to_node_ROM -of_objects [ipx::current_core]]
set_property physical_name kernel_to_node_ROM_RST [ipx::get_port_maps RST -of_objects [ipx::get_bus_interfaces kernel_to_node_ROM -of_objects [ipx::current_core]]]
ipx::add_port_map CLK [ipx::get_bus_interfaces kernel_to_node_ROM -of_objects [ipx::current_core]]
set_property physical_name kernel_to_node_ROM_CLK [ipx::get_port_maps CLK -of_objects [ipx::get_bus_interfaces kernel_to_node_ROM -of_objects [ipx::current_core]]]
ipx::add_port_map EN [ipx::get_bus_interfaces kernel_to_node_ROM -of_objects [ipx::current_core]]
set_property physical_name kernel_to_node_ROM_EN [ipx::get_port_maps EN -of_objects [ipx::get_bus_interfaces kernel_to_node_ROM -of_objects [ipx::current_core]]]
ipx::add_port_map DOUT [ipx::get_bus_interfaces kernel_to_node_ROM -of_objects [ipx::current_core]]
set_property physical_name kernel_to_node_ROM_DOUT [ipx::get_port_maps DOUT -of_objects [ipx::get_bus_interfaces kernel_to_node_ROM -of_objects [ipx::current_core]]]
ipx::add_port_map ADDR [ipx::get_bus_interfaces kernel_to_node_ROM -of_objects [ipx::current_core]]
set_property physical_name kernel_to_node_ROM_ADDR [ipx::get_port_maps ADDR -of_objects [ipx::get_bus_interfaces kernel_to_node_ROM -of_objects [ipx::current_core]]]
ipx::associate_bus_interfaces -busif kernel_to_node_ROM -clock kernel_to_node_ROM_CLK [ipx::current_core]
ipx::associate_bus_interfaces -busif from_ctrl_LAN -clock i_clk [ipx::current_core]
ipx::associate_bus_interfaces -busif to_LAN_TX -clock i_clk [ipx::current_core]
ipgui::remove_param -component [ipx::current_core] [ipgui::get_guiparamspec -name "AXIS_FROM_NB_TDEST_WIDTH" -component [ipx::current_core]]
ipgui::remove_param -component [ipx::current_core] [ipgui::get_guiparamspec -name "AXIS_FROM_NB_TUSER_WIDTH" -component [ipx::current_core]]
ipgui::remove_param -component [ipx::current_core] [ipgui::get_guiparamspec -name "AXI_LITE_ADDR_WIDTH" -component [ipx::current_core]]
set_property core_revision 2 [ipx::current_core]
ipx::create_xgui_files [ipx::current_core]
ipx::update_checksums [ipx::current_core]
ipx::check_integrity [ipx::current_core]
ipx::save_core [ipx::current_core]