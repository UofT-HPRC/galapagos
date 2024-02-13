
#include <stdio.h>
#include <iostream>
#include <fstream>
#include <string>
#include <math.h>
#include <hls_stream.h>
#include "ap_int.h"
#include <stdint.h>
#include "galapagos_packet.h"

using namespace hls;

ap_uint<32> byteSwap32(ap_uint<32> &inputVector)
{

    return (inputVector.range(7, 0), inputVector(15, 8), inputVector(23, 16), inputVector(31, 24));
}

// Old AXIS signals (Vivado HLS <2019.1)
// struct axiWord512
// {
//     ap_uint<512> data;
//     ap_uint<16> keep;
//     ap_uint<1> last;
// };

// New AXIS signals (Vitis HLS 2023.1+) <WData, WUser, WDest, WId>
typedef ap_axiu<512, 0, 0, 0> axiWord512;

typedef ap_axiu<512, 64, 0, 0> extAxiWord512;

void rxPath(stream<axiWord512> &lbRxDataIn,
            stream<axiWord512> &txGalapagosBridge)
{
#pragma HLS PIPELINE II = 1

    if (!lbRxDataIn.empty())
    {
        axiWord512 currWord = lbRxDataIn.read();
        // currWord.data = byteSwap512(currWord.data);
        txGalapagosBridge.write(currWord);
    }
}

extAxiWord512 currWordExtender(axiWord512 wordIn, ap_uint<32> ip)
{
#pragma HLS inline
    extAxiWord512 wordOut;
    const ap_uint<16> port=9000;
    wordOut.data = wordIn.data;
    wordOut.user=(port,port,ip);
    wordOut.last=wordIn.last;
    wordOut.keep=wordIn.keep;
    wordOut.strb=wordIn.strb;
    return(wordOut);
}

void txPath(
    stream<axiWord512> &rxGalapagosBridge,
    stream<extAxiWord512> &lbTxDataOut,
    const ap_uint<32> ip_table[256])
{
#pragma HLS INTERFACE bram port = ip_table

    static int dest;
    static ap_uint<32> dest_ip_addr;
    static axiWord512 currWordIn;
    static extAxiWord512 currWordOut;

    // read header
    currWordIn = rxGalapagosBridge.read();
    dest = currWordIn.data.range(31, 24);
    dest_ip_addr = ip_table[dest * 4];
    currWordOut=currWordExtender(currWordIn,dest_ip_addr);
    // write header
    lbTxDataOut.write(currWordOut);

    // write rest
    while (!currWordIn.last)
    {
#pragma HLS PIPELINE II = 1
        currWordIn = rxGalapagosBridge.read();
        currWordOut=currWordExtender(currWordIn,dest_ip_addr);
        lbTxDataOut.write(currWordOut);
    }
}

void network_bridge_udp_100g(
    stream<axiWord512> &rxGalapagosBridge,
    stream<axiWord512> &lbRxDataIn,
    stream<extAxiWord512> &lbTxDataOut,
    stream<axiWord512> &txGalapagosBridge,
    const ap_uint<32> ip_table[256]
)
{
#pragma HLS INTERFACE ap_ctrl_none port = return
#pragma HLS DATAFLOW

#pragma HLS INTERFACE AXIS port = lbRxDataIn
#pragma HLS INTERFACE AXIS port = lbTxDataOut
#pragma HLS INTERFACE AXIS port = rxGalapagosBridge
#pragma HLS INTERFACE AXIS port = txGalapagosBridge
#pragma HLS INTERFACE bram port = ip_table

    rxPath(lbRxDataIn, txGalapagosBridge);
    txPath(rxGalapagosBridge, lbTxDataOut, ip_table);
}
