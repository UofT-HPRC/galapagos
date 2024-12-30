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
set_property vendor uoft-hprc [ipx::current_core]
set_property library control_api [ipx::current_core]
set_property display_name $ip_name [ipx::current_core]
set_property description $ip_name [ipx::current_core]
# Register Address BRAM
ipx::add_bus_interface to_register_address_ROM [ipx::current_core]
set_property abstraction_type_vlnv xilinx.com:interface:bram_rtl:1.0 [ipx::get_bus_interfaces to_register_address_ROM -of_objects [ipx::current_core]]
set_property bus_type_vlnv xilinx.com:interface:bram:1.0 [ipx::get_bus_interfaces to_register_address_ROM -of_objects [ipx::current_core]]
set_property interface_mode master [ipx::get_bus_interfaces to_register_address_ROM -of_objects [ipx::current_core]]
ipx::add_port_map RST [ipx::get_bus_interfaces to_register_address_ROM -of_objects [ipx::current_core]]
set_property physical_name to_register_address_ROM_RST [ipx::get_port_maps RST -of_objects [ipx::get_bus_interfaces to_register_address_ROM -of_objects [ipx::current_core]]]
ipx::add_port_map CLK [ipx::get_bus_interfaces to_register_address_ROM -of_objects [ipx::current_core]]
set_property physical_name to_register_address_ROM_CLK [ipx::get_port_maps CLK -of_objects [ipx::get_bus_interfaces to_register_address_ROM -of_objects [ipx::current_core]]]
ipx::add_port_map EN [ipx::get_bus_interfaces to_register_address_ROM -of_objects [ipx::current_core]]
set_property physical_name to_register_address_ROM_EN [ipx::get_port_maps EN -of_objects [ipx::get_bus_interfaces to_register_address_ROM -of_objects [ipx::current_core]]]
ipx::add_port_map DOUT [ipx::get_bus_interfaces to_register_address_ROM -of_objects [ipx::current_core]]
set_property physical_name to_register_address_ROM_DOUT [ipx::get_port_maps DOUT -of_objects [ipx::get_bus_interfaces to_register_address_ROM -of_objects [ipx::current_core]]]
ipx::add_port_map ADDR [ipx::get_bus_interfaces to_register_address_ROM -of_objects [ipx::current_core]]
set_property physical_name to_register_address_ROM_ADDR [ipx::get_port_maps ADDR -of_objects [ipx::get_bus_interfaces to_register_address_ROM -of_objects [ipx::current_core]]]
ipx::associate_bus_interfaces -busif to_register_address_ROM -clock to_register_address_ROM_CLK [ipx::current_core]
# TDEST BRAM
ipx::add_bus_interface to_tdest_ROM [ipx::current_core]
set_property abstraction_type_vlnv xilinx.com:interface:bram_rtl:1.0 [ipx::get_bus_interfaces to_tdest_ROM -of_objects [ipx::current_core]]
set_property bus_type_vlnv xilinx.com:interface:bram:1.0 [ipx::get_bus_interfaces to_tdest_ROM -of_objects [ipx::current_core]]
set_property interface_mode master [ipx::get_bus_interfaces to_tdest_ROM -of_objects [ipx::current_core]]
ipx::add_port_map RST [ipx::get_bus_interfaces to_tdest_ROM -of_objects [ipx::current_core]]
set_property physical_name to_tdest_ROM_RST [ipx::get_port_maps RST -of_objects [ipx::get_bus_interfaces to_tdest_ROM -of_objects [ipx::current_core]]]
ipx::add_port_map CLK [ipx::get_bus_interfaces to_tdest_ROM -of_objects [ipx::current_core]]
set_property physical_name to_tdest_ROM_CLK [ipx::get_port_maps CLK -of_objects [ipx::get_bus_interfaces to_tdest_ROM -of_objects [ipx::current_core]]]
ipx::add_port_map EN [ipx::get_bus_interfaces to_tdest_ROM -of_objects [ipx::current_core]]
set_property physical_name to_tdest_ROM_EN [ipx::get_port_maps EN -of_objects [ipx::get_bus_interfaces to_tdest_ROM -of_objects [ipx::current_core]]]
ipx::add_port_map DOUT [ipx::get_bus_interfaces to_tdest_ROM -of_objects [ipx::current_core]]
set_property physical_name to_tdest_ROM_DOUT [ipx::get_port_maps DOUT -of_objects [ipx::get_bus_interfaces to_tdest_ROM -of_objects [ipx::current_core]]]
ipx::add_port_map ADDR [ipx::get_bus_interfaces to_tdest_ROM -of_objects [ipx::current_core]]
set_property physical_name to_tdest_ROM_ADDR [ipx::get_port_maps ADDR -of_objects [ipx::get_bus_interfaces to_tdest_ROM -of_objects [ipx::current_core]]]
ipx::associate_bus_interfaces -busif to_tdest_ROM -clock to_tdest_ROM_CLK [ipx::current_core]
ipx::associate_bus_interfaces -busif from_WAN -clock i_clk [ipx::current_core]
ipx::associate_bus_interfaces -busif to_LAN -clock i_clk [ipx::current_core]
set_property core_revision 2 [ipx::current_core]
ipx::create_xgui_files [ipx::current_core]
ipx::update_checksums [ipx::current_core]
ipx::check_integrity [ipx::current_core]
ipx::save_core [ipx::current_core]
update_ip_catalog