SHELL := /bin/bash

install:
	source install.sh

%::
	source environmental_reset.sh && make -f makefile_actual.mk $(MAKECMDGOALS)
