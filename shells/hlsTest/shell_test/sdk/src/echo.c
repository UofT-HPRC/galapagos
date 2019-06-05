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
#include <string.h>

#include "lwip/err.h"
#include "lwip/tcp.h"
#if defined (__arm__) || defined (__aarch64__)
#include "xil_printf.h"
#endif
#include "netif/etharp.h"
#include "netif/xemacpsif.h"

#include "axis_dma_controller.h"
#include "platform.h"

// check if all connected array is 1
int transfer_data() {
	int i;
	int j = 1;
	for(i = 0; i < MAX_IPS; i++){
		j &= connected[i];
	}
	return j;
}

void print_app_header()
{	
	#ifdef IP_MODE
	xil_printf("\n\r\n\r-----lwIP_ethernet - IP Mode ------\n\r");
	xil_printf("TCP packets must be sent to port %d\n\r", PORT);
	#else
	xil_printf("\n\r\n\r-----lwIP_ethernet - Ethernet Mode ------\n\r");
	xil_printf("Ethernet packets must be sent with Ethertype %d\n\r", ETHTYPE_CUSTOM);
	#endif
}

// called if an ethernet packet matching the target ethertype is received
void etharp_custom_input(struct netif *netif, struct eth_addr *ethaddr, struct pbuf *p)
{
	struct etharp_hdr *hdr;
	struct eth_hdr *ethhdr;

	LWIP_ERROR("netif != NULL", (netif != NULL), return;);

	ethhdr = (struct eth_hdr *)p->payload;
	hdr = (struct etharp_hdr *)((u8_t*)ethhdr + SIZEOF_ETH_HDR);

	(my_netif_list[CURR_PCB_INDEX]).netif_ptr = netif;
	ETHADDR16_COPY(&(my_netif_list[CURR_PCB_INDEX]).src.src, &ethhdr->src);
	ETHADDR16_COPY(&(my_netif_list[CURR_PCB_INDEX]).src.dest, &ethhdr->dest);
	(my_netif_list[CURR_PCB_INDEX++]).src.type = ethhdr->type;

	// hdr->opcode = htons(0x80cb);

	/* send payload to PL */
	axisDmaCtrl_sendPackets((u8_t *)hdr, p->len - SIZEOF_ETH_HDR);

	/* free the received pbuf */
	pbuf_free(p);
}

err_t recv_callback(void *arg, struct tcp_pcb *tpcb,
                               struct pbuf *p, err_t err)
{
	/* do not read the packet if we are not in ESTABLISHED state */
	if (!p) {
		tcp_close(tpcb);
		tcp_recv(tpcb, NULL);
		return ERR_OK;
	}

	/* indicate that the packet has been received */
	tcp_recved(tpcb, p->len);

	/* send payload to PL */
	axisDmaCtrl_sendPackets(p->payload, p->len);

	/* free the received pbuf */
	pbuf_free(p);

	return ERR_OK;
}

err_t accept_callback(void *arg, struct tcp_pcb *newpcb, err_t err)
{
	static int connection = 1;

	/* set the receive callback for this connection */
	tcp_recv(newpcb, recv_callback);

	/* just use an integer number indicating the connection id as the
	   callback argument */
	tcp_arg(newpcb, (void*)(UINTPTR)connection);

	/* increment for subsequent accepted connections */
	connection++;

	return ERR_OK;
}

int start_application()
{
#ifdef IP_MODE
	struct tcp_pcb *pcb;
	err_t err;
	unsigned port = PORT;

	/* create new TCP PCB structure */
	pcb_list[CURR_PCB_INDEX] = tcp_new();
	pcb = pcb_list[CURR_PCB_INDEX++];
	if (!pcb) {
		xil_printf("Error creating PCB. Out of Memory\n\r");
		return -1;
	}

	/* bind to specified @port */
	err = tcp_bind(pcb, IP_ADDR_ANY, port);
	if (err != ERR_OK) {
		xil_printf("Unable to bind to port %d: err = %d\n\r", port, err);
		return -2;
	}

	/* we do not need any arguments to callback functions */
	tcp_arg(pcb, NULL);

	/* listen for connections */
	pcb = tcp_listen(pcb);
	if (!pcb) {
		xil_printf("Out of memory while tcp_listen\n\r");
		return -3;
	}

	/* specify callback to use for incoming connections */
	tcp_accept(pcb, accept_callback);

	xil_printf("TCP server started @ port %d\n\r", port);
#endif

	return 0;
}
