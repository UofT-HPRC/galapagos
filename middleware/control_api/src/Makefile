SUBDIRS := $(wildcard */)
IGNORE_SUBDIRS := include/ \
				  integration/ \
				  __pycache__/ \
				  reliability_protocol_module_inbound/ \
				  reliability_protocol_node_inbound/ \
				  rpn_WAN_sequence_number_initializer/ \
				  rpn_WNN_node/ \
				  rpn_WNN_repo/ \
				  rpn_KIP_TX/ \
				  test_decoder/
IP_SUBDIRS := $(filter-out $(IGNORE_SUBDIRS), $(SUBDIRS))

# Set Project Part if not provided
ifndef CTRL_PROJECT_PART
export CTRL_PROJECT_PART := xczu19eg-ffvc1760-2-i
endif
# Set IP Repo Path if not provided
ifndef CTRL_IP_REPO_PATH
export CTRL_IP_REPO_PATH := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))/tester_ip
endif

all_ip:
	for dir in $(IP_SUBDIRS); do \
		$(MAKE) -C $$dir ip; \
	done

clean:
	for dir in $(IP_SUBDIRS); do \
		$(MAKE) -C $$dir clean; \
	done