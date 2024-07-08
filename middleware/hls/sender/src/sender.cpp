#include "sender.hpp"

void sender(
  ap_uint<24> dest_prt,
  ap_uint<24> id_prt,
  ap_uint<16> user_prt,
  ap_uint<1> run,
  ap_uint<32> &pkt_sent,
  network_data &pkt_out
)
{
#pragma HLS INTERFACE ap_ctrl_none port=return

#pragma HLS INTERFACE axis port=pkt_out
  network_data_t temp_data;
  static ap_uint<8> flit_count=0;
  static ap_uint<32> packets_sent_cnt = 0;
  pkt_sent=packets_sent_cnt;
  if (!pkt_out.full() && (run == 1))
  {
    temp_data.data.range(511,448) = flit_count *8;
    temp_data.data.range(447,384) = flit_count *8+1;
    temp_data.data.range(383,320) = flit_count *8+2;
    temp_data.data.range(319,256) = flit_count *8+3;
    temp_data.data.range(255,192) = flit_count *8+4;
    temp_data.data.range(191,128) = flit_count *8+5;
    temp_data.data.range(127,64) = flit_count *8+6;
    temp_data.data.range(63,0) = flit_count *8+7;
    temp_data.dest = dest_prt;
    temp_data.id = id_prt;
    temp_data.user = user_prt;
    temp_data.keep = 0xFFFFFFFFFFFFFFFF;
    if (flit_count==(flits-1))
    {
    	packets_sent_cnt=packets_sent_cnt+1;
      temp_data.last = 1;
      flit_count = 0;
    }
    else
    {
      temp_data.last = 0;
      flit_count = 1 + flit_count;
    }
    pkt_out.write(temp_data);
  }
}
