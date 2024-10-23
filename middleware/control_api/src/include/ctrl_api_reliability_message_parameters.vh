// *****************************************************************************
// Reliability Messages
// *****************************************************************************
// Packets are identified based on their sequence number. There are 2 types of sequence number:
// - LAN Sequence Number
// - WAN Sequence Number
// Let N represent number of FPGA Nodes in a cluster, and C represents the number of clusters

// Reliability Message Types
localparam RPN_MSG_TYPE_LAN_PUB = 0;
localparam RPN_MSG_TYPE_LAN_ACK = 1;
localparam RPN_MSG_TYPE_LAN_SEQ_NUM_CHECK = 2;
localparam RPN_MSG_TYPE_LAN_SEQ_NUM_REPLY = 3;
localparam RPN_MSG_TYPE_WAN_PUB = 4;
localparam RPN_MSG_TYPE_WAN_ACK = 5;
localparam RPN_MSG_TYPE_WAN_NUM_SEQ_NUM_CHECK = 6; // Sent by WAN Num TX to WAN Num Node to receive a sequence number for WAN->GW communications
localparam RPN_MSG_TYPE_WAN_NUM_SEQ_NUM_REPLY = 7;
localparam RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_REQUEST = 8; // Sent by WAN TX to Gateway to request a sequence number to send the WAN message. Uses WAN->GW sequence number received using RPN_MSG_TYPE_WAN_GW_SEQ_NUM_CHECK
localparam RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_REPLY = 9;
localparam RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_WRITE = 10; // Also serves to unlock the sequence number for another usage
localparam RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_BRESP = 11;
localparam RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_REQUEST = 12; // Sent by WAN TX to Gateway to request a sequence number to send the WAN message. Uses WAN->GW sequence number received using RPN_MSG_TYPE_WAN_GW_SEQ_NUM_CHECK
localparam RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_REPLY = 13;
localparam RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_WRITE = 14; // Also serves to unlock the sequence number for another usage
localparam RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_BRESP = 15;
localparam RPN_MSG_TYPE_WAN_SEQ_NUM_CHECK = 16; // Used by WNN Repos to query gateways for their currently stored Sequence numbers
localparam RPN_MSG_TYPE_WAN_SEQ_NUM_REPLY = 17;
localparam RPN_MSG_TYPE_KIP_PUB = 18;
localparam RPN_MSG_TYPE_KIP_ACK = 19;
localparam RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_CHECK = 20; // Used by KIP RX to verify the WAN sequence number and owner of the received KIP transmission. 
localparam RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_RDATA = 21;

// Packet Offsets
// LAN messages
// LAN PUB and SEQ REQUEST messages will be sent using LAN with TDATA fields set in the following format:
// | Packet Data | Forwarded WAN Seq Num | Forwarded CTID | LAN Sequence Number | RPN Sender Node ID | RPN_MSG_TYPE_LAN_PUB |
// |511        80|79                   64|63            32|31                 16|15                 8|7                    0|
// RPM overhead occupies 80 bits. The remaining bits are allocated for the LAN packet's data
// RPN Message Type identifies this as a PUB_LAN or SEQ NUM REQUEST message
// RPN Node ID is the ID of the FPGA hosting the kernel that made the original request
// LAN Sequence Number is used to maintain reliability
// Forwarded CTID and Forwarded WAN Sequence Number fields are used for LAN messages sent from the gateway. These are not used for LAN reliability, but are used by the node to reply to the message. Set to 0 for pure LAN messages
// SEQ NUM REQUEST messages have everything set to 0, except for Sender Node ID and Message Type
localparam PUB_LAN_SENDER_NODE_ID_OFFSET = RPN_MSG_TYPE_WIDTH;
localparam PUB_LAN_SENDER_NODE_ID_WIDTH = NODE_ID_WIDTH;
localparam PUB_LAN_SEQUENCE_NUMBER_OFFSET = PUB_LAN_SENDER_NODE_ID_OFFSET + PUB_LAN_SENDER_NODE_ID_WIDTH;
localparam PUB_LAN_SEQUENCE_NUMBER_WIDTH = LAN_SEQUENCE_NUMBER_WIDTH;
localparam PUB_LAN_FWD_CTID_OFFSET = PUB_LAN_SEQUENCE_NUMBER_OFFSET + PUB_LAN_SEQUENCE_NUMBER_WIDTH;
localparam PUB_LAN_FWD_CTID_WIDTH = CLUSTER_ID_WIDTH;
localparam PUB_LAN_FWD_WAN_SEQ_NUM_OFFSET = PUB_LAN_FWD_CTID_OFFSET + PUB_LAN_FWD_CTID_WIDTH;
localparam PUB_LAN_FWD_WAN_SEQ_NUM_WIDTH = WAN_SEQUENCE_NUMBER_WIDTH;
localparam PUB_LAN_DATA_OFFSET = PUB_LAN_FWD_WAN_SEQ_NUM_OFFSET + PUB_LAN_FWD_WAN_SEQ_NUM_WIDTH;
localparam PUB_LAN_DATA_WIDTH = AXIS_DATA_WIDTH -  PUB_LAN_DATA_OFFSET;
// LAN ACK and SEQ NUM REPLY messages will be sent using the KIP interface and have TDATA in the following format:
// |      0      | LAN Sequence Number | RPN Sender Node ID | RPN_MSG_TYPE_LAN_ACK |
// |511        32|31                 16|15                 8|7                    0|
localparam LAN_ACK_SENDER_NODE_ID_OFFSET = RPN_MSG_TYPE_WIDTH;
localparam LAN_ACK_SENDER_NODE_ID_WIDTH = NODE_ID_WIDTH;
localparam LAN_ACK_SEQUENCE_NUMBER_OFFSET = LAN_ACK_SENDER_NODE_ID_OFFSET + LAN_ACK_SENDER_NODE_ID_WIDTH;
localparam LAN_ACK_SEQUENCE_NUMBER_WIDTH = LAN_SEQUENCE_NUMBER_WIDTH;

