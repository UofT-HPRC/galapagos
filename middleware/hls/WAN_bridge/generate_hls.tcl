set galapagos_path $::env(GALAPAGOS_PATH)
set board_name $::env(GALAPAGOS_BOARD_NAME)
set part_name $::env(GALAPAGOS_PART)

set src_path_root $galapagos_path/middleware/hls/WAN_bridge

cd $galapagos_path/hlsBuild/${board_name}/ip

open_project WAN_bridge 
set_top WAN_bridge
open_solution "solution1"
set_part ${part_name}
#csynth path
add_files $src_path_root/src/WAN_bridge.cpp -cflags "-I $src_path_root/include -I $galapagos_path/middleware/include"
create_clock -period 250MHz -name default
# config_interface -expose_global
csynth_design
export_design -format ip_catalog
close_project

quit
