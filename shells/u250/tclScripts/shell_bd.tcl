puts ${::env(GALAPAGOS_PATH)}
source ${::env(GALAPAGOS_PATH)}/shells/u250/tclScripts/shellTopLevel.tcl
source ${::env(GALAPAGOS_PATH)}/shells/u250/tclScripts/clock_reset_generator.tcl
source ${::env(GALAPAGOS_PATH)}/shells/u250/tclScripts/ethernet.tcl
regenerate_bd_layout
validate_bd_design
return 0
