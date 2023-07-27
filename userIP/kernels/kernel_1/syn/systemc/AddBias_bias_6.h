// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __AddBias_bias_6_H__
#define __AddBias_bias_6_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct AddBias_bias_6_ram : public sc_core::sc_module {

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


   SC_CTOR(AddBias_bias_6_ram) {
        ram[0] = "0b11110000100110";
        ram[1] = "0b11111000011011";
        ram[2] = "0b00010100010111";
        ram[3] = "0b10100001100100";
        ram[4] = "0b00101101100011";
        ram[5] = "0b00011110011101";
        ram[6] = "0b00000011101010";
        ram[7] = "0b00010001000011";
        ram[8] = "0b11110011111111";
        ram[9] = "0b00000001100011";
        ram[10] = "0b11001100001101";
        ram[11] = "0b11100011011110";
        ram[12] = "0b00001100111001";
        ram[13] = "0b11101110111110";
        ram[14] = "0b11111001110010";
        ram[15] = "0b11001011001001";
        ram[16] = "0b11111110101001";
        ram[17] = "0b00000100000000";
        ram[18] = "0b00010011000011";
        ram[19] = "0b11100101110010";
        ram[20] = "0b00000110111001";
        ram[21] = "0b01000010010010";
        ram[22] = "0b01000010000101";
        ram[23] = "0b01001000000011";
        ram[24] = "0b00011010110010";
        ram[25] = "0b11110111100010";
        ram[26] = "0b10111010101011";
        ram[27] = "0b11011110001101";
        ram[28] = "0b00010100011000";
        ram[29] = "0b11001111000110";
        ram[30] = "0b11101110110110";
        ram[31] = "0b00100000010011";
        ram[32] = "0b11110101101001";
        ram[33] = "0b11100010000100";
        ram[34] = "0b11111011001001";
        ram[35] = "0b11111000110101";
        ram[36] = "0b00000101111110";
        ram[37] = "0b00000001011010";
        ram[38] = "0b11110000000110";
        ram[39] = "0b11010011111110";
        ram[40] = "0b11110001111111";
        ram[41] = "0b00110001000100";
        ram[42] = "0b11111110111001";
        ram[43] = "0b11011100111111";
        ram[44] = "0b01001001101111";
        ram[45] = "0b10110010111111";
        ram[46] = "0b11001100000001";
        ram[47] = "0b00110110111111";


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


SC_MODULE(AddBias_bias_6) {


static const unsigned DataWidth = 14;
static const unsigned AddressRange = 48;
static const unsigned AddressWidth = 6;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


AddBias_bias_6_ram* meminst;


SC_CTOR(AddBias_bias_6) {
meminst = new AddBias_bias_6_ram("AddBias_bias_6_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~AddBias_bias_6() {
    delete meminst;
}


};//endmodule
#endif
