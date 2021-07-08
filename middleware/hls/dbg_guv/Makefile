# Edit the following four variables and run `make`.
# After that, follow the instructions in ip_maker.tcl
#
# Alternatively, you could set any of these variables on the command line:
#
#	$ make src_dir=/path/to/my/src dst_dir=/path/to/my/output
#
# Just make sure that you don't include a trailing slash on your directories

dst_dir=$(GALAPAGOS_PATH)/hlsBuild/$(GALAPAGOS_BOARD_NAME)/ip
src_dir=.
ip_name=dbg_guv
part_no=$(GALAPAGOS_PART)



# Makes Makefile easier to read
out_dir=${dst_dir}/${ip_name}

# These variables are for running the testbench
MODULE := dbg_guv

# By default, package as an ip
default: ip

# This is to run the testbench
tb: $(MODULE).vcd

# This opens the testbench in gtkwave
open:	$(MODULE).vcd
	gtkwave $(MODULE).vcd --autosavename &

# Compile the Verilog into Icarus's special format
$(MODULE).vvp:	$(MODULE).v $(MODULE)_tb.v $(MODULE)_drivers.mem
	iverilog -DICARUS_VERILOG -Iaxis_governor/ -I../marcos_macros/ -Iaxis_headerizer/ -o $(MODULE).vvp $(MODULE)_tb.v

# Run the Verilog simulator
$(MODULE).vcd:	$(MODULE).vvp
	vvp $(MODULE).vvp

clean:
	rm -rf $(MODULE).vvp
	rm -rf $(MODULE).vcd
	rm -rf ${out_dir}
	rm -rf ${ip_name}_tmp_proj

# Packages into a Vivado IP
ip: clean
	rm -rf ${out_dir}
	mkdir -p ${out_dir}/src
	cp dbg_guv.v axis_governor/axis_governor.v ../marcos_macros/macros.vh axis_headerizer/axis_headerizer.v ${out_dir}/src
	vivado -nolog -nojournal -notrace -mode batch -source ip_maker.tcl -tclargs ${out_dir} ${ip_name} ${part_no}
	rm -rf ${ip_name}_tmp_proj
	rm -f *log
	rm -rf .Xil
	rm -f vivado*

syntax_check:
	iverilog -DICARUS_VERILOG -Iaxis_governor/ -I../marcos_macros/ -Iaxis_headerizer/ -E $(MODULE).v
	rm -rf a.out
 
