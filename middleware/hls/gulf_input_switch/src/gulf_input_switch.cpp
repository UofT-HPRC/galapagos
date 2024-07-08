#include "gulf_input_switch.hpp"

axis_gulfstream_t de_extender(axis_gulfstream_extend_t data_in)
{
    axis_gulfstream_t data_out;
    data_out.data = data_in.data;
    data_out.keep = data_in.keep;
    data_out.last = data_in.last;
    return data_out;
}

void gulf_input_switch(
    gulfstream_interface_extend & in_network,
    gulfstream_interface & out,
    ap_uint<32> * out_ip,
    ap_uint<16> * out_dest_prt,
    ap_uint<16> * out_source_prt,

    gs_input_switch_t * state_out
){
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS INTERFACE axis port=in_network
#pragma HLS INTERFACE axis port=out
#pragma HLS INTERFACE ap_none port=out_ip
#pragma HLS INTERFACE ap_none port=out_dest_prt
#pragma HLS INTERFACE ap_none port=out_source_prt

    // Declarations
    static gs_input_switch_t core_state = GSIS_STATE_IDLE;
    *state_out = core_state;
    static ap_uint<32> out_ip_addr = 0;
    ap_uint<32> out_ip_addr_temp;
    static ap_uint<16> out_dst_prt = 0;
    ap_uint<16> out_dst_prt_temp;
    static ap_uint<16> out_src_prt = 0;
    ap_uint<16> out_src_prt_temp;
    axis_gulfstream_extend_t input_packet;
    axis_gulfstream_t output_packet;
    static axis_gulfstream_t previous_data;


    // Assignments

    switch(core_state){
    case GSIS_STATE_IDLE:
        // Case 1: IP Fetch ready, previously sent Network Bridge
        if (!in_network.empty()){
            input_packet = in_network.read();
            out_ip_addr_temp = input_packet.user.range(31,0);
            out_src_prt_temp = input_packet.user.range(47,32);
            out_dst_prt_temp = input_packet.user.range(63,48);
            core_state = GSIS_STATE_WAIT_ARP_STATUS;
            previous_data=de_extender(input_packet);
        }
        else
        {
        	
            out_ip_addr_temp = out_ip_addr;
            out_src_prt_temp = out_src_prt;
            out_dst_prt_temp = out_dst_prt;
        }
        break;
    case GSIS_STATE_WAIT_ARP_STATUS:
        if (!out.full())
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
        out_src_prt_temp = out_src_prt;
        out_dst_prt_temp = out_dst_prt;
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
        out_src_prt_temp = out_src_prt;
        out_dst_prt_temp = out_dst_prt;
        break;
    }
    *out_ip = out_ip_addr_temp;
    *out_dest_prt = out_dst_prt_temp;
    *out_source_prt = out_src_prt_temp;
    out_ip_addr = out_ip_addr_temp;
    out_src_prt = out_src_prt_temp;
    out_dst_prt = out_dst_prt_temp;
}
