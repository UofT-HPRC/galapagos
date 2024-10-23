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
add_files -fileset sim_1 -norecurse $source_path/tb_$ip_name.sv
update_compile_order -fileset sim_1

ipx::package_project -root_dir $ip_path/ip -vendor user.org -library user -taxonomy /UserIP -import_files
set_property library control_api [ipx::current_core]
set_property vendor uoft-hprc [ipx::current_core]
set_property display_name $ip_name [ipx::current_core]
set_property description $ip_name [ipx::current_core]
ipx::associate_bus_interfaces -busif S_AXIL -clock clk [ipx::current_core]
ipx::add_bus_interface memory [ipx::current_core]
set_property abstraction_type_vlnv xilinx.com:interface:bram_rtl:1.0 [ipx::get_bus_interfaces memory -of_objects [ipx::current_core]]
set_property bus_type_vlnv xilinx.com:interface:bram:1.0 [ipx::get_bus_interfaces memory -of_objects [ipx::current_core]]
set_property interface_mode master [ipx::get_bus_interfaces memory -of_objects [ipx::current_core]]
ipx::add_port_map RST [ipx::get_bus_interfaces memory -of_objects [ipx::current_core]]
set_property physical_name memory_rst [ipx::get_port_maps RST -of_objects [ipx::get_bus_interfaces memory -of_objects [ipx::current_core]]]
ipx::add_port_map CLK [ipx::get_bus_interfaces memory -of_objects [ipx::current_core]]
set_property physical_name memory_clk [ipx::get_port_maps CLK -of_objects [ipx::get_bus_interfaces memory -of_objects [ipx::current_core]]]
ipx::add_port_map DIN [ipx::get_bus_interfaces memory -of_objects [ipx::current_core]]
set_property physical_name memory_din [ipx::get_port_maps DIN -of_objects [ipx::get_bus_interfaces memory -of_objects [ipx::current_core]]]
ipx::add_port_map EN [ipx::get_bus_interfaces memory -of_objects [ipx::current_core]]
set_property physical_name memory_en [ipx::get_port_maps EN -of_objects [ipx::get_bus_interfaces memory -of_objects [ipx::current_core]]]
ipx::add_port_map DOUT [ipx::get_bus_interfaces memory -of_objects [ipx::current_core]]
set_property physical_name memory_dout [ipx::get_port_maps DOUT -of_objects [ipx::get_bus_interfaces memory -of_objects [ipx::current_core]]]
ipx::add_port_map WE [ipx::get_bus_interfaces memory -of_objects [ipx::current_core]]
set_property physical_name memory_wen [ipx::get_port_maps WE -of_objects [ipx::get_bus_interfaces memory -of_objects [ipx::current_core]]]
ipx::add_port_map ADDR [ipx::get_bus_interfaces memory -of_objects [ipx::current_core]]
set_property physical_name memory_addr [ipx::get_port_maps ADDR -of_objects [ipx::get_bus_interfaces memory -of_objects [ipx::current_core]]]
ipx::associate_bus_interfaces -busif memory -clock memory_clk [ipx::current_core]
set_property core_revision 2 [ipx::current_core]
ipx::create_xgui_files [ipx::current_core]
ipx::update_checksums [ipx::current_core]
ipx::check_integrity [ipx::current_core]
ipx::save_core [ipx::current_core]
update_ip_catalog