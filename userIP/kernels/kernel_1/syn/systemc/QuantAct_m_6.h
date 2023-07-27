// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __QuantAct_m_6_H__
#define __QuantAct_m_6_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct QuantAct_m_6_ram : public sc_core::sc_module {

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


   SC_CTOR(QuantAct_m_6_ram) {
        ram[0] = "0b1110110110111110010001100110001";
        ram[1] = "0b1101001000110100000100000000110";
        ram[2] = "0b1100100001100011111010001111001";
        ram[3] = "0b1101011101110010010101000011001";
        ram[4] = "0b1110000011110101011100001100010";
        ram[5] = "0b1110001011110111111010011000001";
        ram[6] = "0b1000101001101111001111001001010";
        ram[7] = "0b1000100000100101100010101110011";
        ram[8] = "0b1011101100010111010100011000111";
        ram[9] = "0b1001000010011011000000101010000";
        ram[10] = "0b1110111001101110010001111101011";
        ram[11] = "0b1001000101001001010010001110000";
        ram[12] = "0b1001000001100110101100100111000";
        ram[13] = "0b1001010110000000100001011101101";
        ram[14] = "0b1010000101001111101001100011110";
        ram[15] = "0b1111000011100100010011001111101";
        ram[16] = "0b1100100001100001100100011011100";
        ram[17] = "0b1101101000100110001000000111001";
        ram[18] = "0b1000001000001001001110101001011";
        ram[19] = "0b1110100011001010001110110110110";
        ram[20] = "0b1100000101011000100100010011111";
        ram[21] = "0b1000110001101000110010101001101";
        ram[22] = "0b1000110000110110010101010100011";
        ram[23] = "0b1000011001110100110001001110111";
        ram[24] = "0b1000101000000011101110111001101";
        ram[25] = "0b1010010010001011110100001010000";
        ram[26] = "0b1000011001101001011000011010000";
        ram[27] = "0b1000101100101110001101000000000";
        ram[28] = "0b1100100100000111100001001100000";
        ram[29] = "0b1110100001011010111101010111011";
        ram[30] = "0b1110011001001101011011011010011";
        ram[31] = "0b1100010110000110101011110111111";
        ram[32] = "0b1010100011111111101001111111011";
        ram[33] = "0b1001101001000110100000011001010";
        ram[34] = "0b1100001011110111110101110010001";
        ram[35] = "0b1100010111010110111010010011001";
        ram[36] = "0b1111011101111110111101110010111";
        ram[37] = "0b1010110101101100101011000111111";
        ram[38] = "0b1000111101111011000010110110100";
        ram[39] = "0b1000010111110111000101110111010";
        ram[40] = "0b1000010110100000111001010010011";
        ram[41] = "0b1000011000111011101101010101001";
        ram[42] = "0b1001001101101100010110000111010";
        ram[43] = "0b1000101100010011011100011001010";
        ram[44] = "0b1100001011110001000110011101000";
        ram[45] = "0b1010011011101111100100011000011";
        ram[46] = "0b1100101010010001111100001111110";
        ram[47] = "0b1010110110101010001010110011111";


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


SC_MODULE(QuantAct_m_6) {


static const unsigned DataWidth = 31;
static const unsigned AddressRange = 48;
static const unsigned AddressWidth = 6;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


QuantAct_m_6_ram* meminst;


SC_CTOR(QuantAct_m_6) {
meminst = new QuantAct_m_6_ram("QuantAct_m_6_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~QuantAct_m_6() {
    delete meminst;
}


};//endmodule
#endif
