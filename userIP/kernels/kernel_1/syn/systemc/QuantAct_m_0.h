// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __QuantAct_m_0_H__
#define __QuantAct_m_0_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct QuantAct_m_0_ram : public sc_core::sc_module {

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


   SC_CTOR(QuantAct_m_0_ram) {
        ram[0] = "0b1100111100100010010010100111101";
        ram[1] = "0b1100100100110110101111000011010";
        ram[2] = "0b1110010000111111010001100110110";
        ram[3] = "0b1100110001011111110100110111000";
        ram[4] = "0b1000011000011011001110100010111";
        ram[5] = "0b1110001110010101101001101011100";
        ram[6] = "0b1000011101000101001001101111010";
        ram[7] = "0b1110011110100001001100000011011";
        ram[8] = "0b1000101100101111100110111000101";
        ram[9] = "0b1001011110011100000001101111001";
        ram[10] = "0b1010000110101111111001011101010";
        ram[11] = "0b1111111110101010010111111000110";
        ram[12] = "0b1111000110001000001100000000001";
        ram[13] = "0b1001100101101111100001000010100";
        ram[14] = "0b1000110000111000110011011101101";
        ram[15] = "0b1001101001101010010111010001010";
        ram[16] = "0b1011111100001011010110001100010";
        ram[17] = "0b1101011000101010000100101110011";
        ram[18] = "0b1110011010000001101100101000100";
        ram[19] = "0b1101011111110001011110000111101";
        ram[20] = "0b1100100001111111000011001001101";
        ram[21] = "0b1001001011100000011101000001010";
        ram[22] = "0b1010111100110110100100110010000";
        ram[23] = "0b1010011010100011111101000011000";
        ram[24] = "0b1111101100011001101111011011010";
        ram[25] = "0b1111011001100001000110111101011";
        ram[26] = "0b1001100011010111100110100011110";
        ram[27] = "0b1111001000100100110000101011101";
        ram[28] = "0b1110000100110100010010101001111";
        ram[29] = "0b1100011000011101111000010001111";
        ram[30] = "0b1100010111100101011001000111111";
        ram[31] = "0b1100100110101011000100101111110";
        ram[32] = "0b1011111101001100000001111101001";
        ram[33] = "0b1010111010010111010010110101011";
        ram[34] = "0b1010001010000100100110011001101";
        ram[35] = "0b1100000111100010111011000010100";
        ram[36] = "0b1010011000100111111111110001011";
        ram[37] = "0b1000100011001000111111100000000";
        ram[38] = "0b1100001101110010100010110010010";
        ram[39] = "0b1001011001000101010010000001010";
        ram[40] = "0b1010011100101110111110001011001";
        ram[41] = "0b1011001010011001110001001100110";
        ram[42] = "0b1111111010110011110000011100000";
        ram[43] = "0b1100011011011011110011100100100";
        ram[44] = "0b1010111111101110100000110010110";
        ram[45] = "0b1011001011011101011111011011100";
        ram[46] = "0b1100010000011010001010000110101";
        ram[47] = "0b1101011011110110000011101101010";


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


SC_MODULE(QuantAct_m_0) {


static const unsigned DataWidth = 31;
static const unsigned AddressRange = 48;
static const unsigned AddressWidth = 6;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


QuantAct_m_0_ram* meminst;


SC_CTOR(QuantAct_m_0) {
meminst = new QuantAct_m_0_ram("QuantAct_m_0_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~QuantAct_m_0() {
    delete meminst;
}


};//endmodule
#endif
