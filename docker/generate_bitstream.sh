cd /opt/Xilinx
source vivado_setup 2018.1
cd /home/user/galapagos
vivado -mode batch -source shells/tclScripts/make_shell.tcl -tclargs --project_name 1  --pr_tcl /home/user/galapagos/projects/middleware_test/1/1.tcl --dir middleware_test --start_synth 1
