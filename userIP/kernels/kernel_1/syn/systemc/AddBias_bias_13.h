// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __AddBias_bias_13_H__
#define __AddBias_bias_13_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct AddBias_bias_13_ram : public sc_core::sc_module {

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


   SC_CTOR(AddBias_bias_13_ram) {
        ram[0] = "0b11101000001001";
        ram[1] = "0b00101111100001";
        ram[2] = "0b11110010101110";
        ram[3] = "0b11101011101011";
        ram[4] = "0b10110111111001";
        ram[5] = "0b00001100100010";
        ram[6] = "0b11111111000101";
        ram[7] = "0b11101011100110";
        ram[8] = "0b00000000101110";
        ram[9] = "0b11101011111001";
        ram[10] = "0b11110001101100";
        ram[11] = "0b11101010001000";
        ram[12] = "0b00010101100101";
        ram[13] = "0b11001001110110";
        ram[14] = "0b00000101101111";
        ram[15] = "0b11110100010000";
        ram[16] = "0b11111110001001";
        ram[17] = "0b11110110001000";
        ram[18] = "0b00101010111101";
        ram[19] = "0b11111001101111";
        ram[20] = "0b11101011011110";
        ram[21] = "0b00101100001111";
        ram[22] = "0b11111111001101";
        ram[23] = "0b00100010100110";
        ram[24] = "0b00010000100101";
        ram[25] = "0b11000010001111";
        ram[26] = "0b00001110011000";
        ram[27] = "0b01001100111110";
        ram[28] = "0b11010101111111";
        ram[29] = "0b00111011011100";
        ram[30] = "0b00111011001101";
        ram[31] = "0b11010010110011";
        ram[32] = "0b00011101100010";
        ram[33] = "0b01000000001111";
        ram[34] = "0b11011110101001";
        ram[35] = "0b11011100001011";
        ram[36] = "0b00111111001111";
        ram[37] = "0b11110110111011";
        ram[38] = "0b11100001111100";
        ram[39] = "0b00000111001101";
        ram[40] = "0b11010010110111";
        ram[41] = "0b01000011100100";
        ram[42] = "0b11010000000000";
        ram[43] = "0b11000101000011";
        ram[44] = "0b11001101000001";
        ram[45] = "0b01010111111111";
        ram[46] = "0b00100001111000";
        ram[47] = "0b11000111010011";


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


SC_MODULE(AddBias_bias_13) {


static const unsigned DataWidth = 14;
static const unsigned AddressRange = 48;
static const unsigned AddressWidth = 6;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


AddBias_bias_13_ram* meminst;


SC_CTOR(AddBias_bias_13) {
meminst = new AddBias_bias_13_ram("AddBias_bias_13_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~AddBias_bias_13() {
    delete meminst;
}


};//endmodule
#endif
