# Overview
This folder contains Python scripts used to demonstrate the framework, and the Python scripts used to write the TCL scripts that generate Galapagos projects.

# How Galapagos Writes TCL
- TCL script to generate PR region is written using Python scripts inside the `middleware/python` folder
- `tclMe.py`: Contains helper functions to write the TCL code
- `tclFileGenerator.py`: Writes the TCL code
  - `userApplicationRegion`: Writes the TCL code for generating the PR/application region block diagram
  - `bridgeConnections`: Writes the TCL code for generating the PR/network region block diagram
- TCL script to generate Shell region is pre-written and cannot be modified at runtime
  - Contained in `middleware/tclScripts/pr_udp100_bridge.tcl`
- Top-level file written by `python/createTopLevel.py`
  - Uses `verilog/shellTop_ptX.v` files as a basis for the top-level file
 
# Writing the TCL for PR/Application Region
- All writing performed in `userApplicationRegion` function inside `tclFileGenerator.py`
- `tcl_user_app`: `tclMeFile` class object from `tclMe.py`, contains lots of helper functions to help write the TCL
  - Inside the object: `tcl_user_app.fpga` links to an FPGA node object that contains parsed data from the logical and Map Files
- TCL is written through a series of software passes. For example, `userApplicationRegionKernelsInst` adds the kernels used for the Data Path of the Application Region
- Each pass is given `tcl_user_app`, and contributes to it.

# tclMeFile API
- Full details are found in the `tclMe.py` file
- `tcl_user_app.instBlock(ip)`:
- `tcl_user_app.instModule(ip)`:
- `tcl_user_app.makeConnection(conn_type, source, sink)`: Connects ports from source and destination together
  - `conn_type`: 'net' or 'intf' depending on if net or interface connection
  - `source/destination`: Dictionary that describes the source or destination with the following fields:
    - 'name': Module name
    - 'type': should match 'net' or 'intf' from above
    - 'port_name': Name of the port to be connected
    - eg. `{'name':'applicationRegion/custom_switch_inst', 'type':'intf', 'port_name':'network_table_PORTA'}`
- `tcl_user_app.setProperties(inst_name, properties)`: Sets the properties for the specified module
  - `inst_name`: Name of the module Eg. `applicationRegion/blk_mem_switch_rom`
  - `properties`: List of properties in TCL format (same syntax as seen in TCL console)
    - eg. `properties = ['CONFIG.Memory_Type {Single_Port_ROM}','CONFIG.Enable_32bit_Address {true}']` (exact commands as seen in a TCL console)
- `tcl_user_app.setPortProperties(inst_name, properties)`:
- `tcl_user_app.setGeneralProperties(inst_name, properties)`: Used to 
