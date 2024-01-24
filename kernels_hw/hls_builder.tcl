set infile [open "Namefile.txt" r]
set ip_name [gets $infile]
close $infile
set infile [open "Speed_grade.txt" r]
set speed [gets $infile]
close $infile
set infile [open "part_number.txt" r]
set part_num [gets $infile]
close $infile
set module_name $ip_name
cd $module_name
open_project $module_name
set_top $module_name
add_files ../$module_name.cpp
open_solution "solution1"
set_part $part_num
# -tool vivado
create_clock -period $speed -name default
config_rtl -reset all -reset_level low
# config_interface -expose_global
csynth_design
export_design -rtl verilog
