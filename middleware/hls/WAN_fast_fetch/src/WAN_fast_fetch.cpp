#include "WAN_fast_fetch.hpp"

void WAN_fast_fetch(
    ip_fetch_interface & from_dispatch,
    fetch_reply_interface & to_collector,
    slow_fetch_request_interface & to_slow_fetch,
	fetch_bin_reply_interface &bin1_send,
	fetch_bin_reply_interface &bin2_send,
	fetch_bin_reply_interface &bin3_send,
	fetch_update_interface &update,
    ip_fetch_state_t &state_out,
	ap_uint<2> &error_flag_out
)
{
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS INTERFACE axis port=from_dispatch register_mode=off
#pragma HLS INTERFACE axis port=to_collector register_mode=off
#pragma HLS INTERFACE axis port=to_slow_fetch register_mode=off
#pragma HLS INTERFACE axis port=bin1_send register_mode=off
#pragma HLS INTERFACE axis port=bin2_send register_mode=off
#pragma HLS INTERFACE axis port=bin3_send register_mode=off
#pragma HLS INTERFACE axis port=update register_mode=off

    static ip_fetch_state_t core_state = IPF_STATE_IDLE;//FSM State
    state_out = core_state;
    static ap_uint<KERN_TABLE_ENTRY_BITS> network_table[NUM_KERN_TABLE_ENTRIES];
    static bin_info bin1;
    static bin_info bin2;
    static bin_info bin3;
    static ap_uint<2> error_flags=0;
    static ap_uint<1> retrying_bin=0;
    error_flag_out = error_flags;
    static fetch_bin_reply bin_response;
    static ap_uint<3> affected_bin;
    fetch_update update_msg;
    ap_uint<KERN_TABLE_ENTRY_BITS> table_entry;
    static ip_fetch_packet_t saved_request;
    ap_uint<KERN_TAG_BITS> kern_tag = 0;
    ap_uint<KERN_TAG_BITS> table_entry_tag;
    ap_uint<IP_LENGTH> ip_address = 0;
    ap_uint<KERN_INDEX_BITS> kern_index = 0;
    ip_fetch_packet_t kernel_request;
    fetch_reply fetch_response;
    slow_fetch_request slow_fetch_response;
    if (retrying_bin == 1)
    {
    	//Indicates we were unable to send to a bin, keep trying until we can and raise the second error bit.
    	error_flags.bit(1)=1;    	
    	switch(affected_bin)
    	{
    	//For the matching bin, forward the bin response and clear the fact we are re-trying
    	case 1:
    		if (!bin1_send.full())
    		{
    			bin1_send.write(bin_response);
    			retrying_bin = 0;
    		}
    		break;
    	case 2:
    		if (!bin2_send.full())
    		{
    			bin2_send.write(bin_response);
    			retrying_bin = 0;
    		}
    		break;
    	case 3:
    		if (!bin3_send.full())
    		{
    			bin3_send.write(bin_response);
    			retrying_bin = 0;
    		}
    		break;
    	}
    }
    else if (!update.empty())
    {
    	//A table entry update for one of our bins arrived
    	//read it
    	update_msg=update.read();
    	//copy the ip to bin_response message
    	bin_response.data=update_msg.data;
    	affected_bin=update_msg.dest;
    	switch(update_msg.dest)
    	{
    	case 1:
    		//Get the saved kernel_request
    		kernel_request.data = bin1.dest;
    		//Write the number of packets to forward
    		bin_response.user=bin1.sent_total;
    		//Mark as unoccupied
    		bin1.occupied=0;
    		if (!bin1_send.full())
    		{
    			bin1_send.write(bin_response);
    		}
    		else
    		{
    			//Do a retry
    			retrying_bin = 1;
    		}
    		break;
    		//Repeat for bins 2 and 3 depending on the one targeted
    	case 2:
    		kernel_request.data = bin2.dest;
    		bin_response.user=bin2.sent_total;
    		bin2.occupied=0;
    		if (!bin2_send.full())
    		{
    			bin2_send.write(bin_response);
    		}
    		else
    		{
    			retrying_bin = 1;
    		}
    		break;
    	case 3:
    		kernel_request.data = bin3.dest;
    		bin_response.user=bin3.sent_total;
    		bin3.occupied=0;
    		if (!bin3_send.full())
    		{
    			bin3_send.write(bin_response);
    		}
    		else
    		{
    			retrying_bin = 1;
    		}
    		break;
    	default:
    		//Should never happen
    		error_flags.bit(0) = 1;
    		break;
    	}
    	//Get the tag and the index from the request
		kern_tag = kernel_request.data(KERN_BITS-1, KERN_INDEX_BITS);
		kern_index = kernel_request.data(KERN_INDEX_BITS-1,0);
		//Formulate the new updated entry with tag and ip
		table_entry(IP_LENGTH-1,0)=update_msg.data;
		table_entry(KERN_TABLE_ENTRY_BITS-1,IP_LENGTH)=kern_tag;
		//Write the entry into the device
    	network_table[kern_index](KERN_TABLE_ENTRY_BITS-1,0) = table_entry(KERN_TABLE_ENTRY_BITS-1,0);
    }
    else
    {
		switch(core_state){
		case IPF_STATE_IDLE:
			if (!from_dispatch.empty() && !to_collector.full())
			{
				ap_uint<1> should_write = 1;//A flag indicating if the collector should be written
				kernel_request = from_dispatch.read();//Read in the fetch request
				saved_request = kernel_request;//Save the request in case something goes wrong
				//Parse the tag and index from the request.
				kern_tag(KERN_TAG_BITS-1,0) = kernel_request.data(KERN_BITS-1, KERN_INDEX_BITS);
				kern_index(KERN_INDEX_BITS-1,0) = kernel_request.data(KERN_INDEX_BITS-1,0);
				//Retrieve the entry from hash location
				table_entry = network_table[kern_index];
				//Parse the tag and ip from the entry
				table_entry_tag(KERN_TAG_BITS-1,0) = table_entry(KERN_TABLE_ENTRY_BITS-1, IP_LENGTH);
				ip_address = table_entry(IP_LENGTH-1,0);
				//Write the ip address into the response
				fetch_response.data = ip_address;
                slow_fetch_response.data=kernel_request.data;
				if (table_entry_tag == kern_tag && table_entry != 0)
				{
					//Tags match, tell collector to use ip and send
					fetch_response.dest = 0;
				}
				else if ((bin1.occupied==1)&& (bin1.dest == kernel_request.data))
				{
					//We are waiting for this on bin 1, tell collector to forward it there and record how many have been forwarded
					bin1.sent_total += 1;
					fetch_response.dest = 1;
				}
				else if ((bin2.occupied==1)&& (bin2.dest == kernel_request.data))
				{
					//We are waiting for this on bin 2, tell collector to forward it there and record how many have been forwarded
					bin2.sent_total += 1;
					fetch_response.dest = 2;
				}
				else if ((bin3.occupied==1)&& (bin3.dest == kernel_request.data))
				{
					//We are waiting for this on bin 3, tell collector to forward it there and record how many have been forwarded
					bin3.sent_total += 1;
					fetch_response.dest = 3;
				}
				else if (!to_slow_fetch.full())
				{
					if (bin1.occupied==0)
					{
						//Add this to unused bin 1, tell collector to forward it there and record there is 1 there
						fetch_response.dest = 1;
                        slow_fetch_response.dest=1;
						to_slow_fetch.write(slow_fetch_response);
						bin1.occupied = 1;
						bin1.sent_total = 1;
						bin1.dest = kernel_request.data;
					}
					else if (bin2.occupied==0)
					{
						//Add this to unused bin 2, tell collector to forward it there and record there is 1 there
						fetch_response.dest = 2;
                        slow_fetch_response.dest=2;
						to_slow_fetch.write(slow_fetch_response);
						bin2.occupied = 1;
						bin2.sent_total = 1;
						bin2.dest = kernel_request.data;
					}
					else if (bin3.occupied==0)
					{
						//Add this to unused bin 3, tell collector to forward it there and record there is 1 there
						fetch_response.dest = 3;
                        slow_fetch_response.dest=3;
						to_slow_fetch.write(slow_fetch_response);
						bin3.occupied = 1;
						bin3.sent_total = 1;
						bin3.dest = kernel_request.data;
					}
					else
					{
						//We failed since all bins are full, go to retry to keep trying
						core_state= RETRY;
						should_write = 0;
					}
				}
				else
				{
					//We failed since slow fetch is busy, go to retry to keep trying
					core_state = RETRY;
					should_write = 0;
				}
				if (should_write==1)
				{
					//Write out the response to the collector
					to_collector.write(fetch_response);
				}
			}
			break;
		case RETRY:
			//We are re-attempting to send to SF and collector
			//Data is unused since it will go to a bin, tie it to 0.
			fetch_response.data=0;
            slow_fetch_response.data=saved_request.data;
			if (!to_slow_fetch.full()  && !to_collector.full())
			{
				//We can write to SF and Collector
				if (bin1.occupied==0)
				{
					//Add this to unused bin 1, tell collector to forward it there and record there is 1 there
					fetch_response.dest = 1;
					slow_fetch_response.dest=1;
					to_slow_fetch.write(slow_fetch_response);
					bin1.occupied = 1;
					bin1.sent_total = 1;
					bin1.dest = saved_request.data;
					to_collector.write(fetch_response);
					core_state= IPF_STATE_IDLE;
				}
				else if (bin2.occupied==0)
				{
					//Add this to unused bin 2, tell collector to forward it there and record there is 1 there
					fetch_response.dest = 2;
					slow_fetch_response.dest=2;
					to_slow_fetch.write(slow_fetch_response);
					bin2.occupied = 1;
					bin2.sent_total = 1;
					bin2.dest = saved_request.data;
					to_collector.write(fetch_response);
					core_state= IPF_STATE_IDLE;
				}
				else if (bin3.occupied==0)
				{
					//Add this to unused bin 3, tell collector to forward it there and record there is 1 there
					fetch_response.dest = 3;
					slow_fetch_response.dest=3;
					to_slow_fetch.write(slow_fetch_response);
					bin3.occupied = 1;
					bin3.sent_total = 1;
					bin3.dest = saved_request.data;
					to_collector.write(fetch_response);
					core_state= IPF_STATE_IDLE;
				}
			}
			break;
		}
    }
}
