// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __QuantAct_m_14_H__
#define __QuantAct_m_14_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct QuantAct_m_14_ram : public sc_core::sc_module {

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


   SC_CTOR(QuantAct_m_14_ram) {
        ram[0] = "0b1110100011000110111100010001110";
        ram[1] = "0b1111000011000011010111110001010";
        ram[2] = "0b1111001110001110111101011111100";
        ram[3] = "0b1100110100111110011000101100000";
        ram[4] = "0b1010011100101100011111010100101";
        ram[5] = "0b1001110101111101000000010110001";
        ram[6] = "0b1100110110000000101110101110110";
        ram[7] = "0b1101111100111101011000001011010";
        ram[8] = "0b1100010000010001110101010011001";
        ram[9] = "0b1110100111111011011101001000101";
        ram[10] = "0b1111001101101001100111111011011";
        ram[11] = "0b1001101000101000001110110011000";
        ram[12] = "0b1001110000001100011111100111110";
        ram[13] = "0b1001111010010000101001011001110";
        ram[14] = "0b1010111000011110100001111010110";
        ram[15] = "0b1011010010010000111110111001100";
        ram[16] = "0b1100100110011111000000010000000";
        ram[17] = "0b1101110010001011100010010101001";
        ram[18] = "0b1101110011010111001101000011101";
        ram[19] = "0b1101011101100111111101011000000";
        ram[20] = "0b1010011010011011101000110011101";
        ram[21] = "0b1010100010100001110010001010010";
        ram[22] = "0b1000000001011000111111110001111";
        ram[23] = "0b1100000100011110010111110001001";
        ram[24] = "0b1101111000011101001011100010000";
        ram[25] = "0b1101110111010100101001110001100";
        ram[26] = "0b1010010000100011001101011110011";
        ram[27] = "0b1000100011100010010101010111111";
        ram[28] = "0b1100011110011110000110101100001";
        ram[29] = "0b1101000101100000111001101101110";
        ram[30] = "0b1000110100110110000111010001101";
        ram[31] = "0b1101110011010000000110010001000";
        ram[32] = "0b1001110101100101011100000110011";
        ram[33] = "0b1001111011100010000011100101001";
        ram[34] = "0b1100001011101110100111000010010";
        ram[35] = "0b1001000010011110011101001000001";
        ram[36] = "0b1000010101011000110011100000110";
        ram[37] = "0b1000001001000100000011010101000";
        ram[38] = "0b1001110111001111011100111100101";
        ram[39] = "0b1001101010010000001100001101011";
        ram[40] = "0b1111001110110000011111001000000";
        ram[41] = "0b1101010010000100000010001110011";
        ram[42] = "0b1111001001011011101000000110101";
        ram[43] = "0b1001111000000000011011010011101";
        ram[44] = "0b1110001101010000000100011100111";
        ram[45] = "0b1011000000011111100000110110010";
        ram[46] = "0b1010000100010110010001110111111";
        ram[47] = "0b1001111110101110011101011010100";


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


SC_MODULE(QuantAct_m_14) {


static const unsigned DataWidth = 31;
static const unsigned AddressRange = 48;
static const unsigned AddressWidth = 6;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


QuantAct_m_14_ram* meminst;


SC_CTOR(QuantAct_m_14) {
meminst = new QuantAct_m_14_ram("QuantAct_m_14_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~QuantAct_m_14() {
    delete meminst;
}


};//endmodule
#endif
