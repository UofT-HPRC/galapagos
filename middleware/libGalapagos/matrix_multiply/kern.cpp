
#define INTERFACE_100G

#include <cstddef>
#include <cstring>
#include <fstream>
#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#ifdef CPU
#include "../packet_size.h"
#include "../galapagos_interface.hpp"
#else
#include "galapagos_packet.h"
#endif

#include "kern.hpp"

using namespace std;

const int hidden_size = 768;
const int head = 12;



void kern_0(short id,
            galapagos_interface *in,
            galapagos_interface *out)
{
    galapagos_packet pkt;


    int SIZE_N=1;
    cout << "set n=1" << endl;

    ap_int<8> input[512][hidden_size];
    ifstream infile("data/input.txt");

    for (int i = 0; i < SIZE_N; i++)
    {
        for (int j = 0; j < hidden_size; j++)
        {
            infile >> input[i][j];
        }
    }

    int dest=1;
    

    // sending packets
    pkt.data = SIZE_N;
    pkt.dest = dest;
    pkt.id = id;
    pkt.last = 0;
    out->write(pkt);

    for (int i = 0; i < SIZE_N; i++)
    {
        for (int j = 0; j < hidden_size / 64; j++)
        {
            for (int k = 0; k < 64; k++)
            {
                pkt.data(k * 8 + 7, k * 8) = input[i][j * 64 + k];
            }

            pkt.dest = dest;
            pkt.id = id;
            pkt.last = j == hidden_size/64 - 1 ? 1:0;
            out->write(pkt);
        }
    }

    // receiving packets
    pkt = in->read();
    cout << "data " << pkt.data << " id " << pkt.id << " dest " << pkt.dest << " last " << pkt.last << endl;

    for (int i = 0; i < SIZE_N; i++)
    {
        for (int j = 0; j < hidden_size / 64; j++)
        {
            pkt = in->read();
            cout << "data " << pkt.data << " id " << pkt.id << " dest " << pkt.dest << " last " << pkt.last << endl;
        }
    }
}

