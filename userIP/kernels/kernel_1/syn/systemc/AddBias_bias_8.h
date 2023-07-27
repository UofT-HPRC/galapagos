// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __AddBias_bias_8_H__
#define __AddBias_bias_8_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct AddBias_bias_8_ram : public sc_core::sc_module {

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


   SC_CTOR(AddBias_bias_8_ram) {
        ram[0] = "0b11110110101110";
        ram[1] = "0b10110111111110";
        ram[2] = "0b11110011101001";
        ram[3] = "0b00000111101100";
        ram[4] = "0b00100101101010";
        ram[5] = "0b11010100011110";
        ram[6] = "0b11001100111101";
        ram[7] = "0b00001101111011";
        ram[8] = "0b00011010110111";
        ram[9] = "0b00011000001011";
        ram[10] = "0b11100000101000";
        ram[11] = "0b11101111110010";
        ram[12] = "0b11101011011010";
        ram[13] = "0b00001001101111";
        ram[14] = "0b11111011101101";
        ram[15] = "0b11111001000101";
        ram[16] = "0b11111001000110";
        ram[17] = "0b00101100000100";
        ram[18] = "0b11101010010101";
        ram[19] = "0b11110110001100";
        ram[20] = "0b00000011010010";
        ram[21] = "0b11000000010011";
        ram[22] = "0b01000101110111";
        ram[23] = "0b11000011010110";
        ram[24] = "0b11011111000101";
        ram[25] = "0b11111011001000";
        ram[26] = "0b11111100000111";
        ram[27] = "0b11010101011111";
        ram[28] = "0b00010000111100";
        ram[29] = "0b00000011011111";
        ram[30] = "0b11110000111111";
        ram[31] = "0b11001111010101";
        ram[32] = "0b00010011000110";
        ram[33] = "0b00011010110001";
        ram[34] = "0b11001010001101";
        ram[35] = "0b00001000001101";
        ram[36] = "0b11000111011000";
        ram[37] = "0b00100110110011";
        ram[38] = "0b00111111101100";
        ram[39] = "0b11010011101111";
        ram[40] = "0b11011011110011";
        ram[41] = "0b00101111110101";
        ram[42] = "0b00000101011011";
        ram[43] = "0b11011111110101";
        ram[44] = "0b10100011001010";
        ram[45] = "0b00111110111011";
        ram[46] = "0b10111101111110";
        ram[47] = "0b01000001011010";


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


SC_MODULE(AddBias_bias_8) {


static const unsigned DataWidth = 14;
static const unsigned AddressRange = 48;
static const unsigned AddressWidth = 6;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


AddBias_bias_8_ram* meminst;


SC_CTOR(AddBias_bias_8) {
meminst = new AddBias_bias_8_ram("AddBias_bias_8_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~AddBias_bias_8() {
    delete meminst;
}


};//endmodule
#endif
