#opening netcat port to listen for the bitstreamfile to transfer over
nc -lvd 44444 > shellTop.bit

#setting up vivado
cd /opt/Xilinx/Vivado/2018.1
source settings64.sh
cd

#running tcl code to program FPGA
vivado -mode tcl -source program_fpga.tcl
