-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity PSInterface_AXILiteS_s_axi is
generic (
    C_S_AXI_ADDR_WIDTH    : INTEGER := 8;
    C_S_AXI_DATA_WIDTH    : INTEGER := 32);
port (
    ACLK                  :in   STD_LOGIC;
    ARESET                :in   STD_LOGIC;
    ACLK_EN               :in   STD_LOGIC;
    AWADDR                :in   STD_LOGIC_VECTOR(C_S_AXI_ADDR_WIDTH-1 downto 0);
    AWVALID               :in   STD_LOGIC;
    AWREADY               :out  STD_LOGIC;
    WDATA                 :in   STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH-1 downto 0);
    WSTRB                 :in   STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH/8-1 downto 0);
    WVALID                :in   STD_LOGIC;
    WREADY                :out  STD_LOGIC;
    BRESP                 :out  STD_LOGIC_VECTOR(1 downto 0);
    BVALID                :out  STD_LOGIC;
    BREADY                :in   STD_LOGIC;
    ARADDR                :in   STD_LOGIC_VECTOR(C_S_AXI_ADDR_WIDTH-1 downto 0);
    ARVALID               :in   STD_LOGIC;
    ARREADY               :out  STD_LOGIC;
    RDATA                 :out  STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH-1 downto 0);
    RRESP                 :out  STD_LOGIC_VECTOR(1 downto 0);
    RVALID                :out  STD_LOGIC;
    RREADY                :in   STD_LOGIC;
    axil_start_V          :out  STD_LOGIC_VECTOR(31 downto 0);
    axil_pkt_num_V        :out  STD_LOGIC_VECTOR(31 downto 0);
    axil_pkt_len_V        :out  STD_LOGIC_VECTOR(31 downto 0);
    axil_remote_ip_V      :out  STD_LOGIC_VECTOR(31 downto 0);
    axil_remote_port_V    :out  STD_LOGIC_VECTOR(31 downto 0);
    axil_local_port_V     :out  STD_LOGIC_VECTOR(31 downto 0);
    axil_tx_timeElapse_high_V :in   STD_LOGIC_VECTOR(31 downto 0);
    axil_tx_timeElapse_high_V_ap_vld :in   STD_LOGIC;
    axil_tx_timeElapse_low_V :in   STD_LOGIC_VECTOR(31 downto 0);
    axil_tx_timeElapse_low_V_ap_vld :in   STD_LOGIC;
    axil_tx_done_V        :in   STD_LOGIC_VECTOR(31 downto 0);
    axil_tx_done_V_ap_vld :in   STD_LOGIC;
    axil_latency_sum_high_V :in   STD_LOGIC_VECTOR(31 downto 0);
    axil_latency_sum_high_V_ap_vld :in   STD_LOGIC;
    axil_latency_sum_low_V :in   STD_LOGIC_VECTOR(31 downto 0);
    axil_latency_sum_low_V_ap_vld :in   STD_LOGIC;
    axil_rx_timeElaspe_high_V :in   STD_LOGIC_VECTOR(31 downto 0);
    axil_rx_timeElaspe_high_V_ap_vld :in   STD_LOGIC;
    axil_rx_timeElaspe_low_V :in   STD_LOGIC_VECTOR(31 downto 0);
    axil_rx_timeElaspe_low_V_ap_vld :in   STD_LOGIC;
    axil_rx_done_V        :in   STD_LOGIC_VECTOR(31 downto 0);
    axil_rx_done_V_ap_vld :in   STD_LOGIC;
    axil_rx_error_V       :in   STD_LOGIC_VECTOR(31 downto 0);
    axil_rx_error_V_ap_vld :in   STD_LOGIC;
    axil_rx_curr_cnt_V    :in   STD_LOGIC_VECTOR(31 downto 0);
    axil_rx_curr_cnt_V_ap_vld :in   STD_LOGIC
);
end entity PSInterface_AXILiteS_s_axi;

