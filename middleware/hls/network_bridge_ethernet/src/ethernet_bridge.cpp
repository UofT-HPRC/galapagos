//===============================
// AUTHOR     : Naif Tarafdar and Nariman Eskandari
// CREATE DATE     : June 15, 2018
//===============================

// #include "ap_cint.h"
#include "ap_int.h"
#include "hls_stream.h"
// #include "ap_utils.h"

struct eth_axis
{
    ap_int<64> data;
    ap_uint<1> last;
    ap_uint<8> tkeep;
};

struct app_axis
{
    ap_int<64> data;
    ap_uint<1> last;
    ap_uint<8> tdest;
    ap_uint<8> tkeep;
};

#define DEBUG

ap_uint<64> reverseEndian64_data(ap_uint<64> X)
{
    ap_uint<64> x = X;
    x = (x & 0x00000000FFFFFFFF) << 32 | (x & 0xFFFFFFFF00000000) >> 32;
    x = (x & 0x0000FFFF0000FFFF) << 16 | (x & 0xFFFF0000FFFF0000) >> 16;
    x = (x & 0x00FF00FF00FF00FF) << 8 | (x & 0xFF00FF00FF00FF00) >> 8;
    return x;
}

ap_uint<8> reverseEndian64_keep(ap_uint<8> X)
{
    ap_uint<8> x = X;
    x = (x & 0xF0) >> 4 | (x & 0x0F) << 4;
    x = (x & 0xCC) >> 2 | (x & 0x33) << 2;
    x = (x & 0xAA) >> 1 | (x & 0x55) << 1;
    return x;
}

// eth_to_app states
#define INIT_ETH_TO_APP 0
#define DROP_ETH_TO_APP 1
#define READ_DEST_ETH_TO_APP 2
#define STREAM_ETH_TO_APP 3

// app states
#define INIT_APP_TO_ETH 0
#define HEADER_0_APP_TO_ETH 1
#define HEADER_1_APP_TO_ETH 2
#define STREAM_FIRST_FLIT_APP_TO_ETH 3
#define STREAM_APP_TO_ETH 4

#define ETH_PROTOCOL 0x7400

// ap_uint<48> mac_table_global[256];

void eth_to_app(hls::stream<eth_axis> &from_eth,
                hls::stream<app_axis> &to_app,
                ap_uint<48> mac_address
                #ifdef DEBUG
                    ,
                    ap_uint<48> *observedAddress_out
                #endif

)
{
#pragma HLS PIPELINE II = 1

    static ap_uint<3> state = 0;
    static ap_uint<16> dest;
    static eth_axis eth_packet_in;
    static app_axis app_packet_out;

    ap_int<48> observedAddress;
    switch (state)
    {
    // read header
    case INIT_ETH_TO_APP:
        if (!from_eth.empty())
        {
            eth_packet_in = from_eth.read();
            eth_packet_in.data = reverseEndian64_data(eth_packet_in.data);
            observedAddress = eth_packet_in.data.range(63, 16);
            // on this fpga
            if (observedAddress == mac_address)
            {
                state = READ_DEST_ETH_TO_APP;
            }
            else
            {
                state = DROP_ETH_TO_APP;
            }
        }
        break;
    case READ_DEST_ETH_TO_APP:
        if (!from_eth.empty())
        {
            eth_packet_in = from_eth.read();
            eth_packet_in.data = reverseEndian64_data(eth_packet_in.data);
            dest = eth_packet_in.data.range(15, 8);
            state = STREAM_ETH_TO_APP;
        }
        break;
    case STREAM_ETH_TO_APP:
        app_packet_out.tdest = dest;
        if (!from_eth.empty())
        {
            eth_packet_in = from_eth.read();
            // eth_packet_in.data = reverseEndian64_data(eth_packet_in.data);
            // eth_packet_in.tkeep = reverseEndian64_keep(eth_packet_in.tkeep);
            app_packet_out.tkeep = eth_packet_in.tkeep;
            app_packet_out.data = eth_packet_in.data;
            app_packet_out.last = eth_packet_in.last;
            to_app.write(app_packet_out);
        }
        if (app_packet_out.last)
        {
            state = INIT_ETH_TO_APP;
        }
        else
        {
            state = STREAM_ETH_TO_APP;
        }
        break;
    case DROP_ETH_TO_APP:
        if (!from_eth.empty())
        {
            eth_packet_in = from_eth.read();
            if (eth_packet_in.last)
            {
                state = INIT_ETH_TO_APP;
            }
            else
            {
                state = DROP_ETH_TO_APP;
            }
        }
        break;
    }
#ifdef DEBUG
    *observedAddress_out = observedAddress;
#endif
}

