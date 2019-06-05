################################################################################
# Parse Arguments
################################################################################

if { $::argc > 2 } {
  for {set i 2} {$i < $::argc} {incr i} {
      if {$i == 2} {
        set Project [lindex $::argv $i]
      }
  }
} else {
  puts "Argument error. The project name must be an argument\n"
  exit
}

################################################################################
# Variables
################################################################################

if { [info exists ::env(GALAPAGOS_PATH)] } {
  source ${::env(GALAPAGOS_PATH)}/shells/tclScripts/utilities.tcl
} elseif [info exists ::env(SHELLS_PATH)] {
  source ${::env(SHELLS_PATH)}/tclScripts/utilities.tcl
} else {
  puts ""
    catch {common::send_msg_id "BD_TCL-109" "ERROR" "No root path found: \
      have you sourced init.sh?"}
    return 1
}

# defined in utilities.tcl
set result [define_env]
if { $result != 0 } {
  return $result
}

set Solution $top_part_family
set Device $top_part
set Flow ""
set Clock 4.0
set DefaultFlag 1

set src_dir $top_shells/hlsTest/$Project/srcs
set cflag -I$top_shells/hlsTest/$Project/include
set test_dir $top_shells/hlsTest/$Project/test

################################################################################
# Body
################################################################################

# Project settings
open_project $Project -reset

# Add the files for synthesis
if {! [catch {glob $src_dir/*} yikes] } {
  set constFiles [glob $src_dir/*]
  puts constFiles
  foreach src_file $constFiles { 
    add_files $src_file -cflags $cflag
  }
}

# Add testbench files for co-simulation
if {! [catch {glob $test_dir/*} yikes] } {
  set constFiles [glob $test_dir/*]
  foreach src_file $constFiles { 
    add_files -tb  $test_dir/${Project}_tb.cpp -cflags $cflag
  }
}

# Set top module of the design
set_top $Project

# Solution settings
open_solution -reset $Solution

# Set module prefix
config_rtl -encoding auto -prefix ${Project}_ -reset all -reset_level low

# Add library
set_part $Device

# Set the target clock period
create_clock -period $Clock

#################
# C SIMULATION
#################
#csim_design

#############
# SYNTHESIS #
#############
csynth_design

#################
# CO-SIMULATION #
#################
#cosim_design -rtl verilog -trace_level all

##################
# IMPLEMENTATION #
##################
export_design -format ipxact

exit
