SHELL := /bin/bash

.PHONY: middleware

install:
	source install.sh

FORCE: ;

%:: FORCE
	source environmental_reset.sh && make -B -f makefile_actual.mk $(MAKECMDGOALS)
