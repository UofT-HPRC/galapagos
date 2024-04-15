# Overview

# How Galapagos compiles IP:
- IP is compiled based on calling functions in the main folder's Makefile (Main Makefile)
- In all cases, Main Makefile compiles IP by calling functions in the middleware folder's Makefile (Middleware Makefile)
-To compile all the HLS cores:
  - User calls `make hlsmiddleware` in Main Makefile.
  - Main Makefile calls `make hlsmiddleware` in Middleware Makefile
  - This calls the makefile inside the folder containing all HLS IP cores (HLS Makefile).
  - The HLS Makefile calls Makefiles to compile each IP core.
  - These Makefiles run TCL scripts in Vitis that compile the HLS IP.
  - NOTE: These TCL scripts automatically change directory to `galapagos/hlsBuild`, thus building all IP inside `galapagos/hlsBuild`.

# How Middleware Makefile is Organized:
- The source files for each type of IP (HLS middleware, old HLS middleware, control, etc) sit in their own individual folders.
- Each folder contains Makefile that compiles the IP
- Path to each folder is found at the top of the Middleware Makefile
- When Main Makefile calls for a type of IP to be built, Middleware Makefile calls the Makefile of the IP's folder (IP Makefile)
- Middleware Makefile only supports re-making ALL the IP inside the folder, cannot make specific modules

# Adding IP to Middleware:
- Add your IP's source files as a folder to the Middleware folder. Include a Makefile that compiles all the IP (IP Makefile), and has a `clean` function.
    - HINT: Middleware Makefile's `make clean` cleans every folder's IP, so include a prerequisite inside your Makefile that automatically cleans your IP files before compilation begins (eg. `make all_ip: clean`). This ensures that all of your IP cores are cleaned before you build the kernels again.
- Add the path to your folder to the Middleware Makefile.
- Add a function in the Middleware Makefile that will call the IP Makefile to build all the IP.
- Add a call in the Middleware Makefile's `clean` function to the `clean` function in the IP Makefile. This ensures all your IP is cleaned when all IP is cleaned.

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
