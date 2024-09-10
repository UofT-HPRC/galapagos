set lang "C++"
set moduleName "lbus_fifo_write"
set moduleIsExternC "0"
set rawDecl ""
set globalVariable ""
set PortList ""
set PortName0 "lbus"
set BitWidth0 "64"
set ArrayOpt0 ""
set Const0 "0"
set Volatile0 "0"
set Pointer0 "0"
set Reference0 "0"
set Dims0 [list 4]
set Interface0 "wire"
set structMem0 ""
set PortName00 "data"
set BitWidth00 "128"
set ArrayOpt00 ""
set Const00 "0"
set Volatile00 "0"
set Pointer00 "0"
set Reference00 "0"
set Dims00 [list 0]
set Interface00 "wire"
set DataType00 "[list ap_uint 128 ]"
set Port00 [list $PortName00 $Interface00 $DataType00 $Pointer00 $Dims00 $Const00 $Volatile00 $ArrayOpt00]
lappend structMem0 $Port00
set PortName01 "ena"
set BitWidth01 "8"
set ArrayOpt01 ""
set Const01 "0"
set Volatile01 "0"
set Pointer01 "0"
set Reference01 "0"
set Dims01 [list 0]
set Interface01 "wire"
set DataType01 "[list ap_uint 1 ]"
set Port01 [list $PortName01 $Interface01 $DataType01 $Pointer01 $Dims01 $Const01 $Volatile01 $ArrayOpt01]
lappend structMem0 $Port01
set PortName02 "sop"
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
set PortName03 "eop"
set BitWidth03 "8"
set ArrayOpt03 ""
set Const03 "0"
set Volatile03 "0"
set Pointer03 "0"
set Reference03 "0"
set Dims03 [list 0]
set Interface03 "wire"
set DataType03 "[list ap_uint 1 ]"
set Port03 [list $PortName03 $Interface03 $DataType03 $Pointer03 $Dims03 $Const03 $Volatile03 $ArrayOpt03]
lappend structMem0 $Port03
set PortName04 "err"
set BitWidth04 "8"
set ArrayOpt04 ""
set Const04 "0"
set Volatile04 "0"
set Pointer04 "0"
set Reference04 "0"
set Dims04 [list 0]
set Interface04 "wire"
set DataType04 "[list ap_uint 1 ]"
set Port04 [list $PortName04 $Interface04 $DataType04 $Pointer04 $Dims04 $Const04 $Volatile04 $ArrayOpt04]
lappend structMem0 $Port04
set PortName05 "mty"
set BitWidth05 "8"
set ArrayOpt05 ""
set Const05 "0"
set Volatile05 "0"
set Pointer05 "0"
set Reference05 "0"
set Dims05 [list 0]
set Interface05 "wire"
set DataType05 "[list ap_uint 4 ]"
set Port05 [list $PortName05 $Interface05 $DataType05 $Pointer05 $Dims05 $Const05 $Volatile05 $ArrayOpt05]
lappend structMem0 $Port05
set structParameter0 [list ]
set structArgument0 [list ]
set NameSpace0 [list ]
set structIsPacked0 "0"
set DataType0 [list "LBUS" "struct LBUS" $structMem0 1 0 $structParameter0 $structArgument0 $NameSpace0 $structIsPacked0]
set Port0 [list $PortName0 $Interface0 $DataType0 $Pointer0 $Dims0 $Const0 $Volatile0 $ArrayOpt0]
lappend PortList $Port0
set PortName1 "lbus_fifo"
set BitWidth1 "1024"
set ArrayOpt1 ""
set Const1 "0"
set Volatile1 "0"
set Pointer1 "2"
set Reference1 "1"
set Dims1 [list 0]
set Interface1 "wire"
set structMem1 ""
set PortName10 "lbus0"
set BitWidth10 "256"
set ArrayOpt10 ""
set Const10 "0"
set Volatile10 "0"
set Pointer10 "0"
set Reference10 "0"
set Dims10 [list 0]
set Interface10 "wire"
set structMem10 ""
set PortName100 "data"
set BitWidth100 "128"
set ArrayOpt100 ""
set Const100 "0"
set Volatile100 "0"
set Pointer100 "0"
set Reference100 "0"
set Dims100 [list 0]
set Interface100 "wire"
set DataType100 "[list ap_uint 128 ]"
set Port100 [list $PortName100 $Interface100 $DataType100 $Pointer100 $Dims100 $Const100 $Volatile100 $ArrayOpt100]
lappend structMem10 $Port100
set PortName101 "ena"
set BitWidth101 "8"
set ArrayOpt101 ""
set Const101 "0"
set Volatile101 "0"
set Pointer101 "0"
set Reference101 "0"
set Dims101 [list 0]
set Interface101 "wire"
set DataType101 "[list ap_uint 1 ]"
set Port101 [list $PortName101 $Interface101 $DataType101 $Pointer101 $Dims101 $Const101 $Volatile101 $ArrayOpt101]
lappend structMem10 $Port101
set PortName102 "sop"
set BitWidth102 "8"
set ArrayOpt102 ""
set Const102 "0"
set Volatile102 "0"
set Pointer102 "0"
set Reference102 "0"
set Dims102 [list 0]
set Interface102 "wire"
set DataType102 "[list ap_uint 1 ]"
set Port102 [list $PortName102 $Interface102 $DataType102 $Pointer102 $Dims102 $Const102 $Volatile102 $ArrayOpt102]
lappend structMem10 $Port102
set PortName103 "eop"
set BitWidth103 "8"
set ArrayOpt103 ""
set Const103 "0"
set Volatile103 "0"
set Pointer103 "0"
set Reference103 "0"
set Dims103 [list 0]
set Interface103 "wire"
set DataType103 "[list ap_uint 1 ]"
set Port103 [list $PortName103 $Interface103 $DataType103 $Pointer103 $Dims103 $Const103 $Volatile103 $ArrayOpt103]
lappend structMem10 $Port103
set PortName104 "err"
set BitWidth104 "8"
set ArrayOpt104 ""
set Const104 "0"
set Volatile104 "0"
set Pointer104 "0"
set Reference104 "0"
set Dims104 [list 0]
set Interface104 "wire"
set DataType104 "[list ap_uint 1 ]"
set Port104 [list $PortName104 $Interface104 $DataType104 $Pointer104 $Dims104 $Const104 $Volatile104 $ArrayOpt104]
lappend structMem10 $Port104
set PortName105 "mty"
set BitWidth105 "8"
set ArrayOpt105 ""
set Const105 "0"
set Volatile105 "0"
set Pointer105 "0"
set Reference105 "0"
set Dims105 [list 0]
set Interface105 "wire"
set DataType105 "[list ap_uint 4 ]"
set Port105 [list $PortName105 $Interface105 $DataType105 $Pointer105 $Dims105 $Const105 $Volatile105 $ArrayOpt105]
lappend structMem10 $Port105
set structParameter10 [list ]
set structArgument10 [list ]
set NameSpace10 [list ]
set structIsPacked10 "0"
set DataType10 [list "LBUS" "struct LBUS" $structMem10 1 0 $structParameter10 $structArgument10 $NameSpace10 $structIsPacked10]
set Port10 [list $PortName10 $Interface10 $DataType10 $Pointer10 $Dims10 $Const10 $Volatile10 $ArrayOpt10]
lappend structMem1 $Port10
set PortName11 "lbus1"
set BitWidth11 "256"
set ArrayOpt11 ""
set Const11 "0"
set Volatile11 "0"
set Pointer11 "0"
set Reference11 "0"
set Dims11 [list 0]
set Interface11 "wire"
set structMem11 ""
set PortName110 "data"
set BitWidth110 "128"
set ArrayOpt110 ""
set Const110 "0"
set Volatile110 "0"
set Pointer110 "0"
set Reference110 "0"
set Dims110 [list 0]
set Interface110 "wire"
set DataType110 "[list ap_uint 128 ]"
set Port110 [list $PortName110 $Interface110 $DataType110 $Pointer110 $Dims110 $Const110 $Volatile110 $ArrayOpt110]
lappend structMem11 $Port110
set PortName111 "ena"
set BitWidth111 "8"
set ArrayOpt111 ""
set Const111 "0"
set Volatile111 "0"
set Pointer111 "0"
set Reference111 "0"
set Dims111 [list 0]
set Interface111 "wire"
set DataType111 "[list ap_uint 1 ]"
set Port111 [list $PortName111 $Interface111 $DataType111 $Pointer111 $Dims111 $Const111 $Volatile111 $ArrayOpt111]
lappend structMem11 $Port111
set PortName112 "sop"
set BitWidth112 "8"
set ArrayOpt112 ""
set Const112 "0"
set Volatile112 "0"
set Pointer112 "0"
set Reference112 "0"
set Dims112 [list 0]
set Interface112 "wire"
set DataType112 "[list ap_uint 1 ]"
set Port112 [list $PortName112 $Interface112 $DataType112 $Pointer112 $Dims112 $Const112 $Volatile112 $ArrayOpt112]
lappend structMem11 $Port112
set PortName113 "eop"
set BitWidth113 "8"
set ArrayOpt113 ""
set Const113 "0"
set Volatile113 "0"
set Pointer113 "0"
set Reference113 "0"
set Dims113 [list 0]
set Interface113 "wire"
set DataType113 "[list ap_uint 1 ]"
set Port113 [list $PortName113 $Interface113 $DataType113 $Pointer113 $Dims113 $Const113 $Volatile113 $ArrayOpt113]
lappend structMem11 $Port113
set PortName114 "err"
set BitWidth114 "8"
set ArrayOpt114 ""
set Const114 "0"
set Volatile114 "0"
set Pointer114 "0"
set Reference114 "0"
set Dims114 [list 0]
set Interface114 "wire"
set DataType114 "[list ap_uint 1 ]"
set Port114 [list $PortName114 $Interface114 $DataType114 $Pointer114 $Dims114 $Const114 $Volatile114 $ArrayOpt114]
lappend structMem11 $Port114
set PortName115 "mty"
set BitWidth115 "8"
set ArrayOpt115 ""
set Const115 "0"
set Volatile115 "0"
set Pointer115 "0"
set Reference115 "0"
set Dims115 [list 0]
set Interface115 "wire"
set DataType115 "[list ap_uint 4 ]"
set Port115 [list $PortName115 $Interface115 $DataType115 $Pointer115 $Dims115 $Const115 $Volatile115 $ArrayOpt115]
lappend structMem11 $Port115
set structParameter11 [list ]
set structArgument11 [list ]
set NameSpace11 [list ]
set structIsPacked11 "0"
set DataType11 [list "LBUS" "struct LBUS" $structMem11 1 0 $structParameter11 $structArgument11 $NameSpace11 $structIsPacked11]
set Port11 [list $PortName11 $Interface11 $DataType11 $Pointer11 $Dims11 $Const11 $Volatile11 $ArrayOpt11]
lappend structMem1 $Port11
set PortName12 "lbus2"
set BitWidth12 "256"
set ArrayOpt12 ""
set Const12 "0"
set Volatile12 "0"
set Pointer12 "0"
set Reference12 "0"
set Dims12 [list 0]
set Interface12 "wire"
set structMem12 ""
set PortName120 "data"
set BitWidth120 "128"
set ArrayOpt120 ""
set Const120 "0"
set Volatile120 "0"
set Pointer120 "0"
set Reference120 "0"
set Dims120 [list 0]
set Interface120 "wire"
set DataType120 "[list ap_uint 128 ]"
set Port120 [list $PortName120 $Interface120 $DataType120 $Pointer120 $Dims120 $Const120 $Volatile120 $ArrayOpt120]
lappend structMem12 $Port120
set PortName121 "ena"
set BitWidth121 "8"
set ArrayOpt121 ""
set Const121 "0"
set Volatile121 "0"
set Pointer121 "0"
set Reference121 "0"
set Dims121 [list 0]
set Interface121 "wire"
set DataType121 "[list ap_uint 1 ]"
set Port121 [list $PortName121 $Interface121 $DataType121 $Pointer121 $Dims121 $Const121 $Volatile121 $ArrayOpt121]
lappend structMem12 $Port121
set PortName122 "sop"
set BitWidth122 "8"
set ArrayOpt122 ""
set Const122 "0"
set Volatile122 "0"
set Pointer122 "0"
set Reference122 "0"
set Dims122 [list 0]
set Interface122 "wire"
set DataType122 "[list ap_uint 1 ]"
set Port122 [list $PortName122 $Interface122 $DataType122 $Pointer122 $Dims122 $Const122 $Volatile122 $ArrayOpt122]
lappend structMem12 $Port122
set PortName123 "eop"
set BitWidth123 "8"
set ArrayOpt123 ""
set Const123 "0"
set Volatile123 "0"
set Pointer123 "0"
set Reference123 "0"
set Dims123 [list 0]
set Interface123 "wire"
set DataType123 "[list ap_uint 1 ]"
set Port123 [list $PortName123 $Interface123 $DataType123 $Pointer123 $Dims123 $Const123 $Volatile123 $ArrayOpt123]
lappend structMem12 $Port123
set PortName124 "err"
set BitWidth124 "8"
set ArrayOpt124 ""
set Const124 "0"
set Volatile124 "0"
set Pointer124 "0"
set Reference124 "0"
set Dims124 [list 0]
set Interface124 "wire"
set DataType124 "[list ap_uint 1 ]"
set Port124 [list $PortName124 $Interface124 $DataType124 $Pointer124 $Dims124 $Const124 $Volatile124 $ArrayOpt124]
lappend structMem12 $Port124
set PortName125 "mty"
set BitWidth125 "8"
set ArrayOpt125 ""
set Const125 "0"
set Volatile125 "0"
set Pointer125 "0"
set Reference125 "0"
set Dims125 [list 0]
set Interface125 "wire"
set DataType125 "[list ap_uint 4 ]"
set Port125 [list $PortName125 $Interface125 $DataType125 $Pointer125 $Dims125 $Const125 $Volatile125 $ArrayOpt125]
lappend structMem12 $Port125
set structParameter12 [list ]
set structArgument12 [list ]
set NameSpace12 [list ]
set structIsPacked12 "0"
set DataType12 [list "LBUS" "struct LBUS" $structMem12 1 0 $structParameter12 $structArgument12 $NameSpace12 $structIsPacked12]
set Port12 [list $PortName12 $Interface12 $DataType12 $Pointer12 $Dims12 $Const12 $Volatile12 $ArrayOpt12]
lappend structMem1 $Port12
set PortName13 "lbus3"
set BitWidth13 "256"
set ArrayOpt13 ""
set Const13 "0"
set Volatile13 "0"
set Pointer13 "0"
set Reference13 "0"
set Dims13 [list 0]
set Interface13 "wire"
set structMem13 ""
set PortName130 "data"
set BitWidth130 "128"
set ArrayOpt130 ""
set Const130 "0"
set Volatile130 "0"
set Pointer130 "0"
set Reference130 "0"
set Dims130 [list 0]
set Interface130 "wire"
set DataType130 "[list ap_uint 128 ]"
set Port130 [list $PortName130 $Interface130 $DataType130 $Pointer130 $Dims130 $Const130 $Volatile130 $ArrayOpt130]
lappend structMem13 $Port130
set PortName131 "ena"
set BitWidth131 "8"
set ArrayOpt131 ""
set Const131 "0"
set Volatile131 "0"
set Pointer131 "0"
set Reference131 "0"
set Dims131 [list 0]
set Interface131 "wire"
set DataType131 "[list ap_uint 1 ]"
set Port131 [list $PortName131 $Interface131 $DataType131 $Pointer131 $Dims131 $Const131 $Volatile131 $ArrayOpt131]
lappend structMem13 $Port131
set PortName132 "sop"
set BitWidth132 "8"
set ArrayOpt132 ""
set Const132 "0"
set Volatile132 "0"
set Pointer132 "0"
set Reference132 "0"
set Dims132 [list 0]
set Interface132 "wire"
set DataType132 "[list ap_uint 1 ]"
set Port132 [list $PortName132 $Interface132 $DataType132 $Pointer132 $Dims132 $Const132 $Volatile132 $ArrayOpt132]
lappend structMem13 $Port132
set PortName133 "eop"
set BitWidth133 "8"
set ArrayOpt133 ""
set Const133 "0"
set Volatile133 "0"
set Pointer133 "0"
set Reference133 "0"
set Dims133 [list 0]
set Interface133 "wire"
set DataType133 "[list ap_uint 1 ]"
set Port133 [list $PortName133 $Interface133 $DataType133 $Pointer133 $Dims133 $Const133 $Volatile133 $ArrayOpt133]
lappend structMem13 $Port133
set PortName134 "err"
set BitWidth134 "8"
set ArrayOpt134 ""
set Const134 "0"
set Volatile134 "0"
set Pointer134 "0"
set Reference134 "0"
set Dims134 [list 0]
set Interface134 "wire"
set DataType134 "[list ap_uint 1 ]"
set Port134 [list $PortName134 $Interface134 $DataType134 $Pointer134 $Dims134 $Const134 $Volatile134 $ArrayOpt134]
lappend structMem13 $Port134
set PortName135 "mty"
set BitWidth135 "8"
set ArrayOpt135 ""
set Const135 "0"
set Volatile135 "0"
set Pointer135 "0"
set Reference135 "0"
set Dims135 [list 0]
set Interface135 "wire"
set DataType135 "[list ap_uint 4 ]"
set Port135 [list $PortName135 $Interface135 $DataType135 $Pointer135 $Dims135 $Const135 $Volatile135 $ArrayOpt135]
lappend structMem13 $Port135
set structParameter13 [list ]
set structArgument13 [list ]
set NameSpace13 [list ]
set structIsPacked13 "0"
set DataType13 [list "LBUS" "struct LBUS" $structMem13 1 0 $structParameter13 $structArgument13 $NameSpace13 $structIsPacked13]
set Port13 [list $PortName13 $Interface13 $DataType13 $Pointer13 $Dims13 $Const13 $Volatile13 $ArrayOpt13]
lappend structMem1 $Port13
set structParameter1 [list ]
set structArgument1 [list ]
set NameSpace1 [list ]
set structIsPacked1 "0"
set DataType1 [list "LBUS_FIFO_DATA" "struct LBUS_FIFO_DATA" $structMem1 1 0 $structParameter1 $structArgument1 $NameSpace1 $structIsPacked1]
set Port1 [list $PortName1 $Interface1 $DataType1 $Pointer1 $Dims1 $Const1 $Volatile1 $ArrayOpt1]
lappend PortList $Port1
set PortName2 "lbus_fifo_we"
set BitWidth2 "8"
set ArrayOpt2 ""
set Const2 "0"
set Volatile2 "0"
set Pointer2 "2"
set Reference2 "1"
set Dims2 [list 0]
set Interface2 "wire"
set DataType2 "[list ap_uint 1 ]"
set Port2 [list $PortName2 $Interface2 $DataType2 $Pointer2 $Dims2 $Const2 $Volatile2 $ArrayOpt2]
lappend PortList $Port2
set PortName3 "lbus_fifo_pkt_end"
set BitWidth3 "768"
set ArrayOpt3 ""
set Const3 "0"
set Volatile3 "0"
set Pointer3 "2"
set Reference3 "1"
set Dims3 [list 0]
set Interface3 "wire"
set structMem3 ""
set PortName30 "lbus0"
set BitWidth30 "256"
set ArrayOpt30 ""
set Const30 "0"
set Volatile30 "0"
set Pointer30 "0"
set Reference30 "0"
set Dims30 [list 0]
set Interface30 "wire"
set structMem30 ""
set PortName300 "data"
set BitWidth300 "128"
set ArrayOpt300 ""
set Const300 "0"
set Volatile300 "0"
set Pointer300 "0"
set Reference300 "0"
set Dims300 [list 0]
set Interface300 "wire"
set DataType300 "[list ap_uint 128 ]"
set Port300 [list $PortName300 $Interface300 $DataType300 $Pointer300 $Dims300 $Const300 $Volatile300 $ArrayOpt300]
lappend structMem30 $Port300
set PortName301 "ena"
set BitWidth301 "8"
set ArrayOpt301 ""
set Const301 "0"
set Volatile301 "0"
set Pointer301 "0"
set Reference301 "0"
set Dims301 [list 0]
set Interface301 "wire"
set DataType301 "[list ap_uint 1 ]"
set Port301 [list $PortName301 $Interface301 $DataType301 $Pointer301 $Dims301 $Const301 $Volatile301 $ArrayOpt301]
lappend structMem30 $Port301
set PortName302 "sop"
set BitWidth302 "8"
set ArrayOpt302 ""
set Const302 "0"
set Volatile302 "0"
set Pointer302 "0"
set Reference302 "0"
set Dims302 [list 0]
set Interface302 "wire"
set DataType302 "[list ap_uint 1 ]"
set Port302 [list $PortName302 $Interface302 $DataType302 $Pointer302 $Dims302 $Const302 $Volatile302 $ArrayOpt302]
lappend structMem30 $Port302
set PortName303 "eop"
set BitWidth303 "8"
set ArrayOpt303 ""
set Const303 "0"
set Volatile303 "0"
set Pointer303 "0"
set Reference303 "0"
set Dims303 [list 0]
set Interface303 "wire"
set DataType303 "[list ap_uint 1 ]"
set Port303 [list $PortName303 $Interface303 $DataType303 $Pointer303 $Dims303 $Const303 $Volatile303 $ArrayOpt303]
lappend structMem30 $Port303
set PortName304 "err"
set BitWidth304 "8"
set ArrayOpt304 ""
set Const304 "0"
set Volatile304 "0"
set Pointer304 "0"
set Reference304 "0"
set Dims304 [list 0]
set Interface304 "wire"
set DataType304 "[list ap_uint 1 ]"
set Port304 [list $PortName304 $Interface304 $DataType304 $Pointer304 $Dims304 $Const304 $Volatile304 $ArrayOpt304]
lappend structMem30 $Port304
set PortName305 "mty"
set BitWidth305 "8"
set ArrayOpt305 ""
set Const305 "0"
set Volatile305 "0"
set Pointer305 "0"
set Reference305 "0"
set Dims305 [list 0]
set Interface305 "wire"
set DataType305 "[list ap_uint 4 ]"
set Port305 [list $PortName305 $Interface305 $DataType305 $Pointer305 $Dims305 $Const305 $Volatile305 $ArrayOpt305]
lappend structMem30 $Port305
set structParameter30 [list ]
set structArgument30 [list ]
set NameSpace30 [list ]
set structIsPacked30 "0"
set DataType30 [list "LBUS" "struct LBUS" $structMem30 1 0 $structParameter30 $structArgument30 $NameSpace30 $structIsPacked30]
set Port30 [list $PortName30 $Interface30 $DataType30 $Pointer30 $Dims30 $Const30 $Volatile30 $ArrayOpt30]
lappend structMem3 $Port30
set PortName31 "lbus1"
set BitWidth31 "256"
set ArrayOpt31 ""
set Const31 "0"
set Volatile31 "0"
set Pointer31 "0"
set Reference31 "0"
set Dims31 [list 0]
set Interface31 "wire"
set structMem31 ""
set PortName310 "data"
set BitWidth310 "128"
set ArrayOpt310 ""
set Const310 "0"
set Volatile310 "0"
set Pointer310 "0"
set Reference310 "0"
set Dims310 [list 0]
set Interface310 "wire"
set DataType310 "[list ap_uint 128 ]"
set Port310 [list $PortName310 $Interface310 $DataType310 $Pointer310 $Dims310 $Const310 $Volatile310 $ArrayOpt310]
lappend structMem31 $Port310
set PortName311 "ena"
set BitWidth311 "8"
set ArrayOpt311 ""
set Const311 "0"
set Volatile311 "0"
set Pointer311 "0"
set Reference311 "0"
set Dims311 [list 0]
set Interface311 "wire"
set DataType311 "[list ap_uint 1 ]"
set Port311 [list $PortName311 $Interface311 $DataType311 $Pointer311 $Dims311 $Const311 $Volatile311 $ArrayOpt311]
lappend structMem31 $Port311
set PortName312 "sop"
set BitWidth312 "8"
set ArrayOpt312 ""
set Const312 "0"
set Volatile312 "0"
set Pointer312 "0"
set Reference312 "0"
set Dims312 [list 0]
set Interface312 "wire"
set DataType312 "[list ap_uint 1 ]"
set Port312 [list $PortName312 $Interface312 $DataType312 $Pointer312 $Dims312 $Const312 $Volatile312 $ArrayOpt312]
lappend structMem31 $Port312
set PortName313 "eop"
set BitWidth313 "8"
set ArrayOpt313 ""
set Const313 "0"
set Volatile313 "0"
set Pointer313 "0"
set Reference313 "0"
set Dims313 [list 0]
set Interface313 "wire"
set DataType313 "[list ap_uint 1 ]"
set Port313 [list $PortName313 $Interface313 $DataType313 $Pointer313 $Dims313 $Const313 $Volatile313 $ArrayOpt313]
lappend structMem31 $Port313
set PortName314 "err"
set BitWidth314 "8"
set ArrayOpt314 ""
set Const314 "0"
set Volatile314 "0"
set Pointer314 "0"
set Reference314 "0"
set Dims314 [list 0]
set Interface314 "wire"
set DataType314 "[list ap_uint 1 ]"
set Port314 [list $PortName314 $Interface314 $DataType314 $Pointer314 $Dims314 $Const314 $Volatile314 $ArrayOpt314]
lappend structMem31 $Port314
set PortName315 "mty"
set BitWidth315 "8"
set ArrayOpt315 ""
set Const315 "0"
set Volatile315 "0"
set Pointer315 "0"
set Reference315 "0"
set Dims315 [list 0]
set Interface315 "wire"
set DataType315 "[list ap_uint 4 ]"
set Port315 [list $PortName315 $Interface315 $DataType315 $Pointer315 $Dims315 $Const315 $Volatile315 $ArrayOpt315]
lappend structMem31 $Port315
set structParameter31 [list ]
set structArgument31 [list ]
set NameSpace31 [list ]
set structIsPacked31 "0"
set DataType31 [list "LBUS" "struct LBUS" $structMem31 1 0 $structParameter31 $structArgument31 $NameSpace31 $structIsPacked31]
set Port31 [list $PortName31 $Interface31 $DataType31 $Pointer31 $Dims31 $Const31 $Volatile31 $ArrayOpt31]
lappend structMem3 $Port31
set PortName32 "lbus2"
set BitWidth32 "256"
set ArrayOpt32 ""
set Const32 "0"
set Volatile32 "0"
set Pointer32 "0"
set Reference32 "0"
set Dims32 [list 0]
set Interface32 "wire"
set structMem32 ""
set PortName320 "data"
set BitWidth320 "128"
set ArrayOpt320 ""
set Const320 "0"
set Volatile320 "0"
set Pointer320 "0"
set Reference320 "0"
set Dims320 [list 0]
set Interface320 "wire"
set DataType320 "[list ap_uint 128 ]"
set Port320 [list $PortName320 $Interface320 $DataType320 $Pointer320 $Dims320 $Const320 $Volatile320 $ArrayOpt320]
lappend structMem32 $Port320
set PortName321 "ena"
set BitWidth321 "8"
set ArrayOpt321 ""
set Const321 "0"
set Volatile321 "0"
set Pointer321 "0"
set Reference321 "0"
set Dims321 [list 0]
set Interface321 "wire"
set DataType321 "[list ap_uint 1 ]"
set Port321 [list $PortName321 $Interface321 $DataType321 $Pointer321 $Dims321 $Const321 $Volatile321 $ArrayOpt321]
lappend structMem32 $Port321
set PortName322 "sop"
set BitWidth322 "8"
set ArrayOpt322 ""
set Const322 "0"
set Volatile322 "0"
set Pointer322 "0"
set Reference322 "0"
set Dims322 [list 0]
set Interface322 "wire"
set DataType322 "[list ap_uint 1 ]"
set Port322 [list $PortName322 $Interface322 $DataType322 $Pointer322 $Dims322 $Const322 $Volatile322 $ArrayOpt322]
lappend structMem32 $Port322
set PortName323 "eop"
set BitWidth323 "8"
set ArrayOpt323 ""
set Const323 "0"
set Volatile323 "0"
set Pointer323 "0"
set Reference323 "0"
set Dims323 [list 0]
set Interface323 "wire"
set DataType323 "[list ap_uint 1 ]"
set Port323 [list $PortName323 $Interface323 $DataType323 $Pointer323 $Dims323 $Const323 $Volatile323 $ArrayOpt323]
lappend structMem32 $Port323
set PortName324 "err"
set BitWidth324 "8"
set ArrayOpt324 ""
set Const324 "0"
set Volatile324 "0"
set Pointer324 "0"
set Reference324 "0"
set Dims324 [list 0]
set Interface324 "wire"
set DataType324 "[list ap_uint 1 ]"
set Port324 [list $PortName324 $Interface324 $DataType324 $Pointer324 $Dims324 $Const324 $Volatile324 $ArrayOpt324]
lappend structMem32 $Port324
set PortName325 "mty"
set BitWidth325 "8"
set ArrayOpt325 ""
set Const325 "0"
set Volatile325 "0"
set Pointer325 "0"
set Reference325 "0"
set Dims325 [list 0]
set Interface325 "wire"
set DataType325 "[list ap_uint 4 ]"
set Port325 [list $PortName325 $Interface325 $DataType325 $Pointer325 $Dims325 $Const325 $Volatile325 $ArrayOpt325]
lappend structMem32 $Port325
set structParameter32 [list ]
set structArgument32 [list ]
set NameSpace32 [list ]
set structIsPacked32 "0"
set DataType32 [list "LBUS" "struct LBUS" $structMem32 1 0 $structParameter32 $structArgument32 $NameSpace32 $structIsPacked32]
set Port32 [list $PortName32 $Interface32 $DataType32 $Pointer32 $Dims32 $Const32 $Volatile32 $ArrayOpt32]
lappend structMem3 $Port32
set structParameter3 [list ]
set structArgument3 [list ]
set NameSpace3 [list ]
set structIsPacked3 "0"
set DataType3 [list "LBUS_FIFO_END_DATA" "struct LBUS_FIFO_END_DATA" $structMem3 1 0 $structParameter3 $structArgument3 $NameSpace3 $structIsPacked3]
set Port3 [list $PortName3 $Interface3 $DataType3 $Pointer3 $Dims3 $Const3 $Volatile3 $ArrayOpt3]
lappend PortList $Port3
set PortName4 "lbus_fifo_pkt_end_we"
set BitWidth4 "8"
set ArrayOpt4 ""
set Const4 "0"
set Volatile4 "0"
set Pointer4 "2"
set Reference4 "1"
set Dims4 [list 0]
set Interface4 "wire"
set DataType4 "[list ap_uint 1 ]"
set Port4 [list $PortName4 $Interface4 $DataType4 $Pointer4 $Dims4 $Const4 $Volatile4 $ArrayOpt4]
lappend PortList $Port4
set PortName5 "error"
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
