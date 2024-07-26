#include "WAN_slow_fetch.hpp"

void WAN_slow_fetch(
    slow_fetch_request_interface & from_fast_fetch,
	fetch_update_interface &update,
	ap_uint<32> * ip_server_addr,
    galapagos_interface & in_network,
    gulfstream_interface_extend & out_network
)
{
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS INTERFACE axis port=from_fast_fetch register_mode=off
#pragma HLS INTERFACE axis port=update register_mode=off
#pragma HLS INTERFACE axis port=in_network register_mode=off
#pragma HLS INTERFACE axis port=out_network register_mode=off

	static ip_fetch_state_t core_state = IPF_STATE_IDLE;//State of writing the packet
	static bin_info bin[3];//Datastructure to hold info on each bin
	static ap_uint<3> active_bin=0;//Which bin is currently active
	//Temp objects
	slow_fetch_request fetch_reply_obj;
	axis_gulfstream_extend_t fetch_request_header;
	axis_gulfstream_extend_t fetch_request_payload;
	galapagos_packet fetch_response;
	//Formulate the header
	fetch_request_header.user.range(31,0) = *ip_server_addr;
    fetch_request_header.user.range(47,32) = FETCH_DEST_ADDRESS;
    fetch_request_header.user.range(63,48) = FETCH_DEST_ADDRESS;
	fetch_request_header.data(PACKET_USER_LENGTH-1,0) = 1;  // Number of flits in request
	fetch_request_header.data(PACKET_DEST_LENGTH + PACKET_USER_LENGTH - 1, PACKET_USER_LENGTH) = RIP_ID_IP_FETCH; // Source
	fetch_request_header.data(2*PACKET_DEST_LENGTH + PACKET_USER_LENGTH - 1, PACKET_DEST_LENGTH + PACKET_USER_LENGTH) = RIP_ID_IP_SERVER; // Destination
	fetch_request_header.keep = 0xFFFFFFFFFFFFFFFF;
	fetch_request_header.last = 0;
	//Formulate the payload
	fetch_request_payload.user.range(31,0) = *ip_server_addr;
    fetch_request_payload.user.range(47,32) = FETCH_DEST_ADDRESS;
    fetch_request_payload.user.range(63,48) = FETCH_DEST_ADDRESS;
    fetch_request_payload.keep = 0xFFFFFFFFFFFFFFFF;
    fetch_request_payload.last = 1;
    fetch_update updates;
	if (!in_network.empty() && !update.full())
	{
		//New packet in, read it
		fetch_response = in_network.read();
	    if (!out_network.full() && core_state == IPF_STATE_FETCH_IP_PAYLOAD)
		{
	    	//Write out body if you are actively writing
			fetch_request_payload.data(KERN_BITS-1, 0) = bin[active_bin].dest;
			out_network.write(fetch_request_payload);
			core_state = IPF_STATE_IDLE;
		}
	    //Generate the update
		updates.data=fetch_response.data(IP_LENGTH-1,0);
		updates.id=fetch_response.data(KERN_BITS+IP_LENGTH-1, IP_LENGTH);
		if (bin[0].occupied == 1 && bin[0].dest==fetch_response.data(KERN_TABLE_ENTRY_BITS-1, IP_LENGTH))
		{
			//If bin[0] matches, return indicating this and mark it unoccupied
			updates.dest=1;
			update.write(updates);
			bin[0].occupied = 0;
		}
		else if (bin[1].occupied == 1 && bin[1].dest==fetch_response.data(KERN_TABLE_ENTRY_BITS-1, IP_LENGTH))
		{
			//If bin[1] matches, return indicating this and mark it unoccupied
			updates.dest=2;
			update.write(updates);
		}
		else if (bin[2].occupied == 1 && bin[2].dest==fetch_response.data(KERN_TABLE_ENTRY_BITS-1, IP_LENGTH))
		{
			//If bin[2] matches, return indicating this and mark it unoccupied
			updates.dest=3;
			update.write(updates);
		}
	}
	else if (!out_network.full() && core_state == IPF_STATE_FETCH_IP_PAYLOAD)
	{
		//Write out body if you are actively writing
		fetch_request_payload.data(KERN_BITS-1, 0) = bin[active_bin].dest;
		out_network.write(fetch_request_payload);
		core_state = IPF_STATE_IDLE;
	}
    else if (!from_fast_fetch.empty() && !out_network.full() && core_state==IPF_STATE_IDLE)
	{
    	//Read the fetch request
		fetch_reply_obj=from_fast_fetch.read();
		//Mark the referenced bin
		bin[fetch_reply_obj.dest-1].occupied = 1;
		bin[fetch_reply_obj.dest-1].dest = fetch_reply_obj.data;
		bin[fetch_reply_obj.dest-1].timeout = STATE_RECEIVE_TIMEOUT;
		//Say which bin is active
		active_bin = fetch_reply_obj.dest-1;
		//Write out the header
		out_network.write(fetch_request_header);
		core_state = IPF_STATE_FETCH_IP_PAYLOAD;
	}
	else if (bin[0].occupied==1 && bin[0].timeout==0 && core_state==IPF_STATE_IDLE && !out_network.full())
	{
		//bin 0 timeout, retry it
		active_bin = 0;
		bin[0].timeout = STATE_RECEIVE_TIMEOUT;
		out_network.write(fetch_request_header);
		core_state = IPF_STATE_FETCH_IP_PAYLOAD;
	}
	else if (bin[1].occupied==1 && bin[1].timeout==0 && core_state==IPF_STATE_IDLE && !out_network.full())
	{
		//bin 1 timeout, retry it
		active_bin = 1;
		bin[1].timeout = STATE_RECEIVE_TIMEOUT;
		out_network.write(fetch_request_header);
		core_state = IPF_STATE_FETCH_IP_PAYLOAD;
	}
	else if (bin[2].occupied==1 && bin[2].timeout==0 && core_state==IPF_STATE_IDLE && !out_network.full())
	{
		//bin 2 timeout, retry it
		active_bin = 2;
		bin[2].timeout = STATE_RECEIVE_TIMEOUT;
		out_network.write(fetch_request_header);
		core_state = IPF_STATE_FETCH_IP_PAYLOAD;
	}
	else
	{
		//Decrement the timeout of all occupied regions
		if (bin[0].occupied==1 && bin[0].timeout!=0)
		{
			bin[0].timeout = bin[0].timeout - 1;
		}
		if (bin[1].occupied==1 && bin[1].timeout!=0)
		{
			bin[1].timeout =bin[1].timeout - 1;
		}
		if (bin[2].occupied==1 && bin[2].timeout!=0)
		{
			bin[2].timeout =bin[2].timeout - 1;
		}
	}
}
