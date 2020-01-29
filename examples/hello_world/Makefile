all: .hello_world .world middleware pick_up_vivados_dirty_socks


.hello_world: hello_world.cpp
	vivado_hls hello_world.tcl	
	touch .hello_world

.world: world.cpp
	vivado_hls world.tcl
	touch .world


middleware:
	#TODO

pick_up_vivados_dirty_socks:
	rm -rf vivado*	

show_reports:
	less $(GALAPAGOS_PATH)/hlsBuild/$(GALAPAGOS_BOARD_NAME)/ip/hello_world/solution1/syn/report/hello_world_csynth.rpt
	less $(GALAPAGOS_PATH)/hlsBuild/$(GALAPAGOS_BOARD_NAME)/ip/world/solution1/syn/report/world_csynth.rpt

