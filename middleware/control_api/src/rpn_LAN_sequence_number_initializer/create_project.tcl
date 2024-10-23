set ip_name $::env(IP_NAME)
set project_name $::env(PROJECT_NAME)
set source_path $::env(SOURCE_PATH)
set parameter_source_path $::env(PARAMETER_SOURCE_PATH)
set ip_path $::env(IP_PATH)
set project_part $::env(CTRL_PROJECT_PART)

create_project $project_name $ip_path/$project_name -part $project_part
add_files -norecurse [list $source_path $parameter_source_path]
update_compile_order -fileset sources_1
set_property SOURCE_SET sources_1 [get_filesets sim_1]
add_files -fileset sim_1 -norecurse [list $source_path/sim/tb_$ip_name.sv $parameter_source_path]
update_compile_order -fileset sim_1