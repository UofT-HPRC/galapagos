
# Loading additional proc with user specified bodies to compute parameter values.
source [file join [file dirname [file dirname [info script]]] gui/axis_endianness_converter_v1_0.gtcl]

# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "HAS_DATA" -parent ${Page_0}
  ipgui::add_param $IPINST -name "HAS_KEEP" -parent ${Page_0}
  ipgui::add_param $IPINST -name "HAS_LAST" -parent ${Page_0}
  ipgui::add_param $IPINST -name "HAS_READY" -parent ${Page_0}
  ipgui::add_param $IPINST -name "HAS_DEST" -parent ${Page_0}
  ipgui::add_param $IPINST -name "HAS_ID" -parent ${Page_0}
  ipgui::add_param $IPINST -name "HAS_USER" -parent ${Page_0}
  ipgui::add_param $IPINST -name "HAS_STRB" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DATA_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DEST_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "ID_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "USER_WIDTH" -parent ${Page_0}


}

proc update_PARAM_VALUE.DATA_WIDTH { PARAM_VALUE.DATA_WIDTH PARAM_VALUE.HAS_DATA } {
	# Procedure called to update DATA_WIDTH when any of the dependent parameters in the arguments change
	
	set DATA_WIDTH ${PARAM_VALUE.DATA_WIDTH}
	set HAS_DATA ${PARAM_VALUE.HAS_DATA}
	set values(HAS_DATA) [get_property value $HAS_DATA]
	if { [gen_USERPARAMETER_DATA_WIDTH_ENABLEMENT $values(HAS_DATA)] } {
		set_property enabled true $DATA_WIDTH
	} else {
		set_property enabled false $DATA_WIDTH
	}
}

proc validate_PARAM_VALUE.DATA_WIDTH { PARAM_VALUE.DATA_WIDTH } {
	# Procedure called to validate DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.DEST_WIDTH { PARAM_VALUE.DEST_WIDTH PARAM_VALUE.HAS_DEST } {
	# Procedure called to update DEST_WIDTH when any of the dependent parameters in the arguments change
	
	set DEST_WIDTH ${PARAM_VALUE.DEST_WIDTH}
	set HAS_DEST ${PARAM_VALUE.HAS_DEST}
	set values(HAS_DEST) [get_property value $HAS_DEST]
	if { [gen_USERPARAMETER_DEST_WIDTH_ENABLEMENT $values(HAS_DEST)] } {
		set_property enabled true $DEST_WIDTH
	} else {
		set_property enabled false $DEST_WIDTH
	}
}

proc validate_PARAM_VALUE.DEST_WIDTH { PARAM_VALUE.DEST_WIDTH } {
	# Procedure called to validate DEST_WIDTH
	return true
}

proc update_PARAM_VALUE.ID_WIDTH { PARAM_VALUE.ID_WIDTH PARAM_VALUE.HAS_ID } {
	# Procedure called to update ID_WIDTH when any of the dependent parameters in the arguments change
	
	set ID_WIDTH ${PARAM_VALUE.ID_WIDTH}
	set HAS_ID ${PARAM_VALUE.HAS_ID}
	set values(HAS_ID) [get_property value $HAS_ID]
	if { [gen_USERPARAMETER_ID_WIDTH_ENABLEMENT $values(HAS_ID)] } {
		set_property enabled true $ID_WIDTH
	} else {
		set_property enabled false $ID_WIDTH
	}
}

proc validate_PARAM_VALUE.ID_WIDTH { PARAM_VALUE.ID_WIDTH } {
	# Procedure called to validate ID_WIDTH
	return true
}

proc update_PARAM_VALUE.USER_WIDTH { PARAM_VALUE.USER_WIDTH PARAM_VALUE.HAS_USER } {
	# Procedure called to update USER_WIDTH when any of the dependent parameters in the arguments change
	
	set USER_WIDTH ${PARAM_VALUE.USER_WIDTH}
	set HAS_USER ${PARAM_VALUE.HAS_USER}
	set values(HAS_USER) [get_property value $HAS_USER]
	if { [gen_USERPARAMETER_USER_WIDTH_ENABLEMENT $values(HAS_USER)] } {
		set_property enabled true $USER_WIDTH
	} else {
		set_property enabled false $USER_WIDTH
	}
}

proc validate_PARAM_VALUE.USER_WIDTH { PARAM_VALUE.USER_WIDTH } {
	# Procedure called to validate USER_WIDTH
	return true
}

proc update_PARAM_VALUE.HAS_DATA { PARAM_VALUE.HAS_DATA } {
	# Procedure called to update HAS_DATA when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HAS_DATA { PARAM_VALUE.HAS_DATA } {
	# Procedure called to validate HAS_DATA
	return true
}

