set width [lindex $argv 0]
set width_str width$width

set galapagos_path $::env(GALAPAGOS_PATH)
set board_name $::env(GALAPAGOS_BOARD_NAME)
set part_name $::env(GALAPAGOS_PART)
set interface_bandwidth $::env(GALAPAGOS_BANDWIDTH)

set src_path_root $galapagos_path/middleware/hls/router

cd $galapagos_path/hlsBuild/${board_name}/ip/width$width

open_project  router 
set_top router
open_solution "solution1"
config_rtl -prefix "$width_str" 
set_part ${part_name}

if {$interface_bandwidth == "100G"} {
    add_files $src_path_root/src/router.cpp -cflags "-I $src_path_root/include -I $galapagos_path/middleware/include -D NETWORK_HEADER_LENGTH=$width -DINTERFACE_100G"
} else {
    add_files $src_path_root/src/router.cpp -cflags "-I $src_path_root/include -I $galapagos_path/middleware/include -D NETWORK_HEADER_LENGTH=$width"
}
create_clock -period 322.265625MHz -name default
# config_interface -expose_global
csynth_design
export_design -format ip_catalog
close_project

quit