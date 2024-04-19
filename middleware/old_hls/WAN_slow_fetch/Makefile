################################################################################
# Makefile for Galapagos middleware network_bridge_ethernet
#
# Author: Naif Tarafdar, Varun Sharma
#
# Changelog:
#	1.0 - Mar. 4 2019 - Created (NT)
#	1.1 - Apr. 9 2019 - Added include.mk (VS)
################################################################################

# defines guard-%



HLSMIDDLEWAREIP = WAN_slow_fetch

UNIT_TEST=-I$(GALAPAGOS_PATH)/util/Catch2/single_include/catch2 

all: hls


BOARD_PATH = $(GALAPAGOS_PATH)/oldhlsBuild/$(GALAPAGOS_BOARD_NAME)


hls:
	mkdir -p $(BOARD_PATH)/ip/$(HLSMIDDLEWAREIP)
	vivado_hls $(GALAPAGOS_PATH)/middleware/old_hls/$(HLSMIDDLEWAREIP)/generate_hls.tcl

clean:
	rm -rf $(BOARD_PATH)/ip/$(HLSMIDDLEWAREIP)
	rm -rf $(BOARD_PATH)/csim/$(HLSMIDDLEWAREIP)
