################################################################################
# Makefile for Galapagos
#	- all
#	- example_shell
#	- middleware
#	- hlsmiddleware
#	- clean
#
# Author: Naif Tarafdar, Varun Sharma
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

all: middleware

prepare:
	source parameterize.sh

install:
	source build.sh

middleware: ${LOGICALFILE} ${MAPFILE} guard-LOGICALFILE guard-MAPFILE guard-PROJECTNAME
	mkdir -p $(GALAPAGOS_PATH)/projects
	$(MAKE) -C $(MIDDLEWARE_DIR) middleware 

full: ${LOGICALFILE} ${MAPFILE} guard-LOGICALFILE guard-MAPFILE guard-PROJECTNAME
	mkdir -p $(GALAPAGOS_PATH)/projects
	$(MAKE) -C $(MIDDLEWARE_DIR) middleware
	source $(GALAPAGOS_PATH)/projects/$(PROJECTNAME)/createCluster.sh

laniakea_middleware: ${CLUSTERFILE} guard-CLUSTERFILE guard-PROJECTNAME
	mkdir -p $(GALAPAGOS_PATH)/projects
	$(MAKE) -C $(MIDDLEWARE_DIR) laniakea_middleware

laniakea: laniakea_middleware

hlsmiddleware:
	mkdir -p $(GALAPAGOS_PATH)/hlsBuild
	$(MAKE) -C $(MIDDLEWARE_DIR) hlsmiddleware

clean:
	$(MAKE) -C $(MIDDLEWARE_DIR) clean
	$(MAKE) -C $(SHELLS_DIR) clean
