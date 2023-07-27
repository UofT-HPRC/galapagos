// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __AddBias_bias_3_H__
#define __AddBias_bias_3_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct AddBias_bias_3_ram : public sc_core::sc_module {

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


   SC_CTOR(AddBias_bias_3_ram) {
        ram[0] = "0b01010110101111";
        ram[1] = "0b11111111111011";
        ram[2] = "0b11100000011111";
        ram[3] = "0b00010110101111";
        ram[4] = "0b11001100011011";
        ram[5] = "0b11000101110011";
        ram[6] = "0b10111011011011";
        ram[7] = "0b00000000110101";
        ram[8] = "0b11110100100011";
        ram[9] = "0b11110111101001";
        ram[10] = "0b00001100100011";
        ram[11] = "0b11111110001100";
        ram[12] = "0b00010001100100";
        ram[13] = "0b11111000100100";
        ram[14] = "0b00010000111011";
        ram[15] = "0b11011100101000";
        ram[16] = "0b00000001010100";
        ram[17] = "0b11110100100100";
        ram[18] = "0b11010011010011";
        ram[19] = "0b11110110111000";
        ram[20] = "0b11001101001000";
        ram[21] = "0b00101110100010";
        ram[22] = "0b00000101010010";
        ram[23] = "0b11111110110100";
        ram[24] = "0b01000100100111";
        ram[25] = "0b00011011101001";
        ram[26] = "0b11011110111110";
        ram[27] = "0b00001010001011";
        ram[28] = "0b11011101000101";
        ram[29] = "0b11001011101110";
        ram[30] = "0b00010001100001";
        ram[31] = "0b00000111001100";
        ram[32] = "0b11111011100111";
        ram[33] = "0b11100000101010";
        ram[34] = "0b11101110100101";
        ram[35] = "0b11011100011100";
        ram[36] = "0b00111000000001";
        ram[37] = "0b10111100111011";
        ram[38] = "0b01000110101111";
        ram[39] = "0b00100100110101";
        ram[40] = "0b11011111110100";
        ram[41] = "0b11010001111111";
        ram[42] = "0b00010010110000";
        ram[43] = "0b11001110100101";
        ram[44] = "0b00001001100111";
        ram[45] = "0b01010001011000";
        ram[46] = "0b01000010101011";
        ram[47] = "0b00100110010011";


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


SC_MODULE(AddBias_bias_3) {


static const unsigned DataWidth = 14;
static const unsigned AddressRange = 48;
static const unsigned AddressWidth = 6;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


AddBias_bias_3_ram* meminst;


SC_CTOR(AddBias_bias_3) {
meminst = new AddBias_bias_3_ram("AddBias_bias_3_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~AddBias_bias_3() {
    delete meminst;
}


};//endmodule
#endif
