// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __QuantAct_m_5_H__
#define __QuantAct_m_5_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct QuantAct_m_5_ram : public sc_core::sc_module {

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


   SC_CTOR(QuantAct_m_5_ram) {
        ram[0] = "0b1100100011100011001100101000100";
        ram[1] = "0b1111100100111110001011101101101";
        ram[2] = "0b1110101011000001011101111101111";
        ram[3] = "0b1101111110111000111010111000011";
        ram[4] = "0b1110111010000000100001000010101";
        ram[5] = "0b1101010110101001100110110111000";
        ram[6] = "0b1100111100010110110111111101001";
        ram[7] = "0b1000110100010001111010110001110";
        ram[8] = "0b1000011100111101101001010111011";
        ram[9] = "0b1000001110011110001010000000001";
        ram[10] = "0b1001110100001111111000100000100";
        ram[11] = "0b1001101100010010101010011001101";
        ram[12] = "0b1001111000110001010000000011101";
        ram[13] = "0b1000010001100010110001100001000";
        ram[14] = "0b1001110001110010011101100011110";
        ram[15] = "0b1000111000011101011001101000010";
        ram[16] = "0b1101110110100000001111110010101";
        ram[17] = "0b1110010001010000010111001100101";
        ram[18] = "0b1100011101101010010010100101010";
        ram[19] = "0b1110001010101110011000001011001";
        ram[20] = "0b1000100111100100100001101010011";
        ram[21] = "0b1010010011100111001111111101100";
        ram[22] = "0b1000101000101111110110110000111";
        ram[23] = "0b1000010101010101011111100001011";
        ram[24] = "0b1001001010101011011001110001010";
        ram[25] = "0b1000010110011101001100101101001";
        ram[26] = "0b1110101011000000100011011101010";
        ram[27] = "0b1110000000110111011001110101011";
        ram[28] = "0b1000000101011100100100111101100";
        ram[29] = "0b1000110111101001000111110110000";
        ram[30] = "0b1100000000111010010001011111011";
        ram[31] = "0b1100011010000001101010010011010";
        ram[32] = "0b1001010111001101000011010011101";
        ram[33] = "0b1100100101111101001101111100001";
        ram[34] = "0b1010101101010100101101100010100";
        ram[35] = "0b1011111110110110000001011000111";
        ram[36] = "0b1100011100010100001000110101011";
        ram[37] = "0b1000010110010111111101100111100";
        ram[38] = "0b1001001100011101111001100110010";
        ram[39] = "0b1010000110110011010111101000000";
        ram[40] = "0b1001111011100110011101111101000";
        ram[41] = "0b1011000101110011111100001010111";
        ram[42] = "0b1111001011000010101101110101011";
        ram[43] = "0b1000001100100100100010110100010";
        ram[44] = "0b1101011111101100011001101000011";
        ram[45] = "0b1100101010001111011100100011000";
        ram[46] = "0b1100100100111001100101000101001";
        ram[47] = "0b1100101000110001111011010101001";


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


SC_MODULE(QuantAct_m_5) {


static const unsigned DataWidth = 31;
static const unsigned AddressRange = 48;
static const unsigned AddressWidth = 6;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


QuantAct_m_5_ram* meminst;


SC_CTOR(QuantAct_m_5) {
meminst = new QuantAct_m_5_ram("QuantAct_m_5_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~QuantAct_m_5() {
    delete meminst;
}


};//endmodule
#endif
