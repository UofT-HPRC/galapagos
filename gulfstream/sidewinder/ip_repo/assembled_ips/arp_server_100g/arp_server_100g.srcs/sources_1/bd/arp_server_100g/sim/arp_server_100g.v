//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
//Date        : Wed Aug 18 04:20:52 2021
//Host        : Gaoyu running 64-bit Ubuntu 16.04.7 LTS
//Command     : generate_target arp_server_100g.bd
//Design      : arp_server_100g
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "arp_server_100g,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=arp_server_100g,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=3,numReposBlks=3,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=2,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "arp_server_100g.hwdef" *) 
module arp_server_100g
   (arp_in_data,
    arp_in_valid,
    arp_internal_resp_Mac_IP,
    arp_internal_resp_valid,
    arp_out_data,
    arp_out_keep,
    arp_out_last,
    arp_out_ready,
    arp_out_valid,
    arp_status,
    clk,
    gateway,
    lookup_req,
    lookup_result,
    myIP,
    myMac,
    netmask,
    rst);
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ARP_IN_DATA DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ARP_IN_DATA, LAYERED_METADATA undef" *) input [335:0]arp_in_data;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ARP_IN_VALID DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ARP_IN_VALID, LAYERED_METADATA undef" *) input [0:0]arp_in_valid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ARP_INTERNAL_RESP_MAC_IP DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ARP_INTERNAL_RESP_MAC_IP, LAYERED_METADATA undef" *) input [79:0]arp_internal_resp_Mac_IP;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ARP_INTERNAL_RESP_VALID DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ARP_INTERNAL_RESP_VALID, LAYERED_METADATA undef" *) input [0:0]arp_internal_resp_valid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ARP_OUT_DATA DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ARP_OUT_DATA, LAYERED_METADATA undef" *) output [511:0]arp_out_data;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ARP_OUT_KEEP DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ARP_OUT_KEEP, LAYERED_METADATA undef" *) output [63:0]arp_out_keep;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ARP_OUT_LAST DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ARP_OUT_LAST, LAYERED_METADATA undef" *) output [0:0]arp_out_last;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ARP_OUT_READY DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ARP_OUT_READY, LAYERED_METADATA undef" *) input [0:0]arp_out_ready;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ARP_OUT_VALID DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ARP_OUT_VALID, LAYERED_METADATA undef" *) output [0:0]arp_out_valid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ARP_STATUS DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ARP_STATUS, LAYERED_METADATA undef" *) output [1:0]arp_status;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, ASSOCIATED_RESET rst, CLK_DOMAIN arp_server_100g_ap_clk_0, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.GATEWAY DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.GATEWAY, LAYERED_METADATA undef" *) input [31:0]gateway;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LOOKUP_REQ DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LOOKUP_REQ, LAYERED_METADATA undef" *) input [31:0]lookup_req;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LOOKUP_RESULT DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LOOKUP_RESULT, LAYERED_METADATA undef" *) output [47:0]lookup_result;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.MYIP DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.MYIP, LAYERED_METADATA undef" *) input [31:0]myIP;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.MYMAC DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.MYMAC, LAYERED_METADATA undef" *) input [47:0]myMac;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.NETMASK DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.NETMASK, LAYERED_METADATA undef" *) input [31:0]netmask;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RST, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input rst;

  wire ap_clk_0_1;
  wire ap_rst_0_1;
  wire [335:0]arp_in_data_V_0_1;
  wire [0:0]arp_in_valid_V_0_1;
  wire [79:0]arp_internal_resp_Mac_IP_V_0_1;
  wire [0:0]arp_internal_resp_valid_V_0_1;
  wire [0:0]arp_out_ready_V_0_1;
  wire [7:0]arp_receive_0_arptable_addrout_V;
  wire [79:0]arp_receive_0_arptable_dataout_Mac_IP_V;
  wire [0:0]arp_receive_0_arptable_dataout_valid_V;
  wire [79:0]arp_receive_0_call_for_responce_Mac_IP_V;
  wire [0:0]arp_receive_0_call_for_responce_valid_V;
  wire [511:0]arp_send_0_arp_out_data_V;
  wire [63:0]arp_send_0_arp_out_keep_V;
  wire [0:0]arp_send_0_arp_out_last_V;
  wire [0:0]arp_send_0_arp_out_valid_V;
  wire [1:0]arp_send_0_arp_status_V;
  wire [7:0]arp_send_0_arptable_addr_V;
  wire [47:0]arp_send_0_lookup_result_V;
  wire [79:0]blk_mem_gen_0_doutb;
  wire [31:0]gateway_V_0_1;
  wire [31:0]lookup_req_V_0_1;
  wire [31:0]myIP_V_0_1;
  wire [47:0]myMac_V_0_1;
  wire [31:0]netmask_V_0_1;

  assign ap_clk_0_1 = clk;
  assign ap_rst_0_1 = rst;
  assign arp_in_data_V_0_1 = arp_in_data[335:0];
  assign arp_in_valid_V_0_1 = arp_in_valid[0];
  assign arp_internal_resp_Mac_IP_V_0_1 = arp_internal_resp_Mac_IP[79:0];
  assign arp_internal_resp_valid_V_0_1 = arp_internal_resp_valid[0];
  assign arp_out_data[511:0] = arp_send_0_arp_out_data_V;
  assign arp_out_keep[63:0] = arp_send_0_arp_out_keep_V;
  assign arp_out_last[0] = arp_send_0_arp_out_last_V;
  assign arp_out_ready_V_0_1 = arp_out_ready[0];
  assign arp_out_valid[0] = arp_send_0_arp_out_valid_V;
  assign arp_status[1:0] = arp_send_0_arp_status_V;
  assign gateway_V_0_1 = gateway[31:0];
  assign lookup_req_V_0_1 = lookup_req[31:0];
  assign lookup_result[47:0] = arp_send_0_lookup_result_V;
  assign myIP_V_0_1 = myIP[31:0];
  assign myMac_V_0_1 = myMac[47:0];
  assign netmask_V_0_1 = netmask[31:0];
  arp_server_100g_arp_receive_0_0 arp_receive_0
       (.ap_clk(ap_clk_0_1),
        .ap_rst(ap_rst_0_1),
        .arp_in_data_V(arp_in_data_V_0_1),
        .arp_in_valid_V(arp_in_valid_V_0_1),
        .arp_internal_resp_Mac_IP_V(arp_internal_resp_Mac_IP_V_0_1),
        .arp_internal_resp_valid_V(arp_internal_resp_valid_V_0_1),
        .arptable_addrout_V(arp_receive_0_arptable_addrout_V),
        .arptable_dataout_Mac_IP_V(arp_receive_0_arptable_dataout_Mac_IP_V),
        .arptable_dataout_valid_V(arp_receive_0_arptable_dataout_valid_V),
        .call_for_responce_Mac_IP_V(arp_receive_0_call_for_responce_Mac_IP_V),
        .call_for_responce_valid_V(arp_receive_0_call_for_responce_valid_V),
        .myIP_V(myIP_V_0_1));
  arp_server_100g_arp_send_0_0 arp_send_0
       (.ap_clk(ap_clk_0_1),
        .ap_rst(ap_rst_0_1),
        .arp_out_data_V(arp_send_0_arp_out_data_V),
        .arp_out_keep_V(arp_send_0_arp_out_keep_V),
        .arp_out_last_V(arp_send_0_arp_out_last_V),
        .arp_out_ready_V(arp_out_ready_V_0_1),
        .arp_out_valid_V(arp_send_0_arp_out_valid_V),
        .arp_status_V(arp_send_0_arp_status_V),
        .arptable_addr_V(arp_send_0_arptable_addr_V),
        .arptable_data_V(blk_mem_gen_0_doutb),
        .call_for_responce_Mac_IP_V(arp_receive_0_call_for_responce_Mac_IP_V),
        .call_for_responce_valid_V(arp_receive_0_call_for_responce_valid_V),
        .gateway_V(gateway_V_0_1),
        .lookup_req_V(lookup_req_V_0_1),
        .lookup_result_V(arp_send_0_lookup_result_V),
        .myIP_V(myIP_V_0_1),
        .myMac_V(myMac_V_0_1),
        .netmask_V(netmask_V_0_1));
  arp_server_100g_blk_mem_gen_0_0 blk_mem_gen_0
       (.addra(arp_receive_0_arptable_addrout_V),
        .addrb(arp_send_0_arptable_addr_V),
        .clka(ap_clk_0_1),
        .clkb(ap_clk_0_1),
        .dina(arp_receive_0_arptable_dataout_Mac_IP_V),
        .doutb(blk_mem_gen_0_doutb),
        .wea(arp_receive_0_arptable_dataout_valid_V));
endmodule
