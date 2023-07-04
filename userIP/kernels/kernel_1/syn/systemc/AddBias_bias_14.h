// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __AddBias_bias_14_H__
#define __AddBias_bias_14_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct AddBias_bias_14_ram : public sc_core::sc_module {

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


   SC_CTOR(AddBias_bias_14_ram) {
        ram[0] = "0b01011010111111";
        ram[1] = "0b00001001111100";
        ram[2] = "0b00101001001001";
        ram[3] = "0b10101000101010";
        ram[4] = "0b00001100011111";
        ram[5] = "0b00000001000101";
        ram[6] = "0b00110101011111";
        ram[7] = "0b00000101111010";
        ram[8] = "0b11110000000100";
        ram[9] = "0b11110101100010";
        ram[10] = "0b11111111100001";
        ram[11] = "0b11110010111111";
        ram[12] = "0b00000000111011";
        ram[13] = "0b00000000000100";
        ram[14] = "0b11110011001111";
        ram[15] = "0b11100010100011";
        ram[16] = "0b00010001111010";
        ram[17] = "0b11010111010100";
        ram[18] = "0b11110000011001";
        ram[19] = "0b00010001010100";
        ram[20] = "0b11101110100111";
        ram[21] = "0b00101110101101";
        ram[22] = "0b00001101111111";
        ram[23] = "0b11101000001010";
        ram[24] = "0b00001100101001";
        ram[25] = "0b10110010011110";
        ram[26] = "0b11000111010111";
        ram[27] = "0b00101001111011";
        ram[28] = "0b00101111011011";
        ram[29] = "0b00001101100101";
        ram[30] = "0b11010010000110";
        ram[31] = "0b11110011110101";
        ram[32] = "0b11111111110010";
        ram[33] = "0b00110111101111";
        ram[34] = "0b11101110100100";
        ram[35] = "0b00100110000100";
        ram[36] = "0b00111111010010";
        ram[37] = "0b10111001110011";
        ram[38] = "0b00101101011110";
        ram[39] = "0b11000111111000";
        ram[40] = "0b00010010100000";
        ram[41] = "0b11100000010000";
        ram[42] = "0b11001000011010";
        ram[43] = "0b11100000100110";
        ram[44] = "0b11101001000100";
        ram[45] = "0b01011101000011";
        ram[46] = "0b10001101001010";
        ram[47] = "0b01110011111110";


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


SC_MODULE(AddBias_bias_14) {


static const unsigned DataWidth = 14;
static const unsigned AddressRange = 48;
static const unsigned AddressWidth = 6;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


AddBias_bias_14_ram* meminst;


SC_CTOR(AddBias_bias_14) {
meminst = new AddBias_bias_14_ram("AddBias_bias_14_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~AddBias_bias_14() {
    delete meminst;
}


};//endmodule
#endif
