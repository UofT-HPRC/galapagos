################################################################################
# Makefile for Galapagos middleware
#	- all
#	- middleware
#	- hlsmiddleware
#	- clean
#
# Author: Naif Tarafdar, Varun Sharma
#
# Changelog:
#	1.0 - Mar. 4 2019 - Created (NT)
#	1.1 - Apr. 9 2019 - Added include.mk and changed variables/paths (VS)
################################################################################

# defines guard-%
include $(GALAPAGOS_PATH)/include.mk

middleware_path = $(GALAPAGOS_PATH)/middleware
hls_path = $(middleware_path)/hls
old_hls_path = $(middleware_path)/old_hls
python_path = $(middleware_path)/python

.PHONY: middleware oldhls

all: middleware hlsmiddleware oldhls

middleware: guard-LOGICALFILE guard-MAPFILE guard-PROJECTNAME ${LOGICALFILE} ${MAPFILE}
	python3.7 ${python_path}/globalFPGAParser.py --logicalFile=${LOGICALFILE} \
		--mapFile=${MAPFILE} --projectName=${PROJECTNAME}
	python3.7 ${python_path}/createTopLevel.py

laniakea_middleware: guard-PROJECTNAME guard-CLUSTERFILE ${CLUSTERFILE}
	python3.7 ${python_path}/globalFPGAParser.py --clusterFile=${CLUSTERFILE}
	python3.7 ${python_path}/createTopLevel.py



hlsmiddleware:
	 $(MAKE) -C $(hls_path)

oldhls:
	$(MAKE) -C $(old_hls_path)

clean: guard-PROJECTNAME
	 $(MAKE) -C $(hls_path) clean
	$(MAKE) -C $(old_hls_path) clean
	 rm -rf ${GALAPAGOS_PATH}/projects/${PROJECTNAME}
	 rm -rf ${GALAPAGOS_PATH}/createCluster.sh
	 rm -rf ${GALAPAGOS_PATH}/createSim.sh
