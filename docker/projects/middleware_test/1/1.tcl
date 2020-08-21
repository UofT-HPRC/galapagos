# /middleware/python/tclFileGenerator.py:2018
if { ! [info exists top_dir] } {
    set top_path ${::env(GALAPAGOS_PATH)}
}
if { ! [info exists default_dir] } {
    set default_dir middleware_test
}

# /middleware/python/tclFileGenerator.py:2020
source /home/user/galapagos/shells/tclScripts/pr_standard_interfaces.tcl
# /middleware/python/tclFileGenerator.py:2022
source /home/user/galapagos/projects/middleware_test/1/1_net.tcl
# /middleware/python/tclFileGenerator.py:2023
source /home/user/galapagos/projects/middleware_test/1/1_app.tcl
# /middleware/python/tclFileGenerator.py:2024
source /home/user/galapagos/projects/middleware_test/1/1_bridge_connections.tcl
# /middleware/python/tclFileGenerator.py:2033
validate_bd_design
