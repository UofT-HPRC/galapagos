// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __AddBias_bias_0_H__
#define __AddBias_bias_0_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct AddBias_bias_0_ram : public sc_core::sc_module {

  static const unsigned DataWidth = 14;
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


   SC_CTOR(AddBias_bias_0_ram) {
        ram[0] = "0b00101010000110";
        ram[1] = "0b11011000100110";
        ram[2] = "0b11010011001001";
        ram[3] = "0b00011001011111";
        ram[4] = "0b00011011111000";
        ram[5] = "0b11110111010011";
        ram[6] = "0b11100111001011";
        ram[7] = "0b10101100010100";
        ram[8] = "0b00100000100101";
        ram[9] = "0b00101001100000";
        ram[10] = "0b00100010000111";
        ram[11] = "0b11001010111010";
        ram[12] = "0b11110111110111";
        ram[13] = "0b11111101100001";
        ram[14] = "0b00000110110101";
        ram[15] = "0b11101001110100";
        ram[16] = "0b11110010000001";
        ram[17] = "0b00011111001111";
        ram[18] = "0b11111100100001";
        ram[19] = "0b11111001100101";
        ram[20] = "0b11101000011000";
        ram[21] = "0b00011110000110";
        ram[22] = "0b00100100100110";
        ram[23] = "0b00000000101000";
        ram[24] = "0b00010010011001";
        ram[25] = "0b11000001111101";
        ram[26] = "0b11110010101010";
        ram[27] = "0b11110110011110";
        ram[28] = "0b00000011101100";
        ram[29] = "0b00001111010000";
        ram[30] = "0b11110101100100";
        ram[31] = "0b00000111100010";
        ram[32] = "0b11110100000101";
        ram[33] = "0b00010111100011";
        ram[34] = "0b00000001010101";
        ram[35] = "0b00010110111100";
        ram[36] = "0b00000000010101";
        ram[37] = "0b00011101001010";
        ram[38] = "0b00110100101101";
        ram[39] = "0b00110111000011";
        ram[40] = "0b00001101101000";
        ram[41] = "0b11011100010111";
        ram[42] = "0b11100000101111";
        ram[43] = "0b00100111011000";
        ram[44] = "0b10100101010101";
        ram[45] = "0b10101000001101";
        ram[46] = "0b01001010111000";
        ram[47] = "0b01000101000111";


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


SC_MODULE(AddBias_bias_0) {


static const unsigned DataWidth = 14;
static const unsigned AddressRange = 48;
static const unsigned AddressWidth = 6;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


AddBias_bias_0_ram* meminst;


SC_CTOR(AddBias_bias_0) {
meminst = new AddBias_bias_0_ram("AddBias_bias_0_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~AddBias_bias_0() {
    delete meminst;
}


};//endmodule
#endif
