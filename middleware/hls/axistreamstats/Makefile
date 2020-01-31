# This file is from tpdp/helpful_scripts/packaging_custom_ip:
# https://github.com/UofT-HPRC/tpdp/tree/master/helpful_scripts/packaging_custom_ip

# I didn't want to rock the boat too much, so I'm just using Galapagos's 
# environment variables for compatibility. However, it would be much better to
# use a more robust method


# Edit the following four variables and run `make`.
# After that, follow the instructions in ip_maker.tcl
#
# Alternatively, you could set any of these variables on the command line:
#
#	$ make src_dir=/path/to/my/src dst_dir=/path/to/my/output
#
# Just make sure that you don't include a trailing slash on your directories

dst_dir=$(GALAPAGOS_PATH)/hlsBuild/$(GALAPAGOS_BOARD_NAME)
src_dir=.
ip_name=axistreamstats
part_no=$(GALAPAGOS_PART)



# Makes Makefile easier to read
out_dir=${dst_dir}/${ip_name}

all: clean
	rm -rf ${out_dir}
	mkdir -p ${out_dir}/src
	cp $(shell find ${src_dir} -name "*.v" -o -name "*vh" -o -name "*sv") ${out_dir}/src
	vivado -nolog -nojournal -notrace -mode batch -source ip_maker.tcl -tclargs ${out_dir} ${ip_name} ${part_no}
	rm -rf ${ip_name}_tmp_proj
	rm -f *log
	rm -rf .Xil
	rm -f vivado*
clean:
	rm -rf ${out_dir}
	rm -rf ${ip_name}_tmp_proj
	
