// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __AddBias_bias_5_H__
#define __AddBias_bias_5_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct AddBias_bias_5_ram : public sc_core::sc_module {

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


   SC_CTOR(AddBias_bias_5_ram) {
        ram[0] = "0b11001010101001";
        ram[1] = "0b00001111101010";
        ram[2] = "0b00001100100011";
        ram[3] = "0b00001101011111";
        ram[4] = "0b00001110100110";
        ram[5] = "0b11111100000011";
        ram[6] = "0b00010011001010";
        ram[7] = "0b00100111110101";
        ram[8] = "0b11111100010101";
        ram[9] = "0b00000010110100";
        ram[10] = "0b00010010011000";
        ram[11] = "0b11110111111010";
        ram[12] = "0b00001111000110";
        ram[13] = "0b00011011010010";
        ram[14] = "0b00000011100100";
        ram[15] = "0b11010110110011";
        ram[16] = "0b00000011000011";
        ram[17] = "0b00001100010100";
        ram[18] = "0b11101100011110";
        ram[19] = "0b00100010111001";
        ram[20] = "0b11010110000010";
        ram[21] = "0b11111000010001";
        ram[22] = "0b01000011110001";
        ram[23] = "0b01000100010000";
        ram[24] = "0b11000111001101";
        ram[25] = "0b10100111010111";
        ram[26] = "0b00000111011010";
        ram[27] = "0b01011011010000";
        ram[28] = "0b11001100111011";
        ram[29] = "0b00010001001100";
        ram[30] = "0b11101101001001";
        ram[31] = "0b11010111011110";
        ram[32] = "0b00001110001110";
        ram[33] = "0b00000111010001";
        ram[34] = "0b11101001010011";
        ram[35] = "0b00010111000000";
        ram[36] = "0b11100000101111";
        ram[37] = "0b00111000000001";
        ram[38] = "0b00111010111011";
        ram[39] = "0b11110010010001";
        ram[40] = "0b00000010010100";
        ram[41] = "0b11111010001110";
        ram[42] = "0b11100110001101";
        ram[43] = "0b11111110111111";
        ram[44] = "0b00110001011001";
        ram[45] = "0b11100111101010";
        ram[46] = "0b00111111000111";
        ram[47] = "0b11000000110011";


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


SC_MODULE(AddBias_bias_5) {


static const unsigned DataWidth = 14;
static const unsigned AddressRange = 48;
static const unsigned AddressWidth = 6;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


AddBias_bias_5_ram* meminst;


SC_CTOR(AddBias_bias_5) {
meminst = new AddBias_bias_5_ram("AddBias_bias_5_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~AddBias_bias_5() {
    delete meminst;
}


};//endmodule
#endif
