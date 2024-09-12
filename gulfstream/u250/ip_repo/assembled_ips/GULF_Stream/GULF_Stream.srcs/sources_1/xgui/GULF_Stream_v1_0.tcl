
# Loading additional proc with user specified bodies to compute parameter values.
source [file join [file dirname [file dirname [info script]]] gui/GULF_Stream_v1_0.gtcl]

# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  ipgui::add_param $IPINST -name "HAS_AXIL"
  ipgui::add_param $IPINST -name "ENDIANNESS" -layout horizontal
  ipgui::add_static_text $IPINST -name "Note" -text {Note: This only affects the endianness of the AXI-Stream interfaces, the meta_rx and meta_tx are always in Big Endian format.}
  #Adding Group
  set network_parameters [ipgui::add_group $IPINST -name "network parameters"]
  set_property tooltip {netparams} ${network_parameters}
  ipgui::add_param $IPINST -name "IP_ADDR" -parent ${network_parameters}
  ipgui::add_param $IPINST -name "GATEWAY" -parent ${network_parameters}
  ipgui::add_param $IPINST -name "NETMASK" -parent ${network_parameters}
  ipgui::add_param $IPINST -name "MAC_ADDR" -parent ${network_parameters}


}

proc update_PARAM_VALUE.BIGENDIAN { PARAM_VALUE.BIGENDIAN PARAM_VALUE.ENDIANNESS } {
	# Procedure called to update BIGENDIAN when any of the dependent parameters in the arguments change
	
	set BIGENDIAN ${PARAM_VALUE.BIGENDIAN}
	set ENDIANNESS ${PARAM_VALUE.ENDIANNESS}
	set values(ENDIANNESS) [get_property value $ENDIANNESS]
	set_property value [gen_USERPARAMETER_BIGENDIAN_VALUE $values(ENDIANNESS)] $BIGENDIAN
}

proc validate_PARAM_VALUE.BIGENDIAN { PARAM_VALUE.BIGENDIAN } {
	# Procedure called to validate BIGENDIAN
	return true
}

proc update_PARAM_VALUE.ENDIANNESS { PARAM_VALUE.ENDIANNESS } {
	# Procedure called to update ENDIANNESS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ENDIANNESS { PARAM_VALUE.ENDIANNESS } {
	# Procedure called to validate ENDIANNESS
	return true
}

proc update_PARAM_VALUE.GATEWAY { PARAM_VALUE.GATEWAY } {
	# Procedure called to update GATEWAY when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.GATEWAY { PARAM_VALUE.GATEWAY } {
	# Procedure called to validate GATEWAY
	return true
}

proc update_PARAM_VALUE.HAS_AXIL { PARAM_VALUE.HAS_AXIL } {
	# Procedure called to update HAS_AXIL when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HAS_AXIL { PARAM_VALUE.HAS_AXIL } {
	# Procedure called to validate HAS_AXIL
	return true
}

proc update_PARAM_VALUE.IP_ADDR { PARAM_VALUE.IP_ADDR } {
	# Procedure called to update IP_ADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.IP_ADDR { PARAM_VALUE.IP_ADDR } {
	# Procedure called to validate IP_ADDR
	return true
}

proc update_PARAM_VALUE.MAC_ADDR { PARAM_VALUE.MAC_ADDR } {
	# Procedure called to update MAC_ADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MAC_ADDR { PARAM_VALUE.MAC_ADDR } {
	# Procedure called to validate MAC_ADDR
	return true
}

proc update_PARAM_VALUE.NETMASK { PARAM_VALUE.NETMASK } {
	# Procedure called to update NETMASK when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NETMASK { PARAM_VALUE.NETMASK } {
	# Procedure called to validate NETMASK
	return true
}


proc update_MODELPARAM_VALUE.IP_ADDR { MODELPARAM_VALUE.IP_ADDR PARAM_VALUE.IP_ADDR } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IP_ADDR}] ${MODELPARAM_VALUE.IP_ADDR}
}

proc update_MODELPARAM_VALUE.GATEWAY { MODELPARAM_VALUE.GATEWAY PARAM_VALUE.GATEWAY } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.GATEWAY}] ${MODELPARAM_VALUE.GATEWAY}
}

proc update_MODELPARAM_VALUE.NETMASK { MODELPARAM_VALUE.NETMASK PARAM_VALUE.NETMASK } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NETMASK}] ${MODELPARAM_VALUE.NETMASK}
}

proc update_MODELPARAM_VALUE.MAC_ADDR { MODELPARAM_VALUE.MAC_ADDR PARAM_VALUE.MAC_ADDR } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MAC_ADDR}] ${MODELPARAM_VALUE.MAC_ADDR}
}

proc update_MODELPARAM_VALUE.HAS_AXIL { MODELPARAM_VALUE.HAS_AXIL PARAM_VALUE.HAS_AXIL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HAS_AXIL}] ${MODELPARAM_VALUE.HAS_AXIL}
}

proc update_MODELPARAM_VALUE.BIGENDIAN { MODELPARAM_VALUE.BIGENDIAN PARAM_VALUE.BIGENDIAN } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIGENDIAN}] ${MODELPARAM_VALUE.BIGENDIAN}
}

