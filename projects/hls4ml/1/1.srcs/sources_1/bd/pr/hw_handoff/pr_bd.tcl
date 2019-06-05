
################################################################
# This is a generated script based on design: pr
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2018.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source pr_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xcku115-flva1517-2-e
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name pr

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################


# Hierarchical cell: network
proc create_hier_cell_network { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_network() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 from_app_V
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 to_app_V

  # Create pins
  create_bd_pin -dir I -type rst ARESETN
  create_bd_pin -dir I -type clk CLK
  create_bd_pin -dir O -from 47 -to 0 mac_big

  # Create instance: blk_mem_bridge_rom, and set properties
  set blk_mem_bridge_rom [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 blk_mem_bridge_rom ]
  set_property -dict [ list \
   CONFIG.Byte_Size {8} \
   CONFIG.Coe_File {../../../../../../../mac.coe} \
   CONFIG.EN_SAFETY_CKT {true} \
   CONFIG.Enable_32bit_Address {true} \
   CONFIG.Enable_B {Use_ENB_Pin} \
   CONFIG.Load_Init_File {true} \
   CONFIG.Memory_Type {Dual_Port_ROM} \
   CONFIG.Port_A_Write_Rate {0} \
   CONFIG.Port_B_Clock {100} \
   CONFIG.Port_B_Enable_Rate {100} \
   CONFIG.Read_Width_A {64} \
   CONFIG.Read_Width_B {64} \
   CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
   CONFIG.Use_Byte_Write_Enable {false} \
   CONFIG.Use_RSTA_Pin {true} \
   CONFIG.Use_RSTB_Pin {true} \
   CONFIG.Write_Width_A {64} \
   CONFIG.Write_Width_B {64} \
   CONFIG.use_bram_block {BRAM_Controller} \
 ] $blk_mem_bridge_rom

  # Create instance: ip_constant_block_inst, and set properties
  set ip_constant_block_inst [ create_bd_cell -type ip -vlnv user.org:user:ip_constant_block:1.0 ip_constant_block_inst ]
  set_property -dict [ list \
   CONFIG.C_GATEWAY_B0 {100} \
   CONFIG.C_GATEWAY_B1 {2} \
   CONFIG.C_GATEWAY_B2 {1} \
   CONFIG.C_GATEWAY_B3 {10} \
   CONFIG.C_IP_B0 {101} \
   CONFIG.C_IP_B1 {2} \
   CONFIG.C_IP_B2 {1} \
   CONFIG.C_IP_B3 {10} \
   CONFIG.C_MAC {0xfa163e55ca02} \
   CONFIG.C_SUBNET_B0 {0} \
   CONFIG.C_SUBNET_B1 {255} \
   CONFIG.C_SUBNET_B2 {255} \
   CONFIG.C_SUBNET_B3 {255} \
 ] $ip_constant_block_inst

  # Create instance: network_bridge_inst, and set properties
  set network_bridge_inst [ create_bd_cell -type ip -vlnv xilinx.com:hls:ethernet_bridge:1.0 network_bridge_inst ]

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins S_AXIS] [get_bd_intf_pins network_bridge_inst/from_eth_V]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins M_AXIS] [get_bd_intf_pins network_bridge_inst/to_eth_V]
  connect_bd_intf_net -intf_net Conn3 [get_bd_intf_pins from_app_V] [get_bd_intf_pins network_bridge_inst/from_app_V]
  connect_bd_intf_net -intf_net Conn4 [get_bd_intf_pins to_app_V] [get_bd_intf_pins network_bridge_inst/to_app_V]
  connect_bd_intf_net -intf_net network_bridge_inst_mac_table_V_PORTA [get_bd_intf_pins blk_mem_bridge_rom/BRAM_PORTA] [get_bd_intf_pins network_bridge_inst/mac_table_V_PORTA]
  connect_bd_intf_net -intf_net network_bridge_inst_mac_table_V_PORTB [get_bd_intf_pins blk_mem_bridge_rom/BRAM_PORTB] [get_bd_intf_pins network_bridge_inst/mac_table_V_PORTB]

  # Create port connections
  connect_bd_net -net ARESETN_1 [get_bd_pins ARESETN] [get_bd_pins network_bridge_inst/aresetn]
  connect_bd_net -net CLK_1 [get_bd_pins CLK] [get_bd_pins network_bridge_inst/aclk]
  connect_bd_net -net ip_constant_block_inst_mac_big [get_bd_pins mac_big] [get_bd_pins ip_constant_block_inst/mac_big] [get_bd_pins network_bridge_inst/mac_addr_V]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: applicationRegion
