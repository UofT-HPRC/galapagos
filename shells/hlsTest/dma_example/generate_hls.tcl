#Author: Naif Tarafdar

cd hlsBuild 

if { [info exists ::env(GALAPAGOS_PATH)] } {
  set top_part ${::env(GALAPAGOS_PART)}
} else {
  set top_part ${::env(SHELLS_PART)}
}

open_project hlsTest 
set_top hlsTest
add_files ../hlsTest/hlsTest.cpp 
open_solution "solution1"
set_part $top_part
create_clock -period 5 -name default
csynth_design
export_design -rtl verilog -format ip_catalog
close_project
