#Author: Naif Tarafdar

set gal_path ${::env(GALAPAGOS_PATH)}
cd $gal_path/hlsBuild 
set top_part ${::env(GALAPAGOS_PART)}

#if { [info exists ::env(GALAPAGOS_PATH)] } {
#  set top_part ${::env(GALAPAGOS_PART)}
#} else {
#  set top_part ${::env(SHELLS_PART)}
#}

open_project dma_example 
set_top dma_example 
add_files $gal_path/shells/hlsTest/dma_example/srcs/dma_example.cpp 

open_solution "solution1"
set_part $top_part
create_clock -period 5 -name default
csynth_design
export_design -rtl verilog -format ip_catalog
close_project
