################################################################################
# Makefile for Galapagos
#	- all
#	- example_shell
#	- middleware
#	- hlsmiddleware
#	- clean
#
# Author: Juan Camilo Vega, Varun Sharma, Naif Tarafdar
#
# Changelog:
#	1.0 - Mar. 4 2019 - Created (NT)
#	1.1 - Apr. 9 2019 - Added include.mk (VS)
################################################################################

# defines guard-%
include include.mk

SHELL := /bin/bash
MIDDLEWARE_DIR = $(GALAPAGOS_PATH)/middleware
SHELLS_DIR = $(GALAPAGOS_PATH)/shells
HLSMIDDLEWARE_DIR = $(GALAPAGOS_PATH)/middleware/hls 

.PHONY: middleware

full: middleware

query: ${APIFILE} guard-APIFILE guard-PROJECTNAME
	mkdir -p $(GALAPAGOS_PATH)/projects
	source $(MAKE) -C $(MIDDLEWARE_DIR) apiquery

merge:
	mkdir -p $(GALAPAGOS_PATH)/projects
	source python3.7 ${MIDDLEWARE_DIR}/python/join_clusters.py --projectName=${PROJECTNAME} --clinfoFiles="$(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))"

middleware: ${LOGICALFILE} ${MAPFILE} guard-LOGICALFILE guard-MAPFILE guard-PROJECTNAME
	mkdir -p $(GALAPAGOS_PATH)/projects
	source $(MAKE) -C $(MIDDLEWARE_DIR) middleware 

full: ${LOGICALFILE} ${MAPFILE} guard-LOGICALFILE guard-MAPFILE guard-PROJECTNAME
	mkdir -p $(GALAPAGOS_PATH)/projects
	source $(MAKE) -C $(MIDDLEWARE_DIR) middleware
	source source $(GALAPAGOS_PATH)/projects/$(PROJECTNAME)/createCluster.sh

laniakea: ${CLUSTERFILE} guard-CLUSTERFILE guard-PROJECTNAME
	mkdir -p $(GALAPAGOS_PATH)/projects
	$(MAKE) -C $(GALAPAGOS_PATH)/middleware laniakea_middleware
hlsmiddleware:
	mkdir -p $(GALAPAGOS_PATH)/hlsBuild
	$(MAKE) -C $(MIDDLEWARE_DIR) hlsmiddleware

clean:
	$(MAKE) -C $(MIDDLEWARE_DIR) clean
	$(MAKE) -C $(SHELLS_DIR) clean

%::
	@true
