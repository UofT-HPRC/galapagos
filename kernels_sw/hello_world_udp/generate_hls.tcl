set galapagos_path $::env(GALAPAGOS_PATH)
set board_name $::env(GALAPAGOS_BOARD_NAME)
set part_name $::env(GALAPAGOS_PART)
set interface_bandwidth $::env(GALAPAGOS_BANDWIDTH)
set curDir [pwd]
cd $galapagos_path/hlsBuild/${board_name}/ip

open_project kern_send 
set_top kern_send 
open_solution "solution1"
set_part ${part_name}
#csynth path
if {$interface_bandwidth == "100G"} {
    add_files $curDir/kern.cpp -cflags "-std=c++0x -I $curDir -I $galapagos_path/middleware/include -DINTERFACE_100G"
} else {
    add_files $curDir/kern.cpp -cflags "-std=c++0x -I $curDir -I $galapagos_path/middleware/include "
}
create_clock -period 322.265625MHz -name default
csynth_design
export_design -format ip_catalog
close_project

open_project kern_loopback
set_top kern_loopback 
open_solution "solution1"
set_part ${part_name}
#csynth path
if {$interface_bandwidth == "100G"} {
    add_files $curDir/kern.cpp -cflags "-std=c++0x -I $curDir -I $galapagos_path/middleware/include -DINTERFACE_100G"
} else {
    add_files $curDir/kern.cpp -cflags "-std=c++0x -I $curDir -I $galapagos_path/middleware/include "
}
create_clock -period 322.265625MHz -name default
csynth_design
export_design -format ip_catalog
close_project

cd $curDir
quit
