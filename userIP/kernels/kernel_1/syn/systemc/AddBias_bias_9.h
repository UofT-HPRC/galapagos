// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __AddBias_bias_9_H__
#define __AddBias_bias_9_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct AddBias_bias_9_ram : public sc_core::sc_module {

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


   SC_CTOR(AddBias_bias_9_ram) {
        ram[0] = "0b00111010000011";
        ram[1] = "0b00100001001111";
        ram[2] = "0b00010101110011";
        ram[3] = "0b00010101101100";
        ram[4] = "0b00001110111100";
        ram[5] = "0b00011110100110";
        ram[6] = "0b00000010000000";
        ram[7] = "0b11100111110101";
        ram[8] = "0b11101010010100";
        ram[9] = "0b00001100000001";
        ram[10] = "0b00010011101100";
        ram[11] = "0b00011011010111";
        ram[12] = "0b11101100101110";
        ram[13] = "0b00111000001110";
        ram[14] = "0b11010000101111";
        ram[15] = "0b11100101010100";
        ram[16] = "0b00100101100000";
        ram[17] = "0b00010110101111";
        ram[18] = "0b00000000011010";
        ram[19] = "0b00101010101111";
        ram[20] = "0b11010111001110";
        ram[21] = "0b00111011000100";
        ram[22] = "0b10111101110010";
        ram[23] = "0b11001001111101";
        ram[24] = "0b00001010010000";
        ram[25] = "0b01010001010101";
        ram[26] = "0b00011001000011";
        ram[27] = "0b00010011000011";
        ram[28] = "0b00000010011011";
        ram[29] = "0b01000011011011";
        ram[30] = "0b11101010011000";
        ram[31] = "0b00000010000010";
        ram[32] = "0b11111111011011";
        ram[33] = "0b00010000111110";
        ram[34] = "0b11110010001011";
        ram[35] = "0b00011011011011";
        ram[36] = "0b00001011111001";
        ram[37] = "0b11101010001100";
        ram[38] = "0b10111001001101";
        ram[39] = "0b01010010101100";
        ram[40] = "0b11111001000001";
        ram[41] = "0b01000101110011";
        ram[42] = "0b00011011010110";
        ram[43] = "0b11111000101000";
        ram[44] = "0b01011111100110";
        ram[45] = "0b01000010101110";
        ram[46] = "0b01110001010011";
        ram[47] = "0b10110110111100";


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


SC_MODULE(AddBias_bias_9) {


static const unsigned DataWidth = 14;
static const unsigned AddressRange = 48;
static const unsigned AddressWidth = 6;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


AddBias_bias_9_ram* meminst;


SC_CTOR(AddBias_bias_9) {
meminst = new AddBias_bias_9_ram("AddBias_bias_9_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~AddBias_bias_9() {
    delete meminst;
}


};//endmodule
#endif
