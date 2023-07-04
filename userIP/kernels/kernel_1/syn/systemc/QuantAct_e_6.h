// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __QuantAct_e_6_H__
#define __QuantAct_e_6_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct QuantAct_e_6_ram : public sc_core::sc_module {

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


   SC_CTOR(QuantAct_e_6_ram) {
        for (unsigned i = 0; i < 6 ; i = i + 1) {
            ram[i] = "0b101001";
        }
        ram[6] = "0b101000";
        ram[7] = "0b101000";
        ram[8] = "0b101000";
        ram[9] = "0b101000";
        ram[10] = "0b101001";
        ram[11] = "0b101000";
        ram[12] = "0b101000";
        ram[13] = "0b101000";
        ram[14] = "0b101000";
        ram[15] = "0b101001";
        ram[16] = "0b101000";
        ram[17] = "0b101000";
        ram[18] = "0b100111";
        for (unsigned i = 19; i < 29 ; i = i + 1) {
            ram[i] = "0b101000";
        }
        ram[29] = "0b101001";
        ram[30] = "0b101001";
        for (unsigned i = 31; i < 36 ; i = i + 1) {
            ram[i] = "0b101000";
        }
        ram[36] = "0b101001";
        for (unsigned i = 37; i < 48 ; i = i + 1) {
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


SC_MODULE(QuantAct_e_6) {


static const unsigned DataWidth = 6;
static const unsigned AddressRange = 48;
static const unsigned AddressWidth = 6;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


QuantAct_e_6_ram* meminst;


SC_CTOR(QuantAct_e_6) {
meminst = new QuantAct_e_6_ram("QuantAct_e_6_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~QuantAct_e_6() {
    delete meminst;
}


};//endmodule
#endif
