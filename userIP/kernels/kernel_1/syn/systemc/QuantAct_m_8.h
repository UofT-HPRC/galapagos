// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __QuantAct_m_8_H__
#define __QuantAct_m_8_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct QuantAct_m_8_ram : public sc_core::sc_module {

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


   SC_CTOR(QuantAct_m_8_ram) {
        ram[0] = "0b1011101100111100001001101110110";
        ram[1] = "0b1010001000000000010000000101001";
        ram[2] = "0b1101000000011000000110010101111";
        ram[3] = "0b1110011111011001010011011101111";
        ram[4] = "0b1000110010111010111111101101001";
        ram[5] = "0b1100101001010110011111011011100";
        ram[6] = "0b1111110111111111010000000011010";
        ram[7] = "0b1001001101010110111001100010101";
        ram[8] = "0b1001100101000010100000100000001";
        ram[9] = "0b1110101110101011110000110011110";
        ram[10] = "0b1100100000010000010001000010010";
        ram[11] = "0b1010110111011110011100100110001";
        ram[12] = "0b1010010100011010100101100010101";
        ram[13] = "0b1011010000011000011001000000011";
        ram[14] = "0b1010001111010110110011010000111";
        ram[15] = "0b1000111011011001011110111010011";
        ram[16] = "0b1100100001001010110100001100010";
        ram[17] = "0b1011110111011100100011010111111";
        ram[18] = "0b1100101011001001001110100001011";
        ram[19] = "0b1100001111001010011010001101000";
        ram[20] = "0b1001111010101010001111000110110";
        ram[21] = "0b1001001010011111100000100101001";
        ram[22] = "0b1000011000101100111011010010010";
        ram[23] = "0b1010100001111111011101101001101";
        ram[24] = "0b1001010100101001101101111000011";
        ram[25] = "0b1000110100010010110101101101100";
        ram[26] = "0b1001011000001001101110111111000";
        ram[27] = "0b1110110011110100001101100100100";
        ram[28] = "0b1100111111101110101001111010001";
        ram[29] = "0b1100100011011000001101011000110";
        ram[30] = "0b1100101001011101001000010000101";
        ram[31] = "0b1100011000011010000000011001000";
        ram[32] = "0b1010100111010111110100110100010";
        ram[33] = "0b1100010001010010101011110011011";
        ram[34] = "0b1000101001111000100100110100011";
        ram[35] = "0b1001100111101010000001111000101";
        ram[36] = "0b1011111011000000110010101100011";
        ram[37] = "0b1010101100111100010101000000001";
        ram[38] = "0b1000111111111001000001100101010";
        ram[39] = "0b1100100000101000111100001110101";
        ram[40] = "0b1100111000101111000010100011011";
        ram[41] = "0b1111010100001010111110100010000";
        ram[42] = "0b1001100111011101000001001011110";
        ram[43] = "0b1001011111100100010010100010010";
        ram[44] = "0b1100011101101111101101011001101";
        ram[45] = "0b1100100100001000101110010110100";
        ram[46] = "0b1100100000001001110011100000110";
        ram[47] = "0b1100000001011011011111100111101";


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


SC_MODULE(QuantAct_m_8) {


static const unsigned DataWidth = 31;
static const unsigned AddressRange = 48;
static const unsigned AddressWidth = 6;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


QuantAct_m_8_ram* meminst;


SC_CTOR(QuantAct_m_8) {
meminst = new QuantAct_m_8_ram("QuantAct_m_8_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~QuantAct_m_8() {
    delete meminst;
}


};//endmodule
#endif
