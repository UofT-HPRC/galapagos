#include "hls_stream.h"
#include "ap_int.h"
#include "ap_utils.h"

// Receiver

// Parameters
#define BYTE_WIDTH_OF_DATA 64
// Calculated pre-processed values
#define bitwidth (BYTE_WIDTH_OF_DATA * 8)

struct net_data
{
    ap_uint<bitwidth> data;
    ap_uint<BYTE_WIDTH_OF_DATA> keep;
    ap_uint<1> last;
    ap_uint<24> dest;
    ap_uint<24> id;
    ap_uint<16> user;
    // Add any other necessary sideband signals
};

void multiplierB(
    hls::stream<net_data> &pkt_in,
    ap_uint<24> dest_prt,
    ap_uint<24> id_prt,
    ap_uint<16> user_prt,
    hls::stream<net_data> &pkt_out)
{
#pragma HLS INTERFACE ap_ctrl_none port = return

#pragma HLS resource core = AXI4Stream variable = pkt_in
#pragma HLS DATA_PACK variable = pkt_in
#pragma HLS resource core = AXI4Stream variable = pkt_out
#pragma HLS DATA_PACK variable = pkt_out

    ap_uint<32> numberA;
    ap_uint<32> numberB;
    ap_uint<64> numberResult;
    net_data in_data, out_data;
    if (!pkt_in.empty())
    {
        in_data = pkt_in.read();
        numberA = in_data.data.range(31, 0);
        numberB = in_data.data.range(63, 32);
        numberResult = numberA * numberB;

        out_data.data = numberResult;
        out_data.dest = dest_prt;
        out_data.id = id_prt;
        out_data.user = user_prt;
        out_data.keep = 0xFFFFFFFFFFFFFFFF;
        out_data.last = 1;
        pkt_out.write(out_data);
    }
}
