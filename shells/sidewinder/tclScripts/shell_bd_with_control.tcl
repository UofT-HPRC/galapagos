puts ${::env(GALAPAGOS_PATH)}
source ${::env(GALAPAGOS_PATH)}/shells/sidewinder/tclScripts/shellTopLevelControl.tcl
source ${::env(GALAPAGOS_PATH)}/shells/sidewinder/tclScripts/setup_ps_linkControl.tcl
source ${::env(GALAPAGOS_PATH)}/shells/sidewinder/tclScripts/ethernet.tcl
source ${::env(GALAPAGOS_PATH)}/shells/sidewinder/tclScripts/postprocessing.tcl
validate_bd_design
return 0
