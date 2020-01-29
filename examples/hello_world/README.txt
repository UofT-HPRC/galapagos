=====================
GALAPAGOS HELLO WORLD
=====================

This example contains:
	
	 - hello_world.cpp, a Galapagos HLS kernel with DEST = 1 that contantly
	   broadcasts a message to the kernel with DEST = 2

	 - world.cpp, a Galapagos HLS kernel with DEST = 2 that ignores all
	   incoming messages

	 - generate_ips.tcl, a script that invokes Vivado HLS in order to compile
	   the HLS code into Verilog

	 - logical.xml, the logical file

	 - mapping.xml, the mapping file
	 
	 - A Makefile


