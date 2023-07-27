// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __QuantAct_m_7_H__
#define __QuantAct_m_7_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct QuantAct_m_7_ram : public sc_core::sc_module {

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


   SC_CTOR(QuantAct_m_7_ram) {
        ram[0] = "0b1000111001010000100110001010100";
        ram[1] = "0b1111101101000000000100010011100";
        ram[2] = "0b1101110111100000001011001110001";
        ram[3] = "0b1001010101100000110001011101010";
        ram[4] = "0b1110101101111001010010111010010";
        ram[5] = "0b1111010011011001110001011110011";
        ram[6] = "0b1101011100100000001000110101111";
        ram[7] = "0b1101011001111100001110000110110";
        ram[8] = "0b1000001100000010100011001110010";
        ram[9] = "0b1111100001100001100001111111100";
        ram[10] = "0b1010010010011100011000000111001";
        ram[11] = "0b1111001100011110001010110001010";
        ram[12] = "0b1001010101000010111110101010101";
        ram[13] = "0b1011000011011010010010010100110";
        ram[14] = "0b1000011111011101100100110111010";
        ram[15] = "0b1000011110111100011011011001100";
        ram[16] = "0b1101000000001100010010100001100";
        ram[17] = "0b1101101011010100110111111010101";
        ram[18] = "0b1100100010110111110010111111000";
        ram[19] = "0b1100100100100010010010111011001";
        ram[20] = "0b1000110101010011100110110110000";
        ram[21] = "0b1000111110100011110111010010100";
        ram[22] = "0b1001001011101010001100100011101";
        ram[23] = "0b1000011011011101101101000111001";
        ram[24] = "0b1000010010101100011101110000001";
        ram[25] = "0b1110011101011101100010101000010";
        ram[26] = "0b1110110010100100000111111010000";
        ram[27] = "0b1001001101101100100010110101011";
        ram[28] = "0b1000100101001000101000001110100";
        ram[29] = "0b1100100000001110101101110100110";
        ram[30] = "0b1101001000011000100101111001100";
        ram[31] = "0b1011011011010101110001011011011";
        ram[32] = "0b1100011101111101111000101110010";
        ram[33] = "0b1101000010001011011001100111010";
        ram[34] = "0b1011010110000110110100010100010";
        ram[35] = "0b1001100001011000101101100110011";
        ram[36] = "0b1010011100010100101011110100000";
        ram[37] = "0b1101100000111111111011011110111";
        ram[38] = "0b1001010101011000000100101000001";
        ram[39] = "0b1001010001101110011011100111100";
        ram[40] = "0b1110110100110111101010010001101";
        ram[41] = "0b1000100010010001000000110110011";
        ram[42] = "0b1000111001110100001101110001101";
        ram[43] = "0b1000100110111001000001010111101";
        ram[44] = "0b1010011001101000000101011000001";
        ram[45] = "0b1011110001110011011100011000001";
        ram[46] = "0b1011000001101111111000010100100";
        ram[47] = "0b1100110010011101101000111001100";


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


SC_MODULE(QuantAct_m_7) {


static const unsigned DataWidth = 31;
static const unsigned AddressRange = 48;
static const unsigned AddressWidth = 6;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


QuantAct_m_7_ram* meminst;


SC_CTOR(QuantAct_m_7) {
meminst = new QuantAct_m_7_ram("QuantAct_m_7_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~QuantAct_m_7() {
    delete meminst;
}


};//endmodule
#endif
