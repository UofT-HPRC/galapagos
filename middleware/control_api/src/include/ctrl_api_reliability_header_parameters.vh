localparam BRAM_ADDR_WIDTH = 32, // All BRAMs have 32-bit wide addresses regardless of actual address length
localparam BRAM_WEN_WIDTH = 4, // WEN also functions as WSTRB
localparam RPN_MSG_TYPE_WIDTH = 8, // Extra bits added for future proofing
// LAN Sequence Number:
// Two sequence numbers are maintained for each Node->Node combination: One for going A->B, one for B->A. This results in 2N currently used sequence numbers at any given time.
localparam LAN_SEQUENCE_NUMBER_WIDTH = 16,
// Node ID
localparam NODE_ID_WIDTH = 8,
// WAN Sequence Number:
// Two sequence numbers are maintained for each Cluster->Cluster combination: One for going A->B, one for B->A. This results in 2C currently used sequence numbers at any given time.
// Any node in Cluster A that wants to contact Cluster B must use the A->B sequence number
localparam WAN_SEQUENCE_NUMBER_WIDTH = 16,
// WAN Num Sequence Number:
// Two sequence numbers are maintained for each Node->WAN Number Node combination: One for going A->B, one for B->A. This results in 2N currently used sequence numbers at any given time.
localparam WAN_NUM_SEQUENCE_NUMBER_WIDTH = 32,
localparam WAN_NUM_TDEST_WIDTH = 2,
// Message destinations
localparam ID_RPN_WAN_TX = 1,
localparam ID_RPN_KIP_TX = 2,
localparam ID_RPN_KIP_RX = 3,