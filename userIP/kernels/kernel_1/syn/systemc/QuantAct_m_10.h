// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __QuantAct_m_10_H__
#define __QuantAct_m_10_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct QuantAct_m_10_ram : public sc_core::sc_module {

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


   SC_CTOR(QuantAct_m_10_ram) {
        ram[0] = "0b1111011011111011100011101011101";
        ram[1] = "0b1100001100000010000111110011100";
        ram[2] = "0b1101010100011100100000100110100";
        ram[3] = "0b1101010110101101110011011000011";
        ram[4] = "0b1011000001011001100000000110111";
        ram[5] = "0b1000010000110111100100010011011";
        ram[6] = "0b1111001101100111011111011010000";
        ram[7] = "0b1100100100111001110000111100111";
        ram[8] = "0b1001011000100011110101001100010";
        ram[9] = "0b1010100010101100101101011100110";
        ram[10] = "0b1111000111111011111100101010110";
        ram[11] = "0b1000110001101010101010001101101";
        ram[12] = "0b1001010001001011011001100110011";
        ram[13] = "0b1001101011010111011000010100110";
        ram[14] = "0b1001010011110011011001100000100";
        ram[15] = "0b1001100000111000100101100100011";
        ram[16] = "0b1100010110010100010100111111100";
        ram[17] = "0b1100111101100100111001010101101";
        ram[18] = "0b1110111011111011001001110011010";
        ram[19] = "0b1100010110011101111000101010001";
        ram[20] = "0b1001100001110010010101110110010";
        ram[21] = "0b1010001110111000110010000011101";
        ram[22] = "0b1011000100101001011110010100111";
        ram[23] = "0b1000010111001010111000000100001";
        ram[24] = "0b1000010010111110000110111101011";
        ram[25] = "0b1110110010100010111001000010111";
        ram[26] = "0b1101100111010110000110101100000";
        ram[27] = "0b1101111000001100011111000110001";
        ram[28] = "0b1100100000101110110000001101000";
        ram[29] = "0b1110001000110000110010111000011";
        ram[30] = "0b1100101111110001000110001000110";
        ram[31] = "0b1100010100011001010101010101101";
        ram[32] = "0b1001100001111111011100011111000";
        ram[33] = "0b1011011101110101000111100111100";
        ram[34] = "0b1001010011101011110100001100001";
        ram[35] = "0b1100100100001100110110010110100";
        ram[36] = "0b1000110101100001000011000110110";
        ram[37] = "0b1010001100101000100100001111101";
        ram[38] = "0b1001100100010011110010010011000";
        ram[39] = "0b1001000011111111111101110111011";
        ram[40] = "0b1100000010111000101101100111100";
        ram[41] = "0b1011010111101101001000100101010";
        ram[42] = "0b1010000011110110000110001010101";
        ram[43] = "0b1100011001111001111110011110111";
        ram[44] = "0b1100011110010111110010110001101";
        ram[45] = "0b1101101011011001111010001001001";
        ram[46] = "0b1011010100111110011100101111000";
        ram[47] = "0b1101011110111111111111110100011";


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


SC_MODULE(QuantAct_m_10) {


static const unsigned DataWidth = 31;
static const unsigned AddressRange = 48;
static const unsigned AddressWidth = 6;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


QuantAct_m_10_ram* meminst;


SC_CTOR(QuantAct_m_10) {
meminst = new QuantAct_m_10_ram("QuantAct_m_10_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~QuantAct_m_10() {
    delete meminst;
}


};//endmodule
#endif
