#include "WAN_GULFStream_input_switch.hpp"

axis_gulfstream_t de_extender(axis_gulfstream_extend_t data_in)
{
    axis_gulfstream_t data_out;
    data_out.data = data_in.data;
    data_out.keep = data_in.keep;
    data_out.last = data_in.last;
    return data_out;
}

void WAN_GULFStream_input_switch(
    gulfstream_interface_extend & in_network,
    gulfstream_interface & out,
    ap_uint<32> * out_ip,
    ap_uint<2> * out_arp_status,

    gs_input_switch_t * state_out
){
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS resource core=AXI4Stream variable = in_network
#pragma HLS DATA_PACK variable=in_network
#pragma HLS resource core=AXI4Stream variable = out
#pragma HLS DATA_PACK variable=out
#pragma HLS INTERFACE ap_none port=out_ip
#pragma HLS INTERFACE ap_none port=out_arp_status

    // Declarations
    static gs_input_switch_t core_state = GSIS_STATE_IDLE;
    *state_out = core_state;
    static ap_uint<32> out_ip_addr = 0;
    ap_uint<32> out_ip_addr_temp;
    axis_gulfstream_extend_t input_packet;
    axis_gulfstream_t output_packet;
    static axis_gulfstream_t previous_data;


    // Assignments

    switch(core_state){
    case GSIS_STATE_IDLE:
        // Case 1: IP Fetch ready, previously sent Network Bridge
        if (!in_network.empty()){
            input_packet = in_network.read();
            out_ip_addr_temp = input_packet.user;
            core_state = GSIS_STATE_WAIT_ARP_STATUS;
            previous_data=de_extender(input_packet);
        }
        else
        {
        	out_ip_addr_temp = out_ip_addr;
        }
        break;
    case GSIS_STATE_WAIT_ARP_STATUS:
        if (*out_arp_status == ARP_STATUS_VALID)
        {
            out.write(previous_data);
            if (previous_data.last == 1)
            {
                core_state = GSIS_STATE_IDLE;
            }
            else
            {
                core_state = GSIS_STATE_SEND_DATA;
            }
        }
        out_ip_addr_temp = out_ip_addr;
        break;
    case GSIS_STATE_SEND_DATA:
        if (!in_network.empty() && !out.full())
        {
            input_packet = in_network.read();
            output_packet = de_extender(input_packet);
            out.write(output_packet);
            if (input_packet.last == 1){
                core_state = GSIS_STATE_IDLE;
            }
        }
        out_ip_addr_temp = out_ip_addr;
        break;
    }
    *out_ip = out_ip_addr_temp;
    out_ip_addr = out_ip_addr_temp;
}