// WAN messages
// PUB WAN messages have TDATA fields set in the following format:
// | Packet Data | WAN Sequence Number | RPN Sender CTID | RPN_MSG_TYPE_WAN_PUB |
// |511        56|55                 40|39              8|7                    0|
// RPN overhead occupies 56 bits. The remaining bits are allocated for the WAN packet's data
// RPN Message Type identifies this as a PUB_WAN message
// RPN Sender CTID is the Cluster ID of the kernel that made the original request
// WAN Sequence Number is used to maintain reliability
localparam PUB_WAN_SENDER_CTID_OFFSET = RPN_MSG_TYPE_WIDTH;
localparam PUB_WAN_SENDER_CTID_WIDTH = CLUSTER_ID_WIDTH;
localparam PUB_WAN_SEQUENCE_NUMBER_OFFSET = PUB_WAN_SENDER_CTID_OFFSET + PUB_WAN_SENDER_CTID_WIDTH;
localparam PUB_WAN_SEQUENCE_NUMBER_WIDTH = WAN_SEQUENCE_NUMBER_WIDTH;
localparam PUB_WAN_DATA_OFFSET = PUB_WAN_SEQUENCE_NUMBER_OFFSET + PUB_WAN_SEQUENCE_NUMBER_WIDTH;
localparam PUB_WAN_DATA_WIDTH = AXIS_DATA_WIDTH -  PUB_WAN_DATA_OFFSET;
// WAN ACK messages will be sent using the KIP interface and have TDATA in the following format:
// |      0      | WAN Sequence Number | RPN Sender CTID | RPN_MSG_TYPE_WAN_ACK |
// |511        32|55                 40|39              8|7                    0|
localparam WAN_ACK_SENDER_CTID_OFFSET = RPN_MSG_TYPE_WIDTH;
localparam WAN_ACK_SENDER_CTID_WIDTH = CLUSTER_ID_WIDTH;
localparam WAN_ACK_SEQUENCE_NUMBER_OFFSET = WAN_ACK_SENDER_CTID_OFFSET + WAN_ACK_SENDER_CTID_WIDTH;
localparam WAN_ACK_SEQUENCE_NUMBER_WIDTH = WAN_SEQUENCE_NUMBER_WIDTH;

