set galapagos_path $::env(GALAPAGOS_PATH)
set board_name $::env(GALAPAGOS_BOARD_NAME)
set part_name $::env(GALAPAGOS_PART)
set interface_bandwidth $::env(GALAPAGOS_BANDWIDTH)
set src_path_root $galapagos_path/middleware/hls/WAN_fast_fetch
cd $galapagos_path/hlsBuild/${board_name}/ip

open_project WAN_fast_fetch 
set_top WAN_fast_fetch
open_solution "solution1"
set_part ${part_name}
#csynth path
if {$interface_bandwidth == "100G"} {
    add_files $src_path_root/src/WAN_fast_fetch.cpp -cflags "-I $src_path_root/include -I $galapagos_path/middleware/include -DINTERFACE_100G"
} else {
    add_files $src_path_root/src/WAN_fast_fetch.cpp -cflags "-I $src_path_root/include -I $galapagos_path/middleware/include "
}
create_clock -period 322.265625MHz -name default
csynth_design
export_design -format ip_catalog
close_project

quit