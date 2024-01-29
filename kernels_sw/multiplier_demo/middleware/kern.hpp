#ifndef KERN_HPP
#define KERN_HPP

typedef ap_uint<PACKET_DATA_LENGTH> T;

//NUM PACKETS
#define N 10

//NUM FLITS
#define F 10


void kern_send(short id, galapagos_interface * in, galapagos_interface  * out);
void kern_loopback(short id, galapagos_interface * in, galapagos_interface  * out);



#endif