// KIP Messages
// KIP interface is used to send LAN response messages and all acknowledgement/reply messages
// PUB KIP TDATA messages are the following format:
// | Packet Data | WAN Sequence Number | RPN Sender CTID | RPN Message Type |
// |511        56|55                 40|39              8|7                0|
// PUB KIP messages will use the WAN sequence number used to send the WAN request
localparam PUB_KIP_SENDER_CTID_OFFSET = RPN_MSG_TYPE_WIDTH;
localparam PUB_KIP_SENDER_CTID_WIDTH = CLUSTER_ID_WIDTH;
localparam PUB_KIP_SEQUENCE_NUMBER_OFFSET = PUB_KIP_SENDER_CTID_OFFSET + PUB_KIP_SENDER_CTID_WIDTH;
localparam PUB_KIP_SEQUENCE_NUMBER_WIDTH = WAN_SEQUENCE_NUMBER_WIDTH;
localparam PUB_KIP_DATA_OFFSET = PUB_KIP_SEQUENCE_NUMBER_OFFSET + PUB_KIP_SEQUENCE_NUMBER_WIDTH;
localparam PUB_KIP_DATA_WIDTH = AXIS_DATA_WIDTH - PUB_KIP_DATA_OFFSET;
// KIP ACK messages will be sent using the KIP interface and have TDATA in the following format:
// | Packet Data | WAN Sequence Number | RPN Sender CTID | RPN Message Type |
// |511        56|55                 40|39              8|7                0|
localparam KIP_ACK_SENDER_CTID_OFFSET = RPN_MSG_TYPE_WIDTH;
localparam KIP_ACK_SENDER_CTID_WIDTH = CLUSTER_ID_WIDTH;
localparam KIP_ACK_SEQUENCE_NUMBER_OFFSET = KIP_ACK_SENDER_CTID_OFFSET + KIP_ACK_SENDER_CTID_WIDTH;
localparam KIP_ACK_SEQUENCE_NUMBER_WIDTH = WAN_SEQUENCE_NUMBER_WIDTH;
// All GW SEQ NUM request and reply messages () will look like the following:
// |   0  | Sequence Number Locked | CTDEST | WAN Sequence Number | WAN Num Sequence Number | RPN Sender Node ID | RPN Message Type |
// |511 97|          96            |95    64|63                 48|47                     16|15                 8|7                0|
// Replies to SEQ NUM REQUESTS will supply the sequence number in the WAN sequence number field. Otherwise, this will be set to 0
// One 1 node in each cluster can write to the same destination cluster at the same time. Therefore, a lock is transmitted in bit 64. If the lock bit is 1, then the WAN TX for that node will have to try again later.
// CTDEST refers to the cluster ID corresponding to the sent sequence number
localparam GW_KIP_SENDER_NODE_ID_OFFSET = RPN_MSG_TYPE_WIDTH;
localparam GW_KIP_SENDER_NODE_ID_WIDTH = NODE_ID_WIDTH;
localparam GW_KIP_SEQUENCE_NUMBER_OFFSET = GW_KIP_SENDER_NODE_ID_OFFSET + GW_KIP_SENDER_NODE_ID_WIDTH;
localparam GW_KIP_SEQUENCE_NUMBER_WIDTH = WAN_NUM_SEQUENCE_NUMBER_WIDTH;
localparam GW_KIP_WAN_SEQUENCE_NUMBER_OFFSET = GW_KIP_SEQUENCE_NUMBER_OFFSET + GW_KIP_SEQUENCE_NUMBER_WIDTH;
localparam GW_KIP_WAN_SEQUENCE_NUMBER_WIDTH = WAN_SEQUENCE_NUMBER_WIDTH;
localparam GW_KIP_WAN_CTDEST_OFFSET = GW_KIP_WAN_SEQUENCE_NUMBER_OFFSET + GW_KIP_WAN_SEQUENCE_NUMBER_WIDTH;
localparam GW_KIP_WAN_CTDEST_WIDTH = AXIS_WAN_TDEST_WIDTH;
localparam GW_KIP_WAN_LOCK_OFFSET = GW_KIP_WAN_CTDEST_OFFSET + GW_KIP_WAN_CTDEST_WIDTH;

// KIP TUSER looks like the following:
// | Destination Port | Source Port | Source IP Address |
// |63              48|47         32|31                0| 
localparam KIP_TUSER_SRC_PORT_OFFSET = IP_ADDRESS_WIDTH;
localparam KIP_TUSER_SRC_PORT_WIDTH = IP_PORT_WIDTH;
localparam KIP_TUSER_DEST_PORT_OFFSET = KIP_TUSER_SRC_PORT_OFFSET + KIP_TUSER_SRC_PORT_WIDTH;
localparam KIP_TUSER_DEST_PORT_WIDTH = IP_PORT_WIDTH;
// Offsets for Packets from Control
// from-Control KnownIP Interface
localparam FROM_CTRL_KIP_TDEST_OFFSET = 40;
// Other
localparam FROM_NB_TUSER_SRC_PORT_OFFSET = KIP_TUSER_SRC_PORT_OFFSET;
localparam FROM_NB_TUSER_SRC_PORT_WIDTH = KIP_TUSER_SRC_PORT_WIDTH;
localparam FROM_NB_TUSER_DEST_PORT_OFFSET = KIP_TUSER_DEST_PORT_OFFSET;
localparam FROM_NB_TUSER_DEST_PORT_WIDTH = KIP_TUSER_DEST_PORT_WIDTH;