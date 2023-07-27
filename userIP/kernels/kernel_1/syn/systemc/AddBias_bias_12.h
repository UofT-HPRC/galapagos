// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __AddBias_bias_12_H__
#define __AddBias_bias_12_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct AddBias_bias_12_ram : public sc_core::sc_module {

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


   SC_CTOR(AddBias_bias_12_ram) {
        ram[0] = "0b00011100011011";
        ram[1] = "0b11110111011000";
        ram[2] = "0b00101000110010";
        ram[3] = "0b01001011011010";
        ram[4] = "0b00001010000010";
        ram[5] = "0b00010001011100";
        ram[6] = "0b10111000001010";
        ram[7] = "0b11010101000101";
        ram[8] = "0b00110010011011";
        ram[9] = "0b00010011110111";
        ram[10] = "0b11110100100101";
        ram[11] = "0b11110100111011";
        ram[12] = "0b00000001110000";
        ram[13] = "0b11111010101100";
        ram[14] = "0b11011111011000";
        ram[15] = "0b11110010011010";
        ram[16] = "0b00001000001000";
        ram[17] = "0b00010000110000";
        ram[18] = "0b00010101001010";
        ram[19] = "0b00001010000001";
        ram[20] = "0b11010010100101";
        ram[21] = "0b11011110001101";
        ram[22] = "0b11001000100100";
        ram[23] = "0b10111110001100";
        ram[24] = "0b00111110011101";
        ram[25] = "0b11111001001010";
        ram[26] = "0b11010010011110";
        ram[27] = "0b11101000000011";
        ram[28] = "0b11100010001111";
        ram[29] = "0b00011010101001";
        ram[30] = "0b00001111100001";
        ram[31] = "0b11101101101100";
        ram[32] = "0b00000011111000";
        ram[33] = "0b00001100110100";
        ram[34] = "0b11111011110001";
        ram[35] = "0b00010011011010";
        ram[36] = "0b10101101101110";
        ram[37] = "0b11101111011001";
        ram[38] = "0b11001100010100";
        ram[39] = "0b00101011110011";
        ram[40] = "0b00101001101011";
        ram[41] = "0b11111111111101";
        ram[42] = "0b11100110010000";
        ram[43] = "0b11111000101111";
        ram[44] = "0b11110000000000";
        ram[45] = "0b10110001010011";
        ram[46] = "0b01000111010001";
        ram[47] = "0b00101100001001";


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


SC_MODULE(AddBias_bias_12) {


static const unsigned DataWidth = 14;
static const unsigned AddressRange = 48;
static const unsigned AddressWidth = 6;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


AddBias_bias_12_ram* meminst;


SC_CTOR(AddBias_bias_12) {
meminst = new AddBias_bias_12_ram("AddBias_bias_12_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~AddBias_bias_12() {
    delete meminst;
}


};//endmodule
#endif
