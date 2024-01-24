# This script segment is generated automatically by AutoPilot

# Memory (RAM/ROM)  definition:
set ID 851
set hasByteEnable 0
set MemName QuantAct_m_0
set CoreName ap_simcore_mem
set PortList { 1 }
set DataWd 31
set AddrRange 48
set AddrWd 6
set TrueReset 0
set IsROM 1
set ROMData { "1100111100100010010010100111101" "1100100100110110101111000011010" "1110010000111111010001100110110" "1100110001011111110100110111000" "1000011000011011001110100010111" "1110001110010101101001101011100" "1000011101000101001001101111010" "1110011110100001001100000011011" "1000101100101111100110111000101" "1001011110011100000001101111001" "1010000110101111111001011101010" "1111111110101010010111111000110" "1111000110001000001100000000001" "1001100101101111100001000010100" "1000110000111000110011011101101" "1001101001101010010111010001010" "1011111100001011010110001100010" "1101011000101010000100101110011" "1110011010000001101100101000100" "1101011111110001011110000111101" "1100100001111111000011001001101" "1001001011100000011101000001010" "1010111100110110100100110010000" "1010011010100011111101000011000" "1111101100011001101111011011010" "1111011001100001000110111101011" "1001100011010111100110100011110" "1111001000100100110000101011101" "1110000100110100010010101001111" "1100011000011101111000010001111" "1100010111100101011001000111111" "1100100110101011000100101111110" "1011111101001100000001111101001" "1010111010010111010010110101011" "1010001010000100100110011001101" "1100000111100010111011000010100" "1010011000100111111111110001011" "1000100011001000111111100000000" "1100001101110010100010110010010" "1001011001000101010010000001010" "1010011100101110111110001011001" "1011001010011001110001001100110" "1111111010110011110000011100000" "1100011011011011110011100100100" "1010111111101110100000110010110" "1011001011011101011111011011100" "1100010000011010001010000110101" "1101011011110110000011101101010" }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set MaxLatency -1
set DelayBudget 1.237
set ClkPeriod 5
set RegisteredInput 0
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
  ::AP::rtl_comp_handler $MemName
}


set CoreName ROM_nP
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_ROM] == "::AESL_LIB_VIRTEX::xil_gen_ROM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_ROM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_ROM, check your platform lib"
  }
}


# Memory (RAM/ROM)  definition:
set ID 852
set hasByteEnable 0
set MemName QuantAct_m_1
set CoreName ap_simcore_mem
set PortList { 1 }
set DataWd 31
set AddrRange 48
set AddrWd 6
set TrueReset 0
set IsROM 1
set ROMData { "1101001110010101001101101010010" "1101001001101000001000001110101" "1110001110100111111100001001110" "1111101110010000000000000100111" "1000011010010000101100000010010" "1100101011100010001101100000000" "1010101010110101011110011010110" "1111000010111100001011010100110" "1001000001001001000111100001110" "1000001100001000100101010101000" "1001001010001111110101011100000" "1110110110110001000010110000110" "1001101000010000000110010111101" "1001001000101111111101110110010" "1000011011111011101011110001100" "1000000101000111110100111010000" "1101001111001101100100100111101" "1100111111100010111111001000101" "1101100100010000011001000100111" "1110000111100111111101111001110" "1001011011000100101010101000101" "1001110011110010100111000100101" "1001100111101001100111100110010" "1011110111100101110000001001001" "1101011001111010110000110101001" "1001101001111010111001100010000" "1001100010101010001001011110011" "1110101111100001110101111010110" "1000100011010000000101110111100" "1011100110100100101000100110011" "1000111011001110110000110001001" "1100111111000110100110100000110" "1000011101111010100001111001111" "1000110001100111110111110110111" "1101011100101001110111001111111" "1001110001100111101010001011110" "1001111010001101100001110110010" "1001110001010000101000101101000" "1001001010001010111111000101011" "1001010111010110100110111110001" "1110100001111111101101010101101" "1100000111100011110011100100100" "1010010110111000111101110101000" "1100010110011100100111010000010" "1000010101100111011010110100010" "1010010111001101111111100011000" "1100010110110010100110100101111" "1100011111001101010000000010000" }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set MaxLatency -1
set DelayBudget 1.237
set ClkPeriod 5
set RegisteredInput 0
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
  ::AP::rtl_comp_handler $MemName
}


set CoreName ROM_nP
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_ROM] == "::AESL_LIB_VIRTEX::xil_gen_ROM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_ROM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_ROM, check your platform lib"
  }
}


# Memory (RAM/ROM)  definition:
set ID 853
set hasByteEnable 0
set MemName QuantAct_m_2
set CoreName ap_simcore_mem
set PortList { 1 }
set DataWd 31
set AddrRange 48
set AddrWd 6
set TrueReset 0
set IsROM 1
set ROMData { "1000001001001101110101001000000" "1100101101000001101001011000111" "1101011110010100000001101101010" "1110100100100010110111011101010" "1001000101100001111101011010011" "1000100001110011011110101111001" "1111100001001111111111110110100" "1100100011100011100100011000001" "1000000001000000000000000110000" "1001110000001111011101100100010" "1100100100111101011110101010100" "1000100101001111010000011111100" "1000001010001001110100111111100" "1001101011111000100100110000100" "1001101100000010010101101101010" "1111100111101110010100100011100" "1110011010100101101111011000010" "1100100100000100111101110100000" "1100110100010100100101111011001" "1110111011111111001010001010111" "1111111010001010111001100110010" "1100010000111111110010111000111" "1100010001000001110110000010100" "1001111111000110010001001101001" "1111010011010110011010000101111" "1111111011000110010011110111110" "1110011101001011100011000101111" "1111100110111101101101101001111" "1001000011010101110010110010110" "1010110111001110011000110111010" "1100101011110100101100011010010" "1101111011101011100000100110101" "1100000011010011110011101101001" "1001101000110101001100101010111" "1100000100101110100010000000001" "1010000111101001100110000011111" "1001011101000110001110010100010" "1001000101011010100101111100011" "1000001010011110010101001101111" "1010001110000011011110101100100" "1011100011010111010010100011111" "1100101010010010011100001100000" "1011100011001010110111101111000" "1001000101110110000111011100101" "1100101001000000011101110101001" "1001011001100110111011010010010" "1011111010010101100101011110110" "1011010100010110010001111111001" }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set MaxLatency -1
set DelayBudget 1.237
set ClkPeriod 5
set RegisteredInput 0
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
  ::AP::rtl_comp_handler $MemName
}


