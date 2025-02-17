export IP_NAME := rpn_LAN_from_network_bridge_splitter
export PROJECT_NAME := vivado_$(IP_NAME)
export SOURCE_PATH := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
export PARAMETER_SOURCE_PATH := $(SOURCE_PATH)/../include
# Set Project Part if not provided
ifndef CTRL_PROJECT_PART
export CTRL_PROJECT_PART := xczu19eg-ffvc1760-2-i
endif
# Set IP Repo Path if not provided
ifndef CTRL_IP_REPO_PATH
export CTRL_IP_REPO_PATH := $(SOURCE_PATH)/ip
endif
export IP_PATH := $(CTRL_IP_REPO_PATH)/$(IP_NAME)

ip: clean
	vivado -mode batch -source package_ip.tcl

project:
	vivado -mode batch -source create_project.tcl

clean:
	rm -rf $(IP_PATH)
	rm -rf ip/
