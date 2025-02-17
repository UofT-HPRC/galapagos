SHELL := /bin/bash

.PHONY: middleware

install:
	source install.sh


%::
	source environmental_reset.sh && make -B -f makefile_actual.mk $(MAKECMDGOALS)