set CoreName ROM_nP
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_ROM] == "::AESL_LIB_VIRTEX::xil_gen_ROM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_ROM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_ROM, check your platform lib"
  }
}


# Memory (RAM/ROM)  definition:
set ID 854
set hasByteEnable 0
set MemName QuantAct_m_3
set CoreName ap_simcore_mem
set PortList { 1 }
set DataWd 31
set AddrRange 48
set AddrWd 6
set TrueReset 0
set IsROM 1
set ROMData { "1101000001000001110111011010001" "1101100000010100001110000011000" "1101101110110010110110101101111" "1100001011100001101001011100011" "1000011011000100011111110111000" "1101110100100111100111101000110" "1110010110011001010110101110011" "1100000111011101000011011001001" "1100111011001110000000001001101" "1000100111001000001100011011100" "1000001001000010010101100001000" "1001010100000001111011001010010" "1000101010010111101110111100110" "1001111011111100011111100011011" "1000101001000010100010011001010" "1010001100011000101011100010010" "1110101110111010111101111111011" "1101010010110101111110110001001" "1101000000010101100100111100100" "1100110100001010001111011000011" "1000100011011000000001011000000" "1100011001011101101010011000011" "1010111111101010100011100010001" "1000110000111001010101001111011" "1110011110010100010101110011111" "1111110000010111101111110000011" "1111101110100111100000000101010" "1111111000011111001100110001101" "1000011010010000110101001110001" "1111101100000000001000000001110" "1100100101011110011111110010110" "1110001101000100100100111110111" "1011000101110101011110100010001" "1010011000111000001110110011111" "1100100010111100010011100100110" "1010011001100101100111111100000" "1011100011111110100000010000001" "1000000010001000101001010101111" "1010101000100110011001100001111" "1000101110101110000001001011001" "1100010010110011001100101010010" "1001000010110000100011101110110" "1100011110101111101010110011110" "1000111101101110011011100101110" "1100100011011110110001111110101" "1100100010101110100000010001110" "1100110111000001011011100111111" "1100001110010010100100100110010" }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set MaxLatency -1
set DelayBudget 1.237
set ClkPeriod 5
set RegisteredInput 0
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
  ::AP::rtl_comp_handler $MemName
}


set CoreName ROM_nP
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_ROM] == "::AESL_LIB_VIRTEX::xil_gen_ROM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_ROM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_ROM, check your platform lib"
  }
}


# Memory (RAM/ROM)  definition:
set ID 855
set hasByteEnable 0
set MemName QuantAct_m_4
set CoreName ap_simcore_mem
set PortList { 1 }
set DataWd 31
set AddrRange 48
set AddrWd 6
set TrueReset 0
set IsROM 1
set ROMData { "1101101011100001101001111010111" "1100110010101101000010001110111" "1001011110110011101110011101100" "1110101010101111100001100010100" "1001110111000001100100110110001" "1011101101111110001100110101011" "1000011111010101110001101100100" "1001100001111111000100011101011" "1100011100111101101101001011101" "1101000110010111100001010011110" "1000110010110111111011111101111" "1001100101100001111110001000101" "1111111100001111110100101010011" "1000001100100101001100110010101" "1010110000010100000111110011011" "1011000000111110000001101101100" "1111101101010100110010110011100" "1101100001001101101101010111011" "1101011101101010110001101101011" "1101000101111111100101111000101" "1010011010000010000001011010001" "1010110111101000000001111101010" "1010010101100001100100010111101" "1010000101101101111011101110011" "1111011101010101111111010100110" "1001000011001001010100000000101" "1101010100101110100010000111011" "1111011110001111010010001101001" "1100011110001110001001001011001" "1111000011010010101100000001000" "1101110011110000001001011111100" "1010100011001111011101101010010" "1100001100000100010101111110110" "1000100010011001011010011101011" "1011100011001011111001100110000" "1001001001101011101010110001110" "1000111010010100001111010011101" "1011001101101110000010001010001" "1100100111100101100111000011011" "1000100101000101100010000101100" "1111111011011100001011000000111" "1010001011011101011101011010101" "1001000010010010000101101100011" "1011101110001111001000100010001" "1011111010100100010000101111101" "1100101000000100100011000011010" "1100100000000000110000111010101" "1100000011111010110100000111010" }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set MaxLatency -1
set DelayBudget 1.237
set ClkPeriod 5
set RegisteredInput 0
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
  ::AP::rtl_comp_handler $MemName
}


set CoreName ROM_nP
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_ROM] == "::AESL_LIB_VIRTEX::xil_gen_ROM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_ROM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_ROM, check your platform lib"
  }
}


# Memory (RAM/ROM)  definition:
set ID 856
set hasByteEnable 0
set MemName QuantAct_m_5
set CoreName ap_simcore_mem
set PortList { 1 }
set DataWd 31
set AddrRange 48
set AddrWd 6
set TrueReset 0
set IsROM 1
set ROMData { "1100100011100011001100101000100" "1111100100111110001011101101101" "1110101011000001011101111101111" "1101111110111000111010111000011" "1110111010000000100001000010101" "1101010110101001100110110111000" "1100111100010110110111111101001" "1000110100010001111010110001110" "1000011100111101101001010111011" "1000001110011110001010000000001" "1001110100001111111000100000100" "1001101100010010101010011001101" "1001111000110001010000000011101" "1000010001100010110001100001000" "1001110001110010011101100011110" "1000111000011101011001101000010" "1101110110100000001111110010101" "1110010001010000010111001100101" "1100011101101010010010100101010" "1110001010101110011000001011001" "1000100111100100100001101010011" "1010010011100111001111111101100" "1000101000101111110110110000111" "1000010101010101011111100001011" "1001001010101011011001110001010" "1000010110011101001100101101001" "1110101011000000100011011101010" "1110000000110111011001110101011" "1000000101011100100100111101100" "1000110111101001000111110110000" "1100000000111010010001011111011" "1100011010000001101010010011010" "1001010111001101000011010011101" "1100100101111101001101111100001" "1010101101010100101101100010100" "1011111110110110000001011000111" "1100011100010100001000110101011" "1000010110010111111101100111100" "1001001100011101111001100110010" "1010000110110011010111101000000" "1001111011100110011101111101000" "1011000101110011111100001010111" "1111001011000010101101110101011" "1000001100100100100010110100010" "1101011111101100011001101000011" "1100101010001111011100100011000" "1100100100111001100101000101001" "1100101000110001111011010101001" }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set MaxLatency -1
set DelayBudget 1.237
set ClkPeriod 5
set RegisteredInput 0
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
  ::AP::rtl_comp_handler $MemName
}


