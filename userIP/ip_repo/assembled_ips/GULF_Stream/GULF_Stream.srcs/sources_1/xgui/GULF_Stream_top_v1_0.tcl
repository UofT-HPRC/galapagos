# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "BIGENDIAN" -parent ${Page_0}
  ipgui::add_param $IPINST -name "GATEWAY" -parent ${Page_0}
  ipgui::add_param $IPINST -name "HAS_AXIL" -parent ${Page_0}
  ipgui::add_param $IPINST -name "IP_ADDR" -parent ${Page_0}
  ipgui::add_param $IPINST -name "MAC_ADDR" -parent ${Page_0}
  ipgui::add_param $IPINST -name "NETMASK" -parent ${Page_0}


}

proc update_PARAM_VALUE.BIGENDIAN { PARAM_VALUE.BIGENDIAN } {
	# Procedure called to update BIGENDIAN when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BIGENDIAN { PARAM_VALUE.BIGENDIAN } {
	# Procedure called to validate BIGENDIAN
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

