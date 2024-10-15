// *****************************************************************************
// Control Messages
// *****************************************************************************
// Message Types
localparam MSG_TYPE_WIDTH = 3;
localparam MSG_READ = 0;
localparam MSG_WRITE = 1;
localparam MSG_BRESP = 2;
localparam MSG_RDATA = 3;
localparam MSG_BUSY = 4; // Indicates that the AXI-Lite to Network Converter cannot read/store the message right now
// AXI-Lite Offsets
localparam AXIL_IS_WAN_OFFSET = 0;
// AXI-Lite LAN messages have addresses in the following format:
// | Extended Register Address | Base Register Address | TDEST | 0 |
// |63                       32|31                    9|8     1| 0 |
// Base Register Address forms bits 0-22 of Full Register Address
// Extended Register Address forms bits 23-MSB (up to 55 bits in total)
localparam AXIL_LAN_TDEST_OFFSET = 1;
localparam AXIL_LAN_BASE_REG_ADDR_OFFSET = AXIL_LAN_TDEST_OFFSET + AXIS_LAN_TDEST_WIDTH;
localparam AXIL_LAN_BASE_REG_ADDR_WIDTH = 23;
localparam AXIL_LAN_EXTENDED_REG_ADDR_OFFSET = 32;
localparam AXIL_LAN_EXTENDED_REG_ADDR_WIDTH = AXI_LITE_ADDR_WIDTH - AXIL_LAN_EXTENDED_REG_ADDR_OFFSET; // Will be 0-32 bits
localparam AXIL_LAN_FULL_REG_ADDR_OFFSET = AXIL_LAN_BASE_REG_ADDR_OFFSET;
localparam AXIL_LAN_FULL_REG_ADDR_WIDTH = AXIL_LAN_BASE_REG_ADDR_WIDTH + AXIL_LAN_EXTENDED_REG_ADDR_WIDTH;
// AXI-Lite WAN messages have addresses in the following format:
// | CReg Address | Ext. CTDEST | Ext. Port | Base CTDEST | Base Port | 1 |
// |63          49|48         33|     32    |31         16|15        1| 0 |
// If Address width is 32 bits, only base port is used, therefore only ports from 32768 onwards can be reached (bit 15 will be set to 1)
// Extended Port forms bit 15 of the Destination Port
// Base Cluster TDEST (CTDEST) forms bits 0-15 of Full CTDEST
// Extended CTDEST forms bits 16-MSB of Full Dest Cluster ID (up to bits 16-31)
// CReg Address is used to write to an address space within the targeted Cluster IP/Port
localparam AXIL_WAN_BASE_PORT_OFFSET = 1;
localparam AXIL_WAN_BASE_PORT_WIDTH = 15;
localparam AXIL_WAN_BASE_CTDEST_OFFSET = AXIL_WAN_BASE_PORT_OFFSET + AXIL_WAN_BASE_PORT_WIDTH;
localparam AXIL_WAN_BASE_CTDEST_WIDTH = 16;
localparam AXIL_EXTENDED_PORT_EXISTS = (AXI_LITE_ADDR_WIDTH > (AXIL_WAN_BASE_CTDEST_OFFSET + AXIL_WAN_BASE_CTDEST_WIDTH)) ? 1 : 0;
localparam AXIL_WAN_EXTENDED_PORT_OFFSET = (AXIL_EXTENDED_PORT_EXISTS == 1) ? (AXIL_WAN_BASE_CTDEST_OFFSET + AXIL_WAN_BASE_CTDEST_WIDTH) : 0;
// Figure out how wide Extended CTDEST is
// Base + Extended CTDEST Width must not exceed maximum CTDEST width
localparam AXIL_EXTENDED_CTDEST_EXISTS = (AXIL_EXTENDED_PORT_EXISTS == 1 && (AXI_LITE_ADDR_WIDTH > (AXIL_WAN_EXTENDED_PORT_OFFSET + 1))) ? 1 : 0;
localparam AXIL_WAN_EXTENDED_CTDEST_OFFSET = (AXIL_EXTENDED_CTDEST_EXISTS == 1) ? (AXIL_WAN_EXTENDED_PORT_OFFSET + 1) : 0;
localparam AXIL_REMAINING_EXTENDED_CTDEST_WIDTH = (AXIL_EXTENDED_CTDEST_EXISTS == 1) ? (AXI_LITE_ADDR_WIDTH - AXIL_WAN_EXTENDED_CTDEST_OFFSET) : 0;
localparam AXIL_MAX_EXTENDED_CTDEST_WIDTH = AXIS_WAN_TDEST_WIDTH - AXIL_WAN_BASE_CTDEST_WIDTH;
localparam AXIL_WAN_EXTENDED_CTDEST_WIDTH = (AXIL_REMAINING_EXTENDED_CTDEST_WIDTH <= AXIL_MAX_EXTENDED_CTDEST_WIDTH) ? AXIL_REMAINING_EXTENDED_CTDEST_WIDTH : AXIL_MAX_EXTENDED_CTDEST_WIDTH; // Will be 0-maximum of 16 bits
// Figure out how wide Cluster Register Address is
localparam AXIL_CREG_ADDR_EXISTS = (AXIL_EXTENDED_CTDEST_EXISTS == 1 && (AXI_LITE_ADDR_WIDTH > (AXIL_WAN_EXTENDED_CTDEST_OFFSET + AXIL_MAX_EXTENDED_CTDEST_WIDTH))) ? 1 : 0;
localparam AXIL_CREG_ADDR_OFFSET = (AXIL_CREG_ADDR_EXISTS == 1) ? (AXIL_WAN_EXTENDED_CTDEST_OFFSET + AXIL_MAX_EXTENDED_CTDEST_WIDTH) : 0;
localparam AXIL_CREG_ADDR_WIDTH = AXI_LITE_ADDR_WIDTH - AXIL_CREG_ADDR_OFFSET;
localparam AXIL_MAX_CREG_ADDR_WIDTH = 15;
// AXI-Stream Offsets 
// to-LAN Interface
// AXI-Stream to-LAN TDATA messages are the following format:
// | WSTRB | Register Address | Data | Message Type |
// |107 104|103             40|39   8|7            0|
// Address and Message Type are allocated more bits than they need, for future proofing
// Only register address (base, extended) is sent, not TDEST
localparam AXIS_LAN_MSG_TYPE_WIDTH = 8; // Future proofing
localparam AXIS_LAN_DATA_OFFSET = AXIS_LAN_MSG_TYPE_WIDTH;
localparam AXIS_LAN_DATA_WIDTH = AXI_LITE_DATA_WIDTH;
localparam AXIS_LAN_ADDR_OFFSET = AXIS_LAN_DATA_OFFSET + AXIS_LAN_DATA_WIDTH;
localparam AXIS_LAN_ADDR_WIDTH = 64; // Allows for addresses up to 64 bits
localparam AXIS_LAN_WSTRB_OFFSET = AXIS_LAN_ADDR_OFFSET + AXIS_LAN_ADDR_WIDTH;
localparam AXIS_LAN_WSTRB_WIDTH = AXI_LITE_WSTRB_WIDTH; // Due to AXI-Lite Data Width being 32 bits
// from-Network-Bridge Interface
// AXI-Stream from-Network-Bridge TDATA messages follow the format of the to-LAN interface, with the following additions for LAN messages sent from the Gateway:
// | Requestor IP | Requestor TID | to-LAN format |
// |147        116|115         108|107           0|
// Requestor IP and TID are the IP address and LAN TID of the kernel that made the original request
localparam AXIS_LAN_TID_OFFSET = AXIS_LAN_WSTRB_OFFSET + AXIS_LAN_WSTRB_WIDTH;
localparam AXIS_LAN_TID_WIDTH = AXIS_LAN_TDEST_WIDTH;
localparam AXIS_LAN_IP_OFFSET = AXIS_LAN_TID_OFFSET + AXIS_LAN_TID_WIDTH;
localparam AXIS_LAN_IP_WIDTH = IP_ADDRESS_WIDTH;
// to-WAN Interface
// AXI-Stream to-WAN TDATA messages are the following format:
// |  CTID | R. IP | R. TID | WSTRB | CReg Addr | CTDEST | Dest Port | Data | Message Type |
// |179 148|147 116|115  108|107 104|103      88|87    56|55       40|39   8|7            0|
// Requestor IP and TID are the IP address and LAN TID of the kernel attached to this converter
// CTID and CTDEST are the Cluster IDs of the source and destination kernel
localparam AXIS_WAN_MSG_TYPE_WIDTH = 8; // Future proofing
localparam AXIS_WAN_DATA_OFFSET = AXIS_WAN_MSG_TYPE_WIDTH;
localparam AXIS_WAN_DATA_WIDTH = AXI_LITE_DATA_WIDTH;
localparam AXIS_WAN_ADDR_WIDTH = 64;
localparam AXIS_WAN_DEST_PORT_OFFSET = AXIS_WAN_DATA_OFFSET + AXIS_WAN_DATA_WIDTH;
localparam AXIS_WAN_DEST_PORT_WIDTH = IP_PORT_WIDTH;
localparam AXIS_WAN_CTDEST_OFFSET = AXIS_WAN_DEST_PORT_OFFSET + AXIS_WAN_DEST_PORT_WIDTH;
localparam AXIS_WAN_CTDEST_WIDTH = AXIS_WAN_TDEST_WIDTH;
localparam AXIS_WAN_CREG_ADDR_OFFSET = AXIS_WAN_CTDEST_OFFSET + AXIS_WAN_CTDEST_WIDTH;
localparam AXIS_WAN_CREG_ADDR_WIDTH = AXIL_MAX_CREG_ADDR_WIDTH;
localparam AXIS_WAN_WSTRB_OFFSET = AXIS_WAN_CREG_ADDR_OFFSET + AXIS_WAN_CREG_ADDR_WIDTH;
localparam AXIS_WAN_WSTRB_WIDTH = AXI_LITE_WSTRB_WIDTH;
localparam AXIS_WAN_TID_OFFSET = AXIS_WAN_WSTRB_OFFSET + AXIS_WAN_WSTRB_WIDTH;
localparam AXIS_WAN_TID_WIDTH = AXIS_LAN_TDEST_WIDTH;
localparam AXIS_WAN_IP_OFFSET = AXIS_WAN_TID_OFFSET + AXIS_WAN_TID_WIDTH;
localparam AXIS_WAN_IP_WIDTH = IP_ADDRESS_WIDTH;
localparam AXIS_WAN_CTID_OFFSET = AXIS_WAN_IP_OFFSET + AXIS_WAN_IP_WIDTH;
localparam AXIS_WAN_CTID_WIDTH = AXIS_WAN_TDEST_WIDTH;
// Known IP Interface
// AXI-Stream Known IP TDATA messages are the following format:
// | CTDEST | KIP Sender TID | Requestor TID | Data | Message Type |
// |87    56|55            48|47           40|39   8|7            0|
// Only LAN Response messages will be sent using this interface
// Requestor TID (TDEST) represents the ID of the kernel that submitted the LAN/WAN request
// KIP Sender TID represents the ID of the kernel that sent this KIP message
// CTDEST is the ID of the destination cluster
// IMPORTANT: KIP Sender TID is not yet implemented in AXI-Lite to Network Converters
localparam AXIS_KIP_MSG_TYPE_WIDTH = 8; // Future proofing
localparam AXIS_KIP_DATA_OFFSET = AXIS_KIP_MSG_TYPE_WIDTH;
localparam AXIS_KIP_DATA_WIDTH = AXI_LITE_DATA_WIDTH;
localparam AXIS_KIP_TID_OFFSET = AXIS_KIP_DATA_OFFSET + AXIS_KIP_DATA_WIDTH;
localparam AXIS_KIP_TID_WIDTH = AXIS_LAN_TDEST_WIDTH;
localparam AXIS_KIP_SENDER_TID_OFFSET = AXIS_KIP_TID_OFFSET + AXIS_KIP_TID_WIDTH;
localparam AXIS_KIP_SENDER_TID_WIDTH = AXIS_LAN_TDEST_WIDTH;
localparam AXIS_KIP_CTDEST_OFFSET = AXIS_KIP_SENDER_TID_OFFSET + AXIS_KIP_SENDER_TID_WIDTH;
localparam AXIS_KIP_CTDEST_WIDTH = AXIS_WAN_TDEST_WIDTH;
// AXI-Stream Known IP TUSER looks like the following:
// | Destination Port | Source Port | Requestor IP Address |
// |63              48|47         32|31                   0| 
localparam AXIS_KIP_TUSER_SRC_PORT_OFFSET = IP_ADDRESS_WIDTH;
localparam AXIS_KIP_TUSER_SRC_PORT_WIDTH = IP_PORT_WIDTH;
localparam AXIS_KIP_TUSER_DEST_PORT_OFFSET = AXIS_KIP_TUSER_SRC_PORT_OFFSET + AXIS_KIP_TUSER_SRC_PORT_WIDTH;
localparam AXIS_KIP_TUSER_DEST_PORT_WIDTH = IP_PORT_WIDTH;
// AXI-Stream from-Network-Bridge TUSER looks like the following:
// | Destination Port | Source Port | Source IP Address |
// |63              48|47         32|31                0| 
localparam AXIS_FROM_NB_SRC_PORT_OFFSET = IP_ADDRESS_WIDTH;
localparam AXIS_FROM_NB_DEST_PORT_OFFSET = AXIS_FROM_NB_SRC_PORT_OFFSET + IP_PORT_WIDTH;
// AXI-Stream LAN Header Offsets
// LAN messages received from the network will consist of two flits: a header followed by the payload
// The message header looks like the following:
// |    0   | TDEST | TID | TUSER |
// |511   24|23   16|15  8|7     0|
localparam AXIS_LAN_HDR_TID_OFFSET = 8;
localparam AXIS_LAN_HDR_TID_WIDTH = AXIS_LAN_TDEST_WIDTH;
localparam AXIS_LAN_HDR_TDEST_OFFSET = AXIS_LAN_HDR_TID_OFFSET + AXIS_LAN_HDR_TID_WIDTH;
localparam AXIS_LAN_HDR_TDEST_WIDTH = AXIS_LAN_TDEST_WIDTH;