set CoreName ROM_nP
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_ROM] == "::AESL_LIB_VIRTEX::xil_gen_ROM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_ROM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_ROM, check your platform lib"
  }
}


# Memory (RAM/ROM)  definition:
set ID 857
set hasByteEnable 0
set MemName QuantAct_m_6
set CoreName ap_simcore_mem
set PortList { 1 }
set DataWd 31
set AddrRange 48
set AddrWd 6
set TrueReset 0
set IsROM 1
set ROMData { "1110110110111110010001100110001" "1101001000110100000100000000110" "1100100001100011111010001111001" "1101011101110010010101000011001" "1110000011110101011100001100010" "1110001011110111111010011000001" "1000101001101111001111001001010" "1000100000100101100010101110011" "1011101100010111010100011000111" "1001000010011011000000101010000" "1110111001101110010001111101011" "1001000101001001010010001110000" "1001000001100110101100100111000" "1001010110000000100001011101101" "1010000101001111101001100011110" "1111000011100100010011001111101" "1100100001100001100100011011100" "1101101000100110001000000111001" "1000001000001001001110101001011" "1110100011001010001110110110110" "1100000101011000100100010011111" "1000110001101000110010101001101" "1000110000110110010101010100011" "1000011001110100110001001110111" "1000101000000011101110111001101" "1010010010001011110100001010000" "1000011001101001011000011010000" "1000101100101110001101000000000" "1100100100000111100001001100000" "1110100001011010111101010111011" "1110011001001101011011011010011" "1100010110000110101011110111111" "1010100011111111101001111111011" "1001101001000110100000011001010" "1100001011110111110101110010001" "1100010111010110111010010011001" "1111011101111110111101110010111" "1010110101101100101011000111111" "1000111101111011000010110110100" "1000010111110111000101110111010" "1000010110100000111001010010011" "1000011000111011101101010101001" "1001001101101100010110000111010" "1000101100010011011100011001010" "1100001011110001000110011101000" "1010011011101111100100011000011" "1100101010010001111100001111110" "1010110110101010001010110011111" }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set MaxLatency -1
set DelayBudget 1.237
set ClkPeriod 5
set RegisteredInput 0
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
  ::AP::rtl_comp_handler $MemName
}


set CoreName ROM_nP
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_ROM] == "::AESL_LIB_VIRTEX::xil_gen_ROM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_ROM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_ROM, check your platform lib"
  }
}


# Memory (RAM/ROM)  definition:
set ID 858
set hasByteEnable 0
set MemName QuantAct_m_7
set CoreName ap_simcore_mem
set PortList { 1 }
set DataWd 31
set AddrRange 48
set AddrWd 6
set TrueReset 0
set IsROM 1
set ROMData { "1000111001010000100110001010100" "1111101101000000000100010011100" "1101110111100000001011001110001" "1001010101100000110001011101010" "1110101101111001010010111010010" "1111010011011001110001011110011" "1101011100100000001000110101111" "1101011001111100001110000110110" "1000001100000010100011001110010" "1111100001100001100001111111100" "1010010010011100011000000111001" "1111001100011110001010110001010" "1001010101000010111110101010101" "1011000011011010010010010100110" "1000011111011101100100110111010" "1000011110111100011011011001100" "1101000000001100010010100001100" "1101101011010100110111111010101" "1100100010110111110010111111000" "1100100100100010010010111011001" "1000110101010011100110110110000" "1000111110100011110111010010100" "1001001011101010001100100011101" "1000011011011101101101000111001" "1000010010101100011101110000001" "1110011101011101100010101000010" "1110110010100100000111111010000" "1001001101101100100010110101011" "1000100101001000101000001110100" "1100100000001110101101110100110" "1101001000011000100101111001100" "1011011011010101110001011011011" "1100011101111101111000101110010" "1101000010001011011001100111010" "1011010110000110110100010100010" "1001100001011000101101100110011" "1010011100010100101011110100000" "1101100000111111111011011110111" "1001010101011000000100101000001" "1001010001101110011011100111100" "1110110100110111101010010001101" "1000100010010001000000110110011" "1000111001110100001101110001101" "1000100110111001000001010111101" "1010011001101000000101011000001" "1011110001110011011100011000001" "1011000001101111111000010100100" "1100110010011101101000111001100" }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set MaxLatency -1
set DelayBudget 1.237
set ClkPeriod 5
set RegisteredInput 0
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
  ::AP::rtl_comp_handler $MemName
}


set CoreName ROM_nP
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_ROM] == "::AESL_LIB_VIRTEX::xil_gen_ROM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_ROM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_ROM, check your platform lib"
  }
}


# Memory (RAM/ROM)  definition:
set ID 859
set hasByteEnable 0
set MemName QuantAct_m_8
set CoreName ap_simcore_mem
set PortList { 1 }
set DataWd 31
set AddrRange 48
set AddrWd 6
set TrueReset 0
set IsROM 1
set ROMData { "1011101100111100001001101110110" "1010001000000000010000000101001" "1101000000011000000110010101111" "1110011111011001010011011101111" "1000110010111010111111101101001" "1100101001010110011111011011100" "1111110111111111010000000011010" "1001001101010110111001100010101" "1001100101000010100000100000001" "1110101110101011110000110011110" "1100100000010000010001000010010" "1010110111011110011100100110001" "1010010100011010100101100010101" "1011010000011000011001000000011" "1010001111010110110011010000111" "1000111011011001011110111010011" "1100100001001010110100001100010" "1011110111011100100011010111111" "1100101011001001001110100001011" "1100001111001010011010001101000" "1001111010101010001111000110110" "1001001010011111100000100101001" "1000011000101100111011010010010" "1010100001111111011101101001101" "1001010100101001101101111000011" "1000110100010010110101101101100" "1001011000001001101110111111000" "1110110011110100001101100100100" "1100111111101110101001111010001" "1100100011011000001101011000110" "1100101001011101001000010000101" "1100011000011010000000011001000" "1010100111010111110100110100010" "1100010001010010101011110011011" "1000101001111000100100110100011" "1001100111101010000001111000101" "1011111011000000110010101100011" "1010101100111100010101000000001" "1000111111111001000001100101010" "1100100000101000111100001110101" "1100111000101111000010100011011" "1111010100001010111110100010000" "1001100111011101000001001011110" "1001011111100100010010100010010" "1100011101101111101101011001101" "1100100100001000101110010110100" "1100100000001001110011100000110" "1100000001011011011111100111101" }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set MaxLatency -1
set DelayBudget 1.237
set ClkPeriod 5
set RegisteredInput 0
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
  ::AP::rtl_comp_handler $MemName
}


