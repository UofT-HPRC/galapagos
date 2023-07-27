// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __AddBias_bias_11_H__
#define __AddBias_bias_11_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct AddBias_bias_11_ram : public sc_core::sc_module {

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


   SC_CTOR(AddBias_bias_11_ram) {
        ram[0] = "0b01000101110010";
        ram[1] = "0b10110110101011";
        ram[2] = "0b11110111011001";
        ram[3] = "0b00000011001000";
        ram[4] = "0b10110001110111";
        ram[5] = "0b00001110110011";
        ram[6] = "0b11110111110100";
        ram[7] = "0b11101110010111";
        ram[8] = "0b00011001111000";
        ram[9] = "0b00011000110101";
        ram[10] = "0b00100111110011";
        ram[11] = "0b11011010010110";
        ram[12] = "0b00000110101010";
        ram[13] = "0b00000110110111";
        ram[14] = "0b11100101100111";
        ram[15] = "0b00010100101100";
        ram[16] = "0b11111001101010";
        ram[17] = "0b11110110000111";
        ram[18] = "0b00001000101111";
        ram[19] = "0b00000000000101";
        ram[20] = "0b11001001111011";
        ram[21] = "0b00000110110011";
        ram[22] = "0b00010010001010";
        ram[23] = "0b11000101101111";
        ram[24] = "0b11110100011111";
        ram[25] = "0b00000110001100";
        ram[26] = "0b10110011010011";
        ram[27] = "0b11111110111000";
        ram[28] = "0b00001011110101";
        ram[29] = "0b00010001010010";
        ram[30] = "0b11100000010110";
        ram[31] = "0b00001000111110";
        ram[32] = "0b00010010100111";
        ram[33] = "0b00110111010011";
        ram[34] = "0b11111111101000";
        ram[35] = "0b00111011011100";
        ram[36] = "0b11100001100000";
        ram[37] = "0b01000101011101";
        ram[38] = "0b00100101010010";
        ram[39] = "0b00101111111101";
        ram[40] = "0b11100011011000";
        ram[41] = "0b11111101011011";
        ram[42] = "0b11110111011000";
        ram[43] = "0b00100000111011";
        ram[44] = "0b01100000101101";
        ram[45] = "0b11111000001111";
        ram[46] = "0b01011101111100";
        ram[47] = "0b10110101011001";


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


SC_MODULE(AddBias_bias_11) {


static const unsigned DataWidth = 14;
static const unsigned AddressRange = 48;
static const unsigned AddressWidth = 6;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


AddBias_bias_11_ram* meminst;


SC_CTOR(AddBias_bias_11) {
meminst = new AddBias_bias_11_ram("AddBias_bias_11_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~AddBias_bias_11() {
    delete meminst;
}


};//endmodule
#endif
