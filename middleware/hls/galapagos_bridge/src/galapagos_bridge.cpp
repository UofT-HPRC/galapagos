#include <stdint.h>
#include <stdlib.h>
#include <iostream>
#include <iomanip>
#include <string.h>
#include <stdio.h>

#include "galapagos_bridge.hpp"

void g2N(
    galapagos_interface *input,
    hls::stream<netStream> *output)
{

    galapagos_packet gp = input->read();
    ap_uint<PACKET_USER_LENGTH> size;

    ap_uint<PACKET_DATA_LENGTH> header = get_header(gp.id, gp.dest, 0);
    // ap_uint<PACKET_DATA_LENGTH> header = get_header(gp.id, gp.dest);

    netStream np;
    // Write header
    np.keep = KEEP_ALL;
    np.last = 0;
    np.data = header;
    np.user = gp.user;
    // np.user= size;
    // ap_wait();
    output->write(np);

    // write first packet
    np.data = gp.data;
    np.last = gp.last;
    np.user = gp.user;
    //    np.user = size;
    output->write(np);

    while (!np.last)
    {
        #pragma HLS PIPELINE II = 1
        galapagos_packet gp = input->read();
        np.keep = gp.keep;
        np.data = gp.data;
        np.last = gp.last;
        np.user = gp.user;
        output->write(np);
    }
}

void n2G(
    hls::stream<netStream> *input,
    galapagos_interface *output)
{

    netStream np = input->read();
    ap_uint<PACKET_DEST_LENGTH> id = np.data.range(PACKET_DEST_LENGTH + PACKET_USER_LENGTH - 1, PACKET_USER_LENGTH);
    ap_uint<PACKET_DEST_LENGTH> dest = np.data.range(PACKET_DEST_LENGTH + PACKET_DEST_LENGTH + PACKET_USER_LENGTH - 1, PACKET_DEST_LENGTH + PACKET_USER_LENGTH);
    ap_uint<PACKET_USER_LENGTH> size = np.data.range(PACKET_USER_LENGTH - 1, 0);
    // ap_uint<PACKET_DEST_LENGTH> id = np.data.range(PACKET_DEST_LENGTH-1, 0);
    // ap_uint<PACKET_DEST_LENGTH> dest =  np.data.range(PACKET_DEST_LENGTH+PACKET_DEST_LENGTH-1, PACKET_DEST_LENGTH);

    // gp
    galapagos_packet gp;
    gp.id = id;
    gp.dest = dest;
    gp.user = size;
    gp.data = np.data;
    gp.last = np.last;
    gp.keep = np.keep;

    while (!gp.last)
    {
        #pragma HLS PIPELINE II = 1

        netStream np = input->read();
        gp.id = id;
        gp.dest = dest;
        gp.user = size;
        gp.data = np.data;
        gp.last = np.last;
        gp.keep = np.keep;
        output->write(gp);
    }

    //     for(int i=0; i<size; i++){
    // #pragma HLS PIPELINE II=1
    //         galapagos_packet gp;
    //         netStream np = input->read();
    //         gp.id = id;
    //         gp.dest = dest;
    //         gp.user = size;
    //         gp.data = np.data;
    //         gp.last = np.last;
    //         gp.keep = np.keep;
    //         output->write(gp);
    //     }
}

void galapagos_bridge(
    galapagos_interface *g2N_input,
    hls::stream<netStream> *g2N_output,
    hls::stream<netStream> *n2G_input,
    galapagos_interface *n2G_output)
{

    #pragma HLS DATAFLOW
    #pragma HLS INTERFACE ap_ctrl_none port=return
    #pragma HLS INTERFACE axis port=g2N_input
    #pragma HLS INTERFACE axis port=g2N_output
    #pragma HLS INTERFACE axis port=n2G_input
    #pragma HLS INTERFACE axis port=n2G_output

    galapagos_interface buff_stream;

    g2N(
        g2N_input,
        g2N_output);

    n2G(
        n2G_input,
        n2G_output);
}