set CoreName ROM_nP
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_ROM] == "::AESL_LIB_VIRTEX::xil_gen_ROM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_ROM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_ROM, check your platform lib"
  }
}


# Memory (RAM/ROM)  definition:
set ID 860
set hasByteEnable 0
set MemName QuantAct_m_9
set CoreName ap_simcore_mem
set PortList { 1 }
set DataWd 31
set AddrRange 48
set AddrWd 6
set TrueReset 0
set IsROM 1
set ROMData { "1111110110000010110110110010110" "1100011001111011011111111111111" "1101111010000110110111011101101" "1110001101000110011111000101110" "1101001111101011011000100010101" "1110100001110110011111101110000" "1111010000001011110111010000011" "1110010110000100111111011001111" "1001000001000000011010011010101" "1001100001011100100010101010011" "1001111011110101010100001111010" "1000101001000001110111100100101" "1001011010011011001100110010100" "1000100100100111010111101100011" "1010010101101010000111100101110" "1001111111111110011001011101111" "1101010000010101011101011001010" "1110100000001101010100000000101" "1101110010100111010111111001111" "1101000010100011101010001111001" "1110110010100000000100011011100" "1000101011010011111000001001001" "1000100111010010101001100111011" "1001110001000011011000101111011" "1100111111101110011000111100110" "1111011100010100110111010010111" "1110010000111000111001001010111" "1111001110010010010000000100100" "1001001111000001011111011010110" "1101011111010010101111011010000" "1100100001101110000011001101101" "1100011000111110000110001111110" "1001010010001111011001010110101" "1011110110011001001111001001011" "1000101111101100000010010110110" "1000110011011100100000101000011" "1111110001111011001001110000001" "1001011000010001110100100001101" "1000100100001111000100011000101" "1110101001100100101100001111001" "1001000100100000001110011000000" "1000111110001100101100001100110" "1000100011110011100010111000011" "1100011101011010010100100000001" "1010101111110001111011011111010" "1101000100011111011011010110111" "1001011100101011011111111110010" "1010100100001000001000011001111" }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set MaxLatency -1
set DelayBudget 1.237
set ClkPeriod 5
set RegisteredInput 0
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
  ::AP::rtl_comp_handler $MemName
}


set CoreName ROM_nP
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_ROM] == "::AESL_LIB_VIRTEX::xil_gen_ROM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_ROM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_ROM, check your platform lib"
  }
}


# Memory (RAM/ROM)  definition:
set ID 861
set hasByteEnable 0
set MemName QuantAct_m_10
set CoreName ap_simcore_mem
set PortList { 1 }
set DataWd 31
set AddrRange 48
set AddrWd 6
set TrueReset 0
set IsROM 1
set ROMData { "1111011011111011100011101011101" "1100001100000010000111110011100" "1101010100011100100000100110100" "1101010110101101110011011000011" "1011000001011001100000000110111" "1000010000110111100100010011011" "1111001101100111011111011010000" "1100100100111001110000111100111" "1001011000100011110101001100010" "1010100010101100101101011100110" "1111000111111011111100101010110" "1000110001101010101010001101101" "1001010001001011011001100110011" "1001101011010111011000010100110" "1001010011110011011001100000100" "1001100000111000100101100100011" "1100010110010100010100111111100" "1100111101100100111001010101101" "1110111011111011001001110011010" "1100010110011101111000101010001" "1001100001110010010101110110010" "1010001110111000110010000011101" "1011000100101001011110010100111" "1000010111001010111000000100001" "1000010010111110000110111101011" "1110110010100010111001000010111" "1101100111010110000110101100000" "1101111000001100011111000110001" "1100100000101110110000001101000" "1110001000110000110010111000011" "1100101111110001000110001000110" "1100010100011001010101010101101" "1001100001111111011100011111000" "1011011101110101000111100111100" "1001010011101011110100001100001" "1100100100001100110110010110100" "1000110101100001000011000110110" "1010001100101000100100001111101" "1001100100010011110010010011000" "1001000011111111111101110111011" "1100000010111000101101100111100" "1011010111101101001000100101010" "1010000011110110000110001010101" "1100011001111001111110011110111" "1100011110010111110010110001101" "1101101011011001111010001001001" "1011010100111110011100101111000" "1101011110111111111111110100011" }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set MaxLatency -1
set DelayBudget 1.237
set ClkPeriod 5
set RegisteredInput 0
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
  ::AP::rtl_comp_handler $MemName
}


set CoreName ROM_nP
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_ROM] == "::AESL_LIB_VIRTEX::xil_gen_ROM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_ROM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_ROM, check your platform lib"
  }
}


# Memory (RAM/ROM)  definition:
set ID 862
set hasByteEnable 0
set MemName QuantAct_m_11
set CoreName ap_simcore_mem
set PortList { 1 }
set DataWd 31
set AddrRange 48
set AddrWd 6
set TrueReset 0
set IsROM 1
set ROMData { "1001100111010111101010100110110" "1100011110101101010110101100101" "1100001010110010010100100000111" "1100101100101011010110100011000" "1001100000101110000100010010010" "1101100001100011101001100110001" "1001010000011101001011111001100" "1001001100000011110111000100001" "1010100110110010001110100100111" "1000000111000000001001010001100" "1111101001100010110010011100101" "1001000001110100000101110000101" "1000011011010110001101010011100" "1001000101001101110000110101001" "1000011000010000010000010010100" "1000000111001101111001001011100" "1100111110100011000110001111111" "1101001111100100000111000000100" "1101000111000000000001100010011" "1100110011000100001001010111011" "1011001011010000011000001110100" "1001001101001010011101110111101" "1001010010111111001000000000011" "1001110110000000110101001000000" "1000111110010000101010110111110" "1001110010010001000000000111100" "1000100111011010100010101110001" "1111011101000101110011011001010" "1100100001000011010010100011000" "1010101100110101110011001111010" "1010101001101000000001011111111" "1010011100101000101001101100100" "1010010000011111100010100101101" "1001011110001010101111111111011" "1100100010111101110111111010101" "1001110110100100000110001000000" "1100010101000011101010100101011" "1010000000001011110101100101100" "1001010100001010001000100111011" "1010010110111010100011110111011" "1000000000001111101111111100101" "1100100011100001110101100100111" "1000001011001011101001010000011" "1000100010111000100001000011101" "1001111111100011011101110101101" "1011101111101110111001111001111" "1010010110111001000110100101110" "1100101010001010011011001010110" }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set MaxLatency -1
set DelayBudget 1.237
set ClkPeriod 5
set RegisteredInput 0
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
  ::AP::rtl_comp_handler $MemName
}


