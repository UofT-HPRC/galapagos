# These variables are for running the testbench
MODULE := axis_governor

# By default, package as an ip
default: 
	echo "Warning: axis_governor is not meant to be used as a separate IP in Galapagos"
	echo "Please see https://github.com/esophagus-now/ye_olde_verilogge"
	
# This is to run the testbench
tb: $(MODULE).vcd

# This opens the testbench in gtkwave
open:	$(MODULE).vcd
	gtkwave $(MODULE).vcd --autosavename &

# Compile the Verilog into Icarus's special format
$(MODULE).vvp:	$(MODULE).v $(MODULE)_tb.v $(MODULE)_drivers.mem
	iverilog -DICARUS_VERILOG -o $(MODULE).vvp $(MODULE)_tb.v

# Run the Verilog simulator
$(MODULE).vcd:	$(MODULE).vvp
	vvp $(MODULE).vvp

clean:
	rm -rf $(MODULE).vvp
	rm -rf $(MODULE).vcd

# Packages into a Vivado IP
ip: clean
	rm -rf ${out_dir}
	mkdir -p ${out_dir}/src
	cp $(shell find ${src_dir} -name "*.v" -o -name "*vh" -o -name "*sv" | grep -v "tb") ${out_dir}/src
	vivado -nolog -nojournal -notrace -mode batch -source ip_maker.tcl -tclargs ${out_dir} ${ip_name} ${part_no}
	rm -rf ${ip_name}_tmp_proj
	rm -f *log
	rm -rf .Xil
	rm -f vivado*

syntax_check:
	iverilog -DICARUS_VERILOG -E $(MODULE).v
	rm -rf a.out
 
