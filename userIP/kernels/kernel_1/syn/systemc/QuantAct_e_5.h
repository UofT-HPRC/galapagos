// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __QuantAct_e_5_H__
#define __QuantAct_e_5_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct QuantAct_e_5_ram : public sc_core::sc_module {

  static const unsigned DataWidth = 6;
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


   SC_CTOR(QuantAct_e_5_ram) {
        for (unsigned i = 0; i < 7 ; i = i + 1) {
            ram[i] = "0b101001";
        }
        for (unsigned i = 7; i < 26 ; i = i + 1) {
            ram[i] = "0b101000";
        }
        ram[26] = "0b101001";
        ram[27] = "0b101001";
        for (unsigned i = 28; i < 42 ; i = i + 1) {
            ram[i] = "0b101000";
        }
        ram[42] = "0b101001";
        for (unsigned i = 43; i < 48 ; i = i + 1) {
            ram[i] = "0b101000";
        }


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


SC_MODULE(QuantAct_e_5) {


static const unsigned DataWidth = 6;
static const unsigned AddressRange = 48;
static const unsigned AddressWidth = 6;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


QuantAct_e_5_ram* meminst;


SC_CTOR(QuantAct_e_5) {
meminst = new QuantAct_e_5_ram("QuantAct_e_5_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~QuantAct_e_5() {
    delete meminst;
}


};//endmodule
#endif