set CoreName ROM_nP
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_ROM] == "::AESL_LIB_VIRTEX::xil_gen_ROM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_ROM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_ROM, check your platform lib"
  }
}


# Memory (RAM/ROM)  definition:
set ID 863
set hasByteEnable 0
set MemName QuantAct_m_12
set CoreName ap_simcore_mem
set PortList { 1 }
set DataWd 31
set AddrRange 48
set AddrWd 6
set TrueReset 0
set IsROM 1
set ROMData { "1100110001100101010011111010110" "1110010011101110010000000111000" "1001010110011001011010110010100" "1000000100111111110101101110100" "1000101010000010010001001111110" "1101101110111011110011011000000" "1111110111110100100101101110001" "1001101101011000011001001111010" "1000100110000001001101000010010" "1111011011000011111100110001101" "1110111001101001011111010001110" "1110010111001000001110110100110" "1010100001000010101000101001010" "1010011001010100110111100010111" "1001011111111010011000111100001" "1011100101010011100010001101010" "1100110010100101010111010000110" "1100101011101010000110111000110" "1101010100111100100011010000110" "1000111011000110101001110100000" "1000011100011000011001100110001" "1100001110000001011111110110101" "1010011011011001100100011110100" "1111100111101101001101010100111" "1001011100010101001101011010011" "1110001011011110010010001000011" "1001011111000010100101111000010" "1000101011100100010100011101111" "1100101011010011000101101100001" "1000111110110000000010001001010" "1101001111011111100110001000101" "1100100101000100001101001001100" "1001011000010000101101010011000" "1011101101110110101111101101101" "1010001011000010100000101010000" "1010100010110101110000111001000" "1000001110100010110110111000111" "1001111101011010000001100111100" "1101100101111010011101010100010" "1000100110011000010111010001110" "1001000111001000111011100000101" "1100101101110100000000110010010" "1001010001011010101000001100011" "1001101101010100010001100001011" "1100011001101101110001001110011" "1100011100101011100001011111011" "1011111000110011001111111000110" "1101001101111010100001100101000" }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set MaxLatency -1
set DelayBudget 1.237
set ClkPeriod 5
set RegisteredInput 0
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
  ::AP::rtl_comp_handler $MemName
}


set CoreName ROM_nP
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_ROM] == "::AESL_LIB_VIRTEX::xil_gen_ROM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_ROM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_ROM, check your platform lib"
  }
}


# Memory (RAM/ROM)  definition:
set ID 864
set hasByteEnable 0
set MemName QuantAct_m_13
set CoreName ap_simcore_mem
set PortList { 1 }
set DataWd 31
set AddrRange 48
set AddrWd 6
set TrueReset 0
set IsROM 1
set ROMData { "1000011000100001111111110110110" "1000010011100101011101011010100" "1101000110010000010001001100001" "1101000110010001111010010101100" "1010110111011101001111101101101" "1111110011010011101000001011011" "1000111100100110001010101001100" "1101001100000011010011000001101" "1110110001110111100000001111101" "1101000111110101100110001001000" "1001011101111000000000011001110" "1000111001010000011011101101010" "1000110011001001101101100000110" "1001100100011000111110111110110" "1000100001000100111100111101111" "1100100001011000111100011001111" "1100100000111011010000011001100" "1101101111101101110101110110110" "1100111010001101010011010000011" "1110100010001101011111110010010" "1100100011110100110100001001001" "1001101001001000100001110110100" "1001000011001101011111101011111" "1000110000010011111110011001111" "1001011010010110100000000010110" "1000100011100011111011001000010" "1000000110001011011111000010100" "1001001000111001100000000110011" "1110110101010000011011111110000" "1010000111001100101101011111111" "1001110110011110111010000000010" "1110101100010000001111101011101" "1000110011001100011001010111011" "1001000101110011111011100010001" "1000100001001000101110101000110" "1010001011111001100011011000100" "1110111111011001011010111110011" "1001011111111110001111111110110" "1000000111000100100000011001011" "1001110100100110001001101001111" "1000100111100001110001010010010" "1101010000101001011001100101001" "1001000111010100010011111010011" "1000000100100100101010100011010" "1011010110000001100110110010001" "1100100111111010110000101100000" "1101110000110101101110010110001" "1110011101101011011001010100010" }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set MaxLatency -1
set DelayBudget 1.237
set ClkPeriod 5
set RegisteredInput 0
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
  ::AP::rtl_comp_handler $MemName
}


set CoreName ROM_nP
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_ROM] == "::AESL_LIB_VIRTEX::xil_gen_ROM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_ROM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_ROM, check your platform lib"
  }
}


# Memory (RAM/ROM)  definition:
set ID 865
set hasByteEnable 0
set MemName QuantAct_m_14
set CoreName ap_simcore_mem
set PortList { 1 }
set DataWd 31
set AddrRange 48
set AddrWd 6
set TrueReset 0
set IsROM 1
set ROMData { "1110100011000110111100010001110" "1111000011000011010111110001010" "1111001110001110111101011111100" "1100110100111110011000101100000" "1010011100101100011111010100101" "1001110101111101000000010110001" "1100110110000000101110101110110" "1101111100111101011000001011010" "1100010000010001110101010011001" "1110100111111011011101001000101" "1111001101101001100111111011011" "1001101000101000001110110011000" "1001110000001100011111100111110" "1001111010010000101001011001110" "1010111000011110100001111010110" "1011010010010000111110111001100" "1100100110011111000000010000000" "1101110010001011100010010101001" "1101110011010111001101000011101" "1101011101100111111101011000000" "1010011010011011101000110011101" "1010100010100001110010001010010" "1000000001011000111111110001111" "1100000100011110010111110001001" "1101111000011101001011100010000" "1101110111010100101001110001100" "1010010000100011001101011110011" "1000100011100010010101010111111" "1100011110011110000110101100001" "1101000101100000111001101101110" "1000110100110110000111010001101" "1101110011010000000110010001000" "1001110101100101011100000110011" "1001111011100010000011100101001" "1100001011101110100111000010010" "1001000010011110011101001000001" "1000010101011000110011100000110" "1000001001000100000011010101000" "1001110111001111011100111100101" "1001101010010000001100001101011" "1111001110110000011111001000000" "1101010010000100000010001110011" "1111001001011011101000000110101" "1001111000000000011011010011101" "1110001101010000000100011100111" "1011000000011111100000110110010" "1010000100010110010001110111111" "1001111110101110011101011010100" }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set MaxLatency -1
set DelayBudget 1.237
set ClkPeriod 5
set RegisteredInput 0
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
  ::AP::rtl_comp_handler $MemName
}


