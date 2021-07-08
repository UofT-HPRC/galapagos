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
ip_name=rr4
part_no=$(GALAPAGOS_PART)


# Makes Makefile easier to read
out_dir=${dst_dir}/${ip_name}

MODULE := rr4


default:	ip

tb: $(MODULE).vcd

$(MODULE).vcd:	$(MODULE).vvp
	vvp $(MODULE).vvp

$(MODULE).vvp:	$(MODULE).v $(MODULE)_tb.v $(MODULE)_drivers.mem
	iverilog -DICARUS_VERILOG -I../buffered_handshake -I../marcos_macros -o $(MODULE).vvp $(MODULE)_tb.v

open:	$(MODULE).vcd
	gtkwave $(MODULE).vcd --autosavename &

clean:
	rm -rf $(MODULE).vvp
	rm -rf $(MODULE).vcd
	rm -rf ${out_dir}
	rm -rf ${ip_name}_tmp_proj

# Packages into a Vivado IP
ip: clean
	rm -rf ${out_dir}
	mkdir -p ${out_dir}/src
	cp rr4.v ../marcos_macros/macros.vh ../buffered_handshake/bhand.v ${out_dir}/src
	vivado -nolog -nojournal -notrace -mode batch -source ip_maker.tcl -tclargs ${out_dir} ${ip_name} ${part_no}
	rm -rf ${ip_name}_tmp_proj
	rm -f *log
	rm -rf .Xil
	rm -f vivado*

force:
	touch $(MODULE)_tb.v
	make
