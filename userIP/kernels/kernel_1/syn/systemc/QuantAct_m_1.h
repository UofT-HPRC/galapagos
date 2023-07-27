// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __QuantAct_m_1_H__
#define __QuantAct_m_1_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct QuantAct_m_1_ram : public sc_core::sc_module {

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


   SC_CTOR(QuantAct_m_1_ram) {
        ram[0] = "0b1101001110010101001101101010010";
        ram[1] = "0b1101001001101000001000001110101";
        ram[2] = "0b1110001110100111111100001001110";
        ram[3] = "0b1111101110010000000000000100111";
        ram[4] = "0b1000011010010000101100000010010";
        ram[5] = "0b1100101011100010001101100000000";
        ram[6] = "0b1010101010110101011110011010110";
        ram[7] = "0b1111000010111100001011010100110";
        ram[8] = "0b1001000001001001000111100001110";
        ram[9] = "0b1000001100001000100101010101000";
        ram[10] = "0b1001001010001111110101011100000";
        ram[11] = "0b1110110110110001000010110000110";
        ram[12] = "0b1001101000010000000110010111101";
        ram[13] = "0b1001001000101111111101110110010";
        ram[14] = "0b1000011011111011101011110001100";
        ram[15] = "0b1000000101000111110100111010000";
        ram[16] = "0b1101001111001101100100100111101";
        ram[17] = "0b1100111111100010111111001000101";
        ram[18] = "0b1101100100010000011001000100111";
        ram[19] = "0b1110000111100111111101111001110";
        ram[20] = "0b1001011011000100101010101000101";
        ram[21] = "0b1001110011110010100111000100101";
        ram[22] = "0b1001100111101001100111100110010";
        ram[23] = "0b1011110111100101110000001001001";
        ram[24] = "0b1101011001111010110000110101001";
        ram[25] = "0b1001101001111010111001100010000";
        ram[26] = "0b1001100010101010001001011110011";
        ram[27] = "0b1110101111100001110101111010110";
        ram[28] = "0b1000100011010000000101110111100";
        ram[29] = "0b1011100110100100101000100110011";
        ram[30] = "0b1000111011001110110000110001001";
        ram[31] = "0b1100111111000110100110100000110";
        ram[32] = "0b1000011101111010100001111001111";
        ram[33] = "0b1000110001100111110111110110111";
        ram[34] = "0b1101011100101001110111001111111";
        ram[35] = "0b1001110001100111101010001011110";
        ram[36] = "0b1001111010001101100001110110010";
        ram[37] = "0b1001110001010000101000101101000";
        ram[38] = "0b1001001010001010111111000101011";
        ram[39] = "0b1001010111010110100110111110001";
        ram[40] = "0b1110100001111111101101010101101";
        ram[41] = "0b1100000111100011110011100100100";
        ram[42] = "0b1010010110111000111101110101000";
        ram[43] = "0b1100010110011100100111010000010";
        ram[44] = "0b1000010101100111011010110100010";
        ram[45] = "0b1010010111001101111111100011000";
        ram[46] = "0b1100010110110010100110100101111";
        ram[47] = "0b1100011111001101010000000010000";


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


SC_MODULE(QuantAct_m_1) {


static const unsigned DataWidth = 31;
static const unsigned AddressRange = 48;
static const unsigned AddressWidth = 6;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


QuantAct_m_1_ram* meminst;


SC_CTOR(QuantAct_m_1) {
meminst = new QuantAct_m_1_ram("QuantAct_m_1_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~QuantAct_m_1() {
    delete meminst;
}


};//endmodule
#endif
