set lang "C++"
set moduleName "router"
set moduleIsExternC "0"
set rawDecl ""
set globalVariable ""
set PortList ""
set PortName0 "network_table"
set BitWidth0 "64"
set ArrayOpt0 ""
set Const0 "1"
set Volatile0 "0"
set Pointer0 "0"
set Reference0 "0"
set Dims0 [list 256]
set Interface0 "wire"
set DataType0 "[list ap_uint 48 ]"
set Port0 [list $PortName0 $Interface0 $DataType0 $Pointer0 $Dims0 $Const0 $Volatile0 $ArrayOpt0]
lappend PortList $Port0
set PortName1 "network_addr"
set BitWidth1 "64"
set ArrayOpt1 ""
set Const1 "1"
set Volatile1 "0"
set Pointer1 "0"
set Reference1 "0"
set Dims1 [list 0]
set Interface1 "wire"
set DataType1 "[list ap_uint 48 ]"
set Port1 [list $PortName1 $Interface1 $DataType1 $Pointer1 $Dims1 $Const1 $Volatile1 $ArrayOpt1]
lappend PortList $Port1
set PortName2 "stream_in"
set BitWidth2 "64"
set ArrayOpt2 ""
set Const2 "0"
set Volatile2 "0"
set Pointer2 "1"
set Reference2 "0"
set Dims2 [list 0]
set Interface2 [list AP_STREAM 0] 
set structMem2 ""
set PortName20 "data"
set BitWidth20 "64"
set ArrayOpt20 ""
set Const20 "0"
set Volatile20 "0"
set Pointer20 "0"
set Reference20 "0"
set Dims20 [list 0]
set Interface20 "wire"
set DataType20 "[list ap_uint 64 ]"
set Port20 [list $PortName20 $Interface20 $DataType20 $Pointer20 $Dims20 $Const20 $Volatile20 $ArrayOpt20]
lappend structMem2 $Port20
set PortName21 "dest"
set BitWidth21 "8"
set ArrayOpt21 ""
set Const21 "0"
set Volatile21 "0"
set Pointer21 "0"
set Reference21 "0"
set Dims21 [list 0]
set Interface21 "wire"
set DataType21 "[list ap_uint 8 ]"
set Port21 [list $PortName21 $Interface21 $DataType21 $Pointer21 $Dims21 $Const21 $Volatile21 $ArrayOpt21]
lappend structMem2 $Port21
set PortName22 "last"
set BitWidth22 "8"
set ArrayOpt22 ""
set Const22 "0"
set Volatile22 "0"
set Pointer22 "0"
set Reference22 "0"
set Dims22 [list 0]
set Interface22 "wire"
set DataType22 "[list ap_uint 1 ]"
set Port22 [list $PortName22 $Interface22 $DataType22 $Pointer22 $Dims22 $Const22 $Volatile22 $ArrayOpt22]
lappend structMem2 $Port22
set PortName23 "id"
set BitWidth23 "8"
set ArrayOpt23 ""
set Const23 "0"
set Volatile23 "0"
set Pointer23 "0"
set Reference23 "0"
set Dims23 [list 0]
set Interface23 "wire"
set DataType23 "[list ap_uint 8 ]"
set Port23 [list $PortName23 $Interface23 $DataType23 $Pointer23 $Dims23 $Const23 $Volatile23 $ArrayOpt23]
lappend structMem2 $Port23
set PortName24 "keep"
set BitWidth24 "8"
set ArrayOpt24 ""
set Const24 "0"
set Volatile24 "0"
set Pointer24 "0"
set Reference24 "0"
set Dims24 [list 0]
set Interface24 "wire"
set DataType24 "[list ap_uint 8 ]"
set Port24 [list $PortName24 $Interface24 $DataType24 $Pointer24 $Dims24 $Const24 $Volatile24 $ArrayOpt24]
lappend structMem2 $Port24
set DataType2tp0 "int"
set structParameter2 [list [list $DataType2tp0 T] ]
set structArgument2 [list 64 ]
set SpaceName20 "galapagos"
set NameSpace2 [list  [list  space $SpaceName20] ]
set structIsPacked2 "0"
set DataType2 [list "galapagos::stream_packet<64>" "struct stream_packet" $structMem2 1 0 $structParameter2 $structArgument2 $NameSpace2 $structIsPacked2]
set Port2 [list $PortName2 $Interface2 $DataType2 $Pointer2 $Dims2 $Const2 $Volatile2 $ArrayOpt2]
lappend PortList $Port2
set PortName3 "stream_out_switch"
set BitWidth3 "64"
set ArrayOpt3 ""
set Const3 "0"
set Volatile3 "0"
set Pointer3 "1"
set Reference3 "0"
set Dims3 [list 0]
set Interface3 [list AP_STREAM 0] 
set structMem3 ""
set PortName30 "data"
set BitWidth30 "64"
set ArrayOpt30 ""
set Const30 "0"
set Volatile30 "0"
set Pointer30 "0"
set Reference30 "0"
set Dims30 [list 0]
set Interface30 "wire"
set DataType30 "[list ap_uint 64 ]"
set Port30 [list $PortName30 $Interface30 $DataType30 $Pointer30 $Dims30 $Const30 $Volatile30 $ArrayOpt30]
lappend structMem3 $Port30
set PortName31 "dest"
set BitWidth31 "8"
set ArrayOpt31 ""
set Const31 "0"
set Volatile31 "0"
set Pointer31 "0"
set Reference31 "0"
set Dims31 [list 0]
set Interface31 "wire"
set DataType31 "[list ap_uint 8 ]"
set Port31 [list $PortName31 $Interface31 $DataType31 $Pointer31 $Dims31 $Const31 $Volatile31 $ArrayOpt31]
lappend structMem3 $Port31
set PortName32 "last"
set BitWidth32 "8"
set ArrayOpt32 ""
set Const32 "0"
set Volatile32 "0"
set Pointer32 "0"
set Reference32 "0"
set Dims32 [list 0]
set Interface32 "wire"
set DataType32 "[list ap_uint 1 ]"
set Port32 [list $PortName32 $Interface32 $DataType32 $Pointer32 $Dims32 $Const32 $Volatile32 $ArrayOpt32]
lappend structMem3 $Port32
set PortName33 "id"
set BitWidth33 "8"
set ArrayOpt33 ""
set Const33 "0"
set Volatile33 "0"
set Pointer33 "0"
set Reference33 "0"
set Dims33 [list 0]
set Interface33 "wire"
set DataType33 "[list ap_uint 8 ]"
set Port33 [list $PortName33 $Interface33 $DataType33 $Pointer33 $Dims33 $Const33 $Volatile33 $ArrayOpt33]
lappend structMem3 $Port33
set PortName34 "keep"
set BitWidth34 "8"
set ArrayOpt34 ""
set Const34 "0"
set Volatile34 "0"
set Pointer34 "0"
set Reference34 "0"
set Dims34 [list 0]
set Interface34 "wire"
set DataType34 "[list ap_uint 8 ]"
set Port34 [list $PortName34 $Interface34 $DataType34 $Pointer34 $Dims34 $Const34 $Volatile34 $ArrayOpt34]
lappend structMem3 $Port34
set DataType3tp0 "int"
set structParameter3 [list [list $DataType3tp0 T] ]
set structArgument3 [list 64 ]
set SpaceName30 "galapagos"
set NameSpace3 [list  [list  space $SpaceName30] ]
set structIsPacked3 "0"
set DataType3 [list "galapagos::stream_packet<64>" "struct stream_packet" $structMem3 1 0 $structParameter3 $structArgument3 $NameSpace3 $structIsPacked3]
set Port3 [list $PortName3 $Interface3 $DataType3 $Pointer3 $Dims3 $Const3 $Volatile3 $ArrayOpt3]
lappend PortList $Port3
set PortName4 "stream_out_network"
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
set PortName41 "dest"
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
set PortName43 "id"
set BitWidth43 "8"
set ArrayOpt43 ""
set Const43 "0"
set Volatile43 "0"
set Pointer43 "0"
set Reference43 "0"
set Dims43 [list 0]
set Interface43 "wire"
set DataType43 "[list ap_uint 8 ]"
set Port43 [list $PortName43 $Interface43 $DataType43 $Pointer43 $Dims43 $Const43 $Volatile43 $ArrayOpt43]
lappend structMem4 $Port43
set PortName44 "keep"
set BitWidth44 "8"
set ArrayOpt44 ""
set Const44 "0"
set Volatile44 "0"
set Pointer44 "0"
set Reference44 "0"
set Dims44 [list 0]
set Interface44 "wire"
set DataType44 "[list ap_uint 8 ]"
set Port44 [list $PortName44 $Interface44 $DataType44 $Pointer44 $Dims44 $Const44 $Volatile44 $ArrayOpt44]
lappend structMem4 $Port44
set DataType4tp0 "int"
set structParameter4 [list [list $DataType4tp0 T] ]
set structArgument4 [list 64 ]
set SpaceName40 "galapagos"
set NameSpace4 [list  [list  space $SpaceName40] ]
set structIsPacked4 "0"
set DataType4 [list "galapagos::stream_packet<64>" "struct stream_packet" $structMem4 1 0 $structParameter4 $structArgument4 $NameSpace4 $structIsPacked4]
set Port4 [list $PortName4 $Interface4 $DataType4 $Pointer4 $Dims4 $Const4 $Volatile4 $ArrayOpt4]
lappend PortList $Port4
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
