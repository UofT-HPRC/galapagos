/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

#include <stdio.h>

#include "xparameters.h"

#include "netif/xadapter.h"

#include "platform.h"
#include "platform_config.h"
#if defined (__arm__) || defined(__aarch64__)
#include "xil_printf.h"
#endif

#include "lwip/tcp.h"
#include "xil_cache.h"
#include "lwip/pbuf.h"

#if LWIP_DHCP==1
#include "lwip/dhcp.h"
#endif

#include "axis_dma_controller.h"

/* defined by each RAW mode application */
void print_app_header();
int start_application();
int transfer_data();
void tcp_fasttmr(void);
void tcp_slowtmr(void);

/* missing declaration in lwIP */
void lwip_init();

#if LWIP_DHCP==1
extern volatile int dhcp_timoutcntr;
err_t dhcp_start(struct netif *netif);
#endif

extern volatile int TcpFastTmrFlag;
extern volatile int TcpSlowTmrFlag;
static struct netif server_netif;
struct netif *echo_netif;

volatile int tx_bd_count;
volatile int rx_bd_count;
volatile int rx_pkt_count;

struct tcp_pcb* pcb_list[MAX_PCBS];
struct custom_ethernet my_netif_list[MAX_PCBS];
int CURR_PCB_INDEX = 0;
volatile int connected[MAX_IPS];

#define MY_IP4_ADDR(...) IP4_ADDR(__VA_ARGS__)

void
print_ip(char *msg, struct ip_addr *ip) 
{
	print(msg);
	xil_printf("%d.%d.%d.%d\n\r", ip4_addr1(ip), ip4_addr2(ip), 
			ip4_addr3(ip), ip4_addr4(ip));
}

void
print_ip_settings(struct ip_addr *ip, struct ip_addr *mask, struct ip_addr *gw)
{

	print_ip("Board IP: ", ip);
	print_ip("Netmask : ", mask);
	print_ip("Gateway : ", gw);
}

static void tx_callback(void)
{
	tx_bd_count++;
}

// currently the TCP client part isn't working
static err_t client_connected(void *arg, struct tcp_pcb *pcb, err_t err)
{
	connected[CURR_PCB_INDEX] = 1;
	xil_printf("client connected\r\n");

	pcb_list[CURR_PCB_INDEX] = pcb;
	CURR_PCB_INDEX++;

	/* set callback values & functions */
	tcp_arg(pcb, NULL);
	tcp_recv(pcb, recv_callback);

	return err;
}
static int connect(ip_addr_t* addr);

static void connection_failed(void *arg, err_t err){
	ip_addr_t* addr = (ip_addr_t*) arg;
	xil_printf("TCP_connect failed: %d\r\n", err);
	connect(addr);
}

static int connect(ip_addr_t* addr){
	ip_addr_t local_addr;
	err_t err;
	struct tcp_pcb *tpcb = tcp_new();
	if (!tpcb) {
		xil_printf("Error creating PCB. Out of Memory\r\n");
	}
	MY_IP4_ADDR(&local_addr,  IP_ADDRESS);
	err = tcp_bind(tpcb, &local_addr, 0); //client port for outcoming connection
	if (err != ERR_OK) {
		xil_printf("tcp_bind returned error: %d\r\n", err);
	}
	tcp_arg(tpcb, addr);
	tcp_err(tpcb, connection_failed);
	err = tcp_connect(tpcb, addr, 7, client_connected); //server port for incoming connection
	if (err != ERR_OK) {
		xil_printf("tcp_connect returned error: %d\r\n", err);
	}

	return err;
}

// check if the two MAC addresses match
int eth_addr_match(struct eth_addr src, struct eth_addr dst, int reverse){
	int i;
	int match = 1;
	int match_index;
	for(i = 0; i < ETHARP_HWADDR_LEN; i++){
		if (reverse){
			match_index = ETHARP_HWADDR_LEN - i - 1;
		}
		else{
			match_index = i;
		}
		if(src.addr[i] != dst.addr[match_index]){
			match = 0;
			break;
		}
	}
	return match;
}

// check if the two MAC addresses match
int eth_addr_match_char(char* src, struct eth_addr dst, struct eth_addr* addr_reversed, int reverse){
	int i;
	int match = 1;
	int match_index;
	for(i = 0; i < ETHARP_HWADDR_LEN; i++){
		if (reverse){
			match_index = ETHARP_HWADDR_LEN - i - 1;
		}
		else{
			match_index = i;
		}
		if(src[i] != dst.addr[match_index]){
			match = 0;
			addr_reversed->addr[i] = dst.addr[match_index];
		}
	}
	return match;
}

