#ifndef FAST_FETCH_H
#define FAST_FETCH_H

#define INTERFACE_100G
#include "wan_packet.h"

#define STATE_RECEIVE_TIMEOUT 30000000
#define KERN_BITS PACKET_DEST_LENGTH
#define KERN_INDEX_BITS 5
#define KERN_TAG_BITS (KERN_BITS-KERN_INDEX_BITS)
#define KERN_TABLE_ENTRY_BITS (IP_LENGTH + KERN_TAG_BITS) // Each kernel table entry stores IP address and kernel tag
#define NUM_KERN_TABLE_ENTRIES (1<<KERN_INDEX_BITS)

// IP FETCH FSM States
enum ip_fetch_state_t {
    IPF_STATE_IDLE = 0,         // Wait for request
	IPF_STATE_FETCH_IP_PAYLOAD
};

struct bin_info
{
    ap_uint<1> occupied;
    ap_uint<PACKET_DEST_LENGTH> dest;
    ap_uint<32> timeout;
};
void WAN_slow_fetch(
    fetch_reply_interface & from_fast_fetch,
	fetch_update_interface &update,
	ap_uint<32> * ip_server_addr,
    galapagos_interface & in_network,
    gulfstream_interface_extend & out_network
);
#endif
