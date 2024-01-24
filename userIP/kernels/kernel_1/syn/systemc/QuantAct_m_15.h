// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __QuantAct_m_15_H__
#define __QuantAct_m_15_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct QuantAct_m_15_ram : public sc_core::sc_module {

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


   SC_CTOR(QuantAct_m_15_ram) {
        ram[0] = "0b1110000110011000100110111000001";
        ram[1] = "0b1101000010110111101010011000011";
        ram[2] = "0b1101110001110011000001010100001";
        ram[3] = "0b1101110011110111000111001111010";
        ram[4] = "0b1000000101101111010110001111101";
        ram[5] = "0b1100100110001111110110001011011";
        ram[6] = "0b1100100111110111011010001001110";
        ram[7] = "0b1000101001011000111010100110111";
        ram[8] = "0b1111110101100001010011001011101";
        ram[9] = "0b1100100100101110001100011001011";
        ram[10] = "0b1111100010000111111110110010010";
        ram[11] = "0b1011101100101111100001111001110";
        ram[12] = "0b1111001111110010110101011100110";
        ram[13] = "0b1010010011110001001101111010011";
        ram[14] = "0b1010011011101001000011101111110";
        ram[15] = "0b1111010101001101011111100110010";
        ram[16] = "0b1100011111100110111001011010001";
        ram[17] = "0b1101010001001101110111001011100";
        ram[18] = "0b1101101000111101010001001110010";
        ram[19] = "0b1100111011000010000101100011000";
        ram[20] = "0b1111110001110011110001001001110";
        ram[21] = "0b1011110100010001000001001110001";
        ram[22] = "0b1001011000011011001010010101110";
        ram[23] = "0b1001001001001101011111101011100";
        ram[24] = "0b1001001100010000111011001010001";
        ram[25] = "0b1000001011000101001001100111010";
        ram[26] = "0b1111100010100001000110110011110";
        ram[27] = "0b1111111101000101110011010001010";
        ram[28] = "0b1110011010001000000111100111010";
        ram[29] = "0b1001010010110101101110110011001";
        ram[30] = "0b1100011001011010100100001111011";
        ram[31] = "0b1101011100111101000011111100110";
        ram[32] = "0b1011101100110000000111011111110";
        ram[33] = "0b1100010101101000011101111100101";
        ram[34] = "0b1010001010011010101100001111010";
        ram[35] = "0b1011110100010001101000001110101";
        ram[36] = "0b1001010110011101101100011001100";
        ram[37] = "0b1000100011110100100110001001110";
        ram[38] = "0b1000001100011111100011111110111";
        ram[39] = "0b1011110101010101001110110100111";
        ram[40] = "0b1100011101010000011000110011111";
        ram[41] = "0b1110010100101111011101110010101";
        ram[42] = "0b1010010111010010010111011000000";
        ram[43] = "0b1000111001100001011101111010000";
        ram[44] = "0b1011110111000010000101011011000";
        ram[45] = "0b1011000110110010100100110010000";
        ram[46] = "0b1111011001011001111011010111001";
        ram[47] = "0b1010010001000100111000101110000";


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


SC_MODULE(QuantAct_m_15) {


static const unsigned DataWidth = 31;
static const unsigned AddressRange = 48;
static const unsigned AddressWidth = 6;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


QuantAct_m_15_ram* meminst;


SC_CTOR(QuantAct_m_15) {
meminst = new QuantAct_m_15_ram("QuantAct_m_15_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~QuantAct_m_15() {
    delete meminst;
}


};//endmodule
#endif
