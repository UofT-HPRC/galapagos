all: .hello_world .world middleware pick_up_vivados_dirty_socks


.hello_world: hello_world.cpp
	vivado_hls hello_world.tcl	
	touch .hello_world

.world: world.cpp
	vivado_hls world.tcl
	touch .world


middleware: logical.xml mapping.xml
	export LOGICALFILE=$(shell realpath logical.xml)
	export MAPFILE=$(shell realpath mapping.xml)
	export PROJECTNAME=hello_world
	make -C$(GALAPAGOS_PATH) middleware

pick_up_vivados_dirty_socks:
	rm -rf vivado*	

show_reports:
	less $(GALAPAGOS_PATH)/hlsBuild/$(GALAPAGOS_BOARD_NAME)/ip/hello_world/solution1/syn/report/hello_world_csynth.rpt
	less $(GALAPAGOS_PATH)/hlsBuild/$(GALAPAGOS_BOARD_NAME)/ip/world/solution1/syn/report/world_csynth.rpt

