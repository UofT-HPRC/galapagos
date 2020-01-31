all: hello_world world middleware pick_up_vivados_dirty_socks

hello_world: .hello_world
.hello_world: hello_world.cpp
	vivado_hls hello_world.tcl	
	touch .hello_world

world: .world
.world: world.cpp
	vivado_hls world.tcl
	touch .world

middleware: .middleware
.middleware: logical.xml mapping.xml .hello_world .world
	export LOGICALFILE=$(shell realpath logical.xml)
	export MAPFILE=$(shell realpath mapping.xml)
	export PROJECTNAME=hello_world
	make -C$(GALAPAGOS_PATH) middleware
	touch .middleware

pick_up_vivados_dirty_socks:
	# Cleaning up after Vivado... 
	rm -rf vivado*	

show_reports:
	less $(GALAPAGOS_PATH)/hlsBuild/$(GALAPAGOS_BOARD_NAME)/ip/hello_world/solution1/syn/report/hello_world_csynth.rpt
	less $(GALAPAGOS_PATH)/hlsBuild/$(GALAPAGOS_BOARD_NAME)/ip/world/solution1/syn/report/world_csynth.rpt

clean: 
	rm -rf $(GALAPAGOS_PATH)/hlsBuild/$(GALAPAGOS_BOARD_NAME)/ip/hello_world/
	rm -rf $(GALAPAGOS_PATH)/hlsBuild/$(GALAPAGOS_BOARD_NAME)/ip/world/
	rm -rf $(GALAPAGOS_PATH)/projects/hello_world
	rm -rf .world
	rm -rf .hello_world
	rm -rf .middleware
	rm -rf vivado*	


# Very bizarre! GNU Make will silently add calls to g++ if you have cpp files
# in your directory (even if none of your rules or dependencies mention it).
# This is because of some implicit rules... 30 minutes I found this solution
.SUFFIXES:
