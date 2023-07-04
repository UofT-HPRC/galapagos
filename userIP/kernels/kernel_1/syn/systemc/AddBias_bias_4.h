// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __AddBias_bias_4_H__
#define __AddBias_bias_4_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct AddBias_bias_4_ram : public sc_core::sc_module {

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


   SC_CTOR(AddBias_bias_4_ram) {
        ram[0] = "0b01111000111010";
        ram[1] = "0b10100101001101";
        ram[2] = "0b01001010001110";
        ram[3] = "0b10111101111010";
        ram[4] = "0b00011110110110";
        ram[5] = "0b11110010000010";
        ram[6] = "0b11100111001110";
        ram[7] = "0b10111010110101";
        ram[8] = "0b11100111011001";
        ram[9] = "0b00100100011011";
        ram[10] = "0b11110101011011";
        ram[11] = "0b00101100110100";
        ram[12] = "0b00010000001011";
        ram[13] = "0b11110100111100";
        ram[14] = "0b11100001110101";
        ram[15] = "0b00000111100101";
        ram[16] = "0b00001110010010";
        ram[17] = "0b11110100110001";
        ram[18] = "0b11111000010010";
        ram[19] = "0b00000111000010";
        ram[20] = "0b00011001111001";
        ram[21] = "0b11111100011111";
        ram[22] = "0b00000001101101";
        ram[23] = "0b00010101010110";
        ram[24] = "0b00110001101101";
        ram[25] = "0b11110101111110";
        ram[26] = "0b00100111001101";
        ram[27] = "0b11001100100110";
        ram[28] = "0b00000000011001";
        ram[29] = "0b11101001100101";
        ram[30] = "0b00111010001011";
        ram[31] = "0b11010110110011";
        ram[32] = "0b11101011001000";
        ram[33] = "0b00100000001010";
        ram[34] = "0b11110111110111";
        ram[35] = "0b11010010010000";
        ram[36] = "0b11100111010110";
        ram[37] = "0b11000000010010";
        ram[38] = "0b11001111100101";
        ram[39] = "0b00101001111011";
        ram[40] = "0b00110001101000";
        ram[41] = "0b11010111100111";
        ram[42] = "0b11101101111001";
        ram[43] = "0b11111101101110";
        ram[44] = "0b11111010110001";
        ram[45] = "0b01001010111100";
        ram[46] = "0b00101000101110";
        ram[47] = "0b00110011100101";


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


SC_MODULE(AddBias_bias_4) {


static const unsigned DataWidth = 14;
static const unsigned AddressRange = 48;
static const unsigned AddressWidth = 6;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


AddBias_bias_4_ram* meminst;


SC_CTOR(AddBias_bias_4) {
meminst = new AddBias_bias_4_ram("AddBias_bias_4_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~AddBias_bias_4() {
    delete meminst;
}


};//endmodule
#endif