-- ------------------------Address Info-------------------
-- 0x00 : reserved
-- 0x04 : reserved
-- 0x08 : reserved
-- 0x0c : reserved
-- 0x10 : Data signal of axil_start_V
--        bit 31~0 - axil_start_V[31:0] (Read/Write)
-- 0x14 : reserved
-- 0x18 : Data signal of axil_pkt_num_V
--        bit 31~0 - axil_pkt_num_V[31:0] (Read/Write)
-- 0x1c : reserved
-- 0x20 : Data signal of axil_pkt_len_V
--        bit 31~0 - axil_pkt_len_V[31:0] (Read/Write)
-- 0x24 : reserved
-- 0x28 : Data signal of axil_remote_ip_V
--        bit 31~0 - axil_remote_ip_V[31:0] (Read/Write)
-- 0x2c : reserved
-- 0x30 : Data signal of axil_remote_port_V
--        bit 31~0 - axil_remote_port_V[31:0] (Read/Write)
-- 0x34 : reserved
-- 0x38 : Data signal of axil_local_port_V
--        bit 31~0 - axil_local_port_V[31:0] (Read/Write)
-- 0x3c : reserved
-- 0x40 : Data signal of axil_tx_timeElapse_high_V
--        bit 31~0 - axil_tx_timeElapse_high_V[31:0] (Read)
-- 0x44 : Control signal of axil_tx_timeElapse_high_V
--        bit 0  - axil_tx_timeElapse_high_V_ap_vld (Read/COR)
--        others - reserved
-- 0x48 : Data signal of axil_tx_timeElapse_low_V
--        bit 31~0 - axil_tx_timeElapse_low_V[31:0] (Read)
-- 0x4c : Control signal of axil_tx_timeElapse_low_V
--        bit 0  - axil_tx_timeElapse_low_V_ap_vld (Read/COR)
--        others - reserved
-- 0x50 : Data signal of axil_tx_done_V
--        bit 31~0 - axil_tx_done_V[31:0] (Read)
-- 0x54 : Control signal of axil_tx_done_V
--        bit 0  - axil_tx_done_V_ap_vld (Read/COR)
--        others - reserved
-- 0x58 : Data signal of axil_latency_sum_high_V
--        bit 31~0 - axil_latency_sum_high_V[31:0] (Read)
-- 0x5c : Control signal of axil_latency_sum_high_V
--        bit 0  - axil_latency_sum_high_V_ap_vld (Read/COR)
--        others - reserved
-- 0x60 : Data signal of axil_latency_sum_low_V
--        bit 31~0 - axil_latency_sum_low_V[31:0] (Read)
-- 0x64 : Control signal of axil_latency_sum_low_V
--        bit 0  - axil_latency_sum_low_V_ap_vld (Read/COR)
--        others - reserved
-- 0x68 : Data signal of axil_rx_timeElaspe_high_V
--        bit 31~0 - axil_rx_timeElaspe_high_V[31:0] (Read)
-- 0x6c : Control signal of axil_rx_timeElaspe_high_V
--        bit 0  - axil_rx_timeElaspe_high_V_ap_vld (Read/COR)
--        others - reserved
-- 0x70 : Data signal of axil_rx_timeElaspe_low_V
--        bit 31~0 - axil_rx_timeElaspe_low_V[31:0] (Read)
-- 0x74 : Control signal of axil_rx_timeElaspe_low_V
--        bit 0  - axil_rx_timeElaspe_low_V_ap_vld (Read/COR)
--        others - reserved
-- 0x78 : Data signal of axil_rx_done_V
--        bit 31~0 - axil_rx_done_V[31:0] (Read)
-- 0x7c : Control signal of axil_rx_done_V
--        bit 0  - axil_rx_done_V_ap_vld (Read/COR)
--        others - reserved
-- 0x80 : Data signal of axil_rx_error_V
--        bit 31~0 - axil_rx_error_V[31:0] (Read)
-- 0x84 : Control signal of axil_rx_error_V
--        bit 0  - axil_rx_error_V_ap_vld (Read/COR)
--        others - reserved
-- 0x88 : Data signal of axil_rx_curr_cnt_V
--        bit 31~0 - axil_rx_curr_cnt_V[31:0] (Read)
-- 0x8c : Control signal of axil_rx_curr_cnt_V
--        bit 0  - axil_rx_curr_cnt_V_ap_vld (Read/COR)
--        others - reserved
-- (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

architecture behave of PSInterface_AXILiteS_s_axi is
    type states is (wridle, wrdata, wrresp, wrreset, rdidle, rddata, rdreset);  -- read and write fsm states
    signal wstate  : states := wrreset;
    signal rstate  : states := rdreset;
    signal wnext, rnext: states;
    constant ADDR_AXIL_START_V_DATA_0              : INTEGER := 16#10#;
    constant ADDR_AXIL_START_V_CTRL                : INTEGER := 16#14#;
    constant ADDR_AXIL_PKT_NUM_V_DATA_0            : INTEGER := 16#18#;
    constant ADDR_AXIL_PKT_NUM_V_CTRL              : INTEGER := 16#1c#;
    constant ADDR_AXIL_PKT_LEN_V_DATA_0            : INTEGER := 16#20#;
    constant ADDR_AXIL_PKT_LEN_V_CTRL              : INTEGER := 16#24#;
    constant ADDR_AXIL_REMOTE_IP_V_DATA_0          : INTEGER := 16#28#;
    constant ADDR_AXIL_REMOTE_IP_V_CTRL            : INTEGER := 16#2c#;
    constant ADDR_AXIL_REMOTE_PORT_V_DATA_0        : INTEGER := 16#30#;
    constant ADDR_AXIL_REMOTE_PORT_V_CTRL          : INTEGER := 16#34#;
    constant ADDR_AXIL_LOCAL_PORT_V_DATA_0         : INTEGER := 16#38#;
    constant ADDR_AXIL_LOCAL_PORT_V_CTRL           : INTEGER := 16#3c#;
    constant ADDR_AXIL_TX_TIMEELAPSE_HIGH_V_DATA_0 : INTEGER := 16#40#;
    constant ADDR_AXIL_TX_TIMEELAPSE_HIGH_V_CTRL   : INTEGER := 16#44#;
    constant ADDR_AXIL_TX_TIMEELAPSE_LOW_V_DATA_0  : INTEGER := 16#48#;
    constant ADDR_AXIL_TX_TIMEELAPSE_LOW_V_CTRL    : INTEGER := 16#4c#;
    constant ADDR_AXIL_TX_DONE_V_DATA_0            : INTEGER := 16#50#;
    constant ADDR_AXIL_TX_DONE_V_CTRL              : INTEGER := 16#54#;
    constant ADDR_AXIL_LATENCY_SUM_HIGH_V_DATA_0   : INTEGER := 16#58#;
    constant ADDR_AXIL_LATENCY_SUM_HIGH_V_CTRL     : INTEGER := 16#5c#;
    constant ADDR_AXIL_LATENCY_SUM_LOW_V_DATA_0    : INTEGER := 16#60#;
    constant ADDR_AXIL_LATENCY_SUM_LOW_V_CTRL      : INTEGER := 16#64#;
    constant ADDR_AXIL_RX_TIMEELASPE_HIGH_V_DATA_0 : INTEGER := 16#68#;
    constant ADDR_AXIL_RX_TIMEELASPE_HIGH_V_CTRL   : INTEGER := 16#6c#;
    constant ADDR_AXIL_RX_TIMEELASPE_LOW_V_DATA_0  : INTEGER := 16#70#;
    constant ADDR_AXIL_RX_TIMEELASPE_LOW_V_CTRL    : INTEGER := 16#74#;
    constant ADDR_AXIL_RX_DONE_V_DATA_0            : INTEGER := 16#78#;
    constant ADDR_AXIL_RX_DONE_V_CTRL              : INTEGER := 16#7c#;
    constant ADDR_AXIL_RX_ERROR_V_DATA_0           : INTEGER := 16#80#;
    constant ADDR_AXIL_RX_ERROR_V_CTRL             : INTEGER := 16#84#;
    constant ADDR_AXIL_RX_CURR_CNT_V_DATA_0        : INTEGER := 16#88#;
    constant ADDR_AXIL_RX_CURR_CNT_V_CTRL          : INTEGER := 16#8c#;
    constant ADDR_BITS         : INTEGER := 8;

    signal waddr               : UNSIGNED(ADDR_BITS-1 downto 0);
    signal wmask               : UNSIGNED(31 downto 0);
    signal aw_hs               : STD_LOGIC;
    signal w_hs                : STD_LOGIC;
    signal rdata_data          : UNSIGNED(31 downto 0);
    signal ar_hs               : STD_LOGIC;
    signal raddr               : UNSIGNED(ADDR_BITS-1 downto 0);
    signal AWREADY_t           : STD_LOGIC;
    signal WREADY_t            : STD_LOGIC;
    signal ARREADY_t           : STD_LOGIC;
    signal RVALID_t            : STD_LOGIC;
    -- internal registers
    signal int_axil_start_V    : UNSIGNED(31 downto 0) := (others => '0');
    signal int_axil_pkt_num_V  : UNSIGNED(31 downto 0) := (others => '0');
    signal int_axil_pkt_len_V  : UNSIGNED(31 downto 0) := (others => '0');
    signal int_axil_remote_ip_V : UNSIGNED(31 downto 0) := (others => '0');
    signal int_axil_remote_port_V : UNSIGNED(31 downto 0) := (others => '0');
    signal int_axil_local_port_V : UNSIGNED(31 downto 0) := (others => '0');
    signal int_axil_tx_timeElapse_high_V : UNSIGNED(31 downto 0) := (others => '0');
    signal int_axil_tx_timeElapse_high_V_ap_vld : STD_LOGIC;
    signal int_axil_tx_timeElapse_low_V : UNSIGNED(31 downto 0) := (others => '0');
    signal int_axil_tx_timeElapse_low_V_ap_vld : STD_LOGIC;
    signal int_axil_tx_done_V  : UNSIGNED(31 downto 0) := (others => '0');
    signal int_axil_tx_done_V_ap_vld : STD_LOGIC;
    signal int_axil_latency_sum_high_V : UNSIGNED(31 downto 0) := (others => '0');
    signal int_axil_latency_sum_high_V_ap_vld : STD_LOGIC;
    signal int_axil_latency_sum_low_V : UNSIGNED(31 downto 0) := (others => '0');
    signal int_axil_latency_sum_low_V_ap_vld : STD_LOGIC;
    signal int_axil_rx_timeElaspe_high_V : UNSIGNED(31 downto 0) := (others => '0');
    signal int_axil_rx_timeElaspe_high_V_ap_vld : STD_LOGIC;
    signal int_axil_rx_timeElaspe_low_V : UNSIGNED(31 downto 0) := (others => '0');
    signal int_axil_rx_timeElaspe_low_V_ap_vld : STD_LOGIC;
    signal int_axil_rx_done_V  : UNSIGNED(31 downto 0) := (others => '0');
    signal int_axil_rx_done_V_ap_vld : STD_LOGIC;
    signal int_axil_rx_error_V : UNSIGNED(31 downto 0) := (others => '0');
    signal int_axil_rx_error_V_ap_vld : STD_LOGIC;
    signal int_axil_rx_curr_cnt_V : UNSIGNED(31 downto 0) := (others => '0');
    signal int_axil_rx_curr_cnt_V_ap_vld : STD_LOGIC;


begin
-- ----------------------- Instantiation------------------

-- ----------------------- AXI WRITE ---------------------
    AWREADY_t <=  '1' when wstate = wridle else '0';
    AWREADY   <=  AWREADY_t;
    WREADY_t  <=  '1' when wstate = wrdata else '0';
    WREADY    <=  WREADY_t;
    BRESP     <=  "00";  -- OKAY
    BVALID    <=  '1' when wstate = wrresp else '0';
    wmask     <=  (31 downto 24 => WSTRB(3), 23 downto 16 => WSTRB(2), 15 downto 8 => WSTRB(1), 7 downto 0 => WSTRB(0));
    aw_hs     <=  AWVALID and AWREADY_t;
    w_hs      <=  WVALID and WREADY_t;

    -- write FSM
    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                wstate <= wrreset;
            elsif (ACLK_EN = '1') then
                wstate <= wnext;
            end if;
        end if;
    end process;

    process (wstate, AWVALID, WVALID, BREADY)
    begin
        case (wstate) is
        when wridle =>
            if (AWVALID = '1') then
                wnext <= wrdata;
            else
                wnext <= wridle;
            end if;
        when wrdata =>
            if (WVALID = '1') then
                wnext <= wrresp;
            else
                wnext <= wrdata;
            end if;
        when wrresp =>
            if (BREADY = '1') then
                wnext <= wridle;
            else
                wnext <= wrresp;
            end if;
        when others =>
            wnext <= wridle;
        end case;
    end process;

    waddr_proc : process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (aw_hs = '1') then
                    waddr <= UNSIGNED(AWADDR(ADDR_BITS-1 downto 0));
                end if;
            end if;
        end if;
    end process;

-- ----------------------- AXI READ ----------------------
    ARREADY_t <= '1' when (rstate = rdidle) else '0';
    ARREADY <= ARREADY_t;
    RDATA   <= STD_LOGIC_VECTOR(rdata_data);
    RRESP   <= "00";  -- OKAY
    RVALID_t  <= '1' when (rstate = rddata) else '0';
    RVALID    <= RVALID_t;
    ar_hs   <= ARVALID and ARREADY_t;
    raddr   <= UNSIGNED(ARADDR(ADDR_BITS-1 downto 0));

    -- read FSM
    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                rstate <= rdreset;
            elsif (ACLK_EN = '1') then
                rstate <= rnext;
            end if;
        end if;
    end process;

    process (rstate, ARVALID, RREADY, RVALID_t)
    begin
        case (rstate) is
        when rdidle =>
            if (ARVALID = '1') then
                rnext <= rddata;
            else
                rnext <= rdidle;
            end if;
        when rddata =>
            if (RREADY = '1' and RVALID_t = '1') then
                rnext <= rdidle;
            else
                rnext <= rddata;
            end if;
        when others =>
            rnext <= rdidle;
        end case;
    end process;

    rdata_proc : process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (ar_hs = '1') then
                    case (TO_INTEGER(raddr)) is
                    when ADDR_AXIL_START_V_DATA_0 =>
                        rdata_data <= RESIZE(int_axil_start_V(31 downto 0), 32);
                    when ADDR_AXIL_PKT_NUM_V_DATA_0 =>
                        rdata_data <= RESIZE(int_axil_pkt_num_V(31 downto 0), 32);
                    when ADDR_AXIL_PKT_LEN_V_DATA_0 =>
                        rdata_data <= RESIZE(int_axil_pkt_len_V(31 downto 0), 32);
                    when ADDR_AXIL_REMOTE_IP_V_DATA_0 =>
                        rdata_data <= RESIZE(int_axil_remote_ip_V(31 downto 0), 32);
                    when ADDR_AXIL_REMOTE_PORT_V_DATA_0 =>
                        rdata_data <= RESIZE(int_axil_remote_port_V(31 downto 0), 32);
                    when ADDR_AXIL_LOCAL_PORT_V_DATA_0 =>
                        rdata_data <= RESIZE(int_axil_local_port_V(31 downto 0), 32);
                    when ADDR_AXIL_TX_TIMEELAPSE_HIGH_V_DATA_0 =>
                        rdata_data <= RESIZE(int_axil_tx_timeElapse_high_V(31 downto 0), 32);
                    when ADDR_AXIL_TX_TIMEELAPSE_HIGH_V_CTRL =>
                        rdata_data <= (0 => int_axil_tx_timeElapse_high_V_ap_vld, others => '0');
                    when ADDR_AXIL_TX_TIMEELAPSE_LOW_V_DATA_0 =>
                        rdata_data <= RESIZE(int_axil_tx_timeElapse_low_V(31 downto 0), 32);
                    when ADDR_AXIL_TX_TIMEELAPSE_LOW_V_CTRL =>
                        rdata_data <= (0 => int_axil_tx_timeElapse_low_V_ap_vld, others => '0');
                    when ADDR_AXIL_TX_DONE_V_DATA_0 =>
                        rdata_data <= RESIZE(int_axil_tx_done_V(31 downto 0), 32);
                    when ADDR_AXIL_TX_DONE_V_CTRL =>
                        rdata_data <= (0 => int_axil_tx_done_V_ap_vld, others => '0');
                    when ADDR_AXIL_LATENCY_SUM_HIGH_V_DATA_0 =>
                        rdata_data <= RESIZE(int_axil_latency_sum_high_V(31 downto 0), 32);
                    when ADDR_AXIL_LATENCY_SUM_HIGH_V_CTRL =>
                        rdata_data <= (0 => int_axil_latency_sum_high_V_ap_vld, others => '0');
                    when ADDR_AXIL_LATENCY_SUM_LOW_V_DATA_0 =>
                        rdata_data <= RESIZE(int_axil_latency_sum_low_V(31 downto 0), 32);
                    when ADDR_AXIL_LATENCY_SUM_LOW_V_CTRL =>
                        rdata_data <= (0 => int_axil_latency_sum_low_V_ap_vld, others => '0');
                    when ADDR_AXIL_RX_TIMEELASPE_HIGH_V_DATA_0 =>
                        rdata_data <= RESIZE(int_axil_rx_timeElaspe_high_V(31 downto 0), 32);
                    when ADDR_AXIL_RX_TIMEELASPE_HIGH_V_CTRL =>
                        rdata_data <= (0 => int_axil_rx_timeElaspe_high_V_ap_vld, others => '0');
                    when ADDR_AXIL_RX_TIMEELASPE_LOW_V_DATA_0 =>
                        rdata_data <= RESIZE(int_axil_rx_timeElaspe_low_V(31 downto 0), 32);
                    when ADDR_AXIL_RX_TIMEELASPE_LOW_V_CTRL =>
                        rdata_data <= (0 => int_axil_rx_timeElaspe_low_V_ap_vld, others => '0');
                    when ADDR_AXIL_RX_DONE_V_DATA_0 =>
                        rdata_data <= RESIZE(int_axil_rx_done_V(31 downto 0), 32);
                    when ADDR_AXIL_RX_DONE_V_CTRL =>
                        rdata_data <= (0 => int_axil_rx_done_V_ap_vld, others => '0');
                    when ADDR_AXIL_RX_ERROR_V_DATA_0 =>
                        rdata_data <= RESIZE(int_axil_rx_error_V(31 downto 0), 32);
                    when ADDR_AXIL_RX_ERROR_V_CTRL =>
                        rdata_data <= (0 => int_axil_rx_error_V_ap_vld, others => '0');
                    when ADDR_AXIL_RX_CURR_CNT_V_DATA_0 =>
                        rdata_data <= RESIZE(int_axil_rx_curr_cnt_V(31 downto 0), 32);
                    when ADDR_AXIL_RX_CURR_CNT_V_CTRL =>
                        rdata_data <= (0 => int_axil_rx_curr_cnt_V_ap_vld, others => '0');
                    when others =>
                        rdata_data <= (others => '0');
                    end case;
                end if;
            end if;
        end if;
    end process;

-- ----------------------- Register logic ----------------
    axil_start_V         <= STD_LOGIC_VECTOR(int_axil_start_V);
    axil_pkt_num_V       <= STD_LOGIC_VECTOR(int_axil_pkt_num_V);
    axil_pkt_len_V       <= STD_LOGIC_VECTOR(int_axil_pkt_len_V);
    axil_remote_ip_V     <= STD_LOGIC_VECTOR(int_axil_remote_ip_V);
    axil_remote_port_V   <= STD_LOGIC_VECTOR(int_axil_remote_port_V);
    axil_local_port_V    <= STD_LOGIC_VECTOR(int_axil_local_port_V);

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_AXIL_START_V_DATA_0) then
                    int_axil_start_V(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_axil_start_V(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_AXIL_PKT_NUM_V_DATA_0) then
                    int_axil_pkt_num_V(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_axil_pkt_num_V(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_AXIL_PKT_LEN_V_DATA_0) then
                    int_axil_pkt_len_V(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_axil_pkt_len_V(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_AXIL_REMOTE_IP_V_DATA_0) then
                    int_axil_remote_ip_V(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_axil_remote_ip_V(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_AXIL_REMOTE_PORT_V_DATA_0) then
                    int_axil_remote_port_V(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_axil_remote_port_V(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_AXIL_LOCAL_PORT_V_DATA_0) then
                    int_axil_local_port_V(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_axil_local_port_V(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_axil_tx_timeElapse_high_V <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (axil_tx_timeElapse_high_V_ap_vld = '1') then
                    int_axil_tx_timeElapse_high_V <= UNSIGNED(axil_tx_timeElapse_high_V); -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_axil_tx_timeElapse_high_V_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (axil_tx_timeElapse_high_V_ap_vld = '1') then
                    int_axil_tx_timeElapse_high_V_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_AXIL_TX_TIMEELAPSE_HIGH_V_CTRL) then
                    int_axil_tx_timeElapse_high_V_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_axil_tx_timeElapse_low_V <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (axil_tx_timeElapse_low_V_ap_vld = '1') then
                    int_axil_tx_timeElapse_low_V <= UNSIGNED(axil_tx_timeElapse_low_V); -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_axil_tx_timeElapse_low_V_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (axil_tx_timeElapse_low_V_ap_vld = '1') then
                    int_axil_tx_timeElapse_low_V_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_AXIL_TX_TIMEELAPSE_LOW_V_CTRL) then
                    int_axil_tx_timeElapse_low_V_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_axil_tx_done_V <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (axil_tx_done_V_ap_vld = '1') then
                    int_axil_tx_done_V <= UNSIGNED(axil_tx_done_V); -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_axil_tx_done_V_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (axil_tx_done_V_ap_vld = '1') then
                    int_axil_tx_done_V_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_AXIL_TX_DONE_V_CTRL) then
                    int_axil_tx_done_V_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_axil_latency_sum_high_V <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (axil_latency_sum_high_V_ap_vld = '1') then
                    int_axil_latency_sum_high_V <= UNSIGNED(axil_latency_sum_high_V); -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_axil_latency_sum_high_V_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (axil_latency_sum_high_V_ap_vld = '1') then
                    int_axil_latency_sum_high_V_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_AXIL_LATENCY_SUM_HIGH_V_CTRL) then
                    int_axil_latency_sum_high_V_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_axil_latency_sum_low_V <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (axil_latency_sum_low_V_ap_vld = '1') then
                    int_axil_latency_sum_low_V <= UNSIGNED(axil_latency_sum_low_V); -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_axil_latency_sum_low_V_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (axil_latency_sum_low_V_ap_vld = '1') then
                    int_axil_latency_sum_low_V_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_AXIL_LATENCY_SUM_LOW_V_CTRL) then
                    int_axil_latency_sum_low_V_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_axil_rx_timeElaspe_high_V <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (axil_rx_timeElaspe_high_V_ap_vld = '1') then
                    int_axil_rx_timeElaspe_high_V <= UNSIGNED(axil_rx_timeElaspe_high_V); -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_axil_rx_timeElaspe_high_V_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (axil_rx_timeElaspe_high_V_ap_vld = '1') then
                    int_axil_rx_timeElaspe_high_V_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_AXIL_RX_TIMEELASPE_HIGH_V_CTRL) then
                    int_axil_rx_timeElaspe_high_V_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_axil_rx_timeElaspe_low_V <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (axil_rx_timeElaspe_low_V_ap_vld = '1') then
                    int_axil_rx_timeElaspe_low_V <= UNSIGNED(axil_rx_timeElaspe_low_V); -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_axil_rx_timeElaspe_low_V_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (axil_rx_timeElaspe_low_V_ap_vld = '1') then
                    int_axil_rx_timeElaspe_low_V_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_AXIL_RX_TIMEELASPE_LOW_V_CTRL) then
                    int_axil_rx_timeElaspe_low_V_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_axil_rx_done_V <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (axil_rx_done_V_ap_vld = '1') then
                    int_axil_rx_done_V <= UNSIGNED(axil_rx_done_V); -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_axil_rx_done_V_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (axil_rx_done_V_ap_vld = '1') then
                    int_axil_rx_done_V_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_AXIL_RX_DONE_V_CTRL) then
                    int_axil_rx_done_V_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_axil_rx_error_V <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (axil_rx_error_V_ap_vld = '1') then
                    int_axil_rx_error_V <= UNSIGNED(axil_rx_error_V); -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_axil_rx_error_V_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (axil_rx_error_V_ap_vld = '1') then
                    int_axil_rx_error_V_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_AXIL_RX_ERROR_V_CTRL) then
                    int_axil_rx_error_V_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_axil_rx_curr_cnt_V <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (axil_rx_curr_cnt_V_ap_vld = '1') then
                    int_axil_rx_curr_cnt_V <= UNSIGNED(axil_rx_curr_cnt_V); -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_axil_rx_curr_cnt_V_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (axil_rx_curr_cnt_V_ap_vld = '1') then
                    int_axil_rx_curr_cnt_V_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_AXIL_RX_CURR_CNT_V_CTRL) then
                    int_axil_rx_curr_cnt_V_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;


-- ----------------------- Memory logic ------------------

end architecture behave;
