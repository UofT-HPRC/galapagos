// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __QuantAct_m_13_H__
#define __QuantAct_m_13_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct QuantAct_m_13_ram : public sc_core::sc_module {

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


   SC_CTOR(QuantAct_m_13_ram) {
        ram[0] = "0b1000011000100001111111110110110";
        ram[1] = "0b1000010011100101011101011010100";
        ram[2] = "0b1101000110010000010001001100001";
        ram[3] = "0b1101000110010001111010010101100";
        ram[4] = "0b1010110111011101001111101101101";
        ram[5] = "0b1111110011010011101000001011011";
        ram[6] = "0b1000111100100110001010101001100";
        ram[7] = "0b1101001100000011010011000001101";
        ram[8] = "0b1110110001110111100000001111101";
        ram[9] = "0b1101000111110101100110001001000";
        ram[10] = "0b1001011101111000000000011001110";
        ram[11] = "0b1000111001010000011011101101010";
        ram[12] = "0b1000110011001001101101100000110";
        ram[13] = "0b1001100100011000111110111110110";
        ram[14] = "0b1000100001000100111100111101111";
        ram[15] = "0b1100100001011000111100011001111";
        ram[16] = "0b1100100000111011010000011001100";
        ram[17] = "0b1101101111101101110101110110110";
        ram[18] = "0b1100111010001101010011010000011";
        ram[19] = "0b1110100010001101011111110010010";
        ram[20] = "0b1100100011110100110100001001001";
        ram[21] = "0b1001101001001000100001110110100";
        ram[22] = "0b1001000011001101011111101011111";
        ram[23] = "0b1000110000010011111110011001111";
        ram[24] = "0b1001011010010110100000000010110";
        ram[25] = "0b1000100011100011111011001000010";
        ram[26] = "0b1000000110001011011111000010100";
        ram[27] = "0b1001001000111001100000000110011";
        ram[28] = "0b1110110101010000011011111110000";
        ram[29] = "0b1010000111001100101101011111111";
        ram[30] = "0b1001110110011110111010000000010";
        ram[31] = "0b1110101100010000001111101011101";
        ram[32] = "0b1000110011001100011001010111011";
        ram[33] = "0b1001000101110011111011100010001";
        ram[34] = "0b1000100001001000101110101000110";
        ram[35] = "0b1010001011111001100011011000100";
        ram[36] = "0b1110111111011001011010111110011";
        ram[37] = "0b1001011111111110001111111110110";
        ram[38] = "0b1000000111000100100000011001011";
        ram[39] = "0b1001110100100110001001101001111";
        ram[40] = "0b1000100111100001110001010010010";
        ram[41] = "0b1101010000101001011001100101001";
        ram[42] = "0b1001000111010100010011111010011";
        ram[43] = "0b1000000100100100101010100011010";
        ram[44] = "0b1011010110000001100110110010001";
        ram[45] = "0b1100100111111010110000101100000";
        ram[46] = "0b1101110000110101101110010110001";
        ram[47] = "0b1110011101101011011001010100010";


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


SC_MODULE(QuantAct_m_13) {


static const unsigned DataWidth = 31;
static const unsigned AddressRange = 48;
static const unsigned AddressWidth = 6;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


QuantAct_m_13_ram* meminst;


SC_CTOR(QuantAct_m_13) {
meminst = new QuantAct_m_13_ram("QuantAct_m_13_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~QuantAct_m_13() {
    delete meminst;
}


};//endmodule
#endif
