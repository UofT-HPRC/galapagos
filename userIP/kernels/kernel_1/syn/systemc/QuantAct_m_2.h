// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __QuantAct_m_2_H__
#define __QuantAct_m_2_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct QuantAct_m_2_ram : public sc_core::sc_module {

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


   SC_CTOR(QuantAct_m_2_ram) {
        ram[0] = "0b1000001001001101110101001000000";
        ram[1] = "0b1100101101000001101001011000111";
        ram[2] = "0b1101011110010100000001101101010";
        ram[3] = "0b1110100100100010110111011101010";
        ram[4] = "0b1001000101100001111101011010011";
        ram[5] = "0b1000100001110011011110101111001";
        ram[6] = "0b1111100001001111111111110110100";
        ram[7] = "0b1100100011100011100100011000001";
        ram[8] = "0b1000000001000000000000000110000";
        ram[9] = "0b1001110000001111011101100100010";
        ram[10] = "0b1100100100111101011110101010100";
        ram[11] = "0b1000100101001111010000011111100";
        ram[12] = "0b1000001010001001110100111111100";
        ram[13] = "0b1001101011111000100100110000100";
        ram[14] = "0b1001101100000010010101101101010";
        ram[15] = "0b1111100111101110010100100011100";
        ram[16] = "0b1110011010100101101111011000010";
        ram[17] = "0b1100100100000100111101110100000";
        ram[18] = "0b1100110100010100100101111011001";
        ram[19] = "0b1110111011111111001010001010111";
        ram[20] = "0b1111111010001010111001100110010";
        ram[21] = "0b1100010000111111110010111000111";
        ram[22] = "0b1100010001000001110110000010100";
        ram[23] = "0b1001111111000110010001001101001";
        ram[24] = "0b1111010011010110011010000101111";
        ram[25] = "0b1111111011000110010011110111110";
        ram[26] = "0b1110011101001011100011000101111";
        ram[27] = "0b1111100110111101101101101001111";
        ram[28] = "0b1001000011010101110010110010110";
        ram[29] = "0b1010110111001110011000110111010";
        ram[30] = "0b1100101011110100101100011010010";
        ram[31] = "0b1101111011101011100000100110101";
        ram[32] = "0b1100000011010011110011101101001";
        ram[33] = "0b1001101000110101001100101010111";
        ram[34] = "0b1100000100101110100010000000001";
        ram[35] = "0b1010000111101001100110000011111";
        ram[36] = "0b1001011101000110001110010100010";
        ram[37] = "0b1001000101011010100101111100011";
        ram[38] = "0b1000001010011110010101001101111";
        ram[39] = "0b1010001110000011011110101100100";
        ram[40] = "0b1011100011010111010010100011111";
        ram[41] = "0b1100101010010010011100001100000";
        ram[42] = "0b1011100011001010110111101111000";
        ram[43] = "0b1001000101110110000111011100101";
        ram[44] = "0b1100101001000000011101110101001";
        ram[45] = "0b1001011001100110111011010010010";
        ram[46] = "0b1011111010010101100101011110110";
        ram[47] = "0b1011010100010110010001111111001";


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


SC_MODULE(QuantAct_m_2) {


static const unsigned DataWidth = 31;
static const unsigned AddressRange = 48;
static const unsigned AddressWidth = 6;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


QuantAct_m_2_ram* meminst;


SC_CTOR(QuantAct_m_2) {
meminst = new QuantAct_m_2_ram("QuantAct_m_2_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~QuantAct_m_2() {
    delete meminst;
}


};//endmodule
#endif
