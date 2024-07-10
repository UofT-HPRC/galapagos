//===============================
// AUTHOR     : Naif Tarafdar
// CREATE DATE     : June 20, 2018
//===============================

#include "galapagos_packet.h"
#include "ap_int.h"
#include "hls_stream.h"
// #include "ap_utils.h"

#include "router.hpp"

void router(
    const ap_uint<NETWORK_HEADER_LENGTH> network_table[256],
    const ap_uint<NETWORK_HEADER_LENGTH> network_addr,
    galapagos_interface &stream_in,
    galapagos_interface &stream_out_switch,
    galapagos_interface &ctrl_out_switch,
    galapagos_interface &stream_out_network
)
{
#pragma HLS INTERFACE ap_ctrl_none port = return
#pragma HLS INTERFACE axis port = stream_in register_mode=off
#pragma HLS INTERFACE axis port = stream_out_switch register_mode=off
#pragma HLS INTERFACE axis port = stream_out_network register_mode=off
#pragma HLS INTERFACE axis port = ctrl_out_switch register_mode=off
#pragma HLS INTERFACE bram port = network_table register_mode=off

    galapagos_packet packetIn;
    galapagos_packet packetOut;
    ap_uint<NETWORK_HEADER_LENGTH> network_addr_in;
    int index;

    packetIn = stream_in.read();
    index = packetIn.dest;
    network_addr_in = network_table[index * 4];

    // send out
    packetOut = packetIn;

    if (network_addr_in == network_addr)
    {
      if (packetIn.user == 0)
      {
        stream_out_switch.write(packetOut);
      }
      else
      {
        ctrl_out_switch.write(packetOut);
      }
    }
    else
    {
      stream_out_network.write(packetOut);
    }

    while (!packetOut.last)
    {
#pragma HLS pipeline ii = 1

      packetIn = stream_in.read();
      packetOut = packetIn;

      if (network_addr_in == network_addr)
      {
        if (packetIn.user == 0)
        {
          stream_out_switch.write(packetOut);
        }
        else
        {
          ctrl_out_switch.write(packetOut);
        }
      }
      else
      {
          stream_out_network.write(packetOut);
      }
    }
}
