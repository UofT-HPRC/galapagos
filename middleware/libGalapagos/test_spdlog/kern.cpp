
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



void kern_0(short id, 
        galapagos_interface * in, 
        galapagos_interface  * out
        )
{   
    galapagos_packet pkt;

    
    // for (int i=0; i<10; i++){
    //     pkt.data = i;
    //     pkt.dest = 1;
    //     pkt.id = id;
    //     pkt.last = i==9? 1:0;
    //     out->write(pkt);
    // }
}


// linear + act
void kern_1(short id, 
        galapagos_interface * in, 
        galapagos_interface  * out
        )
{
    galapagos_packet pkt;

    while(in->empty()){}

    while(!in->empty()) {
        pkt = in->read();
    }
}
