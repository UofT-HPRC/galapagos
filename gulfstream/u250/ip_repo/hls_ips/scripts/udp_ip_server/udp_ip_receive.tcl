set root_dir [file dirname [file dirname [file dirname [file dirname [file dirname [file normalize [info script]]]]]]]
set ip_name "udp_ip_server"
set subdir "udp_ip_rx"
set module_name "udp_ip_receive"
cd $ip_name
open_project $module_name
set_top $module_name
add_files $root_dir/src/$ip_name/$subdir/$module_name.cpp
open_solution "solution1"
set_part {xcu250-figd2104-2L-e} -tool vivado
create_clock -period 3.103 -name default
config_rtl -reset all
csynth_design
export_design -rtl verilog