set CoreName ROM_nP
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_ROM] == "::AESL_LIB_VIRTEX::xil_gen_ROM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_ROM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_ROM, check your platform lib"
  }
}


# Memory (RAM/ROM)  definition:
set ID 866
set hasByteEnable 0
set MemName QuantAct_m_15
set CoreName ap_simcore_mem
set PortList { 1 }
set DataWd 31
set AddrRange 48
set AddrWd 6
set TrueReset 0
set IsROM 1
set ROMData { "1110000110011000100110111000001" "1101000010110111101010011000011" "1101110001110011000001010100001" "1101110011110111000111001111010" "1000000101101111010110001111101" "1100100110001111110110001011011" "1100100111110111011010001001110" "1000101001011000111010100110111" "1111110101100001010011001011101" "1100100100101110001100011001011" "1111100010000111111110110010010" "1011101100101111100001111001110" "1111001111110010110101011100110" "1010010011110001001101111010011" "1010011011101001000011101111110" "1111010101001101011111100110010" "1100011111100110111001011010001" "1101010001001101110111001011100" "1101101000111101010001001110010" "1100111011000010000101100011000" "1111110001110011110001001001110" "1011110100010001000001001110001" "1001011000011011001010010101110" "1001001001001101011111101011100" "1001001100010000111011001010001" "1000001011000101001001100111010" "1111100010100001000110110011110" "1111111101000101110011010001010" "1110011010001000000111100111010" "1001010010110101101110110011001" "1100011001011010100100001111011" "1101011100111101000011111100110" "1011101100110000000111011111110" "1100010101101000011101111100101" "1010001010011010101100001111010" "1011110100010001101000001110101" "1001010110011101101100011001100" "1000100011110100100110001001110" "1000001100011111100011111110111" "1011110101010101001110110100111" "1100011101010000011000110011111" "1110010100101111011101110010101" "1010010111010010010111011000000" "1000111001100001011101111010000" "1011110111000010000101011011000" "1011000110110010100100110010000" "1111011001011001111011010111001" "1010010001000100111000101110000" }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set MaxLatency -1
set DelayBudget 1.237
set ClkPeriod 5
set RegisteredInput 0
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
  ::AP::rtl_comp_handler $MemName
}


set CoreName ROM_nP
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_ROM] == "::AESL_LIB_VIRTEX::xil_gen_ROM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_ROM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_ROM, check your platform lib"
  }
}


# Memory (RAM/ROM)  definition:
set ID 867
set hasByteEnable 0
set MemName QuantAct_e_0
set CoreName ap_simcore_mem
set PortList { 1 }
set DataWd 6
set AddrRange 48
set AddrWd 6
set TrueReset 0
set IsROM 1
set ROMData { "101001" "101001" "101001" "101001" "101000" "101001" "101000" "101001" "101000" "101000" "101000" "101001" "101001" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101001" "101001" "101000" "101001" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101001" "101000" "101000" "101000" "101000" "101000" }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set MaxLatency -1
set DelayBudget 1.237
set ClkPeriod 5
set RegisteredInput 0
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
  ::AP::rtl_comp_handler $MemName
}


set CoreName ROM_nP
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_ROM] == "::AESL_LIB_VIRTEX::xil_gen_ROM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_ROM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_ROM, check your platform lib"
  }
}


# Memory (RAM/ROM)  definition:
set ID 868
set hasByteEnable 0
set MemName QuantAct_e_1
set CoreName ap_simcore_mem
set PortList { 1 }
set DataWd 6
set AddrRange 48
set AddrWd 6
set TrueReset 0
set IsROM 1
set ROMData { "101001" "101001" "101001" "101001" "101000" "101001" "101000" "101001" "101000" "101000" "101000" "101001" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101001" "101000" "101000" "101001" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101001" "101000" "101000" "101000" "101000" "101000" "101000" "101000" }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set MaxLatency -1
set DelayBudget 1.237
set ClkPeriod 5
set RegisteredInput 0
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
  ::AP::rtl_comp_handler $MemName
}


set CoreName ROM_nP
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_ROM] == "::AESL_LIB_VIRTEX::xil_gen_ROM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_ROM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_ROM, check your platform lib"
  }
}


# Memory (RAM/ROM)  definition:
set ID 869
set hasByteEnable 0
set MemName QuantAct_e_2
set CoreName ap_simcore_mem
set PortList { 1 }
set DataWd 6
set AddrRange 48
set AddrWd 6
set TrueReset 0
set IsROM 1
set ROMData { "101000" "101001" "101001" "101001" "101000" "101000" "101001" "101001" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101001" "101000" "101000" "101000" "101000" "101001" "101000" "101000" "101000" "101001" "101001" "101001" "101001" "101000" "101000" "101000" "101001" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set MaxLatency -1
set DelayBudget 1.237
set ClkPeriod 5
set RegisteredInput 0
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
  ::AP::rtl_comp_handler $MemName
}


set CoreName ROM_nP
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_ROM] == "::AESL_LIB_VIRTEX::xil_gen_ROM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_ROM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_ROM, check your platform lib"
  }
}


# Memory (RAM/ROM)  definition:
set ID 870
set hasByteEnable 0
set MemName QuantAct_e_3
set CoreName ap_simcore_mem
set PortList { 1 }
set DataWd 6
set AddrRange 48
set AddrWd 6
set TrueReset 0
set IsROM 1
set ROMData { "101001" "101001" "101001" "101001" "101000" "101001" "101001" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101001" "101001" "101001" "101001" "101000" "101001" "101000" "101001" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set MaxLatency -1
set DelayBudget 1.237
set ClkPeriod 5
set RegisteredInput 0
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
  ::AP::rtl_comp_handler $MemName
}


set CoreName ROM_nP
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_ROM] == "::AESL_LIB_VIRTEX::xil_gen_ROM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_ROM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_ROM, check your platform lib"
  }
}


