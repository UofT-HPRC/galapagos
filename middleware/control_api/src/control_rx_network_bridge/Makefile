export IP_NAME := control_rx_network_bridge
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

clean:
	rm -rf $(IP_PATH)
	rm -rf ip/