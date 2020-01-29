set galapagos_path $::env(GALAPAGOS_PATH)
set board_name $::env(GALAPAGOS_BOARD_NAME)
set part_name $::env(GALAPAGOS_PART)

set src_path_root $galapagos_path/examples/hello_world

# Does this still work? We'll find out, I guess...
cd $galapagos_path/hlsBuild/${board_name}/ip

open_project hello_world
set_top hello_world
open_solution "solution1"
set_part ${part_name}
#csynth path
add_files $src_path_root/hello_world.cpp -cflags "-I $galapagos_path/middleware/include -I $galapagos_path/middleware/CPP_lib/Galapagos_lib"
create_clock -period 250MHz -name default
config_interface -expose_global
csynth_design
export_design -format ip_catalog
close_project

quit