# Memory (RAM/ROM)  definition:
set ID 871
set hasByteEnable 0
set MemName QuantAct_e_4
set CoreName ap_simcore_mem
set PortList { 1 }
set DataWd 6
set AddrRange 48
set AddrWd 6
set TrueReset 0
set IsROM 1
set ROMData { "101001" "101001" "101000" "101001" "101000" "101000" "101000" "101000" "101000" "101001" "101000" "101000" "101001" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101001" "101000" "101001" "101001" "101001" "101001" "101001" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101001" "101000" "101000" "101000" "101000" "101000" "101000" "101000" }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set MaxLatency -1
set DelayBudget 1.237
set ClkPeriod 5
set RegisteredInput 0
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
  ::AP::rtl_comp_handler $MemName
}


set CoreName ROM_nP
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_ROM] == "::AESL_LIB_VIRTEX::xil_gen_ROM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_ROM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_ROM, check your platform lib"
  }
}


# Memory (RAM/ROM)  definition:
set ID 872
set hasByteEnable 0
set MemName QuantAct_e_5
set CoreName ap_simcore_mem
set PortList { 1 }
set DataWd 6
set AddrRange 48
set AddrWd 6
set TrueReset 0
set IsROM 1
set ROMData { "101001" "101001" "101001" "101001" "101001" "101001" "101001" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101001" "101001" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101001" "101000" "101000" "101000" "101000" "101000" }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set MaxLatency -1
set DelayBudget 1.237
set ClkPeriod 5
set RegisteredInput 0
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
  ::AP::rtl_comp_handler $MemName
}


set CoreName ROM_nP
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_ROM] == "::AESL_LIB_VIRTEX::xil_gen_ROM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_ROM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_ROM, check your platform lib"
  }
}


# Memory (RAM/ROM)  definition:
set ID 873
set hasByteEnable 0
set MemName QuantAct_e_6
set CoreName ap_simcore_mem
set PortList { 1 }
set DataWd 6
set AddrRange 48
set AddrWd 6
set TrueReset 0
set IsROM 1
set ROMData { "101001" "101001" "101001" "101001" "101001" "101001" "101000" "101000" "101000" "101000" "101001" "101000" "101000" "101000" "101000" "101001" "101000" "101000" "100111" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101001" "101001" "101000" "101000" "101000" "101000" "101000" "101001" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set MaxLatency -1
set DelayBudget 1.237
set ClkPeriod 5
set RegisteredInput 0
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
  ::AP::rtl_comp_handler $MemName
}


set CoreName ROM_nP
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_ROM] == "::AESL_LIB_VIRTEX::xil_gen_ROM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_ROM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_ROM, check your platform lib"
  }
}


# Memory (RAM/ROM)  definition:
set ID 874
set hasByteEnable 0
set MemName QuantAct_e_7
set CoreName ap_simcore_mem
set PortList { 1 }
set DataWd 6
set AddrRange 48
set AddrWd 6
set TrueReset 0
set IsROM 1
set ROMData { "101000" "101001" "101001" "101000" "101001" "101001" "101001" "101001" "101000" "101001" "101000" "101001" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101001" "101001" "101000" "101000" "101000" "101001" "101001" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101001" "101000" "101000" "101000" "101000" "101000" "101000" "101000" }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set MaxLatency -1
set DelayBudget 1.237
set ClkPeriod 5
set RegisteredInput 0
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
  ::AP::rtl_comp_handler $MemName
}


set CoreName ROM_nP
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_ROM] == "::AESL_LIB_VIRTEX::xil_gen_ROM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_ROM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_ROM, check your platform lib"
  }
}


# Memory (RAM/ROM)  definition:
set ID 875
set hasByteEnable 0
set MemName QuantAct_e_8
set CoreName ap_simcore_mem
set PortList { 1 }
set DataWd 6
set AddrRange 48
set AddrWd 6
set TrueReset 0
set IsROM 1
set ROMData { "101001" "101000" "101001" "101001" "101000" "101001" "101001" "101000" "101000" "101001" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101001" "101000" "101001" "101000" "101001" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101001" "101000" "101000" "101000" "101000" "101000" "101000" }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set MaxLatency -1
set DelayBudget 1.237
set ClkPeriod 5
set RegisteredInput 0
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
  ::AP::rtl_comp_handler $MemName
}


set CoreName ROM_nP
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_ROM] == "::AESL_LIB_VIRTEX::xil_gen_ROM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_ROM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_ROM, check your platform lib"
  }
}


# Memory (RAM/ROM)  definition:
set ID 876
set hasByteEnable 0
set MemName QuantAct_e_9
set CoreName ap_simcore_mem
set PortList { 1 }
set DataWd 6
set AddrRange 48
set AddrWd 6
set TrueReset 0
set IsROM 1
set ROMData { "101001" "101001" "101001" "101001" "101001" "101001" "101001" "101001" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101001" "101000" "101000" "101000" "101001" "101001" "101001" "101001" "101000" "101001" "101001" "101000" "101000" "101000" "101000" "101000" "101001" "101000" "101000" "101001" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set MaxLatency -1
set DelayBudget 1.237
set ClkPeriod 5
set RegisteredInput 0
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
  ::AP::rtl_comp_handler $MemName
}


set CoreName ROM_nP
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_ROM] == "::AESL_LIB_VIRTEX::xil_gen_ROM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_ROM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_ROM, check your platform lib"
  }
}


# Memory (RAM/ROM)  definition:
set ID 877
set hasByteEnable 0
set MemName QuantAct_e_10
set CoreName ap_simcore_mem
set PortList { 1 }
set DataWd 6
set AddrRange 48
set AddrWd 6
set TrueReset 0
set IsROM 1
set ROMData { "101001" "101001" "101001" "101001" "101000" "101000" "101001" "101000" "101000" "101000" "101001" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101001" "101001" "101001" "101000" "101001" "101001" "101001" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set MaxLatency -1
set DelayBudget 1.237
set ClkPeriod 5
set RegisteredInput 0
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
  ::AP::rtl_comp_handler $MemName
}


set CoreName ROM_nP
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_ROM] == "::AESL_LIB_VIRTEX::xil_gen_ROM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_ROM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_ROM, check your platform lib"
  }
}


