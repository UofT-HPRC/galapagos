// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __AddBias_bias_15_H__
#define __AddBias_bias_15_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct AddBias_bias_15_ram : public sc_core::sc_module {

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


   SC_CTOR(AddBias_bias_15_ram) {
        ram[0] = "0b11010000010001";
        ram[1] = "0b11000001100000";
        ram[2] = "0b00100011101101";
        ram[3] = "0b00011101111001";
        ram[4] = "0b01001000010101";
        ram[5] = "0b10110101010000";
        ram[6] = "0b11110110110101";
        ram[7] = "0b11101100010001";
        ram[8] = "0b11110010110011";
        ram[9] = "0b00110010110000";
        ram[10] = "0b00101110001110";
        ram[11] = "0b00011010101010";
        ram[12] = "0b00110000110011";
        ram[13] = "0b00000000011000";
        ram[14] = "0b00001001011000";
        ram[15] = "0b11110000110101";
        ram[16] = "0b00000101000111";
        ram[17] = "0b00011001110001";
        ram[18] = "0b11100100000011";
        ram[19] = "0b11100100111101";
        ram[20] = "0b01010011011011";
        ram[21] = "0b11101111000011";
        ram[22] = "0b00111100001101";
        ram[23] = "0b00011100101010";
        ram[24] = "0b11111100110100";
        ram[25] = "0b11001110111101";
        ram[26] = "0b00010111000101";
        ram[27] = "0b00000000111111";
        ram[28] = "0b11100001110110";
        ram[29] = "0b00000101001111";
        ram[30] = "0b00101100111000";
        ram[31] = "0b00100001100100";
        ram[32] = "0b00000010010100";
        ram[33] = "0b00010001111101";
        ram[34] = "0b11110001000101";
        ram[35] = "0b00000101001101";
        ram[36] = "0b10110100111000";
        ram[37] = "0b01000111101011";
        ram[38] = "0b00010010000100";
        ram[39] = "0b11101000011001";
        ram[40] = "0b00001111111101";
        ram[41] = "0b00001011110011";
        ram[42] = "0b00010011101111";
        ram[43] = "0b11010101110111";
        ram[44] = "0b11110110001001";
        ram[45] = "0b10110000101011";
        ram[46] = "0b00101111011110";
        ram[47] = "0b01010110000100";


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


SC_MODULE(AddBias_bias_15) {


static const unsigned DataWidth = 14;
static const unsigned AddressRange = 48;
static const unsigned AddressWidth = 6;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


AddBias_bias_15_ram* meminst;


SC_CTOR(AddBias_bias_15) {
meminst = new AddBias_bias_15_ram("AddBias_bias_15_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~AddBias_bias_15() {
    delete meminst;
}


};//endmodule
#endif
