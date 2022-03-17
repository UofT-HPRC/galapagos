# These variables are for running the testbench
MODULE := axis_headerizer

# By default, try not to mess up Galapagos
default:
	echo "Warning: axis_headerizer is not meant to be used as a separate IP in Galapagos"
	echo "Please see https://github.com/esophagus-now/ye_olde_verilogge"

# This is to run the testbench
tb: $(MODULE).vcd

# This opens the testbench in gtkwave
open:	$(MODULE).vcd
	gtkwave $(MODULE).vcd --autosavename &

# Compile the Verilog into Icarus's special format
$(MODULE).vvp:	$(MODULE).v $(MODULE)_tb.v
	iverilog -DICARUS_VERILOG -I../../marcos_macros/ -o $(MODULE).vvp $(MODULE)_tb.v

# Run the Verilog simulator
$(MODULE).vcd:	$(MODULE).vvp
	vvp $(MODULE).vvp

clean:
	rm -rf $(MODULE).vvp
	rm -rf $(MODULE).vcd

syntax_check:
	iverilog -DICARUS_VERILOG -I../../marcos_macros/ -E $(MODULE).v
	rm -rf a.out
 