# Memory (RAM/ROM)  definition:
set ID 878
set hasByteEnable 0
set MemName QuantAct_e_11
set CoreName ap_simcore_mem
set PortList { 1 }
set DataWd 6
set AddrRange 48
set AddrWd 6
set TrueReset 0
set IsROM 1
set ROMData { "101000" "101001" "101001" "101001" "101000" "101001" "101000" "101000" "101000" "101000" "101001" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101001" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set MaxLatency -1
set DelayBudget 1.237
set ClkPeriod 5
set RegisteredInput 0
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
  ::AP::rtl_comp_handler $MemName
}


set CoreName ROM_nP
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_ROM] == "::AESL_LIB_VIRTEX::xil_gen_ROM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_ROM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_ROM, check your platform lib"
  }
}


# Memory (RAM/ROM)  definition:
set ID 879
set hasByteEnable 0
set MemName QuantAct_e_12
set CoreName ap_simcore_mem
set PortList { 1 }
set DataWd 6
set AddrRange 48
set AddrWd 6
set TrueReset 0
set IsROM 1
set ROMData { "101001" "101001" "101000" "101000" "101000" "101001" "101001" "101000" "101000" "101001" "101001" "101001" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "100111" "101000" "101000" "101000" "101001" "101000" "101001" "101000" "101000" "101000" "101000" "101001" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set MaxLatency -1
set DelayBudget 1.237
set ClkPeriod 5
set RegisteredInput 0
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
  ::AP::rtl_comp_handler $MemName
}


set CoreName ROM_nP
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_ROM] == "::AESL_LIB_VIRTEX::xil_gen_ROM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_ROM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_ROM, check your platform lib"
  }
}


# Memory (RAM/ROM)  definition:
set ID 880
set hasByteEnable 0
set MemName QuantAct_e_13
set CoreName ap_simcore_mem
set PortList { 1 }
set DataWd 6
set AddrRange 48
set AddrWd 6
set TrueReset 0
set IsROM 1
set ROMData { "101000" "101000" "101001" "101001" "101000" "101001" "101000" "101001" "101001" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101001" "101000" "101000" "101001" "101000" "101000" "101000" "101000" "101001" "101000" "101000" "101000" "101000" "101001" "101000" "101000" "101000" "101000" "101000" "101000" }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set MaxLatency -1
set DelayBudget 1.237
set ClkPeriod 5
set RegisteredInput 0
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
  ::AP::rtl_comp_handler $MemName
}


set CoreName ROM_nP
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_ROM] == "::AESL_LIB_VIRTEX::xil_gen_ROM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_ROM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_ROM, check your platform lib"
  }
}


# Memory (RAM/ROM)  definition:
set ID 881
set hasByteEnable 0
set MemName QuantAct_e_14
set CoreName ap_simcore_mem
set PortList { 1 }
set DataWd 6
set AddrRange 48
set AddrWd 6
set TrueReset 0
set IsROM 1
set ROMData { "101001" "101001" "101001" "101001" "101000" "101000" "101000" "101001" "101000" "101001" "101001" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101001" "101001" "101000" "101000" "101000" "101001" "101000" "101001" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101001" "101001" "101001" "101000" "101000" "101000" "101000" "101000" }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set MaxLatency -1
set DelayBudget 1.237
set ClkPeriod 5
set RegisteredInput 0
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
  ::AP::rtl_comp_handler $MemName
}


set CoreName ROM_nP
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_ROM] == "::AESL_LIB_VIRTEX::xil_gen_ROM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_ROM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_ROM, check your platform lib"
  }
}


# Memory (RAM/ROM)  definition:
set ID 882
set hasByteEnable 0
set MemName QuantAct_e_15
set CoreName ap_simcore_mem
set PortList { 1 }
set DataWd 6
set AddrRange 48
set AddrWd 6
set TrueReset 0
set IsROM 1
set ROMData { "101001" "101001" "101001" "101001" "101000" "101001" "101001" "101000" "101001" "101000" "101001" "101000" "101001" "101000" "101000" "101001" "101000" "101000" "101000" "101000" "101001" "101000" "101000" "101000" "101000" "101000" "101001" "101001" "101001" "101000" "101001" "101001" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101000" "101001" "101000" "101000" "101000" "101000" "101000" "101000" }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set MaxLatency -1
set DelayBudget 1.237
set ClkPeriod 5
set RegisteredInput 0
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
  ::AP::rtl_comp_handler $MemName
}


set CoreName ROM_nP
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_ROM] == "::AESL_LIB_VIRTEX::xil_gen_ROM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_ROM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_ROM, check your platform lib"
  }
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 888 \
    name out_V_data_V \
    reset_level 1 \
    sync_rst true \
    corename {out_r} \
    metadata {  } \
    op interface \
    ports { out_r_TDATA { O 512 vector } out_r_TREADY { I 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'out_V_data_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 889 \
    name out_V_id_V \
    reset_level 1 \
    sync_rst true \
    corename {out_r} \
    metadata {  } \
    op interface \
    ports { out_r_TID { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'out_V_id_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 890 \
    name out_V_dest_V \
    reset_level 1 \
    sync_rst true \
    corename {out_r} \
    metadata {  } \
    op interface \
    ports { out_r_TDEST { O 8 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'out_V_dest_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 891 \
    name out_V_user_V \
    reset_level 1 \
    sync_rst true \
    corename {out_r} \
    metadata {  } \
    op interface \
    ports { out_r_TUSER { O 16 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'out_V_user_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 892 \
    name out_V_last_V \
    reset_level 1 \
    sync_rst true \
    corename {out_r} \
    metadata {  } \
    op interface \
    ports { out_r_TVALID { O 1 bit } out_r_TLAST { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'out_V_last_V'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 883 \
    name in_V_data_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_in_V_data_V \
    op interface \
    ports { in_V_data_V_dout { I 512 vector } in_V_data_V_empty_n { I 1 bit } in_V_data_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 884 \
    name in_V_id_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_in_V_id_V \
    op interface \
    ports { in_V_id_V_dout { I 8 vector } in_V_id_V_empty_n { I 1 bit } in_V_id_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 885 \
    name in_V_dest_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_in_V_dest_V \
    op interface \
    ports { in_V_dest_V_dout { I 8 vector } in_V_dest_V_empty_n { I 1 bit } in_V_dest_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 886 \
    name in_V_user_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_in_V_user_V \
    op interface \
    ports { in_V_user_V_dout { I 16 vector } in_V_user_V_empty_n { I 1 bit } in_V_user_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 887 \
    name in_V_last_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_in_V_last_V \
    op interface \
    ports { in_V_last_V_dout { I 1 vector } in_V_last_V_empty_n { I 1 bit } in_V_last_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } ap_continue { I 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


