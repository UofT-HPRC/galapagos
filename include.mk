################################################################################
# Shared targets used across Makefiles in Galapagos. Contains:
#	- guard-%
#
# Author: Varun Sharma
#
# Changelog:
#	1.0 - Apr. 9 2019 - Created (VS)
################################################################################

INCLUDE_UTIL=-I $(GALAPAGOS_PATH)/util/Catch2/single_include/catch2 -I$(GALAPAGOS_PATH)/util/spdlog/include

# GALAPAGOS_BOARD is not asserted because it's optional to have a board file

# Asserts that the specified variable exists. It can be used as a prerequisite 
# for running other targets. E.g. adding guard-FOO to a target enforces that 
# the variable FOO is defined before running the target.
guard-%:
	@ if [ "${${*}}" = "" ]; then \
		echo "Variable $* not set"; \
		exit 1; \
	fi