long long reverseEndian64_data(long long X) {
	long long x = X;
	x = (x & 0x00000000FFFFFFFF) << 32 | (x & 0xFFFFFFFF00000000) >> 32;
	x = (x & 0x0000FFFF0000FFFF) << 16 | (x & 0xFFFF0000FFFF0000) >> 16;
	x = (x & 0x00FF00FF00FF00FF) << 8  | (x & 0xFF00FF00FF00FF00) >> 8;
	return x;
}

// called when a DMA packet is received
static void rx_callback(uint32_t buf_addr, uint32_t buf_len)
{
	int pcb_index = -1;
	int i;
	u16_t tdest = (reverseEndian64_data(*((long long *)(buf_addr))) & 0xFF00) >> 8;
	int thisFPGA;
	err_t err;
#ifdef IP_MODE
	ip_addr_t addr;
	ip_addr_t my_addr;
	MY_IP4_ADDR(&my_addr,  IP_ADDRESS);
	addr.addr = htonl(((u32)(*(((u32*) IP_MEM_ADDR) + tdest))) & 0xFFFFFFFF);
	if (addr.addr == my_addr.addr){
		thisFPGA = 1;
	} else {
		thisFPGA = 0;
	}
	
	// if this FPGA, route back to PL
	if (thisFPGA){
		axisDmaCtrl_sendPackets((u8_t *)buf_addr, buf_len);
	} else {
		for(i = 0; i < MAX_PCBS; i++){
			if(pcb_list[i]->remote_ip.addr == addr.addr){
				pcb_index = i;
				break;
			}
		}
		struct tcp_pcb* pcb;

		// can't seem to open connections from within the interrupt handler
		if(pcb_index == -1){
			while(1){};
		} else {
			pcb = pcb_list[pcb_index];
		}

		// send the data over the TCP connection
		if(tcp_sndbuf(pcb) > buf_len){
			err = tcp_write(pcb, (char*)buf_addr, buf_len, 1);
			if (err != ERR_OK) {
				xil_printf("Error on tcp_write: %d\r\n", err);
			}
			err = tcp_output(pcb);
			if (err != ERR_OK) {
				xil_printf("Error on tcp_output: %d\r\n",err);
			}
		}
	}
#else
	struct eth_addr addr;
	addr = (struct eth_addr)(* (struct eth_addr*) ((((long long *) MAC_MEM_ADDR) + tdest) ) );
	struct eth_addr addr_reversed;

	char my_address[] = {MAC_ADDRESS};
	if(eth_addr_match_char(my_address, addr, &addr_reversed, 1)) {
		thisFPGA = 1;
	} else {
		thisFPGA = 0;
	}

	if (thisFPGA){
		axisDmaCtrl_sendPackets((u8_t *)buf_addr, buf_len);
	} else {
		for(i = 0; i < MAX_PCBS; i++){
			if(eth_addr_match((my_netif_list[i]).src.src, addr, 1)){
				pcb_index = i;
				break;
			}
		}
		while(pcb_index == -1){
			pcb_index = CURR_PCB_INDEX;
			(my_netif_list[CURR_PCB_INDEX]).netif_ptr = echo_netif;
			ETHADDR16_COPY(&(my_netif_list[CURR_PCB_INDEX]).src.src, &addr_reversed);
			ETHADDR16_COPY(&(my_netif_list[CURR_PCB_INDEX]).src.dest, &my_address);
			(my_netif_list[CURR_PCB_INDEX++]).src.type = ETHTYPE_CUSTOM_REV;
		}
		struct netif* netif = (my_netif_list[pcb_index]).netif_ptr;
		struct pbuf* my_pbuf = pbuf_alloc(PBUF_RAW, (u16_t) buf_len, PBUF_REF);
		struct pbuf* my_pbuf_hdr = pbuf_alloc(PBUF_RAW, (u16_t) SIZEOF_ETH_HDR, PBUF_REF);

		struct eth_hdr new_header;
		new_header.dest = (my_netif_list[pcb_index]).src.src;
		new_header.src = (my_netif_list[pcb_index]).src.dest;
		new_header.type = (my_netif_list[pcb_index]).src.type;

		my_pbuf_hdr->payload = (char *) (&new_header);
		my_pbuf_hdr->next = my_pbuf;
		my_pbuf->payload = (char*) buf_addr;
		my_pbuf->next = NULL;
		netif->linkoutput(netif, my_pbuf_hdr);
		pbuf_free(my_pbuf);
		pbuf_free(my_pbuf_hdr);
	}
#endif

	rx_pkt_count++;
	rx_bd_count++;
}

