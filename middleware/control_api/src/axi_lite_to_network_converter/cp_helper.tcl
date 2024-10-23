set ip_source_path $::env(SOURCE_PATH)
set board_name $::env(GALAPAGOS_BOARD_NAME)
set part_name $::env(GALAPAGOS_PART)
set ip_include_path $ip_source_path/include
set ip_name $::env(IP_NAME)
set project_name $::env(PROJECT_NAME)
set ip_include_path $ip_source_path/include

cd $ip_source_path/$ip_name

open_project -reset $project_name
set_top $ip_name 
open_solution "solution1"
set_part ${part_name}
# Include $reconfig_ip_include_path to get all fmcl functions
add_files $ip_name.cpp -cflags "-I $ip_include_path"
# csim_design -clean
