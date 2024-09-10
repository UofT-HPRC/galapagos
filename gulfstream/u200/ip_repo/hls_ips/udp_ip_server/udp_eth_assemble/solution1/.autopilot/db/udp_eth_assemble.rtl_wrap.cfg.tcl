set lang "C++"
set moduleName "udp_eth_assemble"
set moduleIsExternC "0"
set rawDecl ""
set globalVariable ""
set PortList ""
set PortName0 "myMac"
set BitWidth0 "64"
set ArrayOpt0 ""
set Const0 "0"
set Volatile0 "0"
set Pointer0 "0"
set Reference0 "0"
set Dims0 [list 0]
set Interface0 "wire"
set DataType0 "[list ap_uint 48 ]"
set Port0 [list $PortName0 $Interface0 $DataType0 $Pointer0 $Dims0 $Const0 $Volatile0 $ArrayOpt0]
lappend PortList $Port0
set PortName1 "myIP"
set BitWidth1 "32"
set ArrayOpt1 ""
set Const1 "0"
set Volatile1 "0"
set Pointer1 "0"
set Reference1 "0"
set Dims1 [list 0]
set Interface1 "wire"
set DataType1 "[list ap_uint 32 ]"
set Port1 [list $PortName1 $Interface1 $DataType1 $Pointer1 $Dims1 $Const1 $Volatile1 $ArrayOpt1]
lappend PortList $Port1
set PortName2 "action"
set BitWidth2 "256"
set ArrayOpt2 ""
set Const2 "0"
set Volatile2 "0"
set Pointer2 "0"
set Reference2 "0"
set Dims2 [list 0]
set Interface2 "wire"
set structMem2 ""
set PortName20 "dst_ip"
set BitWidth20 "32"
set ArrayOpt20 ""
set Const20 "0"
set Volatile20 "0"
set Pointer20 "0"
set Reference20 "0"
set Dims20 [list 0]
set Interface20 "wire"
set DataType20 "[list ap_uint 32 ]"
set Port20 [list $PortName20 $Interface20 $DataType20 $Pointer20 $Dims20 $Const20 $Volatile20 $ArrayOpt20]
lappend structMem2 $Port20
set PortName21 "dst_mac"
set BitWidth21 "64"
set ArrayOpt21 ""
set Const21 "0"
set Volatile21 "0"
set Pointer21 "0"
set Reference21 "0"
set Dims21 [list 0]
set Interface21 "wire"
set DataType21 "[list ap_uint 48 ]"
set Port21 [list $PortName21 $Interface21 $DataType21 $Pointer21 $Dims21 $Const21 $Volatile21 $ArrayOpt21]
lappend structMem2 $Port21
set PortName22 "src_port"
set BitWidth22 "16"
set ArrayOpt22 ""
set Const22 "0"
set Volatile22 "0"
set Pointer22 "0"
set Reference22 "0"
set Dims22 [list 0]
set Interface22 "wire"
set DataType22 "[list ap_uint 16 ]"
set Port22 [list $PortName22 $Interface22 $DataType22 $Pointer22 $Dims22 $Const22 $Volatile22 $ArrayOpt22]
lappend structMem2 $Port22
set PortName23 "dst_port"
set BitWidth23 "16"
set ArrayOpt23 ""
set Const23 "0"
set Volatile23 "0"
set Pointer23 "0"
set Reference23 "0"
set Dims23 [list 0]
set Interface23 "wire"
set DataType23 "[list ap_uint 16 ]"
set Port23 [list $PortName23 $Interface23 $DataType23 $Pointer23 $Dims23 $Const23 $Volatile23 $ArrayOpt23]
lappend structMem2 $Port23
set PortName24 "udp_cksum"
set BitWidth24 "32"
set ArrayOpt24 ""
set Const24 "0"
set Volatile24 "0"
set Pointer24 "0"
set Reference24 "0"
set Dims24 [list 0]
set Interface24 "wire"
set DataType24 "[list ap_uint 17 ]"
set Port24 [list $PortName24 $Interface24 $DataType24 $Pointer24 $Dims24 $Const24 $Volatile24 $ArrayOpt24]
lappend structMem2 $Port24
set PortName25 "ip_cksum"
set BitWidth25 "16"
set ArrayOpt25 ""
set Const25 "0"
set Volatile25 "0"
set Pointer25 "0"
set Reference25 "0"
set Dims25 [list 0]
set Interface25 "wire"
set DataType25 "[list ap_uint 16 ]"
set Port25 [list $PortName25 $Interface25 $DataType25 $Pointer25 $Dims25 $Const25 $Volatile25 $ArrayOpt25]
lappend structMem2 $Port25
set PortName26 "payload_length"
set BitWidth26 "16"
set ArrayOpt26 ""
set Const26 "0"
set Volatile26 "0"
set Pointer26 "0"
set Reference26 "0"
set Dims26 [list 0]
set Interface26 "wire"
set DataType26 "[list ap_uint 16 ]"
set Port26 [list $PortName26 $Interface26 $DataType26 $Pointer26 $Dims26 $Const26 $Volatile26 $ArrayOpt26]
lappend structMem2 $Port26
set structParameter2 [list ]
set structArgument2 [list ]
set NameSpace2 [list ]
set structIsPacked2 "0"
set DataType2 [list "ACTION_BOX" "struct ACTION_BOX" $structMem2 1 0 $structParameter2 $structArgument2 $NameSpace2 $structIsPacked2]
set Port2 [list $PortName2 $Interface2 $DataType2 $Pointer2 $Dims2 $Const2 $Volatile2 $ArrayOpt2]
lappend PortList $Port2
set PortName3 "action_valid"
set BitWidth3 "8"
set ArrayOpt3 ""
set Const3 "0"
set Volatile3 "0"
set Pointer3 "0"
set Reference3 "0"
set Dims3 [list 0]
set Interface3 "wire"
set DataType3 "[list ap_uint 1 ]"
set Port3 [list $PortName3 $Interface3 $DataType3 $Pointer3 $Dims3 $Const3 $Volatile3 $ArrayOpt3]
lappend PortList $Port3
set PortName4 "action_empty"
set BitWidth4 "8"
set ArrayOpt4 ""
set Const4 "0"
set Volatile4 "0"
set Pointer4 "0"
set Reference4 "0"
set Dims4 [list 0]
set Interface4 "wire"
set DataType4 "[list ap_uint 1 ]"
set Port4 [list $PortName4 $Interface4 $DataType4 $Pointer4 $Dims4 $Const4 $Volatile4 $ArrayOpt4]
lappend PortList $Port4
set PortName5 "action_re"
set BitWidth5 "8"
set ArrayOpt5 ""
set Const5 "0"
set Volatile5 "0"
set Pointer5 "2"
set Reference5 "1"
set Dims5 [list 0]
set Interface5 "wire"
set DataType5 "[list ap_uint 1 ]"
set Port5 [list $PortName5 $Interface5 $DataType5 $Pointer5 $Dims5 $Const5 $Volatile5 $ArrayOpt5]
lappend PortList $Port5
set PortName6 "payload_in"
set BitWidth6 "1024"
set ArrayOpt6 ""
set Const6 "0"
set Volatile6 "0"
set Pointer6 "0"
set Reference6 "0"
set Dims6 [list 0]
set Interface6 "wire"
set structMem6 ""
set PortName60 "data"
set BitWidth60 "512"
set ArrayOpt60 ""
set Const60 "0"
set Volatile60 "0"
set Pointer60 "0"
set Reference60 "0"
set Dims60 [list 0]
set Interface60 "wire"
set DataType60 "[list ap_uint 512 ]"
set Port60 [list $PortName60 $Interface60 $DataType60 $Pointer60 $Dims60 $Const60 $Volatile60 $ArrayOpt60]
lappend structMem6 $Port60
set PortName61 "keep"
set BitWidth61 "64"
set ArrayOpt61 ""
set Const61 "0"
set Volatile61 "0"
set Pointer61 "0"
set Reference61 "0"
set Dims61 [list 0]
set Interface61 "wire"
set DataType61 "[list ap_uint 64 ]"
set Port61 [list $PortName61 $Interface61 $DataType61 $Pointer61 $Dims61 $Const61 $Volatile61 $ArrayOpt61]
lappend structMem6 $Port61
set PortName62 "valid"
set BitWidth62 "8"
set ArrayOpt62 ""
set Const62 "0"
set Volatile62 "0"
set Pointer62 "0"
set Reference62 "0"
set Dims62 [list 0]
set Interface62 "wire"
set DataType62 "[list ap_uint 1 ]"
set Port62 [list $PortName62 $Interface62 $DataType62 $Pointer62 $Dims62 $Const62 $Volatile62 $ArrayOpt62]
lappend structMem6 $Port62
set PortName63 "last"
set BitWidth63 "8"
set ArrayOpt63 ""
set Const63 "0"
set Volatile63 "0"
set Pointer63 "0"
set Reference63 "0"
set Dims63 [list 0]
set Interface63 "wire"
set DataType63 "[list ap_uint 1 ]"
set Port63 [list $PortName63 $Interface63 $DataType63 $Pointer63 $Dims63 $Const63 $Volatile63 $ArrayOpt63]
lappend structMem6 $Port63
set structParameter6 [list ]
set structArgument6 [list ]
set NameSpace6 [list ]
set structIsPacked6 "0"
set DataType6 [list "PAYLOAD_FULL" "struct PAYLOAD_FULL" $structMem6 1 0 $structParameter6 $structArgument6 $NameSpace6 $structIsPacked6]
set Port6 [list $PortName6 $Interface6 $DataType6 $Pointer6 $Dims6 $Const6 $Volatile6 $ArrayOpt6]
lappend PortList $Port6
set PortName7 "payload_ready"
set BitWidth7 "8"
set ArrayOpt7 ""
set Const7 "0"
set Volatile7 "0"
set Pointer7 "2"
set Reference7 "1"
set Dims7 [list 0]
set Interface7 "wire"
set DataType7 "[list ap_uint 1 ]"
set Port7 [list $PortName7 $Interface7 $DataType7 $Pointer7 $Dims7 $Const7 $Volatile7 $ArrayOpt7]
lappend PortList $Port7
set PortName8 "packet_out"
set BitWidth8 "1024"
set ArrayOpt8 ""
set Const8 "0"
set Volatile8 "0"
set Pointer8 "2"
set Reference8 "1"
set Dims8 [list 0]
set Interface8 "wire"
set structMem8 ""
set PortName80 "data"
set BitWidth80 "512"
set ArrayOpt80 ""
set Const80 "0"
set Volatile80 "0"
set Pointer80 "0"
set Reference80 "0"
set Dims80 [list 0]
set Interface80 "wire"
set DataType80 "[list ap_uint 512 ]"
set Port80 [list $PortName80 $Interface80 $DataType80 $Pointer80 $Dims80 $Const80 $Volatile80 $ArrayOpt80]
lappend structMem8 $Port80
set PortName81 "keep"
set BitWidth81 "64"
set ArrayOpt81 ""
set Const81 "0"
set Volatile81 "0"
set Pointer81 "0"
set Reference81 "0"
set Dims81 [list 0]
set Interface81 "wire"
set DataType81 "[list ap_uint 64 ]"
set Port81 [list $PortName81 $Interface81 $DataType81 $Pointer81 $Dims81 $Const81 $Volatile81 $ArrayOpt81]
lappend structMem8 $Port81
set PortName82 "valid"
set BitWidth82 "8"
set ArrayOpt82 ""
set Const82 "0"
set Volatile82 "0"
set Pointer82 "0"
set Reference82 "0"
set Dims82 [list 0]
set Interface82 "wire"
set DataType82 "[list ap_uint 1 ]"
set Port82 [list $PortName82 $Interface82 $DataType82 $Pointer82 $Dims82 $Const82 $Volatile82 $ArrayOpt82]
lappend structMem8 $Port82
set PortName83 "last"
set BitWidth83 "8"
set ArrayOpt83 ""
set Const83 "0"
set Volatile83 "0"
set Pointer83 "0"
set Reference83 "0"
set Dims83 [list 0]
set Interface83 "wire"
set DataType83 "[list ap_uint 1 ]"
set Port83 [list $PortName83 $Interface83 $DataType83 $Pointer83 $Dims83 $Const83 $Volatile83 $ArrayOpt83]
lappend structMem8 $Port83
set structParameter8 [list ]
set structArgument8 [list ]
set NameSpace8 [list ]
set structIsPacked8 "0"
set DataType8 [list "AXIS_RAW" "struct AXIS_RAW" $structMem8 1 0 $structParameter8 $structArgument8 $NameSpace8 $structIsPacked8]
set Port8 [list $PortName8 $Interface8 $DataType8 $Pointer8 $Dims8 $Const8 $Volatile8 $ArrayOpt8]
lappend PortList $Port8
set PortName9 "packet_out_ready"
set BitWidth9 "8"
set ArrayOpt9 ""
set Const9 "0"
set Volatile9 "0"
set Pointer9 "0"
set Reference9 "0"
set Dims9 [list 0]
set Interface9 "wire"
set DataType9 "[list ap_uint 1 ]"
set Port9 [list $PortName9 $Interface9 $DataType9 $Pointer9 $Dims9 $Const9 $Volatile9 $ArrayOpt9]
lappend PortList $Port9
set globalAPint "" 
set returnAPInt "" 
set hasCPPAPInt 1 
set argAPInt "" 
set hasCPPAPFix 0 
set hasSCFix 0 
set hasCBool 0 
set hasCPPComplex 0 
set isTemplateTop 0
set hasHalf 0 
set dataPackList ""
set module [list $moduleName $PortList $rawDecl $argAPInt $returnAPInt $dataPackList]
