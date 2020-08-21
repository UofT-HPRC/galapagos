set lang "C++"
set moduleName "galapagos_bridge"
set moduleIsExternC "0"
set rawDecl ""
set globalVariable ""
set PortList ""
set PortName0 "g2N_input"
set BitWidth0 "64"
set ArrayOpt0 ""
set Const0 "0"
set Volatile0 "0"
set Pointer0 "1"
set Reference0 "0"
set Dims0 [list 0]
set Interface0 [list AP_STREAM 0] 
set structMem0 ""
set PortName00 "data"
set BitWidth00 "64"
set ArrayOpt00 ""
set Const00 "0"
set Volatile00 "0"
set Pointer00 "0"
set Reference00 "0"
set Dims00 [list 0]
set Interface00 "wire"
set DataType00 "[list ap_uint 64 ]"
set Port00 [list $PortName00 $Interface00 $DataType00 $Pointer00 $Dims00 $Const00 $Volatile00 $ArrayOpt00]
lappend structMem0 $Port00
set PortName01 "dest"
set BitWidth01 "8"
set ArrayOpt01 ""
set Const01 "0"
set Volatile01 "0"
set Pointer01 "0"
set Reference01 "0"
set Dims01 [list 0]
set Interface01 "wire"
set DataType01 "[list ap_uint 8 ]"
set Port01 [list $PortName01 $Interface01 $DataType01 $Pointer01 $Dims01 $Const01 $Volatile01 $ArrayOpt01]
lappend structMem0 $Port01
set PortName02 "last"
set BitWidth02 "8"
set ArrayOpt02 ""
set Const02 "0"
set Volatile02 "0"
set Pointer02 "0"
set Reference02 "0"
set Dims02 [list 0]
set Interface02 "wire"
set DataType02 "[list ap_uint 1 ]"
set Port02 [list $PortName02 $Interface02 $DataType02 $Pointer02 $Dims02 $Const02 $Volatile02 $ArrayOpt02]
lappend structMem0 $Port02
set PortName03 "id"
set BitWidth03 "8"
set ArrayOpt03 ""
set Const03 "0"
set Volatile03 "0"
set Pointer03 "0"
set Reference03 "0"
set Dims03 [list 0]
set Interface03 "wire"
set DataType03 "[list ap_uint 8 ]"
set Port03 [list $PortName03 $Interface03 $DataType03 $Pointer03 $Dims03 $Const03 $Volatile03 $ArrayOpt03]
lappend structMem0 $Port03
set PortName04 "keep"
set BitWidth04 "8"
set ArrayOpt04 ""
set Const04 "0"
set Volatile04 "0"
set Pointer04 "0"
set Reference04 "0"
set Dims04 [list 0]
set Interface04 "wire"
set DataType04 "[list ap_uint 8 ]"
set Port04 [list $PortName04 $Interface04 $DataType04 $Pointer04 $Dims04 $Const04 $Volatile04 $ArrayOpt04]
lappend structMem0 $Port04
set DataType0tp0 "int"
set structParameter0 [list [list $DataType0tp0 T] ]
set structArgument0 [list 64 ]
set SpaceName00 "galapagos"
set NameSpace0 [list  [list  space $SpaceName00] ]
set structIsPacked0 "0"
set DataType0 [list "galapagos::stream_packet<64>" "struct stream_packet" $structMem0 1 0 $structParameter0 $structArgument0 $NameSpace0 $structIsPacked0]
set Port0 [list $PortName0 $Interface0 $DataType0 $Pointer0 $Dims0 $Const0 $Volatile0 $ArrayOpt0]
lappend PortList $Port0
set PortName1 "g2N_output"
set BitWidth1 "64"
set ArrayOpt1 ""
set Const1 "0"
set Volatile1 "0"
set Pointer1 "1"
set Reference1 "0"
set Dims1 [list 0]
set Interface1 [list AP_STREAM 0] 
set structMem1 ""
set PortName10 "data"
set BitWidth10 "64"
set ArrayOpt10 ""
set Const10 "0"
set Volatile10 "0"
set Pointer10 "0"
set Reference10 "0"
set Dims10 [list 0]
set Interface10 "wire"
set DataType10 "[list ap_uint 64 ]"
set Port10 [list $PortName10 $Interface10 $DataType10 $Pointer10 $Dims10 $Const10 $Volatile10 $ArrayOpt10]
lappend structMem1 $Port10
set PortName11 "keep"
set BitWidth11 "8"
set ArrayOpt11 ""
set Const11 "0"
set Volatile11 "0"
set Pointer11 "0"
set Reference11 "0"
set Dims11 [list 0]
set Interface11 "wire"
set DataType11 "[list ap_uint 8 ]"
set Port11 [list $PortName11 $Interface11 $DataType11 $Pointer11 $Dims11 $Const11 $Volatile11 $ArrayOpt11]
lappend structMem1 $Port11
set PortName12 "last"
set BitWidth12 "8"
set ArrayOpt12 ""
set Const12 "0"
set Volatile12 "0"
set Pointer12 "0"
set Reference12 "0"
set Dims12 [list 0]
set Interface12 "wire"
set DataType12 "[list ap_uint 1 ]"
set Port12 [list $PortName12 $Interface12 $DataType12 $Pointer12 $Dims12 $Const12 $Volatile12 $ArrayOpt12]
lappend structMem1 $Port12
set DataType1tp0 "int"
set structParameter1 [list [list $DataType1tp0 D] ]
set structArgument1 [list 64 ]
set NameSpace1 [list ]
set structIsPacked1 "0"
set DataType1 [list "ap_axis_net<64>" "struct ap_axis_net" $structMem1 1 0 $structParameter1 $structArgument1 $NameSpace1 $structIsPacked1]
set Port1 [list $PortName1 $Interface1 $DataType1 $Pointer1 $Dims1 $Const1 $Volatile1 $ArrayOpt1]
lappend PortList $Port1
set PortName2 "buffer_storage_A"
set BitWidth2 "64"
set ArrayOpt2 ""
set Const2 "0"
set Volatile2 "0"
set Pointer2 "0"
set Reference2 "0"
set Dims2 [list 512]
set Interface2 "wire"
set DataType2 "[list ap_uint 64 ]"
set Port2 [list $PortName2 $Interface2 $DataType2 $Pointer2 $Dims2 $Const2 $Volatile2 $ArrayOpt2]
lappend PortList $Port2
set PortName3 "buffer_storage_B"
set BitWidth3 "64"
set ArrayOpt3 ""
set Const3 "0"
set Volatile3 "0"
set Pointer3 "0"
set Reference3 "0"
set Dims3 [list 512]
set Interface3 "wire"
set DataType3 "[list ap_uint 64 ]"
set Port3 [list $PortName3 $Interface3 $DataType3 $Pointer3 $Dims3 $Const3 $Volatile3 $ArrayOpt3]
lappend PortList $Port3
set PortName4 "n2G_input"
set BitWidth4 "64"
set ArrayOpt4 ""
set Const4 "0"
set Volatile4 "0"
set Pointer4 "1"
set Reference4 "0"
set Dims4 [list 0]
set Interface4 [list AP_STREAM 0] 
set structMem4 ""
set PortName40 "data"
set BitWidth40 "64"
set ArrayOpt40 ""
set Const40 "0"
set Volatile40 "0"
set Pointer40 "0"
set Reference40 "0"
set Dims40 [list 0]
set Interface40 "wire"
set DataType40 "[list ap_uint 64 ]"
set Port40 [list $PortName40 $Interface40 $DataType40 $Pointer40 $Dims40 $Const40 $Volatile40 $ArrayOpt40]
lappend structMem4 $Port40
set PortName41 "keep"
set BitWidth41 "8"
set ArrayOpt41 ""
set Const41 "0"
set Volatile41 "0"
set Pointer41 "0"
set Reference41 "0"
set Dims41 [list 0]
set Interface41 "wire"
set DataType41 "[list ap_uint 8 ]"
set Port41 [list $PortName41 $Interface41 $DataType41 $Pointer41 $Dims41 $Const41 $Volatile41 $ArrayOpt41]
lappend structMem4 $Port41
set PortName42 "last"
set BitWidth42 "8"
set ArrayOpt42 ""
set Const42 "0"
set Volatile42 "0"
set Pointer42 "0"
set Reference42 "0"
set Dims42 [list 0]
set Interface42 "wire"
set DataType42 "[list ap_uint 1 ]"
set Port42 [list $PortName42 $Interface42 $DataType42 $Pointer42 $Dims42 $Const42 $Volatile42 $ArrayOpt42]
lappend structMem4 $Port42
set DataType4tp0 "int"
set structParameter4 [list [list $DataType4tp0 D] ]
set structArgument4 [list 64 ]
set NameSpace4 [list ]
set structIsPacked4 "0"
set DataType4 [list "ap_axis_net<64>" "struct ap_axis_net" $structMem4 1 0 $structParameter4 $structArgument4 $NameSpace4 $structIsPacked4]
set Port4 [list $PortName4 $Interface4 $DataType4 $Pointer4 $Dims4 $Const4 $Volatile4 $ArrayOpt4]
lappend PortList $Port4
set PortName5 "n2G_output"
set BitWidth5 "64"
set ArrayOpt5 ""
set Const5 "0"
set Volatile5 "0"
set Pointer5 "1"
set Reference5 "0"
set Dims5 [list 0]
set Interface5 [list AP_STREAM 0] 
set structMem5 ""
set PortName50 "data"
set BitWidth50 "64"
set ArrayOpt50 ""
set Const50 "0"
set Volatile50 "0"
set Pointer50 "0"
set Reference50 "0"
set Dims50 [list 0]
set Interface50 "wire"
set DataType50 "[list ap_uint 64 ]"
set Port50 [list $PortName50 $Interface50 $DataType50 $Pointer50 $Dims50 $Const50 $Volatile50 $ArrayOpt50]
lappend structMem5 $Port50
set PortName51 "dest"
set BitWidth51 "8"
set ArrayOpt51 ""
set Const51 "0"
set Volatile51 "0"
set Pointer51 "0"
set Reference51 "0"
set Dims51 [list 0]
set Interface51 "wire"
set DataType51 "[list ap_uint 8 ]"
set Port51 [list $PortName51 $Interface51 $DataType51 $Pointer51 $Dims51 $Const51 $Volatile51 $ArrayOpt51]
lappend structMem5 $Port51
set PortName52 "last"
set BitWidth52 "8"
set ArrayOpt52 ""
set Const52 "0"
set Volatile52 "0"
set Pointer52 "0"
set Reference52 "0"
set Dims52 [list 0]
set Interface52 "wire"
set DataType52 "[list ap_uint 1 ]"
set Port52 [list $PortName52 $Interface52 $DataType52 $Pointer52 $Dims52 $Const52 $Volatile52 $ArrayOpt52]
lappend structMem5 $Port52
set PortName53 "id"
set BitWidth53 "8"
set ArrayOpt53 ""
set Const53 "0"
set Volatile53 "0"
set Pointer53 "0"
set Reference53 "0"
set Dims53 [list 0]
set Interface53 "wire"
set DataType53 "[list ap_uint 8 ]"
set Port53 [list $PortName53 $Interface53 $DataType53 $Pointer53 $Dims53 $Const53 $Volatile53 $ArrayOpt53]
lappend structMem5 $Port53
set PortName54 "keep"
set BitWidth54 "8"
set ArrayOpt54 ""
set Const54 "0"
set Volatile54 "0"
set Pointer54 "0"
set Reference54 "0"
set Dims54 [list 0]
set Interface54 "wire"
set DataType54 "[list ap_uint 8 ]"
set Port54 [list $PortName54 $Interface54 $DataType54 $Pointer54 $Dims54 $Const54 $Volatile54 $ArrayOpt54]
lappend structMem5 $Port54
set DataType5tp0 "int"
set structParameter5 [list [list $DataType5tp0 T] ]
set structArgument5 [list 64 ]
set SpaceName50 "galapagos"
set NameSpace5 [list  [list  space $SpaceName50] ]
set structIsPacked5 "0"
set DataType5 [list "galapagos::stream_packet<64>" "struct stream_packet" $structMem5 1 0 $structParameter5 $structArgument5 $NameSpace5 $structIsPacked5]
set Port5 [list $PortName5 $Interface5 $DataType5 $Pointer5 $Dims5 $Const5 $Volatile5 $ArrayOpt5]
lappend PortList $Port5
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
