set root_dir [file dirname [file dirname [file dirname [file dirname [file dirname [file normalize [info script]]]]]]]
set ip_name "ether_protocol_spliter"
set module_name "ether_protocol_spliter"
open_project $module_name
set_top $module_name
add_files $root_dir/src/$ip_name/$module_name.cpp
open_solution "solution1"
set_part {xcu200-fsgd2104-2-e} -tool vivado
config_rtl -reset all
create_clock -period 3.103 -name default
csynth_design
export_design -rtl verilog
