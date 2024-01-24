// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __AddBias_bias_7_H__
#define __AddBias_bias_7_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct AddBias_bias_7_ram : public sc_core::sc_module {

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


   SC_CTOR(AddBias_bias_7_ram) {
        ram[0] = "0b00100001101111";
        ram[1] = "0b11101111101100";
        ram[2] = "0b00100000000101";
        ram[3] = "0b11011011101011";
        ram[4] = "0b11110010001111";
        ram[5] = "0b11111110111110";
        ram[6] = "0b01000100101101";
        ram[7] = "0b11110001011001";
        ram[8] = "0b11011110001110";
        ram[9] = "0b11110110100011";
        ram[10] = "0b00000000110011";
        ram[11] = "0b11011100011011";
        ram[12] = "0b00001110010001";
        ram[13] = "0b00100010001111";
        ram[14] = "0b00001111101101";
        ram[15] = "0b00011001010100";
        ram[16] = "0b00011000110101";
        ram[17] = "0b11100101101001";
        ram[18] = "0b11101110111000";
        ram[19] = "0b11010100111101";
        ram[20] = "0b00010100101001";
        ram[21] = "0b00001010110001";
        ram[22] = "0b11100100100100";
        ram[23] = "0b11100100001011";
        ram[24] = "0b11101010110101";
        ram[25] = "0b11011000101111";
        ram[26] = "0b11110101101000";
        ram[27] = "0b11101100001001";
        ram[28] = "0b00000111110111";
        ram[29] = "0b11100100001000";
        ram[30] = "0b11010111110110";
        ram[31] = "0b00001100001101";
        ram[32] = "0b00000100111011";
        ram[33] = "0b11101110100111";
        ram[34] = "0b11101011001001";
        ram[35] = "0b11001001101001";
        ram[36] = "0b00111000001010";
        ram[37] = "0b11000100111000";
        ram[38] = "0b11001001010010";
        ram[39] = "0b00000010110100";
        ram[40] = "0b01000010100011";
        ram[41] = "0b11101100010000";
        ram[42] = "0b00100101110000";
        ram[43] = "0b00011111110000";
        ram[44] = "0b10100100001101";
        ram[45] = "0b11001101010000";
        ram[46] = "0b10101110101101";
        ram[47] = "0b01000010101101";


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


SC_MODULE(AddBias_bias_7) {


static const unsigned DataWidth = 14;
static const unsigned AddressRange = 48;
static const unsigned AddressWidth = 6;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


AddBias_bias_7_ram* meminst;


SC_CTOR(AddBias_bias_7) {
meminst = new AddBias_bias_7_ram("AddBias_bias_7_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~AddBias_bias_7() {
    delete meminst;
}


};//endmodule
#endif
