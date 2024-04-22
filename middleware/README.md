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
- TCL script to generate PR block diagram (PR Script) is written using Python functions inside the `middleware/python` folder. Check the README there for details.
  - TCL script to generate Network region (Network Script) is pre-written, in `middleware/tclScripts/pr_udp100_bridge.tcl`. The Python scripts insert a `source middleware/tclScripts/pr_udp100_bridge.tcl` command at the start of the PR Script.
  - Multiple Network Scripts are available, depending on user preference (TCP, ethernet bridges, etc). 
  - Python functions then fill the rest of the PR Script with instructions to build and connect the Application Region.
  - Python functions will alter the Application Region based on what Network type the user has selected. 
- TCL script to generate Shell (Shell Script) is already pre-written. The Shell Script
