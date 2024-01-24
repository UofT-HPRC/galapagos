// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __QuantAct_m_4_H__
#define __QuantAct_m_4_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct QuantAct_m_4_ram : public sc_core::sc_module {

  static const unsigned DataWidth = 31;
  static const unsigned AddressRange = 48;
  static const unsigned AddressWidth = 6;

//latency = 1
//input_reg = 1
//output_reg = 0
sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in <sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


sc_lv<DataWidth> ram[AddressRange];


   SC_CTOR(QuantAct_m_4_ram) {
        ram[0] = "0b1101101011100001101001111010111";
        ram[1] = "0b1100110010101101000010001110111";
        ram[2] = "0b1001011110110011101110011101100";
        ram[3] = "0b1110101010101111100001100010100";
        ram[4] = "0b1001110111000001100100110110001";
        ram[5] = "0b1011101101111110001100110101011";
        ram[6] = "0b1000011111010101110001101100100";
        ram[7] = "0b1001100001111111000100011101011";
        ram[8] = "0b1100011100111101101101001011101";
        ram[9] = "0b1101000110010111100001010011110";
        ram[10] = "0b1000110010110111111011111101111";
        ram[11] = "0b1001100101100001111110001000101";
        ram[12] = "0b1111111100001111110100101010011";
        ram[13] = "0b1000001100100101001100110010101";
        ram[14] = "0b1010110000010100000111110011011";
        ram[15] = "0b1011000000111110000001101101100";
        ram[16] = "0b1111101101010100110010110011100";
        ram[17] = "0b1101100001001101101101010111011";
        ram[18] = "0b1101011101101010110001101101011";
        ram[19] = "0b1101000101111111100101111000101";
        ram[20] = "0b1010011010000010000001011010001";
        ram[21] = "0b1010110111101000000001111101010";
        ram[22] = "0b1010010101100001100100010111101";
        ram[23] = "0b1010000101101101111011101110011";
        ram[24] = "0b1111011101010101111111010100110";
        ram[25] = "0b1001000011001001010100000000101";
        ram[26] = "0b1101010100101110100010000111011";
        ram[27] = "0b1111011110001111010010001101001";
        ram[28] = "0b1100011110001110001001001011001";
        ram[29] = "0b1111000011010010101100000001000";
        ram[30] = "0b1101110011110000001001011111100";
        ram[31] = "0b1010100011001111011101101010010";
        ram[32] = "0b1100001100000100010101111110110";
        ram[33] = "0b1000100010011001011010011101011";
        ram[34] = "0b1011100011001011111001100110000";
        ram[35] = "0b1001001001101011101010110001110";
        ram[36] = "0b1000111010010100001111010011101";
        ram[37] = "0b1011001101101110000010001010001";
        ram[38] = "0b1100100111100101100111000011011";
        ram[39] = "0b1000100101000101100010000101100";
        ram[40] = "0b1111111011011100001011000000111";
        ram[41] = "0b1010001011011101011101011010101";
        ram[42] = "0b1001000010010010000101101100011";
        ram[43] = "0b1011101110001111001000100010001";
        ram[44] = "0b1011111010100100010000101111101";
        ram[45] = "0b1100101000000100100011000011010";
        ram[46] = "0b1100100000000000110000111010101";
        ram[47] = "0b1100000011111010110100000111010";


SC_METHOD(prc_write_0);
  sensitive<<clk.pos();
   }


void prc_write_0()
{
    if (ce0.read() == sc_dt::Log_1) 
    {
            if(address0.read().is_01() && address0.read().to_uint()<AddressRange)
              q0 = ram[address0.read().to_uint()];
            else
              q0 = sc_lv<DataWidth>();
    }
}


}; //endmodule


SC_MODULE(QuantAct_m_4) {


static const unsigned DataWidth = 31;
static const unsigned AddressRange = 48;
static const unsigned AddressWidth = 6;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


QuantAct_m_4_ram* meminst;


SC_CTOR(QuantAct_m_4) {
meminst = new QuantAct_m_4_ram("QuantAct_m_4_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~QuantAct_m_4() {
    delete meminst;
}


};//endmodule
#endif
