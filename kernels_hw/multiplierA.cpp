#include "hls_stream.h"
#include "ap_int.h"
#include "etc/ap_utils.h"
#include "ap_axi_sdata.h"

// MultiplierA

// Parameters
#define BYTE_WIDTH_OF_DATA 64
// Calculated pre-processed values
#define bitwidth (BYTE_WIDTH_OF_DATA * 8)

// Old AXIS signals (Vivado HLS <2019.1)
// struct net_data
// {
// 	ap_uint<bitwidth> data;
// 	ap_uint<BYTE_WIDTH_OF_DATA> keep;
// 	ap_uint<1> last;
// 	ap_uint<24> dest;
// 	ap_uint<24> id;
// 	ap_uint<16> user;
// 	//Add any other necessary sideband signals
// };

// New AXIS signals (Vitis HLS 2023.1+) <WData, WUser, WDest, WId>
typedef ap_axiu<bitwidth, 16, 24, 24> net_data;

void multiplierA(
    hls::stream<net_data> &pkt_in,
    hls::stream<net_data> &pkt_out,)
{
#pragma HLS INTERFACE ap_ctrl_none port = return

#pragma HLS INTERFACE mode = axis port = pkt_in
#pragma HLS INTERFACE mode = axis port = pkt_out

    ap_uint<24> dest_prt = 2;
    ap_uint<24> id_prt = 1;
    ap_uint<16> user_prt = 0;
    ap_uint<32> numberA;
    ap_uint<32> numberB;
    ap_uint<64> numberC;
    ap_uint<64> numberResult;
    net_data in_data, out_data;
    if (!pkt_in.empty())
    {
        in_data = pkt_in.read();
        numberA = in_data.data.range(31, 0);
        numberB = in_data.data.range(63, 32);
        numberC = in_data.data.range(95, 64);
        numberC = numberC << 32;
        numberResult = numberA * numberB;

        out_data.data = (numberC) | numberResult;
        out_data.dest = dest_prt;
        out_data.id = id_prt;
        out_data.user = user_prt;
        out_data.keep = 0xFFFFFFFFFFFFFFFF;
        out_data.last = 1;
        pkt_out.write(out_data);
    }
}
