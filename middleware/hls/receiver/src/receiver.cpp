#include "receiver.hpp"

void receiver(
  network_data &pkt_in,
  ap_uint<32> &good_received,
  ap_uint<32> &total_received,
  ap_uint<1> &bad_cur,
  ap_uint<32> &fof,
  ap_uint<32> &fob
)
{
#pragma HLS INTERFACE ap_ctrl_none port=return

#pragma HLS INTERFACE axis port=pkt_in register_mode=off
  network_data_t temp_data;
  static ap_uint<32> good_reg = 0;
  static ap_uint<32> total_reg = 0;
  static ap_uint<1> bad_so_far=0;
  static ap_uint<8> flit_count = 0; 
  static ap_uint<32> failed_on_flits = 0;
  static ap_uint<32> failed_on_bad = 0;
  fof = failed_on_flits;
  fob = failed_on_bad;
  ap_uint<1> currently_bad;
  bad_cur = bad_so_far;
  good_received = good_reg;
  total_received = total_reg;
  if (!pkt_in.empty())
  {
    temp_data = pkt_in.read();
    if (!(
    temp_data.data.range(511,448) == flit_count *8 &&
    temp_data.data.range(447,384) == flit_count *8+1 &&
    temp_data.data.range(383,320) == flit_count *8+2 &&
    temp_data.data.range(319,256) == flit_count *8+3 &&
    temp_data.data.range(255,192) == flit_count *8+4 &&
    temp_data.data.range(191,128) == flit_count *8+5 &&
    temp_data.data.range(127,64) == flit_count *8+6 &&
    temp_data.data.range(63,0) == flit_count *8+7 &&
    temp_data.keep == 0xFFFFFFFFFFFFFFFF
    ))
    {
      currently_bad = 1;
    }
    else
    {
      currently_bad = bad_so_far;
    }
    if (temp_data.last == 1)
    {
      total_reg = total_reg + 1;
      if ((flit_count==(flits-1)) && (currently_bad==0))
      {
        good_reg = good_reg + 1;
      }
      else if (flit_count!=(flits-1))
      {
        failed_on_flits = failed_on_flits + 1;
      }
      else
      {
        failed_on_bad = failed_on_bad + 1;
      }
      flit_count = 0;
      bad_so_far = 0;
    }
    else if (currently_bad == 1)
    {
      bad_so_far=1;
      flit_count = flit_count + 1;
    }
    else
    {
      flit_count = flit_count + 1;
    }
  }
}