proc update_PARAM_VALUE.HAS_DEST { PARAM_VALUE.HAS_DEST } {
	# Procedure called to update HAS_DEST when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HAS_DEST { PARAM_VALUE.HAS_DEST } {
	# Procedure called to validate HAS_DEST
	return true
}

proc update_PARAM_VALUE.HAS_ID { PARAM_VALUE.HAS_ID } {
	# Procedure called to update HAS_ID when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HAS_ID { PARAM_VALUE.HAS_ID } {
	# Procedure called to validate HAS_ID
	return true
}

proc update_PARAM_VALUE.HAS_KEEP { PARAM_VALUE.HAS_KEEP } {
	# Procedure called to update HAS_KEEP when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HAS_KEEP { PARAM_VALUE.HAS_KEEP } {
	# Procedure called to validate HAS_KEEP
	return true
}

proc update_PARAM_VALUE.HAS_LAST { PARAM_VALUE.HAS_LAST } {
	# Procedure called to update HAS_LAST when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HAS_LAST { PARAM_VALUE.HAS_LAST } {
	# Procedure called to validate HAS_LAST
	return true
}

proc update_PARAM_VALUE.HAS_READY { PARAM_VALUE.HAS_READY } {
	# Procedure called to update HAS_READY when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HAS_READY { PARAM_VALUE.HAS_READY } {
	# Procedure called to validate HAS_READY
	return true
}

proc update_PARAM_VALUE.HAS_STRB { PARAM_VALUE.HAS_STRB } {
	# Procedure called to update HAS_STRB when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HAS_STRB { PARAM_VALUE.HAS_STRB } {
	# Procedure called to validate HAS_STRB
	return true
}

proc update_PARAM_VALUE.HAS_USER { PARAM_VALUE.HAS_USER } {
	# Procedure called to update HAS_USER when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HAS_USER { PARAM_VALUE.HAS_USER } {
	# Procedure called to validate HAS_USER
	return true
}


proc update_MODELPARAM_VALUE.DATA_WIDTH { MODELPARAM_VALUE.DATA_WIDTH PARAM_VALUE.DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DATA_WIDTH}] ${MODELPARAM_VALUE.DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.HAS_DATA { MODELPARAM_VALUE.HAS_DATA PARAM_VALUE.HAS_DATA } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HAS_DATA}] ${MODELPARAM_VALUE.HAS_DATA}
}

proc update_MODELPARAM_VALUE.HAS_KEEP { MODELPARAM_VALUE.HAS_KEEP PARAM_VALUE.HAS_KEEP } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HAS_KEEP}] ${MODELPARAM_VALUE.HAS_KEEP}
}

proc update_MODELPARAM_VALUE.HAS_LAST { MODELPARAM_VALUE.HAS_LAST PARAM_VALUE.HAS_LAST } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HAS_LAST}] ${MODELPARAM_VALUE.HAS_LAST}
}

proc update_MODELPARAM_VALUE.HAS_READY { MODELPARAM_VALUE.HAS_READY PARAM_VALUE.HAS_READY } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HAS_READY}] ${MODELPARAM_VALUE.HAS_READY}
}

proc update_MODELPARAM_VALUE.HAS_DEST { MODELPARAM_VALUE.HAS_DEST PARAM_VALUE.HAS_DEST } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HAS_DEST}] ${MODELPARAM_VALUE.HAS_DEST}
}

proc update_MODELPARAM_VALUE.HAS_USER { MODELPARAM_VALUE.HAS_USER PARAM_VALUE.HAS_USER } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HAS_USER}] ${MODELPARAM_VALUE.HAS_USER}
}

proc update_MODELPARAM_VALUE.HAS_ID { MODELPARAM_VALUE.HAS_ID PARAM_VALUE.HAS_ID } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HAS_ID}] ${MODELPARAM_VALUE.HAS_ID}
}

proc update_MODELPARAM_VALUE.HAS_STRB { MODELPARAM_VALUE.HAS_STRB PARAM_VALUE.HAS_STRB } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HAS_STRB}] ${MODELPARAM_VALUE.HAS_STRB}
}

proc update_MODELPARAM_VALUE.ID_WIDTH { MODELPARAM_VALUE.ID_WIDTH PARAM_VALUE.ID_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ID_WIDTH}] ${MODELPARAM_VALUE.ID_WIDTH}
}

proc update_MODELPARAM_VALUE.DEST_WIDTH { MODELPARAM_VALUE.DEST_WIDTH PARAM_VALUE.DEST_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DEST_WIDTH}] ${MODELPARAM_VALUE.DEST_WIDTH}
}

proc update_MODELPARAM_VALUE.USER_WIDTH { MODELPARAM_VALUE.USER_WIDTH PARAM_VALUE.USER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.USER_WIDTH}] ${MODELPARAM_VALUE.USER_WIDTH}
}

