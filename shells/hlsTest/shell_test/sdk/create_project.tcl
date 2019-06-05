################################################################################
# Parse Arguments
################################################################################

set workspace_path null
set hdf_file null
set project_name null
set processor null
set src_path null

if { $::argc > 0 } {
  for {set i 0} {$i < $::argc} {incr i} {
    set option [string trim [lindex $::argv $i]]
    switch -regexp -- $option {
      "--workspace_path" { incr i; set workspace_path [lindex $::argv $i] }
      "--hdf_file" { incr i; set hdf_file [lindex $::argv $i] }
      "--project_name" { incr i; set project_name [lindex $::argv $i] }
      "--processor" { incr i; set processor [lindex $::argv $i] }
      "--src_path" { incr i; set src_path [lindex $::argv $i] }
      default {
        if { [regexp {^-} $option] } {
          puts "ERROR: Unknown option '$option' specified\n"
          return 1
        }
      }
    }
  }
} else {
  puts "ERROR: no arguments specified to create_project.tcl"
  return 1
}

################################################################################
# Valididate arguments
################################################################################

if { $workspace_path == "null" } {
  puts "ERROR: workspace_path must be specified as an argument"
  return 1
}

if { $hdf_file == "null" } {
  set hdf_file shellTop.hdf
  puts "WARNING: No hdf_file specified. Using default value of $hdf_file"
}

if { $project_name == "null" } {
  puts "ERROR: project_name must be specified as an argument"
  return 1
}

if { $processor == "null" } {
  set processor ps7_cortexa9_0
  puts "WARNING: No processor specified. Using default value of $processor"
}

if { $src_path == "null" } {
  puts "WARNING: No src_path specified. Using default application shell_test"
}

################################################################################
# Create project
################################################################################

if { [info exists ::env(GALAPAGOS_PATH) ] } {
  set top_path ${::env(GALAPAGOS_PATH)}/shells
} elseif { [info exists ::env(SHELLS_PATH) ] } {
  set top_path ${::env(SHELLS_PATH)}
} else {
  puts "No PATH variable set in the environment"
  return 1
}

set bsp ${project_name}_bsp
set app ${project_name}_app
set shell_test $top_path/hlsTest/shell_test/sdk

if { $src_path == "null" } {
  set src_path $shell_test/src
}

setws $workspace_path
createhw -name $project_name -hwspec $workspace_path/$hdf_file
createbsp -name $bsp -hwproject $project_name -proc $processor -os standalone
setlib -bsp $bsp -lib lwip141 -ver 2.0
updatemss -mss $workspace_path/$bsp/system.mss
regenbsp -bsp $bsp
createapp -name $app -hwproject $project_name -proc $processor -os standalone \
  -lang C -app {Empty Application} -bsp $bsp
importsources -name $app -path $src_path

source $shell_test/update_lwip.tcl
update_lwip $workspace_path $bsp $app $processor $shell_test/lwip

projects -build -type bsp -name $bsp
projects -build -type app -name $app
return 0
