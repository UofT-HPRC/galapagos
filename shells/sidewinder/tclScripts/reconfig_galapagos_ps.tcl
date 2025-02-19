proc getPresetInfo {} {
  set vlnv_version_independent [lindex [get_ipdefs -filter "NAME == zynq_ultra_ps_e"] end]
  return [dict create name {reconfig_galapagos_ps} description {reconfig_galapagos_ps}  vlnv $vlnv_version_independent display_name {reconfig_galapagos_ps} ]
}

proc validate_preset {IPINST} { return true }


proc apply_preset {IPINST} {
  return [dict create \
    CONFIG.PSU__PSS_REF_CLK__FREQMHZ {33.333}  \
    CONFIG.PSU__ACT_DDR_FREQ_MHZ {933.323975}  \
    CONFIG.PSU__GEM__TSU__ENABLE {0}  \
    CONFIG.PSU__GEM__TSU__IO {<Select>}  \
    CONFIG.PSU__FPGA_PL0_ENABLE {1}  \
    CONFIG.PSU__FPGA_PL1_ENABLE {0}  \
    CONFIG.PSU__ENET3__PERIPHERAL__ENABLE {1}  \
    CONFIG.PSU__ENET3__FIFO__ENABLE {0}  \
    CONFIG.PSU__ENET3__PTP__ENABLE {0}  \
    CONFIG.PSU__ENET3__PERIPHERAL__IO {MIO 64 .. 75}  \
    CONFIG.PSU__ENET3__GRP_MDIO__ENABLE {1}  \
    CONFIG.PSU__ENET3__GRP_MDIO__IO {MIO 76 .. 77}  \
    CONFIG.PSU__GPIO0_MIO__PERIPHERAL__ENABLE {0}  \
    CONFIG.PSU__GPIO0_MIO__IO {<Select>}  \
    CONFIG.PSU__GPIO1_MIO__PERIPHERAL__ENABLE {1}  \
    CONFIG.PSU__GPIO1_MIO__IO {MIO 26 .. 51}  \
    CONFIG.PSU__GPIO2_MIO__PERIPHERAL__ENABLE {0}  \
    CONFIG.PSU__I2C0__PERIPHERAL__ENABLE {1}  \
    CONFIG.PSU__I2C0__PERIPHERAL__IO {MIO 14 .. 15}  \
    CONFIG.PSU__I2C1__PERIPHERAL__ENABLE {1}  \
    CONFIG.PSU__I2C1__PERIPHERAL__IO {MIO 16 .. 17}  \
    CONFIG.PSU__PROTECTION__MASTERS {USB1:NonSecure;0|USB0:NonSecure;0|S_AXI_LPD:NA;0|S_AXI_HPC1_FPD:NA;0|S_AXI_HPC0_FPD:NA;0|S_AXI_HP3_FPD:NA;0|S_AXI_HP2_FPD:NA;0|S_AXI_HP1_FPD:NA;0|S_AXI_HP0_FPD:NA;0|S_AXI_ACP:NA;0|S_AXI_ACE:NA;0|SD1:NonSecure;1|SD0:NonSecure;0|SATA1:NonSecure;0|SATA0:NonSecure;0|RPU1:Secure;1|RPU0:Secure;1|QSPI:NonSecure;1|PMU:NA;1|PCIe:NonSecure;0|NAND:NonSecure;0|LDMA:NonSecure;1|GPU:NonSecure;1|GEM3:NonSecure;1|GEM2:NonSecure;0|GEM1:NonSecure;0|GEM0:NonSecure;0|FDMA:NonSecure;1|DP:NonSecure;0|DAP:NA;1|Coresight:NA;1|CSU:NA;1|APU:NA;1}  \
    CONFIG.PSU__PROTECTION__SLAVES {LPD;USB3_1_XHCI;FE300000;FE3FFFFF;0|LPD;USB3_1;FF9E0000;FF9EFFFF;0|LPD;USB3_0_XHCI;FE200000;FE2FFFFF;0|LPD;USB3_0;FF9D0000;FF9DFFFF;0|LPD;UART1;FF010000;FF01FFFF;1|LPD;UART0;FF000000;FF00FFFF;1|LPD;TTC3;FF140000;FF14FFFF;0|LPD;TTC2;FF130000;FF13FFFF;0|LPD;TTC1;FF120000;FF12FFFF;0|LPD;TTC0;FF110000;FF11FFFF;0|FPD;SWDT1;FD4D0000;FD4DFFFF;0|LPD;SWDT0;FF150000;FF15FFFF;0|LPD;SPI1;FF050000;FF05FFFF;0|LPD;SPI0;FF040000;FF04FFFF;0|FPD;SMMU_REG;FD5F0000;FD5FFFFF;1|FPD;SMMU;FD800000;FDFFFFFF;1|FPD;SIOU;FD3D0000;FD3DFFFF;1|FPD;SERDES;FD400000;FD47FFFF;1|LPD;SD1;FF170000;FF17FFFF;1|LPD;SD0;FF160000;FF16FFFF;0|FPD;SATA;FD0C0000;FD0CFFFF;0|LPD;RTC;FFA60000;FFA6FFFF;1|LPD;RSA_CORE;FFCE0000;FFCEFFFF;1|LPD;RPU;FF9A0000;FF9AFFFF;1|FPD;RCPU_GIC;F9000000;F900FFFF;1|LPD;R5_TCM_RAM_GLOBAL;FFE00000;FFE3FFFF;1|LPD;R5_1_Instruction_Cache;FFEC0000;FFECFFFF;1|LPD;R5_1_Data_Cache;FFED0000;FFEDFFFF;1|LPD;R5_1_BTCM_GLOBAL;FFEB0000;FFEBFFFF;1|LPD;R5_1_ATCM_GLOBAL;FFE90000;FFE9FFFF;1|LPD;R5_0_Instruction_Cache;FFE40000;FFE4FFFF;1|LPD;R5_0_Data_Cache;FFE50000;FFE5FFFF;1|LPD;R5_0_BTCM_GLOBAL;FFE20000;FFE2FFFF;1|LPD;R5_0_ATCM_GLOBAL;FFE00000;FFE0FFFF;1|LPD;QSPI_Linear_Address;C0000000;DFFFFFFF;1|LPD;QSPI;FF0F0000;FF0FFFFF;1|LPD;PMU_RAM;FFDC0000;FFDDFFFF;1|LPD;PMU_GLOBAL;FFD80000;FFDBFFFF;1|FPD;PCIE_MAIN;FD0E0000;FD0EFFFF;0|FPD;PCIE_LOW;E0000000;EFFFFFFF;0|FPD;PCIE_HIGH2;8000000000;BFFFFFFFFF;0|FPD;PCIE_HIGH1;600000000;7FFFFFFFF;0|FPD;PCIE_DMA;FD0F0000;FD0FFFFF;0|FPD;PCIE_ATTRIB;FD480000;FD48FFFF;0|LPD;OCM_XMPU_CFG;FFA70000;FFA7FFFF;1|LPD;OCM_SLCR;FF960000;FF96FFFF;1|OCM;OCM;FFFC0000;FFFFFFFF;1|LPD;NAND;FF100000;FF10FFFF;0|LPD;MBISTJTAG;FFCF0000;FFCFFFFF;1|LPD;LPD_XPPU_SINK;FF9C0000;FF9CFFFF;1|LPD;LPD_XPPU;FF980000;FF98FFFF;1|LPD;LPD_SLCR_SECURE;FF4B0000;FF4DFFFF;1|LPD;LPD_SLCR;FF410000;FF4AFFFF;1|LPD;LPD_GPV;FE100000;FE1FFFFF;1|LPD;LPD_DMA_7;FFAF0000;FFAFFFFF;1|LPD;LPD_DMA_6;FFAE0000;FFAEFFFF;1|LPD;LPD_DMA_5;FFAD0000;FFADFFFF;1|LPD;LPD_DMA_4;FFAC0000;FFACFFFF;1|LPD;LPD_DMA_3;FFAB0000;FFABFFFF;1|LPD;LPD_DMA_2;FFAA0000;FFAAFFFF;1|LPD;LPD_DMA_1;FFA90000;FFA9FFFF;1|LPD;LPD_DMA_0;FFA80000;FFA8FFFF;1|LPD;IPI_CTRL;FF380000;FF3FFFFF;1|LPD;IOU_SLCR;FF180000;FF23FFFF;1|LPD;IOU_SECURE_SLCR;FF240000;FF24FFFF;1|LPD;IOU_SCNTRS;FF260000;FF26FFFF;1|LPD;IOU_SCNTR;FF250000;FF25FFFF;1|LPD;IOU_GPV;FE000000;FE0FFFFF;1|LPD;I2C1;FF030000;FF03FFFF;1|LPD;I2C0;FF020000;FF02FFFF;1|FPD;GPU;FD4B0000;FD4BFFFF;1|LPD;GPIO;FF0A0000;FF0AFFFF;1|LPD;GEM3;FF0E0000;FF0EFFFF;1|LPD;GEM2;FF0D0000;FF0DFFFF;0|LPD;GEM1;FF0C0000;FF0CFFFF;0|LPD;GEM0;FF0B0000;FF0BFFFF;0|FPD;FPD_XMPU_SINK;FD4F0000;FD4FFFFF;1|FPD;FPD_XMPU_CFG;FD5D0000;FD5DFFFF;1|FPD;FPD_SLCR_SECURE;FD690000;FD6CFFFF;1|FPD;FPD_SLCR;FD610000;FD68FFFF;1|FPD;FPD_GPV;FD700000;FD7FFFFF;1|FPD;FPD_DMA_CH7;FD570000;FD57FFFF;1|FPD;FPD_DMA_CH6;FD560000;FD56FFFF;1|FPD;FPD_DMA_CH5;FD550000;FD55FFFF;1|FPD;FPD_DMA_CH4;FD540000;FD54FFFF;1|FPD;FPD_DMA_CH3;FD530000;FD53FFFF;1|FPD;FPD_DMA_CH2;FD520000;FD52FFFF;1|FPD;FPD_DMA_CH1;FD510000;FD51FFFF;1|FPD;FPD_DMA_CH0;FD500000;FD50FFFF;1|LPD;EFUSE;FFCC0000;FFCCFFFF;1|FPD;Display Port;FD4A0000;FD4AFFFF;0|FPD;DPDMA;FD4C0000;FD4CFFFF;0|FPD;DDR_XMPU5_CFG;FD050000;FD05FFFF;1|FPD;DDR_XMPU4_CFG;FD040000;FD04FFFF;1|FPD;DDR_XMPU3_CFG;FD030000;FD03FFFF;1|FPD;DDR_XMPU2_CFG;FD020000;FD02FFFF;1|FPD;DDR_XMPU1_CFG;FD010000;FD01FFFF;1|FPD;DDR_XMPU0_CFG;FD000000;FD00FFFF;1|FPD;DDR_QOS_CTRL;FD090000;FD09FFFF;1|FPD;DDR_PHY;FD080000;FD08FFFF;1|DDR;DDR_LOW;0;7FFFFFFF;1|DDR;DDR_HIGH;800000000;B7FFFFFFF;1|FPD;DDDR_CTRL;FD070000;FD070FFF;1|LPD;Coresight;FE800000;FEFFFFFF;1|LPD;CSU_DMA;FFC80000;FFC9FFFF;1|LPD;CSU;FFCA0000;FFCAFFFF;0|LPD;CRL_APB;FF5E0000;FF85FFFF;1|FPD;CRF_APB;FD1A0000;FD2DFFFF;1|FPD;CCI_REG;FD5E0000;FD5EFFFF;1|FPD;CCI_GPV;FD6E0000;FD6EFFFF;1|LPD;CAN1;FF070000;FF07FFFF;0|LPD;CAN0;FF060000;FF06FFFF;0|FPD;APU;FD5C0000;FD5CFFFF;1|LPD;APM_INTC_IOU;FFA20000;FFA2FFFF;1|LPD;APM_FPD_LPD;FFA30000;FFA3FFFF;1|FPD;APM_5;FD490000;FD49FFFF;1|FPD;APM_0;FD0B0000;FD0BFFFF;1|LPD;APM2;FFA10000;FFA1FFFF;1|LPD;APM1;FFA00000;FFA0FFFF;1|LPD;AMS;FFA50000;FFA5FFFF;1|FPD;AFI_5;FD3B0000;FD3BFFFF;1|FPD;AFI_4;FD3A0000;FD3AFFFF;1|FPD;AFI_3;FD390000;FD39FFFF;1|FPD;AFI_2;FD380000;FD38FFFF;1|FPD;AFI_1;FD370000;FD37FFFF;1|FPD;AFI_0;FD360000;FD36FFFF;1|LPD;AFIFM6;FF9B0000;FF9BFFFF;1|FPD;ACPU_GIC;F9010000;F907FFFF;1}  \
    CONFIG.SUBPRESET1 {Custom}  \
    CONFIG.PSU_MIO_TREE_PERIPHERALS {Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Feedback Clk#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash##I2C 0#I2C 0#I2C 1#I2C 1#UART 0#UART 0#UART 1#UART 1#####GPIO1 MIO#GPIO1 MIO#GPIO1 MIO#GPIO1 MIO#GPIO1 MIO#GPIO1 MIO#GPIO1 MIO#GPIO1 MIO#GPIO1 MIO#GPIO1 MIO#GPIO1 MIO#GPIO1 MIO#GPIO1 MIO#GPIO1 MIO#GPIO1 MIO#GPIO1 MIO#GPIO1 MIO#GPIO1 MIO#SD 1#SD 1#SD 1#SD 1#SD 1#SD 1#SD 1#SD 1#############Gem 3#Gem 3#Gem 3#Gem 3#Gem 3#Gem 3#Gem 3#Gem 3#Gem 3#Gem 3#Gem 3#Gem 3#MDIO 3#MDIO 3}  \
    CONFIG.PSU_MIO_TREE_SIGNALS {sclk_out#miso_mo1#mo2#mo3#mosi_mi0#n_ss_out#clk_for_lpbk#n_ss_out_upper#mo_upper[0]#mo_upper[1]#mo_upper[2]#mo_upper[3]#sclk_out_upper##scl_out#sda_out#scl_out#sda_out#rxd#txd#txd#rxd#####gpio1[26]#gpio1[27]#gpio1[28]#gpio1[29]#gpio1[30]#gpio1[31]#gpio1[32]#gpio1[33]#gpio1[34]#gpio1[35]#gpio1[36]#gpio1[37]#gpio1[38]#gpio1[39]#gpio1[40]#gpio1[41]#gpio1[42]#gpio1[43]#sdio1_wp#sdio1_cd_n#sdio1_data_out[0]#sdio1_data_out[1]#sdio1_data_out[2]#sdio1_data_out[3]#sdio1_cmd_out#sdio1_clk_out#############rgmii_tx_clk#rgmii_txd[0]#rgmii_txd[1]#rgmii_txd[2]#rgmii_txd[3]#rgmii_tx_ctl#rgmii_rx_clk#rgmii_rxd[0]#rgmii_rxd[1]#rgmii_rxd[2]#rgmii_rxd[3]#rgmii_rx_ctl#gem3_mdc#gem3_mdio_out}  \
    CONFIG.PSU__QSPI__PERIPHERAL__ENABLE {1}  \
    CONFIG.PSU__QSPI__PERIPHERAL__IO {MIO 0 .. 12}  \
    CONFIG.PSU__QSPI__PERIPHERAL__MODE {Dual Parallel}  \
    CONFIG.PSU__QSPI__PERIPHERAL__DATA_MODE {x4}  \
    CONFIG.PSU__QSPI__GRP_FBCLK__ENABLE {1}  \
    CONFIG.PSU__QSPI__GRP_FBCLK__IO {MIO 6}  \
    CONFIG.PSU__SD1__PERIPHERAL__ENABLE {1}  \
    CONFIG.PSU__SD1__PERIPHERAL__IO {MIO 46 .. 51}  \
    CONFIG.PSU__SD1__GRP_CD__ENABLE {1}  \
    CONFIG.PSU__SD1__GRP_CD__IO {MIO 45}  \
    CONFIG.PSU__SD1__GRP_POW__ENABLE {0}  \
    CONFIG.PSU__SD1__GRP_POW__IO {<Select>}  \
    CONFIG.PSU__SD1__GRP_WP__ENABLE {1}  \
    CONFIG.PSU__SD1__GRP_WP__IO {MIO 44}  \
    CONFIG.PSU__SD1__SLOT_TYPE {SD 2.0}  \
    CONFIG.PSU__SD1__RESET__ENABLE {0}  \
    CONFIG.PSU__SD1__DATA_TRANSFER_MODE {4Bit}  \
    CONFIG.PSU__SWDT0__PERIPHERAL__ENABLE {0}  \
    CONFIG.PSU__SWDT0__CLOCK__ENABLE {0}  \
    CONFIG.PSU__SWDT0__RESET__ENABLE {0}  \
    CONFIG.PSU__SWDT1__PERIPHERAL__ENABLE {0}  \
    CONFIG.PSU__SWDT1__CLOCK__ENABLE {0}  \
    CONFIG.PSU__SWDT1__RESET__ENABLE {0}  \
    CONFIG.PSU__UART0__BAUD_RATE {115200}  \
    CONFIG.PSU__TTC0__PERIPHERAL__ENABLE {0}  \
    CONFIG.PSU__TTC0__CLOCK__ENABLE {0}  \
    CONFIG.PSU__TTC0__WAVEOUT__ENABLE {0}  \
    CONFIG.PSU__TTC1__PERIPHERAL__ENABLE {0}  \
    CONFIG.PSU__UART1__BAUD_RATE {115200}  \
    CONFIG.PSU__TTC1__CLOCK__ENABLE {0}  \
    CONFIG.PSU__TTC1__WAVEOUT__ENABLE {0}  \
    CONFIG.PSU__TTC2__PERIPHERAL__ENABLE {0}  \
    CONFIG.PSU__TTC2__CLOCK__ENABLE {0}  \
    CONFIG.PSU__TTC2__WAVEOUT__ENABLE {0}  \
    CONFIG.PSU__TTC3__PERIPHERAL__ENABLE {0}  \
    CONFIG.PSU__TTC3__CLOCK__ENABLE {0}  \
    CONFIG.PSU__TTC3__WAVEOUT__ENABLE {0}  \
    CONFIG.PSU__DDRC__BANK_ADDR_COUNT {2}  \
    CONFIG.PSU__DDRC__BUS_WIDTH {64 Bit}  \
    CONFIG.PSU__DDRC__CL {13}  \
    CONFIG.PSU__DDRC__CLOCK_STOP_EN {0}  \
    CONFIG.PSU__DDRC__COL_ADDR_COUNT {10}  \
    CONFIG.PSU__DDRC__RANK_ADDR_COUNT {1}  \
    CONFIG.PSU__DDRC__CWL {10}  \
    CONFIG.PSU__DDRC__BG_ADDR_COUNT {2}  \
    CONFIG.PSU__DDRC__DEVICE_CAPACITY {8192 MBits}  \
    CONFIG.PSU__DDRC__DRAM_WIDTH {8 Bits}  \
    CONFIG.PSU__DDRC__ECC {Enabled}  \
    CONFIG.PSU__DDRC__MEMORY_TYPE {DDR 4}  \
    CONFIG.PSU__DDRC__ROW_ADDR_COUNT {16}  \
    CONFIG.PSU__DDRC__SPEED_BIN {DDR4_1866L}  \
    CONFIG.PSU__DDRC__T_FAW {21}  \
    CONFIG.PSU__DDRC__T_RAS_MIN {34}  \
    CONFIG.PSU__DDRC__T_RC {46.85}  \
    CONFIG.PSU__DDRC__T_RCD {13}  \
    CONFIG.PSU__DDRC__T_RP {13}  \
    CONFIG.PSU__DDRC__TRAIN_DATA_EYE {1}  \
    CONFIG.PSU__DDRC__TRAIN_READ_GATE {1}  \
    CONFIG.PSU__DDRC__TRAIN_WRITE_LEVEL {1}  \
    CONFIG.PSU__DDRC__VREF {1}  \
    CONFIG.PSU__DDRC__BRC_MAPPING {ROW_BANK_COL}  \
    CONFIG.PSU__DDRC__DIMM_ADDR_MIRROR {1}  \
    CONFIG.PSU__DDRC__STATIC_RD_MODE {0}  \
    CONFIG.PSU__DDRC__DEEP_PWR_DOWN_EN {0}  \
    CONFIG.PSU__DDRC__DDR4_T_REF_MODE {0}  \
    CONFIG.PSU__DDRC__DDR4_T_REF_RANGE {Normal (0-85)}  \
    CONFIG.PSU__DDRC__DDR3_T_REF_RANGE {NA}  \
    CONFIG.PSU__DDRC__DDR3L_T_REF_RANGE {NA}  \
    CONFIG.PSU__DDRC__LPDDR3_T_REF_RANGE {NA}  \
    CONFIG.PSU__DDRC__LPDDR4_T_REF_RANGE {NA}  \
    CONFIG.PSU__DDRC__PHY_DBI_MODE {0}  \
    CONFIG.PSU__DDRC__DM_DBI {DM_NO_DBI}  \
    CONFIG.PSU__DDRC__COMPONENTS {UDIMM}  \
    CONFIG.PSU__DDRC__PARITY_ENABLE {0}  \
    CONFIG.PSU__DDRC__DDR4_CAL_MODE_ENABLE {0}  \
    CONFIG.PSU__DDRC__DDR4_CRC_CONTROL {0}  \
    CONFIG.PSU__DDRC__FGRM {1X}  \
    CONFIG.PSU__DDRC__VENDOR_PART {OTHERS}  \
    CONFIG.PSU__DDRC__SB_TARGET {12-12-12}  \
    CONFIG.PSU__DDRC__LP_ASR {manual normal}  \
    CONFIG.PSU__DDRC__DDR4_ADDR_MAPPING {0}  \
    CONFIG.PSU__DDRC__SELF_REF_ABORT {0}  \
    CONFIG.PSU__DDRC__ADDR_MIRROR {0}  \
    CONFIG.PSU__DDRC__EN_2ND_CLK {0}  \
    CONFIG.PSU__DDRC__PER_BANK_REFRESH {0}  \
    CONFIG.PSU__DDRC__ENABLE_LP4_SLOWBOOT {0}  \
    CONFIG.PSU__DDRC__ENABLE_LP4_HAS_ECC_COMP {ERR: 1  | 0}  \
    CONFIG.PSU__DDRC__DQMAP_0_3 {0}  \
    CONFIG.PSU__DDRC__DQMAP_4_7 {0}  \
    CONFIG.PSU__DDRC__DQMAP_8_11 {0}  \
    CONFIG.PSU__DDRC__DQMAP_12_15 {0}  \
    CONFIG.PSU__DDRC__DQMAP_16_19 {0}  \
    CONFIG.PSU__DDRC__DQMAP_20_23 {0}  \
    CONFIG.PSU__DDRC__DQMAP_24_27 {0}  \
    CONFIG.PSU__DDRC__DQMAP_28_31 {0}  \
    CONFIG.PSU__DDRC__DQMAP_32_35 {0}  \
    CONFIG.PSU__DDRC__DQMAP_36_39 {0}  \
    CONFIG.PSU__DDRC__DQMAP_40_43 {0}  \
    CONFIG.PSU__DDRC__DQMAP_44_47 {0}  \
    CONFIG.PSU__DDRC__DQMAP_48_51 {0}  \
    CONFIG.PSU__DDRC__DQMAP_52_55 {0}  \
    CONFIG.PSU__DDRC__DQMAP_56_59 {0}  \
    CONFIG.PSU__DDRC__DQMAP_60_63 {0}  \
    CONFIG.PSU__DDRC__DQMAP_64_67 {0}  \
    CONFIG.PSU__DDRC__DQMAP_68_71 {0}  \
    CONFIG.PSU_DDR_RAM_HIGHADDR {0x3FFFFFFFF}  \
    CONFIG.PSU_DDR_RAM_HIGHADDR_OFFSET {0x800000000}  \
    CONFIG.PSU_DDR_RAM_LOWADDR_OFFSET {0x80000000}  \
    CONFIG.PSU__UART0__PERIPHERAL__ENABLE {1}  \
    CONFIG.PSU__UART0__PERIPHERAL__IO {MIO 18 .. 19}  \
    CONFIG.PSU__UART0__MODEM__ENABLE {0}  \
    CONFIG.PSU__UART1__PERIPHERAL__ENABLE {1}  \
    CONFIG.PSU__UART1__PERIPHERAL__IO {MIO 20 .. 21}  \
    CONFIG.PSU__UART1__MODEM__ENABLE {0}  \
    CONFIG.PSU__USE__M_AXI_GP0 {1}  \
    CONFIG.PSU__MAXIGP0__DATA_WIDTH {128}  \
    CONFIG.PSU__USE__M_AXI_GP1 {0}  \
    CONFIG.PSU__MAXIGP1__DATA_WIDTH {128}  \
    CONFIG.PSU__USE__M_AXI_GP2 {0}  \
    CONFIG.PSU__MAXIGP2__DATA_WIDTH {32}  \
    CONFIG.PSU__USE__S_AXI_GP0 {0}  \
    CONFIG.PSU__SAXIGP0__DATA_WIDTH {128}  \
    CONFIG.PSU__USE__S_AXI_GP2 {0}  \
    CONFIG.PSU__SAXIGP2__DATA_WIDTH {32}  \
    CONFIG.PSU__USE__S_AXI_GP6 {0}  \
    CONFIG.PSU__SAXIGP6__DATA_WIDTH {128}  \
    CONFIG.PSU__USE__IRQ0 {0}  \
    CONFIG.PSU__USE__FABRIC__RST {1}  \
    CONFIG.PSU__PRESET_APPLIED {1}  \
    CONFIG.PSU__HIGH_ADDRESS__ENABLE {1}  \
    CONFIG.PSU__DDR_HIGH_ADDRESS_GUI_ENABLE {1}  \
    CONFIG.PSU_MIO_0_INPUT_TYPE {schmitt}  \
    CONFIG.PSU_MIO_0_DIRECTION {out}  \
    CONFIG.PSU_MIO_1_DIRECTION {inout}  \
    CONFIG.PSU_MIO_2_DIRECTION {inout}  \
    CONFIG.PSU_MIO_3_DIRECTION {inout}  \
    CONFIG.PSU_MIO_4_DIRECTION {inout}  \
    CONFIG.PSU_MIO_5_INPUT_TYPE {schmitt}  \
    CONFIG.PSU_MIO_5_DIRECTION {out}  \
    CONFIG.PSU_MIO_6_INPUT_TYPE {schmitt}  \
    CONFIG.PSU_MIO_6_DIRECTION {out}  \
    CONFIG.PSU_MIO_7_INPUT_TYPE {schmitt}  \
    CONFIG.PSU_MIO_7_DIRECTION {out}  \
    CONFIG.PSU_MIO_8_DIRECTION {inout}  \
    CONFIG.PSU_MIO_9_DIRECTION {inout}  \
    CONFIG.PSU_MIO_10_DIRECTION {inout}  \
    CONFIG.PSU_MIO_11_DIRECTION {inout}  \
    CONFIG.PSU_MIO_12_INPUT_TYPE {schmitt}  \
    CONFIG.PSU_MIO_12_DIRECTION {out}  \
    CONFIG.PSU_MIO_13_PULLUPDOWN {pullup}  \
    CONFIG.PSU_MIO_13_DIRECTION {inout}  \
    CONFIG.PSU_MIO_14_DIRECTION {inout}  \
    CONFIG.PSU_MIO_15_DIRECTION {inout}  \
    CONFIG.PSU_MIO_16_DIRECTION {inout}  \
    CONFIG.PSU_MIO_17_DIRECTION {inout}  \
    CONFIG.PSU_MIO_18_DRIVE_STRENGTH {12}  \
    CONFIG.PSU_MIO_18_SLEW {slow}  \
    CONFIG.PSU_MIO_18_DIRECTION {in}  \
    CONFIG.PSU_MIO_19_INPUT_TYPE {schmitt}  \
    CONFIG.PSU_MIO_19_DIRECTION {out}  \
    CONFIG.PSU_MIO_20_INPUT_TYPE {schmitt}  \
    CONFIG.PSU_MIO_20_DIRECTION {out}  \
    CONFIG.PSU_MIO_21_DRIVE_STRENGTH {12}  \
    CONFIG.PSU_MIO_21_SLEW {slow}  \
    CONFIG.PSU_MIO_21_DIRECTION {in}  \
    CONFIG.PSU_MIO_22_PULLUPDOWN {pullup}  \
    CONFIG.PSU_MIO_22_DIRECTION {inout}  \
    CONFIG.PSU_MIO_23_PULLUPDOWN {pullup}  \
    CONFIG.PSU_MIO_23_DIRECTION {inout}  \
    CONFIG.PSU_MIO_24_PULLUPDOWN {pullup}  \
    CONFIG.PSU_MIO_24_DIRECTION {inout}  \
    CONFIG.PSU_MIO_25_PULLUPDOWN {pullup}  \
    CONFIG.PSU_MIO_25_DIRECTION {inout}  \
    CONFIG.PSU_MIO_26_PULLUPDOWN {pullup}  \
    CONFIG.PSU_MIO_26_DIRECTION {inout}  \
    CONFIG.PSU_MIO_27_PULLUPDOWN {pullup}  \
    CONFIG.PSU_MIO_27_DIRECTION {inout}  \
    CONFIG.PSU_MIO_28_PULLUPDOWN {pullup}  \
    CONFIG.PSU_MIO_28_DIRECTION {inout}  \
    CONFIG.PSU_MIO_29_PULLUPDOWN {pullup}  \
    CONFIG.PSU_MIO_29_DIRECTION {inout}  \
    CONFIG.PSU_MIO_30_PULLUPDOWN {pullup}  \
    CONFIG.PSU_MIO_30_DRIVE_STRENGTH {12}  \
    CONFIG.PSU_MIO_30_SLEW {slow}  \
    CONFIG.PSU_MIO_30_DIRECTION {inout}  \
    CONFIG.PSU_MIO_31_PULLUPDOWN {pullup}  \
    CONFIG.PSU_MIO_31_DIRECTION {inout}  \
    CONFIG.PSU_MIO_32_PULLUPDOWN {pullup}  \
    CONFIG.PSU_MIO_32_DIRECTION {inout}  \
    CONFIG.PSU_MIO_33_PULLUPDOWN {pullup}  \
    CONFIG.PSU_MIO_33_DIRECTION {inout}  \
    CONFIG.PSU_MIO_34_PULLUPDOWN {pullup}  \
    CONFIG.PSU_MIO_34_DIRECTION {inout}  \
    CONFIG.PSU_MIO_35_PULLUPDOWN {pullup}  \
    CONFIG.PSU_MIO_35_DIRECTION {inout}  \
    CONFIG.PSU_MIO_36_PULLUPDOWN {pullup}  \
    CONFIG.PSU_MIO_36_DIRECTION {inout}  \
    CONFIG.PSU_MIO_37_PULLUPDOWN {pullup}  \
    CONFIG.PSU_MIO_37_DIRECTION {inout}  \
    CONFIG.PSU_MIO_38_PULLUPDOWN {pullup}  \
    CONFIG.PSU_MIO_38_DIRECTION {inout}  \
    CONFIG.PSU_MIO_39_PULLUPDOWN {pullup}  \
    CONFIG.PSU_MIO_39_DIRECTION {inout}  \
    CONFIG.PSU_MIO_40_PULLUPDOWN {pullup}  \
    CONFIG.PSU_MIO_40_DIRECTION {inout}  \
    CONFIG.PSU_MIO_41_PULLUPDOWN {pullup}  \
    CONFIG.PSU_MIO_41_DIRECTION {inout}  \
    CONFIG.PSU_MIO_42_PULLUPDOWN {pullup}  \
    CONFIG.PSU_MIO_42_DIRECTION {inout}  \
    CONFIG.PSU_MIO_43_PULLUPDOWN {pullup}  \
    CONFIG.PSU_MIO_43_INPUT_TYPE {schmitt}  \
    CONFIG.PSU_MIO_43_DIRECTION {inout}  \
    CONFIG.PSU_MIO_44_PULLUPDOWN {pullup}  \
    CONFIG.PSU_MIO_44_DRIVE_STRENGTH {12}  \
    CONFIG.PSU_MIO_44_SLEW {slow}  \
    CONFIG.PSU_MIO_44_DIRECTION {in}  \
    CONFIG.PSU_MIO_45_PULLUPDOWN {pullup}  \
    CONFIG.PSU_MIO_45_DRIVE_STRENGTH {12}  \
    CONFIG.PSU_MIO_45_SLEW {slow}  \
    CONFIG.PSU_MIO_45_DIRECTION {in}  \
    CONFIG.PSU_MIO_46_PULLUPDOWN {pullup}  \
    CONFIG.PSU_MIO_46_DIRECTION {inout}  \
    CONFIG.PSU_MIO_47_PULLUPDOWN {pullup}  \
    CONFIG.PSU_MIO_47_DIRECTION {inout}  \
    CONFIG.PSU_MIO_48_PULLUPDOWN {pullup}  \
    CONFIG.PSU_MIO_48_DIRECTION {inout}  \
    CONFIG.PSU_MIO_49_PULLUPDOWN {pullup}  \
    CONFIG.PSU_MIO_49_DIRECTION {inout}  \
    CONFIG.PSU_MIO_50_PULLUPDOWN {pullup}  \
    CONFIG.PSU_MIO_50_DIRECTION {inout}  \
    CONFIG.PSU_MIO_51_PULLUPDOWN {pullup}  \
    CONFIG.PSU_MIO_51_INPUT_TYPE {schmitt}  \
    CONFIG.PSU_MIO_51_DIRECTION {out}  \
    CONFIG.PSU_MIO_64_INPUT_TYPE {schmitt}  \
    CONFIG.PSU_MIO_64_DIRECTION {out}  \
    CONFIG.PSU_MIO_65_INPUT_TYPE {schmitt}  \
    CONFIG.PSU_MIO_65_DIRECTION {out}  \
    CONFIG.PSU_MIO_66_INPUT_TYPE {schmitt}  \
    CONFIG.PSU_MIO_66_DIRECTION {out}  \
    CONFIG.PSU_MIO_67_INPUT_TYPE {schmitt}  \
    CONFIG.PSU_MIO_67_DIRECTION {out}  \
    CONFIG.PSU_MIO_68_INPUT_TYPE {schmitt}  \
    CONFIG.PSU_MIO_68_DIRECTION {out}  \
    CONFIG.PSU_MIO_69_INPUT_TYPE {schmitt}  \
    CONFIG.PSU_MIO_69_DIRECTION {out}  \
    CONFIG.PSU_MIO_70_DRIVE_STRENGTH {12}  \
    CONFIG.PSU_MIO_70_SLEW {slow}  \
    CONFIG.PSU_MIO_70_DIRECTION {in}  \
    CONFIG.PSU_MIO_71_DRIVE_STRENGTH {12}  \
    CONFIG.PSU_MIO_71_SLEW {slow}  \
    CONFIG.PSU_MIO_71_DIRECTION {in}  \
    CONFIG.PSU_MIO_72_DRIVE_STRENGTH {12}  \
    CONFIG.PSU_MIO_72_SLEW {slow}  \
    CONFIG.PSU_MIO_72_DIRECTION {in}  \
    CONFIG.PSU_MIO_73_DRIVE_STRENGTH {12}  \
    CONFIG.PSU_MIO_73_SLEW {slow}  \
    CONFIG.PSU_MIO_73_DIRECTION {in}  \
    CONFIG.PSU_MIO_74_DRIVE_STRENGTH {12}  \
    CONFIG.PSU_MIO_74_SLEW {slow}  \
    CONFIG.PSU_MIO_74_DIRECTION {in}  \
    CONFIG.PSU_MIO_75_DRIVE_STRENGTH {12}  \
    CONFIG.PSU_MIO_75_SLEW {slow}  \
    CONFIG.PSU_MIO_75_DIRECTION {in}  \
    CONFIG.PSU_MIO_76_INPUT_TYPE {schmitt}  \
    CONFIG.PSU_MIO_76_DIRECTION {out}  \
    CONFIG.PSU_MIO_77_DIRECTION {inout}  \
    CONFIG.PSU_BANK_0_IO_STANDARD {LVCMOS33}  \
    CONFIG.PSU_BANK_1_IO_STANDARD {LVCMOS33}  \
    CONFIG.PSU_BANK_2_IO_STANDARD {LVCMOS33}  \
    CONFIG.PSU_BANK_3_IO_STANDARD {LVCMOS33}  \
    CONFIG.PSU__CRF_APB__APLL_CTRL__FRACDATA {0}  \
    CONFIG.PSU__CRF_APB__VPLL_CTRL__FRACDATA {0}  \
    CONFIG.PSU__CRF_APB__DPLL_CTRL__FRACDATA {0}  \
    CONFIG.PSU__CRL_APB__IOPLL_CTRL__FRACDATA {0}  \
    CONFIG.PSU__CRL_APB__RPLL_CTRL__FRACDATA {0}  \
    CONFIG.PSU__CRF_APB__DPLL_CTRL__DIV2 {1}  \
    CONFIG.PSU__CRF_APB__APLL_CTRL__DIV2 {1}  \
    CONFIG.PSU__CRF_APB__VPLL_CTRL__DIV2 {1}  \
    CONFIG.PSU__CRL_APB__IOPLL_CTRL__DIV2 {1}  \
    CONFIG.PSU__CRL_APB__RPLL_CTRL__DIV2 {1}  \
    CONFIG.PSU__CRF_APB__APLL_CTRL__FBDIV {72}  \
    CONFIG.PSU__CRF_APB__DPLL_CTRL__FBDIV {72}  \
    CONFIG.PSU__CRF_APB__VPLL_CTRL__FBDIV {84}  \
    CONFIG.PSU__CRF_APB__APLL_TO_LPD_CTRL__DIVISOR0 {3}  \
    CONFIG.PSU__CRF_APB__DPLL_TO_LPD_CTRL__DIVISOR0 {3}  \
    CONFIG.PSU__CRF_APB__VPLL_TO_LPD_CTRL__DIVISOR0 {3}  \
    CONFIG.PSU__CRF_APB__ACPU_CTRL__DIVISOR0 {1}  \
    CONFIG.PSU__CRF_APB__DBG_TRACE_CTRL__DIVISOR0 {5}  \
    CONFIG.PSU__CRF_APB__DBG_FPD_CTRL__DIVISOR0 {2}  \
    CONFIG.PSU__CRF_APB__DP_VIDEO_REF_CTRL__DIVISOR0 {5}  \
    CONFIG.PSU__CRF_APB__DP_VIDEO_REF_CTRL__DIVISOR1 {1}  \
    CONFIG.PSU__CRF_APB__DP_AUDIO_REF_CTRL__DIVISOR0 {63}  \
    CONFIG.PSU__CRF_APB__DP_AUDIO_REF_CTRL__DIVISOR1 {1}  \
    CONFIG.PSU__CRF_APB__DP_STC_REF_CTRL__DIVISOR0 {6}  \
    CONFIG.PSU__CRF_APB__DP_STC_REF_CTRL__DIVISOR1 {10}  \
    CONFIG.PSU__CRF_APB__DDR_CTRL__DIVISOR0 {3}  \
    CONFIG.PSU__CRF_APB__GPU_REF_CTRL__DIVISOR0 {2}  \
    CONFIG.PSU__CRF_APB__SATA_REF_CTRL__DIVISOR0 {5}  \
    CONFIG.PSU__CRF_APB__PCIE_REF_CTRL__DIVISOR0 {6}  \
    CONFIG.PSU__CRL_APB__PL0_REF_CTRL__DIVISOR0 {4}  \
    CONFIG.PSU__CRL_APB__PL1_REF_CTRL__DIVISOR0 {4}  \
    CONFIG.PSU__CRL_APB__PL2_REF_CTRL__DIVISOR0 {4}  \
    CONFIG.PSU__CRL_APB__PL3_REF_CTRL__DIVISOR0 {4}  \
    CONFIG.PSU__CRL_APB__PL0_REF_CTRL__DIVISOR1 {1}  \
    CONFIG.PSU__CRL_APB__PL1_REF_CTRL__DIVISOR1 {1}  \
    CONFIG.PSU__CRL_APB__PL2_REF_CTRL__DIVISOR1 {1}  \
    CONFIG.PSU__CRL_APB__PL3_REF_CTRL__DIVISOR1 {1}  \
    CONFIG.PSU__CRL_APB__AMS_REF_CTRL__DIVISOR0 {29}  \
    CONFIG.PSU__CRL_APB__AMS_REF_CTRL__DIVISOR1 {1}  \
    CONFIG.PSU__CRL_APB__TIMESTAMP_REF_CTRL__DIVISOR0 {1}  \
    CONFIG.PSU__CRL_APB__AFI6_REF_CTRL__DIVISOR0 {3}  \
    CONFIG.PSU__CRL_APB__USB3_DUAL_REF_CTRL__DIVISOR0 {5}  \
    CONFIG.PSU__CRL_APB__USB3_DUAL_REF_CTRL__DIVISOR1 {15}  \
    CONFIG.PSU__CRF_APB__GDMA_REF_CTRL__DIVISOR0 {2}  \
    CONFIG.PSU__CRF_APB__DPDMA_REF_CTRL__DIVISOR0 {2}  \
    CONFIG.PSU__CRF_APB__TOPSW_MAIN_CTRL__DIVISOR0 {3}  \
    CONFIG.PSU__CRF_APB__TOPSW_LSBUS_CTRL__DIVISOR0 {5}  \
    CONFIG.PSU__CRF_APB__DBG_TSTMP_CTRL__DIVISOR0 {2}  \
    CONFIG.PSU__CRL_APB__IOPLL_CTRL__FBDIV {90}  \
    CONFIG.PSU__CRL_APB__RPLL_CTRL__FBDIV {48}  \
    CONFIG.PSU__CRL_APB__IOPLL_TO_FPD_CTRL__DIVISOR0 {3}  \
    CONFIG.PSU__CRL_APB__RPLL_TO_FPD_CTRL__DIVISOR0 {2}  \
    CONFIG.PSU__CRL_APB__GEM0_REF_CTRL__DIVISOR0 {12}  \
    CONFIG.PSU__CRL_APB__GEM1_REF_CTRL__DIVISOR0 {12}  \
    CONFIG.PSU__CRL_APB__GEM2_REF_CTRL__DIVISOR0 {12}  \
    CONFIG.PSU__CRL_APB__GEM3_REF_CTRL__DIVISOR0 {12}  \
    CONFIG.PSU__CRL_APB__GEM0_REF_CTRL__DIVISOR1 {1}  \
    CONFIG.PSU__CRL_APB__GEM1_REF_CTRL__DIVISOR1 {1}  \
    CONFIG.PSU__CRL_APB__GEM2_REF_CTRL__DIVISOR1 {1}  \
    CONFIG.PSU__CRL_APB__GEM3_REF_CTRL__DIVISOR1 {1}  \
    CONFIG.PSU__CRL_APB__GEM_TSU_REF_CTRL__DIVISOR0 {6}  \
    CONFIG.PSU__CRL_APB__GEM_TSU_REF_CTRL__DIVISOR1 {1}  \
    CONFIG.PSU__CRL_APB__USB0_BUS_REF_CTRL__DIVISOR0 {6}  \
    CONFIG.PSU__CRL_APB__USB0_BUS_REF_CTRL__DIVISOR1 {1}  \
    CONFIG.PSU__CRL_APB__USB1_BUS_REF_CTRL__DIVISOR0 {6}  \
    CONFIG.PSU__CRL_APB__USB1_BUS_REF_CTRL__DIVISOR1 {1}  \
    CONFIG.PSU__CRL_APB__QSPI_REF_CTRL__DIVISOR0 {12}  \
    CONFIG.PSU__CRL_APB__QSPI_REF_CTRL__DIVISOR1 {1}  \
    CONFIG.PSU__CRL_APB__SDIO0_REF_CTRL__DIVISOR0 {7}  \
    CONFIG.PSU__CRL_APB__SDIO0_REF_CTRL__DIVISOR1 {1}  \
    CONFIG.PSU__CRL_APB__SDIO1_REF_CTRL__DIVISOR0 {4}  \
    CONFIG.PSU__CRL_APB__SDIO1_REF_CTRL__DIVISOR1 {1}  \
    CONFIG.PSU__CRL_APB__UART0_REF_CTRL__DIVISOR0 {15}  \
    CONFIG.PSU__CRL_APB__UART0_REF_CTRL__DIVISOR1 {1}  \
    CONFIG.PSU__CRL_APB__UART1_REF_CTRL__DIVISOR0 {15}  \
    CONFIG.PSU__CRL_APB__UART1_REF_CTRL__DIVISOR1 {1}  \
    CONFIG.PSU__CRL_APB__I2C0_REF_CTRL__DIVISOR0 {15}  \
    CONFIG.PSU__CRL_APB__I2C0_REF_CTRL__DIVISOR1 {1}  \
    CONFIG.PSU__CRL_APB__I2C1_REF_CTRL__DIVISOR0 {15}  \
    CONFIG.PSU__CRL_APB__I2C1_REF_CTRL__DIVISOR1 {1}  \
    CONFIG.PSU__CRL_APB__SPI0_REF_CTRL__DIVISOR0 {7}  \
    CONFIG.PSU__CRL_APB__SPI0_REF_CTRL__DIVISOR1 {1}  \
    CONFIG.PSU__CRL_APB__SPI1_REF_CTRL__DIVISOR0 {7}  \
    CONFIG.PSU__CRL_APB__SPI1_REF_CTRL__DIVISOR1 {1}  \
    CONFIG.PSU__CRL_APB__CAN0_REF_CTRL__DIVISOR0 {15}  \
    CONFIG.PSU__CRL_APB__CAN0_REF_CTRL__DIVISOR1 {1}  \
    CONFIG.PSU__CRL_APB__CAN1_REF_CTRL__DIVISOR0 {15}  \
    CONFIG.PSU__CRL_APB__CAN1_REF_CTRL__DIVISOR1 {1}  \
    CONFIG.PSU__CRL_APB__CPU_R5_CTRL__DIVISOR0 {3}  \
    CONFIG.PSU__CRL_APB__IOU_SWITCH_CTRL__DIVISOR0 {3}  \
    CONFIG.PSU__CRL_APB__PCAP_CTRL__DIVISOR0 {9}  \
    CONFIG.PSU__CRL_APB__LPD_LSBUS_CTRL__DIVISOR0 {15}  \
    CONFIG.PSU__CRL_APB__LPD_SWITCH_CTRL__DIVISOR0 {3}  \
    CONFIG.PSU__CRL_APB__DBG_LPD_CTRL__DIVISOR0 {6}  \
    CONFIG.PSU__CRL_APB__NAND_REF_CTRL__DIVISOR0 {15}  \
    CONFIG.PSU__CRL_APB__NAND_REF_CTRL__DIVISOR1 {1}  \
    CONFIG.PSU__CRL_APB__ADMA_REF_CTRL__DIVISOR0 {3}  \
    CONFIG.PSU__CRF_APB__APLL_CTRL__SRCSEL {PSS_REF_CLK}  \
    CONFIG.PSU__CRF_APB__DPLL_CTRL__SRCSEL {PSS_REF_CLK}  \
    CONFIG.PSU__CRF_APB__VPLL_CTRL__SRCSEL {PSS_REF_CLK}  \
    CONFIG.PSU__CRF_APB__ACPU_CTRL__SRCSEL {APLL}  \
    CONFIG.PSU__CRF_APB__DBG_TRACE_CTRL__SRCSEL {IOPLL}  \
    CONFIG.PSU__CRF_APB__DBG_FPD_CTRL__SRCSEL {IOPLL}  \
    CONFIG.PSU__CRF_APB__DP_VIDEO_REF_CTRL__SRCSEL {VPLL}  \
    CONFIG.PSU__CRF_APB__DP_AUDIO_REF_CTRL__SRCSEL {RPLL}  \
    CONFIG.PSU__CRF_APB__DP_STC_REF_CTRL__SRCSEL {RPLL}  \
    CONFIG.PSU__CRF_APB__DDR_CTRL__SRCSEL {VPLL}  \
    CONFIG.PSU__CRF_APB__GPU_REF_CTRL__SRCSEL {DPLL}  \
    CONFIG.PSU__CRL_APB__PL0_REF_CTRL__SRCSEL {RPLL}  \
    CONFIG.PSU__CRL_APB__PL1_REF_CTRL__SRCSEL {RPLL}  \
    CONFIG.PSU__CRF_APB__GDMA_REF_CTRL__SRCSEL {DPLL}  \
    CONFIG.PSU__CRF_APB__DPDMA_REF_CTRL__SRCSEL {DPLL}  \
    CONFIG.PSU__CRF_APB__TOPSW_MAIN_CTRL__SRCSEL {VPLL}  \
    CONFIG.PSU__CRF_APB__TOPSW_LSBUS_CTRL__SRCSEL {IOPLL}  \
    CONFIG.PSU__CRF_APB__DBG_TSTMP_CTRL__SRCSEL {IOPLL}  \
    CONFIG.PSU__CRL_APB__IOPLL_CTRL__SRCSEL {PSS_REF_CLK}  \
    CONFIG.PSU__CRL_APB__RPLL_CTRL__SRCSEL {PSS_REF_CLK}  \
    CONFIG.PSU__CRL_APB__GEM3_REF_CTRL__SRCSEL {IOPLL}  \
    CONFIG.PSU__CRL_APB__GEM_TSU_REF_CTRL__SRCSEL {IOPLL}  \
    CONFIG.PSU__CRL_APB__QSPI_REF_CTRL__SRCSEL {IOPLL}  \
    CONFIG.PSU__CRL_APB__SDIO1_REF_CTRL__SRCSEL {RPLL}  \
    CONFIG.PSU__CRL_APB__UART0_REF_CTRL__SRCSEL {IOPLL}  \
    CONFIG.PSU__CRL_APB__UART1_REF_CTRL__SRCSEL {IOPLL}  \
    CONFIG.PSU__CRL_APB__I2C0_REF_CTRL__SRCSEL {IOPLL}  \
    CONFIG.PSU__CRL_APB__I2C1_REF_CTRL__SRCSEL {IOPLL}  \
    CONFIG.PSU__CRL_APB__CPU_R5_CTRL__SRCSEL {IOPLL}  \
    CONFIG.PSU__CRL_APB__IOU_SWITCH_CTRL__SRCSEL {RPLL}  \
    CONFIG.PSU__CRL_APB__PCAP_CTRL__SRCSEL {IOPLL}  \
    CONFIG.PSU__CRL_APB__LPD_LSBUS_CTRL__SRCSEL {IOPLL}  \
    CONFIG.PSU__CRL_APB__LPD_SWITCH_CTRL__SRCSEL {IOPLL}  \
    CONFIG.PSU__CRL_APB__DBG_LPD_CTRL__SRCSEL {IOPLL}  \
    CONFIG.PSU__CRL_APB__ADMA_REF_CTRL__SRCSEL {IOPLL}  \
    CONFIG.PSU__CRL_APB__DLL_REF_CTRL__SRCSEL {IOPLL}  \
    CONFIG.PSU__CRL_APB__TIMESTAMP_REF_CTRL__SRCSEL {PSS_REF_CLK}  \
    CONFIG.PSU__IOU_SLCR__WDT_CLK_SEL__SELECT {APB}  \
    CONFIG.PSU__FPD_SLCR__WDT_CLK_SEL__SELECT {APB}  \
    CONFIG.PSU__IOU_SLCR__IOU_TTC_APB_CLK__TTC0_SEL {APB}  \
    CONFIG.PSU__IOU_SLCR__IOU_TTC_APB_CLK__TTC1_SEL {APB}  \
    CONFIG.PSU__IOU_SLCR__IOU_TTC_APB_CLK__TTC2_SEL {APB}  \
    CONFIG.PSU__IOU_SLCR__IOU_TTC_APB_CLK__TTC3_SEL {APB}  \
    CONFIG.PSU__CRF_APB__APLL_FRAC_CFG__ENABLED {0}  \
    CONFIG.PSU__CRF_APB__VPLL_FRAC_CFG__ENABLED {0}  \
    CONFIG.PSU__CRF_APB__DPLL_FRAC_CFG__ENABLED {0}  \
    CONFIG.PSU__CRL_APB__IOPLL_FRAC_CFG__ENABLED {0}  \
    CONFIG.PSU__CRL_APB__RPLL_FRAC_CFG__ENABLED {0}  \
    CONFIG.PSU__OVERRIDE__BASIC_CLOCK {1}  \
    CONFIG.PSU__DLL__ISUSED {1}  \
    CONFIG.PSU__PL_CLK0_BUF {TRUE}  \
    CONFIG.PSU__PL_CLK1_BUF {FALSE}  \
    CONFIG.PSU__IOU_SLCR__TTC0__ACT_FREQMHZ {100}  \
    CONFIG.PSU__IOU_SLCR__TTC1__ACT_FREQMHZ {100}  \
    CONFIG.PSU__IOU_SLCR__TTC2__ACT_FREQMHZ {100}  \
    CONFIG.PSU__IOU_SLCR__TTC3__ACT_FREQMHZ {100}  \
    CONFIG.PSU__IOU_SLCR__WDT0__ACT_FREQMHZ {99.999001}  \
    CONFIG.PSU__FPD_SLCR__WDT1__ACT_FREQMHZ {99.999001}  \
    CONFIG.PSU__CRF_APB__ACPU_CTRL__ACT_FREQMHZ {1199.988037}  \
    CONFIG.PSU__CRF_APB__DBG_FPD_CTRL__ACT_FREQMHZ {249.997498}  \
    CONFIG.PSU__CRF_APB__DDR_CTRL__ACT_FREQMHZ {466.661987}  \
    CONFIG.PSU__DDR__INTERFACE__FREQMHZ {466.667}  \
    CONFIG.PSU__CRF_APB__GPU_REF_CTRL__ACT_FREQMHZ {599.994019}  \
    CONFIG.PSU__CRL_APB__PL0_REF_CTRL__ACT_FREQMHZ {99.999001}  \
    CONFIG.PSU__CRL_APB__PL1_REF_CTRL__ACT_FREQMHZ {199.998001}  \
    CONFIG.PSU__CRF_APB__GDMA_REF_CTRL__ACT_FREQMHZ {599.994019}  \
    CONFIG.PSU__CRF_APB__DPDMA_REF_CTRL__ACT_FREQMHZ {599.994019}  \
    CONFIG.PSU__CRF_APB__TOPSW_MAIN_CTRL__ACT_FREQMHZ {466.661987}  \
    CONFIG.PSU__CRF_APB__TOPSW_LSBUS_CTRL__ACT_FREQMHZ {99.999001}  \
    CONFIG.PSU__CRF_APB__DBG_TSTMP_CTRL__ACT_FREQMHZ {249.997498}  \
    CONFIG.PSU__CRL_APB__GEM3_REF_CTRL__ACT_FREQMHZ {124.998749}  \
    CONFIG.PSU__CRL_APB__GEM_TSU_REF_CTRL__ACT_FREQMHZ {249.997498}  \
    CONFIG.PSU__CRL_APB__QSPI_REF_CTRL__ACT_FREQMHZ {124.998749}  \
    CONFIG.PSU__CRL_APB__SDIO1_REF_CTRL__ACT_FREQMHZ {199.998001}  \
    CONFIG.PSU__CRL_APB__UART0_REF_CTRL__ACT_FREQMHZ {99.999001}  \
    CONFIG.PSU__CRL_APB__UART1_REF_CTRL__ACT_FREQMHZ {99.999001}  \
    CONFIG.PSU__CRL_APB__I2C0_REF_CTRL__ACT_FREQMHZ {99.999001}  \
    CONFIG.PSU__CRL_APB__I2C1_REF_CTRL__ACT_FREQMHZ {99.999001}  \
    CONFIG.PSU__CRL_APB__CPU_R5_CTRL__ACT_FREQMHZ {499.994995}  \
    CONFIG.PSU__CRL_APB__IOU_SWITCH_CTRL__ACT_FREQMHZ {266.664001}  \
    CONFIG.PSU__CRL_APB__PCAP_CTRL__ACT_FREQMHZ {166.664993}  \
    CONFIG.PSU__CRL_APB__LPD_LSBUS_CTRL__ACT_FREQMHZ {99.999001}  \
    CONFIG.PSU__CRL_APB__LPD_SWITCH_CTRL__ACT_FREQMHZ {499.994995}  \
    CONFIG.PSU__CRL_APB__DBG_LPD_CTRL__ACT_FREQMHZ {249.997498}  \
    CONFIG.PSU__CRL_APB__ADMA_REF_CTRL__ACT_FREQMHZ {499.994995}  \
    CONFIG.PSU__CRL_APB__DLL_REF_CTRL__ACT_FREQMHZ {1499.984985}  \
    CONFIG.PSU__CRL_APB__AMS_REF_CTRL__ACT_FREQMHZ {51.723621}  \
    CONFIG.PSU__CRL_APB__TIMESTAMP_REF_CTRL__ACT_FREQMHZ {33.333000}  \
    CONFIG.PSU__CRF_APB__ACPU_CTRL__FREQMHZ {1200}  \
    CONFIG.PSU__CRF_APB__DBG_TRACE_CTRL__FREQMHZ {250}  \
    CONFIG.PSU__CRF_APB__DBG_FPD_CTRL__FREQMHZ {250}  \
    CONFIG.PSU__CRF_APB__DP_VIDEO_REF_CTRL__FREQMHZ {320}  \
    CONFIG.PSU__CRF_APB__DDR_CTRL__FREQMHZ {933.333}  \
    CONFIG.PSU__CRF_APB__GPU_REF_CTRL__FREQMHZ {600}  \
    CONFIG.PSU__CRL_APB__PL0_REF_CTRL__FREQMHZ {200}  \
    CONFIG.PSU__CRL_APB__PL1_REF_CTRL__FREQMHZ {100}  \
    CONFIG.PSU__CRF_APB__GDMA_REF_CTRL__FREQMHZ {600}  \
    CONFIG.PSU__CRF_APB__DPDMA_REF_CTRL__FREQMHZ {600}  \
    CONFIG.PSU__CRF_APB__TOPSW_MAIN_CTRL__FREQMHZ {533.33}  \
    CONFIG.PSU__CRF_APB__TOPSW_LSBUS_CTRL__FREQMHZ {100}  \
    CONFIG.PSU__CRF_APB__DBG_TSTMP_CTRL__FREQMHZ {250}  \
    CONFIG.PSU__CRL_APB__GEM3_REF_CTRL__FREQMHZ {125}  \
    CONFIG.PSU__CRL_APB__QSPI_REF_CTRL__FREQMHZ {300}  \
    CONFIG.PSU__CRL_APB__SDIO1_REF_CTRL__FREQMHZ {200}  \
    CONFIG.PSU__CRL_APB__UART0_REF_CTRL__FREQMHZ {100}  \
    CONFIG.PSU__CRL_APB__UART1_REF_CTRL__FREQMHZ {100}  \
    CONFIG.PSU__CRL_APB__I2C0_REF_CTRL__FREQMHZ {100}  \
    CONFIG.PSU__CRL_APB__I2C1_REF_CTRL__FREQMHZ {100}  \
    CONFIG.PSU__CRL_APB__CPU_R5_CTRL__FREQMHZ {500}  \
    CONFIG.PSU__CRL_APB__IOU_SWITCH_CTRL__FREQMHZ {267}  \
    CONFIG.PSU__CRL_APB__PCAP_CTRL__FREQMHZ {167}  \
    CONFIG.PSU__CRL_APB__LPD_LSBUS_CTRL__FREQMHZ {100}  \
    CONFIG.PSU__CRL_APB__LPD_SWITCH_CTRL__FREQMHZ {500}  \
    CONFIG.PSU__CRL_APB__DBG_LPD_CTRL__FREQMHZ {250}  \
    CONFIG.PSU__CRL_APB__ADMA_REF_CTRL__FREQMHZ {500}  \
    CONFIG.PSU__CRL_APB__DLL_REF_CTRL__FREQMHZ {200}  \
    CONFIG.PSU__CRL_APB__AMS_REF_CTRL__FREQMHZ {52}  \
    CONFIG.PSU__CRL_APB__TIMESTAMP_REF_CTRL__FREQMHZ {33.333}  \
    CONFIG.PSU__IOU_SLCR__TTC0__FREQMHZ {100}  \
    CONFIG.PSU__IOU_SLCR__TTC1__FREQMHZ {100}  \
    CONFIG.PSU__IOU_SLCR__TTC2__FREQMHZ {100}  \
    CONFIG.PSU__IOU_SLCR__TTC3__FREQMHZ {100}  \
    CONFIG.PSU__IOU_SLCR__WDT0__FREQMHZ {99.999001}  \
    CONFIG.PSU__FPD_SLCR__WDT1__FREQMHZ {99.999001}  \
    CONFIG.PSU__NUM_FABRIC_RESETS {1}  \
    CONFIG.PSU__GPIO_EMIO_WIDTH {1}  \
    CONFIG.PSU__GPIO_EMIO__WIDTH {[94:0]}  \
    CONFIG.PSU__SD1_COHERENCY {0}  \
    CONFIG.PSU__QSPI_COHERENCY {0}  \
    CONFIG.PSU__ENET3__TSU__ENABLE {0}  \
    CONFIG.PSU__TSU__BUFG_PORT_PAIR {0}  \
    CONFIG.PSU__GEM3_COHERENCY {0}  \
    CONFIG.PSU__AFI0_COHERENCY {0}  \
    CONFIG.PSU_SD1_INTERNAL_BUS_WIDTH {4}  \
  ]
}


