puts ${::env(GALAPAGOS_PATH)}
source ${::env(GALAPAGOS_PATH)}/shells/sidewinder/tclScripts/shellTopLevel_ddr.tcl
source ${::env(GALAPAGOS_PATH)}/shells/sidewinder/tclScripts/setup_ps_link.tcl
source ${::env(GALAPAGOS_PATH)}/shells/sidewinder/tclScripts/ddr4.tcl
source ${::env(GALAPAGOS_PATH)}/shells/sidewinder/tclScripts/ethernet.tcl
validate_bd_design
return 0
