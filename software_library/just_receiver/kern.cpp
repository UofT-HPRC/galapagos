using namespace std;
#include<unistd.h>
#define INTERFACE_100G
#include "kern.hpp"
// IDs of kernels
#define dS 0
#define mA 1
#define mB 2
#define dR 3

bool printer = true;

void data_sender(short id, galapagos_interface *in, galapagos_interface *out)
{
#pragma HLS INTERFACE axis register both port = out
#pragma HLS INTERFACE axis register both port = in
    // ap_uint<512> numberA("0700000000000000000000000000000000", 16);
    for (int pkt_cnt=0; pkt_cnt<1; pkt_cnt++)
    {
        char packet[64*10];
        for (int flit_cnt=0; flit_cnt<10; flit_cnt++)
        {
            for (int slot=0; slot<8; slot++)
            {
                uint64_t val = flit_cnt*8+slot;
                packet[flit_cnt*64+slot*8+0]=val%256;
                packet[flit_cnt*64+slot*8+1]=(val>>8)%256;
                packet[flit_cnt*64+slot*8+2]=(val>>16)%256;
                packet[flit_cnt*64+slot*8+3]=(val>>24)%256;
                packet[flit_cnt*64+slot*8+4]=(val>>32)%256;
                packet[flit_cnt*64+slot*8+5]=(val>>40)%256;
                packet[flit_cnt*64+slot*8+6]=(val>>48)%256;
                packet[flit_cnt*64+slot*8+7]=(val>>56)%256;
            }
        }
        printf("Sending packet # %d\n",pkt_cnt);
        // data
        out->packet_write(packet, 10, 3, 1);
    }
}

void data_receiver(short id, galapagos_interface *in, galapagos_interface *out)
{
#pragma HLS INTERFACE axis register both port = out
#pragma HLS INTERFACE axis register both port = in
    // cout << "INFO: data_receiver Ready" << endl;
    ap_uint<512> in_data;
    size_t size;
    short dest, src;
    char *read_data;
    unsigned int count;
    int cont;
    int i;
    while (true)
    {
      read_data = in->packet_read(&size, &dest, &src);
      unsigned int size_int = size;
      printf("size %d,dest %x,src %x, data",size_int,dest,src);
      cont = read_data[0];
      count = 1;
      for (i=1; i<size_int; i=i+1)
      {
          if (read_data[i]==cont)
          {
             count=count + 1;
          }
          else
          {
              printf(" (%u X %x)",count,cont);
              cont = read_data[i];
              count=1;
          }
      }
      printf(" (%d X %x)\n",count,cont);
    }
}
