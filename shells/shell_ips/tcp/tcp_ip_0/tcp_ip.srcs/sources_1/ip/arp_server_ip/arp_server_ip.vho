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

-- IP VLNV: ethz.systems:hls:arp_server:1.0
-- IP Revision: 1806041827

-- The following code must appear in the VHDL architecture header.

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
COMPONENT arp_server_ip
  PORT (
    myMacAddress_V : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
    myIpAddress_V : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    arpDataIn_TVALID : IN STD_LOGIC;
    arpDataIn_TREADY : OUT STD_LOGIC;
    arpDataIn_TDATA : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    arpDataIn_TKEEP : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    arpDataIn_TLAST : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    arpDataOut_TVALID : OUT STD_LOGIC;
    arpDataOut_TREADY : IN STD_LOGIC;
    arpDataOut_TDATA : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    arpDataOut_TKEEP : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    arpDataOut_TLAST : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    arpSendGrat_TVALID : IN STD_LOGIC;
    arpSendGrat_TREADY : OUT STD_LOGIC;
    arpSendGrat_TDATA : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    macIpEncode_req_TVALID : IN STD_LOGIC;
    macIpEncode_req_TREADY : OUT STD_LOGIC;
    macIpEncode_req_TDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    macIpEncode_rsp_TVALID : OUT STD_LOGIC;
    macIpEncode_rsp_TREADY : IN STD_LOGIC;
    macIpEncode_rsp_TDATA : OUT STD_LOGIC_VECTOR(55 DOWNTO 0);
    macLookup_req_TVALID : OUT STD_LOGIC;
    macLookup_req_TREADY : IN STD_LOGIC;
    macLookup_req_TDATA : OUT STD_LOGIC_VECTOR(39 DOWNTO 0);
    macLookup_resp_TVALID : IN STD_LOGIC;
    macLookup_resp_TREADY : OUT STD_LOGIC;
    macLookup_resp_TDATA : IN STD_LOGIC_VECTOR(55 DOWNTO 0);
    macUpdate_req_TVALID : OUT STD_LOGIC;
    macUpdate_req_TREADY : IN STD_LOGIC;
    macUpdate_req_TDATA : OUT STD_LOGIC_VECTOR(87 DOWNTO 0);
    macUpdate_resp_TVALID : IN STD_LOGIC;
    macUpdate_resp_TREADY : OUT STD_LOGIC;
    macUpdate_resp_TDATA : IN STD_LOGIC_VECTOR(55 DOWNTO 0);
    aclk : IN STD_LOGIC;
    aresetn : IN STD_LOGIC
  );
END COMPONENT;
-- COMP_TAG_END ------ End COMPONENT Declaration ------------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name : arp_server_ip
  PORT MAP (
    myMacAddress_V => myMacAddress_V,
    myIpAddress_V => myIpAddress_V,
    arpDataIn_TVALID => arpDataIn_TVALID,
    arpDataIn_TREADY => arpDataIn_TREADY,
    arpDataIn_TDATA => arpDataIn_TDATA,
    arpDataIn_TKEEP => arpDataIn_TKEEP,
    arpDataIn_TLAST => arpDataIn_TLAST,
    arpDataOut_TVALID => arpDataOut_TVALID,
    arpDataOut_TREADY => arpDataOut_TREADY,
    arpDataOut_TDATA => arpDataOut_TDATA,
    arpDataOut_TKEEP => arpDataOut_TKEEP,
    arpDataOut_TLAST => arpDataOut_TLAST,
    arpSendGrat_TVALID => arpSendGrat_TVALID,
    arpSendGrat_TREADY => arpSendGrat_TREADY,
    arpSendGrat_TDATA => arpSendGrat_TDATA,
    macIpEncode_req_TVALID => macIpEncode_req_TVALID,
    macIpEncode_req_TREADY => macIpEncode_req_TREADY,
    macIpEncode_req_TDATA => macIpEncode_req_TDATA,
    macIpEncode_rsp_TVALID => macIpEncode_rsp_TVALID,
    macIpEncode_rsp_TREADY => macIpEncode_rsp_TREADY,
    macIpEncode_rsp_TDATA => macIpEncode_rsp_TDATA,
    macLookup_req_TVALID => macLookup_req_TVALID,
    macLookup_req_TREADY => macLookup_req_TREADY,
    macLookup_req_TDATA => macLookup_req_TDATA,
    macLookup_resp_TVALID => macLookup_resp_TVALID,
    macLookup_resp_TREADY => macLookup_resp_TREADY,
    macLookup_resp_TDATA => macLookup_resp_TDATA,
    macUpdate_req_TVALID => macUpdate_req_TVALID,
    macUpdate_req_TREADY => macUpdate_req_TREADY,
    macUpdate_req_TDATA => macUpdate_req_TDATA,
    macUpdate_resp_TVALID => macUpdate_resp_TVALID,
    macUpdate_resp_TREADY => macUpdate_resp_TREADY,
    macUpdate_resp_TDATA => macUpdate_resp_TDATA,
    aclk => aclk,
    aresetn => aresetn
  );
-- INST_TAG_END ------ End INSTANTIATION Template ---------

