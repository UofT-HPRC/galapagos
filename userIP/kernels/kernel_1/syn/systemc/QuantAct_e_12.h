// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __QuantAct_e_12_H__
#define __QuantAct_e_12_H__


#include <systemc>
using namespace sc_core;
using namespace sc_dt;




#include <iostream>
#include <fstream>

struct QuantAct_e_12_ram : public sc_core::sc_module {

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


   SC_CTOR(QuantAct_e_12_ram) {
        ram[0] = "0b101001";
        ram[1] = "0b101001";
        ram[2] = "0b101000";
        ram[3] = "0b101000";
        ram[4] = "0b101000";
        ram[5] = "0b101001";
        ram[6] = "0b101001";
        ram[7] = "0b101000";
        ram[8] = "0b101000";
        ram[9] = "0b101001";
        ram[10] = "0b101001";
        ram[11] = "0b101001";
        for (unsigned i = 12; i < 19 ; i = i + 1) {
            ram[i] = "0b101000";
        }
        ram[19] = "0b100111";
        ram[20] = "0b101000";
        ram[21] = "0b101000";
        ram[22] = "0b101000";
        ram[23] = "0b101001";
        ram[24] = "0b101000";
        ram[25] = "0b101001";
        ram[26] = "0b101000";
        ram[27] = "0b101000";
        ram[28] = "0b101000";
        ram[29] = "0b101000";
        ram[30] = "0b101001";
        for (unsigned i = 31; i < 48 ; i = i + 1) {
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


SC_MODULE(QuantAct_e_12) {


static const unsigned DataWidth = 6;
static const unsigned AddressRange = 48;
static const unsigned AddressWidth = 6;

sc_core::sc_in <sc_lv<AddressWidth> > address0;
sc_core::sc_in<sc_logic> ce0;
sc_core::sc_out <sc_lv<DataWidth> > q0;
sc_core::sc_in<sc_logic> reset;
sc_core::sc_in<bool> clk;


QuantAct_e_12_ram* meminst;


SC_CTOR(QuantAct_e_12) {
meminst = new QuantAct_e_12_ram("QuantAct_e_12_ram");
meminst->address0(address0);
meminst->ce0(ce0);
meminst->q0(q0);

meminst->reset(reset);
meminst->clk(clk);
}
~QuantAct_e_12() {
    delete meminst;
}


};//endmodule
#endif
