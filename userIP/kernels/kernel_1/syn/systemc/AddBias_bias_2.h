// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __AddBias_bias_2_H__
#define __AddBias_bias_2_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct AddBias_bias_2_ram : public sc_core::sc_module {

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


   SC_CTOR(AddBias_bias_2_ram) {
        ram[0] = "0b11001011011010";
        ram[1] = "0b00000100011110";
        ram[2] = "0b00010000100110";
        ram[3] = "0b00101011010010";
        ram[4] = "0b11111111010111";
        ram[5] = "0b00001011100010";
        ram[6] = "0b11111000001010";
        ram[7] = "0b11110111100101";
        ram[8] = "0b10110101000111";
        ram[9] = "0b11001110011101";
        ram[10] = "0b00000100111001";
        ram[11] = "0b11011001001111";
        ram[12] = "0b11100111111011";
        ram[13] = "0b11111111101001";
        ram[14] = "0b00001011110110";
        ram[15] = "0b11110011011101";
        ram[16] = "0b00010111101001";
        ram[17] = "0b00001011001011";
        ram[18] = "0b11100011110100";
        ram[19] = "0b11100110001101";
        ram[20] = "0b11001011010011";
        ram[21] = "0b11111110000000";
        ram[22] = "0b11110001101000";
        ram[23] = "0b00001001011000";
        ram[24] = "0b00000101001100";
        ram[25] = "0b00001000100111";
        ram[26] = "0b11100011101100";
        ram[27] = "0b11110011111001";
        ram[28] = "0b11100010111110";
        ram[29] = "0b11100010111011";
        ram[30] = "0b11101111010001";
        ram[31] = "0b11001001011100";
        ram[32] = "0b11111000001010";
        ram[33] = "0b00010000000101";
        ram[34] = "0b00011011000101";
        ram[35] = "0b00000010011100";
        ram[36] = "0b00111110101111";
        ram[37] = "0b11100111111011";
        ram[38] = "0b10110001001111";
        ram[39] = "0b11111110001010";
        ram[40] = "0b11011110010111";
        ram[41] = "0b11101100101110";
        ram[42] = "0b11110111111100";
        ram[43] = "0b11101011111111";
        ram[44] = "0b11010001111111";
        ram[45] = "0b01100100000001";
        ram[46] = "0b10110100010011";
        ram[47] = "0b01000111010101";


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


SC_MODULE(AddBias_bias_2) {


static const unsigned DataWidth = 14;
static const unsigned AddressRange = 48;
static const unsigned AddressWidth = 6;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


AddBias_bias_2_ram* meminst;


SC_CTOR(AddBias_bias_2) {
meminst = new AddBias_bias_2_ram("AddBias_bias_2_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~AddBias_bias_2() {
    delete meminst;
}


};//endmodule
#endif
