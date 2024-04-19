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
	RETRY
};

struct bin_info
{
    ap_uint<1> occupied;
    ap_uint<16> sent_total;
    ap_uint<PACKET_DEST_LENGTH> dest;
}
;
void WAN_fast_fetch(
    ip_fetch_interface & from_dispatch,
    fetch_reply_interface & to_collector,
    fetch_reply_interface & to_slow_fetch,
	fetch_bin_reply_interface &bin1_send,
	fetch_bin_reply_interface &bin2_send,
	fetch_bin_reply_interface &bin3_send,
	fetch_update_interface &update,
    ip_fetch_state_t &state_out,
	ap_uint<2> &error_flag_out
);
#endif
