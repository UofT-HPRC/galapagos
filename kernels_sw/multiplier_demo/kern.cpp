using namespace std;
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

    ap_uint<32> numberA = 0x03;
    ap_uint<64> numberB = 0x05;
    ap_uint<96> numberC = 0x07;
    ap_uint<512> data = numberA | (numberB << 32) | (numberC << 64);

    // data
    out->packet_write((char *)&data, 1, mA, dS);
    if (printer)
    {
        cout << "INFO: dS PacketSent" << endl;
        cout << "INFO: dS Out_data: " << hex << (data) << "(hex)" << dec << endl;
        cout << "INFO: source:" << dS << "  dest:" << mA << endl;
        cout << "OUTPUT: Answer should be:" << dec << numberA << "*" << numberB << "*" << numberC << " = " << numberA * numberB * numberC << "\n"
             << endl;
    }

    ap_uint<512> in_data;
    size_t size;
    short dest, src;
    ap_uint<512> *read_data = (ap_uint<512> *)in->packet_read(&size, &dest, &src);
    in_data = (ap_uint<512>)read_data[0];
    if (printer)
    {
        cout << "INFO: dS PacketReceived" << endl;
        cout << "INFO: read_data[0]: " << hex << (ap_uint<32>)read_data[0] << "(hex),  size:" << dec << sizeof(read_data) << endl;
        cout << "INFO: received from:" << src << "  at:" << dest << ",  size:" << size * 8 << " bits" << endl;
        cout << "OUTPUT: dSin_data: " << hex << (in_data) << "(hex) = " << dec << in_data << endl;
    }
}

void multiplierA(short id, galapagos_interface *in, galapagos_interface *out)
{
#pragma HLS INTERFACE axis register both port = out
#pragma HLS INTERFACE axis register both port = in
// This kernel was designed to run on hardware, but the following lines of code were written to debug the other software kernels of the multiplier_demo project

    ap_uint<512> mAin_data;
    size_t size;
    short dest, src;
    ap_uint<512> *read_data = (ap_uint<512> *)in->packet_read(&size, &dest, &src);
    mAin_data = (ap_uint<512>)read_data[0];
    if (printer)
    {
        cout << "INFO: mAin_data: " << hex << (mAin_data) << "(hex)" << dec << endl;
        cout << "INFO: received from:" << src << "  at:" << dest << "    size:" << size << endl;
    }

    ap_uint<32> numberA;
    ap_uint<32> numberB;
    ap_uint<64> numberC;
    ap_uint<64> numberResult;
    numberA = mAin_data.range(31, 0);
    numberB = mAin_data.range(63, 32);
    numberC = mAin_data.range(95, 64);
    numberC = numberC << 32;
    numberResult = numberA * numberB;

    ap_uint<512> mAout_data = (numberC) | numberResult;
    out->packet_write((char *)&mAout_data, 1, mB, mA);
    if (printer)
    {
        cout << "INFO: mA PacketSent\n"
             << endl;
        cout << "INFO: mAout_data: " << hex << (mAout_data) << "(hex)" << dec << endl;
        cout << "INFO: source:" << mA << "  dest:" << mB << endl;
    }
}

void multiplierB(short id, galapagos_interface *in, galapagos_interface *out)
{
#pragma HLS INTERFACE axis register both port = out
#pragma HLS INTERFACE axis register both port = in
// This kernel was designed to run on hardware, but the following lines of code were written to debug the other software kernels of the multiplier_demo project

    ap_uint<512> mBin_data;
    size_t size;
    short dest, src;
    ap_uint<512> *read_data = (ap_uint<512> *)in->packet_read(&size, &dest, &src);
    mBin_data = (ap_uint<512>)read_data[0];
    if (printer)
    {
        cout << "INFO: mBin_data: " << hex << (mBin_data) << "(hex)" << dec << endl;
        cout << "INFO: received from:" << src << "  at:" << dest << "    size:" << size << endl;
    }

    ap_uint<32> numberA;
    ap_uint<32> numberB;
    ap_uint<64> numberResult;
    numberA = mBin_data.range(31, 0);
    numberB = mBin_data.range(63, 32);
    numberResult = numberA * numberB;

    ap_uint<512> mBout_data = numberResult;
    out->packet_write((char *)&mBout_data, 1, dR, mB);
    if (printer)
    {
        cout << "INFO: mB PacketSent\n"
             << endl;
        cout << "INFO: mBout_data: " << hex << (mBout_data) << "(hex)" << dec << endl;
        cout << "INFO: source:" << mB << "  dest:" << dR << endl;
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
    // while (true)
    // {
    read_data = in->packet_read(&size, &dest, &src);
    in_data = (ap_uint<512>)read_data[0];
    if (printer)
    {
        cout << "INFO: dR PacketReceived" << endl;
        cout << "INFO: dR In_data: " << hex << (ap_uint<32>)read_data[0] << "(hex),  size:" << dec << sizeof(read_data) << endl;
        cout << "INFO: received from:" << src << "  at:" << dest << ",  size:" << size * 8 << " bits" << endl;
        cout << "OUTPUT: Answer: " << hex << (in_data) << "(hex) = " << dec << in_data << endl;

        // cout << "INFO: dR PacketReceived\nread_data[0]: " << hex << read_data[0] << "(hex), size:" << dec << sizeof(read_data) << endl;
        // cout << "INFO: in_data: " << hex << (in_data) << "(hex)" << dec << endl;
        // cout << "INFO: received from:" << src << "    at:" << dest << "    size:" << size << endl;

        // cout << "OUTPUT: read_data Array:\n" << hex;
        // for(int i = 0; i < sizeof(read_data); i++)
        // {
        //     cout << "OUTPUT: read_data[" << i << "]: " << read_data[i] << endl;
        // }
        // for(int i = 0; i < sizeof(read_data); i++)
        // {
        //     cout << "OUTPUT: read_data[" << i << "]: " << read_data[i] << endl;
        // }
    }
    // }
}