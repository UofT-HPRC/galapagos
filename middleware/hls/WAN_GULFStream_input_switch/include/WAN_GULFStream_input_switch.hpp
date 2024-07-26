#ifndef GULFSTREAM_INPUT_SWITCH_H
#define GULFSTREAM_INPUT_SWITCH_H

#define INTERFACE_100G
#include "wan_packet.h"

#define ARP_STATUS_VALID 0
#define ARP_STATUS_WORKING 1
#define ARP_STATUS_TIMEOUT 2


enum gs_input_switch_t {
    GSIS_STATE_IDLE = 0,                   // Wait for data
    GSIS_STATE_WAIT_ARP_STATUS = 1,  // Wait for ARP STATUS to be
    GSIS_STATE_SEND_DATA = 2        // Send Data from Fetch interface
};

// Currently arbitrates on TLAST only, does not support arbitration cycle-by-cycle
void WAN_GULFStream_input_switch(
    gulfstream_interface_extend & in_network,
    gulfstream_interface & out,
    ap_uint<32> * out_ip,
    ap_uint<2> * out_arp_status,
    gs_input_switch_t * state_out
);
#endif
