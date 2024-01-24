// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __AddBias_bias_1_H__
#define __AddBias_bias_1_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct AddBias_bias_1_ram : public sc_core::sc_module {

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


   SC_CTOR(AddBias_bias_1_ram) {
        ram[0] = "0b00001000010100";
        ram[1] = "0b00010001001111";
        ram[2] = "0b11000001001110";
        ram[3] = "0b11000100100110";
        ram[4] = "0b11000111101100";
        ram[5] = "0b11000110001010";
        ram[6] = "0b00001100001011";
        ram[7] = "0b10111111101010";
        ram[8] = "0b11011000111000";
        ram[9] = "0b11001010001001";
        ram[10] = "0b00001110110111";
        ram[11] = "0b00001110010000";
        ram[12] = "0b00010001001011";
        ram[13] = "0b00001100011001";
        ram[14] = "0b11110001100001";
        ram[15] = "0b11100011100011";
        ram[16] = "0b00010011110100";
        ram[17] = "0b11101001010001";
        ram[18] = "0b11111100111100";
        ram[19] = "0b11111001001100";
        ram[20] = "0b11001010111111";
        ram[21] = "0b11111101111110";
        ram[22] = "0b11000110111111";
        ram[23] = "0b11001100100010";
        ram[24] = "0b11101111011101";
        ram[25] = "0b10111010011001";
        ram[26] = "0b00110110010101";
        ram[27] = "0b11100011001010";
        ram[28] = "0b11101100010101";
        ram[29] = "0b11101110011100";
        ram[30] = "0b00000000101110";
        ram[31] = "0b11011111100010";
        ram[32] = "0b11000001110100";
        ram[33] = "0b00000001001010";
        ram[34] = "0b00000100011110";
        ram[35] = "0b00001110110001";
        ram[36] = "0b11110001001010";
        ram[37] = "0b11110001101000";
        ram[38] = "0b11000010001010";
        ram[39] = "0b10111011111100";
        ram[40] = "0b11001100101111";
        ram[41] = "0b11010111001111";
        ram[42] = "0b00111011000000";
        ram[43] = "0b00000011010011";
        ram[44] = "0b01111110101010";
        ram[45] = "0b10011100000001";
        ram[46] = "0b00110001100110";
        ram[47] = "0b10101111100100";


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


SC_MODULE(AddBias_bias_1) {


static const unsigned DataWidth = 14;
static const unsigned AddressRange = 48;
static const unsigned AddressWidth = 6;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


AddBias_bias_1_ram* meminst;


SC_CTOR(AddBias_bias_1) {
meminst = new AddBias_bias_1_ram("AddBias_bias_1_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~AddBias_bias_1() {
    delete meminst;
}


};//endmodule
#endif
