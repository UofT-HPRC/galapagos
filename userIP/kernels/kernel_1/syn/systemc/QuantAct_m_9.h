// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __QuantAct_m_9_H__
#define __QuantAct_m_9_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct QuantAct_m_9_ram : public sc_core::sc_module {

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


   SC_CTOR(QuantAct_m_9_ram) {
        ram[0] = "0b1111110110000010110110110010110";
        ram[1] = "0b1100011001111011011111111111111";
        ram[2] = "0b1101111010000110110111011101101";
        ram[3] = "0b1110001101000110011111000101110";
        ram[4] = "0b1101001111101011011000100010101";
        ram[5] = "0b1110100001110110011111101110000";
        ram[6] = "0b1111010000001011110111010000011";
        ram[7] = "0b1110010110000100111111011001111";
        ram[8] = "0b1001000001000000011010011010101";
        ram[9] = "0b1001100001011100100010101010011";
        ram[10] = "0b1001111011110101010100001111010";
        ram[11] = "0b1000101001000001110111100100101";
        ram[12] = "0b1001011010011011001100110010100";
        ram[13] = "0b1000100100100111010111101100011";
        ram[14] = "0b1010010101101010000111100101110";
        ram[15] = "0b1001111111111110011001011101111";
        ram[16] = "0b1101010000010101011101011001010";
        ram[17] = "0b1110100000001101010100000000101";
        ram[18] = "0b1101110010100111010111111001111";
        ram[19] = "0b1101000010100011101010001111001";
        ram[20] = "0b1110110010100000000100011011100";
        ram[21] = "0b1000101011010011111000001001001";
        ram[22] = "0b1000100111010010101001100111011";
        ram[23] = "0b1001110001000011011000101111011";
        ram[24] = "0b1100111111101110011000111100110";
        ram[25] = "0b1111011100010100110111010010111";
        ram[26] = "0b1110010000111000111001001010111";
        ram[27] = "0b1111001110010010010000000100100";
        ram[28] = "0b1001001111000001011111011010110";
        ram[29] = "0b1101011111010010101111011010000";
        ram[30] = "0b1100100001101110000011001101101";
        ram[31] = "0b1100011000111110000110001111110";
        ram[32] = "0b1001010010001111011001010110101";
        ram[33] = "0b1011110110011001001111001001011";
        ram[34] = "0b1000101111101100000010010110110";
        ram[35] = "0b1000110011011100100000101000011";
        ram[36] = "0b1111110001111011001001110000001";
        ram[37] = "0b1001011000010001110100100001101";
        ram[38] = "0b1000100100001111000100011000101";
        ram[39] = "0b1110101001100100101100001111001";
        ram[40] = "0b1001000100100000001110011000000";
        ram[41] = "0b1000111110001100101100001100110";
        ram[42] = "0b1000100011110011100010111000011";
        ram[43] = "0b1100011101011010010100100000001";
        ram[44] = "0b1010101111110001111011011111010";
        ram[45] = "0b1101000100011111011011010110111";
        ram[46] = "0b1001011100101011011111111110010";
        ram[47] = "0b1010100100001000001000011001111";


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


SC_MODULE(QuantAct_m_9) {


static const unsigned DataWidth = 31;
static const unsigned AddressRange = 48;
static const unsigned AddressWidth = 6;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


QuantAct_m_9_ram* meminst;


SC_CTOR(QuantAct_m_9) {
meminst = new QuantAct_m_9_ram("QuantAct_m_9_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~QuantAct_m_9() {
    delete meminst;
}


};//endmodule
#endif