#if defined (__arm__) && !defined (ARMR5)
#if XPAR_GIGE_PCS_PMA_SGMII_CORE_PRESENT == 1 || XPAR_GIGE_PCS_PMA_1000BASEX_CORE_PRESENT == 1
int ProgramSi5324(void);
int ProgramSfpPhy(void);
#endif
#endif

#ifdef XPS_BOARD_ZCU102
#ifdef XPAR_XIICPS_0_DEVICE_ID
int IicPhyReset(void);
#endif
#endif

int main()
{
	struct ip_addr ipaddr, netmask, gw;

	/* the mac address of the board. this should be unique per board */
	unsigned char mac_ethernet_address[] = {MAC_ADDRESS};

	echo_netif = &server_netif;
#if defined (__arm__) && !defined (ARMR5)
#if XPAR_GIGE_PCS_PMA_SGMII_CORE_PRESENT == 1 || XPAR_GIGE_PCS_PMA_1000BASEX_CORE_PRESENT == 1
	ProgramSi5324();
	ProgramSfpPhy();
#endif
#endif

/* Define this board specific macro in order perform PHY reset on ZCU102 */
#ifdef XPS_BOARD_ZCU102
	IicPhyReset();
#endif

	init_platform();

	MY_IP4_ADDR(&ipaddr,  IP_ADDRESS);
	MY_IP4_ADDR(&netmask, IP_MASK);
	MY_IP4_ADDR(&gw,      IP_GATEWAY);
	print_app_header();

	lwip_init();
	/**************************************************************************/
	int rc;
	struct axisDmaCtrl_params params;

	params.rx_bd_space_base = BD_BASE_ADDR;
	params.rx_bd_space_high = params.rx_bd_space_base + MEM_REGION_BD_SIZE;
	params.tx_bd_space_base = params.rx_bd_space_high + 1;
	params.tx_bd_space_high = params.tx_bd_space_base + MEM_REGION_BD_SIZE;
	params.tx_buffer_base   = MEM_BASE_ADDR;
	params.tx_buffer_high   = params.tx_buffer_base + MEM_REGION_BUF_SIZE;
	params.rx_buffer_base   = params.tx_buffer_high + 1;
	params.rx_buffer_high   = params.rx_buffer_base + MEM_REGION_BUF_SIZE;
	params.bd_buf_size      = BD_BUFFER_SIZE;
	params.coalesce_count   = 1;
	params.txIrqPriority    = 0xA0;
	params.rxIrqPriority    = 0xA0;
	params.txIrqId          = TX_INTR_ID;
	params.rxIrqId          = RX_INTR_ID;
	params.dmaDevId         = DMA_DEV_ID;
	params.txEn             = 1;
	params.rxEn             = 1;

	rc = axisDmaCtrl_init(&params, &intc, rx_callback, tx_callback);
	if(rc){
		xil_printf("axisDmaCtrl_init failed!\r\n");
		return XST_FAILURE;
	}
	/**************************************************************************/

  	/* Add network interface to the netif_list, and set it as default */
	if (!xemac_add(echo_netif, &ipaddr, &netmask,
						&gw, mac_ethernet_address,
						PLATFORM_EMAC_BASEADDR)) {
		xil_printf("Error adding N/W interface\n\r");
		return -1;
	}
	netif_set_default(echo_netif);

	/* now enable interrupts */
	platform_enable_interrupts();

	/* specify that the network if is up */
	netif_set_up(echo_netif);

	print_ip_settings(&ipaddr, &netmask, &gw);

	INITIALIZE_APP

	/* start the application (web server, rxtest, txtest, etc..) */
	start_application();

	int i, j;
	ip_addr_t remote_addr [MAX_IPS];
	int indices[MAX_IPS] = {CONNECT_IPS};
	err_t err;
	for(i = 0; i < MAX_IPS; i++){
		j = indices[i];
		remote_addr[i].addr = htonl(((u32)(*(((u32*) IP_MEM_ADDR) + j))) & 0xFFFFFFFF);
		err = connect(&(remote_addr[i]));
	}

	/* wait until all devices connect */
	i = 0;
	while (!i) {
		if (TcpFastTmrFlag) {
			tcp_fasttmr();
			TcpFastTmrFlag = 0;
		}
		if (TcpSlowTmrFlag) {
			tcp_slowtmr();
			TcpSlowTmrFlag = 0;
		}
		xemacpsif_input(echo_netif);
		i = transfer_data();
	}

	while(1){
		if (TcpFastTmrFlag) {
			tcp_fasttmr();
			TcpFastTmrFlag = 0;
		}
		if (TcpSlowTmrFlag) {
			tcp_slowtmr();
			TcpSlowTmrFlag = 0;
		}
		xemacpsif_input(echo_netif);
	}

	/* never reached */
	cleanup_platform();

	return 0;
}
