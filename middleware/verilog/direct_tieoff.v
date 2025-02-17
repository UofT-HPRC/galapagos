`timescale 1 ps / 1 ps

module direct_tieoff(
  dt_tready,
  dt_tvalid,
  dt_tdata,
  dt_tkeep,
  dt_tlast,
  dt_tuser,
  aclk,
  aresetn
);
  input dt_tready;
  output dt_tvalid;
  output [511:0] dt_tdata;
  output [63:0] dt_tkeep;
  output dt_tlast;
  output [63:0] dt_tuser;
  input aclk;
  input aresetn;
  assign dt_tvalid = 0;
  assign dt_tdata = 0;
  assign dt_tkeep = 0;
  assign dt_tlast = 0;
  assign dt_tuser = 0;
endmodule
