// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __QuantAct_m_3_H__
#define __QuantAct_m_3_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct QuantAct_m_3_ram : public sc_core::sc_module {

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


   SC_CTOR(QuantAct_m_3_ram) {
        ram[0] = "0b1101000001000001110111011010001";
        ram[1] = "0b1101100000010100001110000011000";
        ram[2] = "0b1101101110110010110110101101111";
        ram[3] = "0b1100001011100001101001011100011";
        ram[4] = "0b1000011011000100011111110111000";
        ram[5] = "0b1101110100100111100111101000110";
        ram[6] = "0b1110010110011001010110101110011";
        ram[7] = "0b1100000111011101000011011001001";
        ram[8] = "0b1100111011001110000000001001101";
        ram[9] = "0b1000100111001000001100011011100";
        ram[10] = "0b1000001001000010010101100001000";
        ram[11] = "0b1001010100000001111011001010010";
        ram[12] = "0b1000101010010111101110111100110";
        ram[13] = "0b1001111011111100011111100011011";
        ram[14] = "0b1000101001000010100010011001010";
        ram[15] = "0b1010001100011000101011100010010";
        ram[16] = "0b1110101110111010111101111111011";
        ram[17] = "0b1101010010110101111110110001001";
        ram[18] = "0b1101000000010101100100111100100";
        ram[19] = "0b1100110100001010001111011000011";
        ram[20] = "0b1000100011011000000001011000000";
        ram[21] = "0b1100011001011101101010011000011";
        ram[22] = "0b1010111111101010100011100010001";
        ram[23] = "0b1000110000111001010101001111011";
        ram[24] = "0b1110011110010100010101110011111";
        ram[25] = "0b1111110000010111101111110000011";
        ram[26] = "0b1111101110100111100000000101010";
        ram[27] = "0b1111111000011111001100110001101";
        ram[28] = "0b1000011010010000110101001110001";
        ram[29] = "0b1111101100000000001000000001110";
        ram[30] = "0b1100100101011110011111110010110";
        ram[31] = "0b1110001101000100100100111110111";
        ram[32] = "0b1011000101110101011110100010001";
        ram[33] = "0b1010011000111000001110110011111";
        ram[34] = "0b1100100010111100010011100100110";
        ram[35] = "0b1010011001100101100111111100000";
        ram[36] = "0b1011100011111110100000010000001";
        ram[37] = "0b1000000010001000101001010101111";
        ram[38] = "0b1010101000100110011001100001111";
        ram[39] = "0b1000101110101110000001001011001";
        ram[40] = "0b1100010010110011001100101010010";
        ram[41] = "0b1001000010110000100011101110110";
        ram[42] = "0b1100011110101111101010110011110";
        ram[43] = "0b1000111101101110011011100101110";
        ram[44] = "0b1100100011011110110001111110101";
        ram[45] = "0b1100100010101110100000010001110";
        ram[46] = "0b1100110111000001011011100111111";
        ram[47] = "0b1100001110010010100100100110010";


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


SC_MODULE(QuantAct_m_3) {


static const unsigned DataWidth = 31;
static const unsigned AddressRange = 48;
static const unsigned AddressWidth = 6;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


QuantAct_m_3_ram* meminst;


SC_CTOR(QuantAct_m_3) {
meminst = new QuantAct_m_3_ram("QuantAct_m_3_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~QuantAct_m_3() {
    delete meminst;
}


};//endmodule
#endif
