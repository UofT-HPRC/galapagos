-- (c) Copyright 1995-2019 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: ethz.systems:hls:arp_server_subnet:1.0
-- IP Revision: 1808181523

-- The following code must appear in the VHDL architecture header.

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
COMPONENT arp_server_subnet_ip
  PORT (
    myMacAddress_V : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
    myIpAddress_V : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_TVALID : OUT STD_LOGIC;
    m_axis_TREADY : IN STD_LOGIC;
    m_axis_TDATA : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    m_axis_TKEEP : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axis_TLAST : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    m_axis_arp_lookup_reply_TVALID : OUT STD_LOGIC;
    m_axis_arp_lookup_reply_TREADY : IN STD_LOGIC;
    m_axis_arp_lookup_reply_TDATA : OUT STD_LOGIC_VECTOR(55 DOWNTO 0);
    s_axis_TVALID : IN STD_LOGIC;
    s_axis_TREADY : OUT STD_LOGIC;
    s_axis_TDATA : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    s_axis_TKEEP : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    s_axis_TLAST : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    s_axis_arp_lookup_request_TVALID : IN STD_LOGIC;
    s_axis_arp_lookup_request_TREADY : OUT STD_LOGIC;
    s_axis_arp_lookup_request_TDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axis_arp_send_grat_TVALID : IN STD_LOGIC;
    s_axis_arp_send_grat_TREADY : OUT STD_LOGIC;
    s_axis_arp_send_grat_TDATA : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    aclk : IN STD_LOGIC;
    aresetn : IN STD_LOGIC
  );
END COMPONENT;
-- COMP_TAG_END ------ End COMPONENT Declaration ------------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name : arp_server_subnet_ip
  PORT MAP (
    myMacAddress_V => myMacAddress_V,
    myIpAddress_V => myIpAddress_V,
    m_axis_TVALID => m_axis_TVALID,
    m_axis_TREADY => m_axis_TREADY,
    m_axis_TDATA => m_axis_TDATA,
    m_axis_TKEEP => m_axis_TKEEP,
    m_axis_TLAST => m_axis_TLAST,
    m_axis_arp_lookup_reply_TVALID => m_axis_arp_lookup_reply_TVALID,
    m_axis_arp_lookup_reply_TREADY => m_axis_arp_lookup_reply_TREADY,
    m_axis_arp_lookup_reply_TDATA => m_axis_arp_lookup_reply_TDATA,
    s_axis_TVALID => s_axis_TVALID,
    s_axis_TREADY => s_axis_TREADY,
    s_axis_TDATA => s_axis_TDATA,
    s_axis_TKEEP => s_axis_TKEEP,
    s_axis_TLAST => s_axis_TLAST,
    s_axis_arp_lookup_request_TVALID => s_axis_arp_lookup_request_TVALID,
    s_axis_arp_lookup_request_TREADY => s_axis_arp_lookup_request_TREADY,
    s_axis_arp_lookup_request_TDATA => s_axis_arp_lookup_request_TDATA,
    s_axis_arp_send_grat_TVALID => s_axis_arp_send_grat_TVALID,
    s_axis_arp_send_grat_TREADY => s_axis_arp_send_grat_TREADY,
    s_axis_arp_send_grat_TDATA => s_axis_arp_send_grat_TDATA,
    aclk => aclk,
    aresetn => aresetn
  );
-- INST_TAG_END ------ End INSTANTIATION Template ---------

