#===============================
# AUTHOR     : Naif Tarafdar
# CREATE DATE     : April 20, 2019
#===============================

XILINX_INCLUDE=../xil_include

DEBUG_FLAGS = -g -DLOG_LEVEL=2
PRODUCTION_FLAGS = -O3 -DLOG_LEVEL=0
BOOST_LDFLAGS=-lboost_thread -lboost_system -lpthread -lboost_log -lboost_log_setup -lboost_program_options
FLAGS=-DCPU  -std=c++17 -isystem $(XILINX_INCLUDE) -I../util/spdlog/include 
MAPFILE=$(shell pwd)/middleware/map.xml
LOGICALFILE=$(shell pwd)/middleware/logical.xml
PROJECTNAME=udpLoopback
python_path = ${GALAPAGOS_PATH}/middleware/python

RELEASE_FLAGS: CXXFLAGS = $(FLAGS)  ${PRODUCTION_FLAGS}
DEBUG_FLAGS: CXXFLAGS = $(FLAGS)  ${DEBUG_FLAGS}

all: cpu 

cpu:  cpu_node.cpp kern.cpp ../common.cpp ../util/CommandLine.cpp
	g++-7 $(FLAGS) $(PRODUCTION_FLAGS) $^ -o hello_world $(BOOST_LDFLAGS)	

hls: kern.cpp generate_hls.tcl
	vivado_hls generate_hls.tcl

middleware: ${MAPFILE} ${LOGICALFILE}
	python3.5 ${python_path}/globalFPGAParser.py --logicalFile=${LOGICALFILE} \
		--mapFile=${MAPFILE} --projectName=${PROJECTNAME}
	chmod +x $(GALAPAGOS_PATH)/projects/$(PROJECTNAME)/createCluster.sh

clean:
	rm -rf *.exe