void app_to_eth(
    hls::stream<app_axis> &from_app,
    hls::stream<eth_axis> &to_eth,
    ap_int<48> src_mac_address,
    ap_uint<48> mac_table[256])
{
#pragma HLS PIPELINE II = 1

    static app_axis app_packet_in;
    static eth_axis eth_packet_out;
    static ap_uint<48> dest_mac_address;
    static ap_uint<96> eth_dst_src;
    static ap_uint<3> state;

    ap_int<32> temp = eth_dst_src.range(31, 0);
    ap_int<16> temp2 = ETH_PROTOCOL;
    ap_int<48> temp3 = temp.concat(temp2);
    ap_uint<16> temp_dest;

    switch (state)
    {
    // read dest and look up mac address
    case INIT_APP_TO_ETH:
        if (!from_app.empty())
        {
            app_packet_in = from_app.read();
            dest_mac_address = mac_table[app_packet_in.tdest];
            state = HEADER_0_APP_TO_ETH;
        }
        break;
    case HEADER_0_APP_TO_ETH:
        eth_dst_src = dest_mac_address.concat(src_mac_address);
        eth_packet_out.tkeep = 0xff;
        eth_packet_out.data = eth_dst_src.range(95, 32);
        // eth_packet_out.tkeep = reverseEndian64_keep(eth_packet_out.tkeep);
        eth_packet_out.last = 0;
        eth_packet_out.data = reverseEndian64_data(eth_packet_out.data);
        to_eth.write(eth_packet_out);
        state = HEADER_1_APP_TO_ETH;
        break;
    case HEADER_1_APP_TO_ETH:
        eth_packet_out.tkeep = 0xff;
        temp_dest = 0;
        temp_dest(15, 8) = app_packet_in.tdest;
        eth_packet_out.data = temp3.concat(temp_dest);
        // eth_packet_out.tkeep = reverseEndian64_keep(eth_packet_out.tkeep);
        eth_packet_out.last = 0;
        eth_packet_out.data = reverseEndian64_data(eth_packet_out.data);
        to_eth.write(eth_packet_out);
        state = STREAM_FIRST_FLIT_APP_TO_ETH;
        break;
    case STREAM_FIRST_FLIT_APP_TO_ETH:
        // eth_packet_out.tkeep = reverseEndian64_keep(app_packet_in.tkeep);
        // eth_packet_out.data = reverseEndian64_data(app_packet_in.data);
        eth_packet_out.tkeep = app_packet_in.tkeep;
        eth_packet_out.data = app_packet_in.data;
        eth_packet_out.last = app_packet_in.last;
        to_eth.write(eth_packet_out);
        if (app_packet_in.last)
            state = INIT_APP_TO_ETH;
        else
            state = STREAM_APP_TO_ETH;
        break;
    case STREAM_APP_TO_ETH:
        if (!from_app.empty())
        {
            app_packet_in = from_app.read();
            // eth_packet_out.tkeep = reverseEndian64_keep(app_packet_in.tkeep);
            // eth_packet_out.data = reverseEndian64_data(app_packet_in.data);
            eth_packet_out.tkeep = app_packet_in.tkeep;
            eth_packet_out.data = app_packet_in.data;
            eth_packet_out.last = app_packet_in.last;

            to_eth.write(eth_packet_out);
            if (app_packet_in.last)
                state = INIT_APP_TO_ETH;
            else
                state = STREAM_APP_TO_ETH;
        }
        break;
    }
}

void ethernet_bridge(
    hls::stream<app_axis> &to_app,
    hls::stream<eth_axis> &from_eth,
    hls::stream<app_axis> &from_app,
    hls::stream<eth_axis> &to_eth,
    const ap_uint<48> mac_addr,
    ap_uint<48> mac_table[256]
    #ifdef DEBUG
        ,
        ap_uint<48> *observedAddress_out
    #endif
)

{
    #pragma HLS DATAFLOW
    #pragma HLS INTERFACE axis port=to_app
    #pragma HLS INTERFACE axis port=from_eth
    #pragma HLS INTERFACE axis port=from_app
    #pragma HLS INTERFACE axis port=to_eth
    /* 
    #pragma HLS resource core = AXI4Stream variable = to_app
    #pragma HLS resource core = AXI4Stream variable = from_eth
    #pragma HLS resource core = AXI4Stream variable = from_app
    #pragma HLS resource core = AXI4Stream variable = to_eth
    #pragma HLS DATA_PACK variable = to_app
    #pragma HLS DATA_PACK variable = from_eth
    #pragma HLS DATA_PACK variable = from_app
    #pragma HLS DATA_PACK variable = to_eth
    #pragma HLS aggregate variable = to_app compact=bit
    #pragma HLS aggregate variable = from_eth compact=bit
    #pragma HLS aggregate variable = from_app compact=bit
    #pragma HLS aggregate variable = to_eth compact=bit
    */
    #pragma HLS_INTERFACE ap_ctrl_none state_out
    #ifdef DEBUG
    #pragma HLS_INTERFACE ap_none observedAddress_out
    #endif
    // #pragma HLS INTERFACE ap_ctrl_none port=mac_addr
    // #pragma HLS RESOURCE variable=mac_table core=ROM_2P_BRAM
    #pragma HLS INTERFACE ap_ctrl_none port = return

    #ifdef DEBUG
        eth_to_app(from_eth, to_app, mac_addr, observedAddress_out);
    #else
        eth_to_app(from_eth, to_app, mac_addr);
    #endif
    app_to_eth(from_app, to_eth, mac_addr, mac_table);
}
