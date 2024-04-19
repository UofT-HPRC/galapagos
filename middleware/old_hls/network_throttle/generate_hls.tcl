set galapagos_path $::env(GALAPAGOS_PATH)
set board_name $::env(GALAPAGOS_BOARD_NAME)
set part_name $::env(GALAPAGOS_PART)
set interface_bandwidth $::env(GALAPAGOS_BANDWIDTH)
set src_path_root $galapagos_path/middleware/old_hls/network_throttle
cd $galapagos_path/oldhlsBuild/${board_name}/ip

open_project network_throttle 
set_top network_throttle
open_solution "solution1"
set_part ${part_name}

add_files $src_path_root/src/network_throttle.cpp -cflags "-I $src_path_root/include -I $galapagos_path/middleware/include_old_hls"
create_clock -period 322.265625MHz -name default
csynth_design
export_design -format ip_catalog
close_project

quit
