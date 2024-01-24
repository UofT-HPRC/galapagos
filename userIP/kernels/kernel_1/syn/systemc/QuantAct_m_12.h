// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __QuantAct_m_12_H__
#define __QuantAct_m_12_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct QuantAct_m_12_ram : public sc_core::sc_module {

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


   SC_CTOR(QuantAct_m_12_ram) {
        ram[0] = "0b1100110001100101010011111010110";
        ram[1] = "0b1110010011101110010000000111000";
        ram[2] = "0b1001010110011001011010110010100";
        ram[3] = "0b1000000100111111110101101110100";
        ram[4] = "0b1000101010000010010001001111110";
        ram[5] = "0b1101101110111011110011011000000";
        ram[6] = "0b1111110111110100100101101110001";
        ram[7] = "0b1001101101011000011001001111010";
        ram[8] = "0b1000100110000001001101000010010";
        ram[9] = "0b1111011011000011111100110001101";
        ram[10] = "0b1110111001101001011111010001110";
        ram[11] = "0b1110010111001000001110110100110";
        ram[12] = "0b1010100001000010101000101001010";
        ram[13] = "0b1010011001010100110111100010111";
        ram[14] = "0b1001011111111010011000111100001";
        ram[15] = "0b1011100101010011100010001101010";
        ram[16] = "0b1100110010100101010111010000110";
        ram[17] = "0b1100101011101010000110111000110";
        ram[18] = "0b1101010100111100100011010000110";
        ram[19] = "0b1000111011000110101001110100000";
        ram[20] = "0b1000011100011000011001100110001";
        ram[21] = "0b1100001110000001011111110110101";
        ram[22] = "0b1010011011011001100100011110100";
        ram[23] = "0b1111100111101101001101010100111";
        ram[24] = "0b1001011100010101001101011010011";
        ram[25] = "0b1110001011011110010010001000011";
        ram[26] = "0b1001011111000010100101111000010";
        ram[27] = "0b1000101011100100010100011101111";
        ram[28] = "0b1100101011010011000101101100001";
        ram[29] = "0b1000111110110000000010001001010";
        ram[30] = "0b1101001111011111100110001000101";
        ram[31] = "0b1100100101000100001101001001100";
        ram[32] = "0b1001011000010000101101010011000";
        ram[33] = "0b1011101101110110101111101101101";
        ram[34] = "0b1010001011000010100000101010000";
        ram[35] = "0b1010100010110101110000111001000";
        ram[36] = "0b1000001110100010110110111000111";
        ram[37] = "0b1001111101011010000001100111100";
        ram[38] = "0b1101100101111010011101010100010";
        ram[39] = "0b1000100110011000010111010001110";
        ram[40] = "0b1001000111001000111011100000101";
        ram[41] = "0b1100101101110100000000110010010";
        ram[42] = "0b1001010001011010101000001100011";
        ram[43] = "0b1001101101010100010001100001011";
        ram[44] = "0b1100011001101101110001001110011";
        ram[45] = "0b1100011100101011100001011111011";
        ram[46] = "0b1011111000110011001111111000110";
        ram[47] = "0b1101001101111010100001100101000";


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


SC_MODULE(QuantAct_m_12) {


static const unsigned DataWidth = 31;
static const unsigned AddressRange = 48;
static const unsigned AddressWidth = 6;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


QuantAct_m_12_ram* meminst;


SC_CTOR(QuantAct_m_12) {
meminst = new QuantAct_m_12_ram("QuantAct_m_12_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~QuantAct_m_12() {
    delete meminst;
}


};//endmodule
#endif
