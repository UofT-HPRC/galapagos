// AXI-Lite Interfaces
parameter AXI_LITE_ADDR_WIDTH = 64, // Adjustable
localparam AXI_LITE_DATA_WIDTH = 32,
localparam AXI_LITE_WSTRB_WIDTH = 4,
localparam AXI_LITE_BRESP_WIDTH = 2,
// AXI-Stream Interfaces
localparam AXIS_DATA_WIDTH = 512,
localparam AXIS_KEEP_WIDTH = 64,
// AXI-Stream to-LAN Interface
localparam AXIS_LAN_TDEST_WIDTH = 8,
localparam AXIS_LAN_TUSER_WIDTH = 8,
// AXI-Stream to-WAN Interface
localparam AXIS_WAN_TDEST_WIDTH = 32,
localparam AXIS_WAN_TUSER_WIDTH = 16,
// AXI-Stream to-KnownIP Interface
localparam IP_ADDRESS_WIDTH = 32,
localparam IP_PORT_WIDTH = 16,
localparam AXIS_KIP_TUSER_WIDTH = 64,
// AXI-Stream from-Receptionist Interface
localparam AXIS_RECEP_TDEST_WIDTH = 16,
localparam AXIS_RECEP_TUSER_WIDTH = 48,
// AXI-Stream from-Network Interface
parameter AXIS_FROM_NB_TDEST_WIDTH = AXIS_LAN_TDEST_WIDTH,
parameter AXIS_FROM_NB_TUSER_WIDTH = AXIS_KIP_TUSER_WIDTH