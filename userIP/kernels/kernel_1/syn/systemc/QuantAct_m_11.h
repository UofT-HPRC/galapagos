// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __QuantAct_m_11_H__
#define __QuantAct_m_11_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct QuantAct_m_11_ram : public sc_core::sc_module {

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


   SC_CTOR(QuantAct_m_11_ram) {
        ram[0] = "0b1001100111010111101010100110110";
        ram[1] = "0b1100011110101101010110101100101";
        ram[2] = "0b1100001010110010010100100000111";
        ram[3] = "0b1100101100101011010110100011000";
        ram[4] = "0b1001100000101110000100010010010";
        ram[5] = "0b1101100001100011101001100110001";
        ram[6] = "0b1001010000011101001011111001100";
        ram[7] = "0b1001001100000011110111000100001";
        ram[8] = "0b1010100110110010001110100100111";
        ram[9] = "0b1000000111000000001001010001100";
        ram[10] = "0b1111101001100010110010011100101";
        ram[11] = "0b1001000001110100000101110000101";
        ram[12] = "0b1000011011010110001101010011100";
        ram[13] = "0b1001000101001101110000110101001";
        ram[14] = "0b1000011000010000010000010010100";
        ram[15] = "0b1000000111001101111001001011100";
        ram[16] = "0b1100111110100011000110001111111";
        ram[17] = "0b1101001111100100000111000000100";
        ram[18] = "0b1101000111000000000001100010011";
        ram[19] = "0b1100110011000100001001010111011";
        ram[20] = "0b1011001011010000011000001110100";
        ram[21] = "0b1001001101001010011101110111101";
        ram[22] = "0b1001010010111111001000000000011";
        ram[23] = "0b1001110110000000110101001000000";
        ram[24] = "0b1000111110010000101010110111110";
        ram[25] = "0b1001110010010001000000000111100";
        ram[26] = "0b1000100111011010100010101110001";
        ram[27] = "0b1111011101000101110011011001010";
        ram[28] = "0b1100100001000011010010100011000";
        ram[29] = "0b1010101100110101110011001111010";
        ram[30] = "0b1010101001101000000001011111111";
        ram[31] = "0b1010011100101000101001101100100";
        ram[32] = "0b1010010000011111100010100101101";
        ram[33] = "0b1001011110001010101111111111011";
        ram[34] = "0b1100100010111101110111111010101";
        ram[35] = "0b1001110110100100000110001000000";
        ram[36] = "0b1100010101000011101010100101011";
        ram[37] = "0b1010000000001011110101100101100";
        ram[38] = "0b1001010100001010001000100111011";
        ram[39] = "0b1010010110111010100011110111011";
        ram[40] = "0b1000000000001111101111111100101";
        ram[41] = "0b1100100011100001110101100100111";
        ram[42] = "0b1000001011001011101001010000011";
        ram[43] = "0b1000100010111000100001000011101";
        ram[44] = "0b1001111111100011011101110101101";
        ram[45] = "0b1011101111101110111001111001111";
        ram[46] = "0b1010010110111001000110100101110";
        ram[47] = "0b1100101010001010011011001010110";


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


SC_MODULE(QuantAct_m_11) {


static const unsigned DataWidth = 31;
static const unsigned AddressRange = 48;
static const unsigned AddressWidth = 6;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


QuantAct_m_11_ram* meminst;


SC_CTOR(QuantAct_m_11) {
meminst = new QuantAct_m_11_ram("QuantAct_m_11_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~QuantAct_m_11() {
    delete meminst;
}


};//endmodule
#endif
