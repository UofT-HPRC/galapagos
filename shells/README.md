# Shells Development 

Welcome to the Galapagos Hardware Stack. 



## Starting Devleopment

For development source the initialization script

`source init.sh <abs path to this repo> <path to vivado> <path to vivado_hls> <vivado vsn> <vivado_hls vsn>`


## Creating Example Shell

You can set up the environment variables for your board in shells-update-board. You can also add new boards by updating the init.sh script.

To create example:
vivado -source tclScripts/make-shell -tclargs <project name>


## Making New Shells



Refer to an example shell. Currently the hierarchy is a top level verilog file in <board name>/srcs/shellTop.v.
This top level file contains a shell module and a pr module. Shell is where the shell IP would reside and pr would be the user application region.


For new boards you would have to create a new directory <board name>. Follow the example hierarchy for the adm-8k5-debug board as a reference.

The make_shell script uses the tcl file <board name>/srcs/shell_bd.tcl to make the IP in the shell IP.
Modify this to add/remove new IPs. 

If changing the interfaces you would have to modify shellTop.v to pass new interfaces between shell and pr as well as ./tclScripts/pr_standard_interfaces.tcl to add new interfaces. This tcl script creates the interfaces within the user application region.



## How To Cite

The following paper may be used to cite this work:
Tarafdar, Naif, Thomas Lin, Eric Fukuda, Hadi Bannazadeh, Alberto Leon-Garcia, and Paul Chow. "Enabling flexible network FPGA clusters in a heterogeneous cloud data center." In Proceedings of the 2017 ACM/SIGDA International Symposium on Field-Programmable Gate Arrays, pp. 237-246. ACM, 2017.

Bibtex
```
@inproceedings{tarafdar2017enabling,
  title={Enabling flexible network FPGA clusters in a heterogeneous cloud data center},
  author={Tarafdar, Naif and Lin, Thomas and Fukuda, Eric and Bannazadeh, Hadi and Leon-Garcia, Alberto and Chow, Paul},
  booktitle={Proceedings of the 2017 ACM/SIGDA International Symposium on Field-Programmable Gate Arrays},
  pages={237--246},
  year={2017},
  organization={ACM}
}
```
