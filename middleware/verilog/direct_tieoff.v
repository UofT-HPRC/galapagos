`timescale 1 ps / 1 ps

module direct_tieoff(
  m_axis_tready,
  m_axis_tvalid,
  m_axis_tdata,
  m_axis_tkeep,
  m_axis_tlast,
  m_axis_tuser,
  aclk,
  aresetn
);
  input m_axis_tready;
  output m_axis_tvalid;
  output [511:0] m_axis_tdata;
  output [63:0] m_axis_tkeep;
  output m_axis_tlast;
  output [63:0] m_axis_tuser;
  input aclk;
  input aresetn;
  assign m_axis_tvalid = 0;
  assign m_axis_tdata = 0;
  assign m_axis_tkeep = 0;
  assign m_axis_tlast = 0;
  assign m_axis_tuser = 0;
endmodule
