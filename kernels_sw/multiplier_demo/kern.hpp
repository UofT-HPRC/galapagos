#include "ap_int.h"
#include "hls_stream.h"
#include "ap_utils.h"
#include "../packet_size.h"
#include "../galapagos_interface.hpp"
#include <math.h>

#define SENDER_ID 1

#define AES_BLOCK_SIZE 16
#define AES_COL_SIZE 4
#define AES_ROUNDS 10
#define AES_ROUND_KEY_SIZE 176
#define DATA_SIZE 8

typedef ap_uint<8> DATA_TYPE;
typedef ap_uint<128> IO_DATA_TYPE;
typedef ap_uint<128> IN;

typedef ap_uint<PACKET_DATA_LENGTH> T;

typedef ap_uint<512> big_mult_t;

typedef struct data_t{
	ap_uint<32> dest;
	ap_uint<128> value;
	bool last;
	bool keep;
} data;

void init_kern (
    short id,
    galapagos_interface * in,
    galapagos_interface  * out
);
void key_core_one (
    short id,
    galapagos_interface * in,
    galapagos_interface  * out
);
void key_core_two (
    short id,
    galapagos_interface * in,
    galapagos_interface  * out
);
void kern_dec(
    short id, 
    galapagos_interface * in, 
    galapagos_interface * out
);
void kern_enc(
    short id, 
    galapagos_interface * in, 
    galapagos_interface * out
);
// Kartavya
void data_sender(
    short id, 
    galapagos_interface * in, 
    galapagos_interface * out
);
void multiplierA(
    short id, 
    galapagos_interface * in, 
    galapagos_interface * out
);
void multiplierB(
    short id, 
    galapagos_interface * in, 
    galapagos_interface * out
);
void data_receiver(
    short id, 
    galapagos_interface * in, 
    galapagos_interface * out
);

ap_uint<8> mul_bytes(ap_uint<8> a, ap_uint<8> b);

