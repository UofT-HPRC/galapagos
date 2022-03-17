=====================
GALAPAGOS HELLO WORLD
=====================

This example contains:
	
	 - hello_world.cpp, a Galapagos HLS kernel with DEST = 1 that contantly
	   broadcasts a message to the kernel with DEST = 2

	 - world.cpp, a Galapagos HLS kernel with DEST = 2 that ignores all
	   incoming messages

	 - hello_world.tcl and world.tcl. Scripts that invoke Vivado HLS to compile
	   hello_world.cpp and world.cpp into Verilog

	 - logical.xml, the logical file

	 - mapping.xml, the mapping file
	 
	 - A Makefile


Make sure you have followed the Galapagos setup instructions (see
documentation/galapagos_flow.txt). This Makefile will generate a Vivado project
in projects/hello_world/0/