proc create_hier_cell_applicationRegion { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_applicationRegion() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S00_AXIS
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_CONTROL
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_MEM_0
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_MEM_1
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 stream_out_network_V

  # Create pins
  create_bd_pin -dir I -type rst ARESETN
  create_bd_pin -dir I -type clk CLK
  create_bd_pin -dir I -from 47 -to 0 network_addr_V

  # Create instance: axi_datamover_0, and set properties
  set axi_datamover_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_datamover:5.1 axi_datamover_0 ]
  set_property -dict [ list \
   CONFIG.c_dummy {1} \
   CONFIG.c_m_axi_mm2s_data_width {64} \
   CONFIG.c_m_axis_mm2s_tdata_width {64} \
   CONFIG.c_mm2s_burst_size {8} \
 ] $axi_datamover_0

  # Create instance: axi_vip_ctrl, and set properties
  set axi_vip_ctrl [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_vip:1.1 axi_vip_ctrl ]
  set_property -dict [ list \
   CONFIG.INTERFACE_MODE {SLAVE} \
   CONFIG.PROTOCOL {AXI4LITE} \
 ] $axi_vip_ctrl

  # Create instance: blk_mem_switch_rom, and set properties
  set blk_mem_switch_rom [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 blk_mem_switch_rom ]
  set_property -dict [ list \
   CONFIG.Byte_Size {8} \
   CONFIG.Coe_File {../../../../../../../mac.coe} \
   CONFIG.EN_SAFETY_CKT {true} \
   CONFIG.Enable_32bit_Address {true} \
   CONFIG.Load_Init_File {true} \
   CONFIG.Memory_Type {Single_Port_ROM} \
   CONFIG.Port_A_Write_Rate {0} \
   CONFIG.Read_Width_A {64} \
   CONFIG.Read_Width_B {64} \
   CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
   CONFIG.Use_Byte_Write_Enable {false} \
   CONFIG.Use_RSTA_Pin {true} \
   CONFIG.Write_Width_A {64} \
   CONFIG.Write_Width_B {64} \
   CONFIG.use_bram_block {BRAM_Controller} \
 ] $blk_mem_switch_rom

  # Create instance: custom_switch_inst, and set properties
  set custom_switch_inst [ create_bd_cell -type ip -vlnv xilinx.com:hls:width48router:1.0 custom_switch_inst ]

  # Create instance: dariusController_raw_0, and set properties
  set dariusController_raw_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:dariusController_raw:1.0 dariusController_raw_0 ]

  # Create instance: input_switch, and set properties
  set input_switch [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_switch:1.1 input_switch ]
  set_property -dict [ list \
   CONFIG.ARB_ON_MAX_XFERS {0} \
   CONFIG.ARB_ON_TLAST {1} \
   CONFIG.M00_AXIS_BASETDEST {0x00000001} \
   CONFIG.M00_AXIS_HIGHTDEST {0x00000001} \
   CONFIG.NUM_MI {1} \
   CONFIG.NUM_SI {2} \
 ] $input_switch

  # Create instance: smartconnect_0, and set properties
  set smartconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_0 ]
  set_property -dict [ list \
   CONFIG.NUM_MI {2} \
 ] $smartconnect_0

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
   CONFIG.CONST_WIDTH {32} \
 ] $xlconstant_0

  # Create instance: xlconstant_1, and set properties
  set xlconstant_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1 ]

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins S_AXI_CONTROL] [get_bd_intf_pins axi_vip_ctrl/S_AXI]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins S_AXI_MEM_0] [get_bd_intf_pins smartconnect_0/M00_AXI]
  connect_bd_intf_net -intf_net Conn4 [get_bd_intf_pins S00_AXIS] [get_bd_intf_pins input_switch/S00_AXIS]
  connect_bd_intf_net -intf_net Conn5 [get_bd_intf_pins stream_out_network_V] [get_bd_intf_pins custom_switch_inst/stream_out_network_V]
  connect_bd_intf_net -intf_net axi_datamover_0_M_AXIS_MM2S [get_bd_intf_pins axi_datamover_0/M_AXIS_MM2S] [get_bd_intf_pins dariusController_raw_0/axis_mm2s]
  connect_bd_intf_net -intf_net axi_datamover_0_M_AXI_MM2S [get_bd_intf_pins axi_datamover_0/M_AXI_MM2S] [get_bd_intf_pins smartconnect_0/S00_AXI]
  connect_bd_intf_net -intf_net axi_datamover_0_M_AXI_S2MM [get_bd_intf_pins axi_datamover_0/M_AXI_S2MM] [get_bd_intf_pins smartconnect_0/S01_AXI]
  connect_bd_intf_net -intf_net custom_switch_inst_network_table_V_PORTA [get_bd_intf_pins blk_mem_switch_rom/BRAM_PORTA] [get_bd_intf_pins custom_switch_inst/network_table_V_PORTA]
  connect_bd_intf_net -intf_net custom_switch_inst_stream_out_switch_V [get_bd_intf_pins custom_switch_inst/stream_out_switch_V] [get_bd_intf_pins input_switch/S01_AXIS]
  connect_bd_intf_net -intf_net dariusController_raw_0_axis_cmd_mm2s_V_data_V [get_bd_intf_pins axi_datamover_0/S_AXIS_MM2S_CMD] [get_bd_intf_pins dariusController_raw_0/axis_cmd_mm2s_V_data_V]
  connect_bd_intf_net -intf_net dariusController_raw_0_axis_cmd_s2mm_V_data_V [get_bd_intf_pins axi_datamover_0/S_AXIS_S2MM_CMD] [get_bd_intf_pins dariusController_raw_0/axis_cmd_s2mm_V_data_V]
  connect_bd_intf_net -intf_net dariusController_raw_0_axis_s2mm [get_bd_intf_pins axi_datamover_0/S_AXIS_S2MM] [get_bd_intf_pins dariusController_raw_0/axis_s2mm]
  connect_bd_intf_net -intf_net input_switch_M00_AXIS [get_bd_intf_pins dariusController_raw_0/stream_in] [get_bd_intf_pins input_switch/M00_AXIS]
  connect_bd_intf_net -intf_net smartconnect_0_M01_AXI [get_bd_intf_pins S_AXI_MEM_1] [get_bd_intf_pins smartconnect_0/M01_AXI]

  # Create port connections
  connect_bd_net -net ARESETN_1 [get_bd_pins ARESETN] [get_bd_pins axi_datamover_0/m_axi_mm2s_aresetn] [get_bd_pins axi_datamover_0/m_axi_s2mm_aresetn] [get_bd_pins axi_datamover_0/m_axis_mm2s_cmdsts_aresetn] [get_bd_pins axi_datamover_0/m_axis_s2mm_cmdsts_aresetn] [get_bd_pins axi_vip_ctrl/aresetn] [get_bd_pins custom_switch_inst/aresetn] [get_bd_pins dariusController_raw_0/ap_rst_n] [get_bd_pins input_switch/aresetn] [get_bd_pins smartconnect_0/aresetn]
  connect_bd_net -net CLK_1 [get_bd_pins CLK] [get_bd_pins axi_datamover_0/m_axi_mm2s_aclk] [get_bd_pins axi_datamover_0/m_axi_s2mm_aclk] [get_bd_pins axi_datamover_0/m_axis_mm2s_cmdsts_aclk] [get_bd_pins axi_datamover_0/m_axis_s2mm_cmdsts_awclk] [get_bd_pins axi_vip_ctrl/aclk] [get_bd_pins custom_switch_inst/aclk] [get_bd_pins dariusController_raw_0/ap_clk] [get_bd_pins input_switch/aclk] [get_bd_pins smartconnect_0/aclk]
  connect_bd_net -net network_addr_V_1 [get_bd_pins network_addr_V] [get_bd_pins custom_switch_inst/network_addr_V]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins dariusController_raw_0/rank] [get_bd_pins xlconstant_0/dout]
  connect_bd_net -net xlconstant_1_dout [get_bd_pins dariusController_raw_0/ap_start] [get_bd_pins xlconstant_1/dout]

  # Restore current instance
  current_bd_instance $oldCurInst
}


# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set M_AXIS [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {156250000} \
   ] $M_AXIS
  set S_AXIS [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {156250000} \
   CONFIG.HAS_TKEEP {1} \
   CONFIG.HAS_TLAST {1} \
   CONFIG.HAS_TREADY {1} \
   CONFIG.HAS_TSTRB {0} \
   CONFIG.LAYERED_METADATA {undef} \
   CONFIG.TDATA_NUM_BYTES {8} \
   CONFIG.TDEST_WIDTH {0} \
   CONFIG.TID_WIDTH {0} \
   CONFIG.TUSER_WIDTH {0} \
   ] $S_AXIS
  set S_AXI_CONTROL [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_CONTROL ]
  set_property -dict [ list \
   CONFIG.ADDR_WIDTH {16} \
   CONFIG.ARUSER_WIDTH {0} \
   CONFIG.AWUSER_WIDTH {0} \
   CONFIG.BUSER_WIDTH {0} \
   CONFIG.DATA_WIDTH {32} \
   CONFIG.FREQ_HZ {156250000} \
   CONFIG.HAS_BRESP {1} \
   CONFIG.HAS_BURST {1} \
   CONFIG.HAS_CACHE {1} \
   CONFIG.HAS_LOCK {1} \
   CONFIG.HAS_PROT {1} \
   CONFIG.HAS_QOS {0} \
   CONFIG.HAS_REGION {0} \
   CONFIG.HAS_RRESP {1} \
   CONFIG.HAS_WSTRB {1} \
   CONFIG.ID_WIDTH {0} \
   CONFIG.MAX_BURST_LENGTH {1} \
   CONFIG.NUM_READ_OUTSTANDING {2} \
   CONFIG.NUM_READ_THREADS {1} \
   CONFIG.NUM_WRITE_OUTSTANDING {2} \
   CONFIG.NUM_WRITE_THREADS {1} \
   CONFIG.PROTOCOL {AXI4LITE} \
   CONFIG.READ_WRITE_MODE {READ_WRITE} \
   CONFIG.RUSER_BITS_PER_BYTE {0} \
   CONFIG.RUSER_WIDTH {0} \
   CONFIG.SUPPORTS_NARROW_BURST {0} \
   CONFIG.WUSER_BITS_PER_BYTE {0} \
   CONFIG.WUSER_WIDTH {0} \
   ] $S_AXI_CONTROL
  set S_AXI_MEM_0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_MEM_0 ]
  set_property -dict [ list \
   CONFIG.ADDR_WIDTH {32} \
   CONFIG.DATA_WIDTH {512} \
   CONFIG.FREQ_HZ {156250000} \
   CONFIG.NUM_READ_OUTSTANDING {2} \
   CONFIG.NUM_WRITE_OUTSTANDING {2} \
   CONFIG.PROTOCOL {AXI4} \
   ] $S_AXI_MEM_0
  set S_AXI_MEM_1 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_MEM_1 ]
  set_property -dict [ list \
   CONFIG.ADDR_WIDTH {32} \
   CONFIG.DATA_WIDTH {512} \
   CONFIG.FREQ_HZ {156250000} \
   CONFIG.NUM_READ_OUTSTANDING {2} \
   CONFIG.NUM_WRITE_OUTSTANDING {2} \
   CONFIG.PROTOCOL {AXI4} \
   ] $S_AXI_MEM_1

  # Create ports
  set ARESETN [ create_bd_port -dir I -type rst ARESETN ]
  set CLK [ create_bd_port -dir I -type clk CLK ]
  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {S_AXIS:M_AXIS:S_AXI_CONTROL:S_AXI_MEM_0:S_AXI_MEM_1} \
   CONFIG.FREQ_HZ {156250000} \
 ] $CLK

  # Create instance: applicationRegion
  create_hier_cell_applicationRegion [current_bd_instance .] applicationRegion

  # Create instance: network
  create_hier_cell_network [current_bd_instance .] network

  # Create interface connections
  connect_bd_intf_net -intf_net S_AXIS_1 [get_bd_intf_ports S_AXIS] [get_bd_intf_pins network/S_AXIS]
  connect_bd_intf_net -intf_net S_AXI_CONTROL_1 [get_bd_intf_ports S_AXI_CONTROL] [get_bd_intf_pins applicationRegion/S_AXI_CONTROL]
  connect_bd_intf_net -intf_net applicationRegion_S_AXI_MEM_0 [get_bd_intf_ports S_AXI_MEM_0] [get_bd_intf_pins applicationRegion/S_AXI_MEM_0]
  connect_bd_intf_net -intf_net applicationRegion_S_AXI_MEM_1 [get_bd_intf_ports S_AXI_MEM_1] [get_bd_intf_pins applicationRegion/S_AXI_MEM_1]
  connect_bd_intf_net -intf_net applicationRegion_stream_out_network_V [get_bd_intf_pins applicationRegion/stream_out_network_V] [get_bd_intf_pins network/from_app_V]
  connect_bd_intf_net -intf_net network_M_AXIS [get_bd_intf_ports M_AXIS] [get_bd_intf_pins network/M_AXIS]
  connect_bd_intf_net -intf_net network_to_app_V [get_bd_intf_pins applicationRegion/S00_AXIS] [get_bd_intf_pins network/to_app_V]

  # Create port connections
  connect_bd_net -net ARESETN_1 [get_bd_ports ARESETN] [get_bd_pins applicationRegion/ARESETN] [get_bd_pins network/ARESETN]
  connect_bd_net -net CLK_1 [get_bd_ports CLK] [get_bd_pins applicationRegion/CLK] [get_bd_pins network/CLK]
  connect_bd_net -net network_mac_big [get_bd_pins applicationRegion/network_addr_V] [get_bd_pins network/mac_big]

  # Create address segments
  create_bd_addr_seg -range 0x80000000 -offset 0x00000000 [get_bd_addr_spaces applicationRegion/axi_datamover_0/Data_MM2S] [get_bd_addr_segs S_AXI_MEM_0/Reg] SEG_S_AXI_MEM_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x44A00000 [get_bd_addr_spaces applicationRegion/axi_datamover_0/Data_S2MM] [get_bd_addr_segs S_AXI_MEM_0/Reg] SEG_S_AXI_MEM_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x44A10000 [get_bd_addr_spaces applicationRegion/axi_datamover_0/Data_S2MM] [get_bd_addr_segs S_AXI_MEM_1/Reg] SEG_S_AXI_MEM_1_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x00000000 [get_bd_addr_spaces S_AXI_CONTROL] [get_bd_addr_segs applicationRegion/axi_vip_ctrl/S_AXI/Reg] SEG_axi_vip_ctrl_Reg


  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


