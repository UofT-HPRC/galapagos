#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
# Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/mnt/shares/tools/Xilinx/Vitis/2023.1/bin:/mnt/shares/tools/Xilinx/Vivado/2023.1/ids_lite/ISE/bin/lin64:/mnt/shares/tools/Xilinx/Vivado/2023.1/bin
else
  PATH=/mnt/shares/tools/Xilinx/Vitis/2023.1/bin:/mnt/shares/tools/Xilinx/Vivado/2023.1/ids_lite/ISE/bin/lin64:/mnt/shares/tools/Xilinx/Vivado/2023.1/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/home/justin/controlapi/galapagos_network_bridge/galapagos/middleware/control_api/src/rpn_LAN_sequence_number_initializer/deployment_LAN_seq_num_initializer/deployment_LAN_seq_num_initializer.runs/design_1_proc_sys_reset_0_0_synth_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vivado -log design_1_proc_sys_reset_0_0.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source design_1_proc_sys_reset_0_0.tcl
