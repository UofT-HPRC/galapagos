// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __AddBias_bias_10_H__
#define __AddBias_bias_10_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct AddBias_bias_10_ram : public sc_core::sc_module {

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


   SC_CTOR(AddBias_bias_10_ram) {
        ram[0] = "0b01010010101111";
        ram[1] = "0b00011000010001";
        ram[2] = "0b00010000010011";
        ram[3] = "0b10111000100111";
        ram[4] = "0b00110101111011";
        ram[5] = "0b00011000011110";
        ram[6] = "0b11100101100001";
        ram[7] = "0b11110111111011";
        ram[8] = "0b11100101110001";
        ram[9] = "0b11010101000001";
        ram[10] = "0b00001111000111";
        ram[11] = "0b11011010100010";
        ram[12] = "0b11100010010011";
        ram[13] = "0b00000001000000";
        ram[14] = "0b00001110111011";
        ram[15] = "0b00000000010011";
        ram[16] = "0b00001101101001";
        ram[17] = "0b00010010000011";
        ram[18] = "0b00000000010011";
        ram[19] = "0b11111100101101";
        ram[20] = "0b11001100100001";
        ram[21] = "0b11110111001010";
        ram[22] = "0b11111101010010";
        ram[23] = "0b11010000110110";
        ram[24] = "0b00010000010110";
        ram[25] = "0b11011000110100";
        ram[26] = "0b11110000000111";
        ram[27] = "0b11110101000100";
        ram[28] = "0b11101110011010";
        ram[29] = "0b00111101110100";
        ram[30] = "0b11011111010010";
        ram[31] = "0b00101101011101";
        ram[32] = "0b00001010110000";
        ram[33] = "0b11101000000101";
        ram[34] = "0b00010001011010";
        ram[35] = "0b11111111111001";
        ram[36] = "0b00111011001110";
        ram[37] = "0b11001101010001";
        ram[38] = "0b11100111001000";
        ram[39] = "0b11100001001111";
        ram[40] = "0b11111110010100";
        ram[41] = "0b11011110110111";
        ram[42] = "0b11110100110010";
        ram[43] = "0b00011110101100";
        ram[44] = "0b10100010111110";
        ram[45] = "0b10111000010101";
        ram[46] = "0b10011010000010";
        ram[47] = "0b00001111110011";


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


SC_MODULE(AddBias_bias_10) {


static const unsigned DataWidth = 14;
static const unsigned AddressRange = 48;
static const unsigned AddressWidth = 6;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


AddBias_bias_10_ram* meminst;


SC_CTOR(AddBias_bias_10) {
meminst = new AddBias_bias_10_ram("AddBias_bias_10_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~AddBias_bias_10() {
    delete meminst;
}


};//endmodule
#endif
