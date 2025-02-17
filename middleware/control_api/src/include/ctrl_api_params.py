# ctrl_api_header_parameters.vh
# AXI-Lite Interfaces
AXI_LITE_ADDR_WIDTH = 64 # Adjustable
AXI_LITE_DATA_WIDTH = 32
AXI_LITE_WSTRB_WIDTH = 4
AXI_LITE_BRESP_WIDTH = 2
# AXI-Stream Interfaces
AXIS_DATA_WIDTH = 512
AXIS_KEEP_WIDTH = 64
# AXI-Stream to-LAN Interface
AXIS_LAN_TDEST_WIDTH = 8
AXIS_LAN_TUSER_WIDTH = 8
# AXI-Stream to-WAN Interface
AXIS_WAN_TDEST_WIDTH = 32
AXIS_WAN_TUSER_WIDTH = 16
# AXI-Stream to-KnownIP Interface
IP_ADDRESS_WIDTH = 32
IP_PORT_WIDTH = 16
AXIS_KIP_TUSER_WIDTH = 64
# AXI-Stream from-Receptionist Interface
AXIS_RECEP_TDEST_WIDTH = 16
AXIS_RECEP_TUSER_WIDTH = 48
# AXI-Stream from-Network Interface
AXIS_FROM_NB_TDEST_WIDTH = AXIS_LAN_TDEST_WIDTH
AXIS_FROM_NB_TUSER_WIDTH = AXIS_KIP_TUSER_WIDTH
# Other
CLUSTER_ID_WIDTH = 32
BRAM_ADDR_WIDTH = 32 # All BRAMs have 32-bit wide addresses regardless of actual address length
# ctrl_api_reliability_header_parameters.vh
BRAM_WEN_WIDTH = 4 # WEN also functions as WSTRB
RPN_MSG_TYPE_WIDTH = 8 # Extra bits added for future proofing
# LAN Sequence Number:
# Two sequence numbers are maintained for each Node->Node combination: One for going A->B one for B->A. This results in 2N currently used sequence numbers at any given time.
LAN_SEQUENCE_NUMBER_WIDTH = 16
# Node ID
NODE_ID_WIDTH = 8
# WAN Sequence Number:
# Two sequence numbers are maintained for each Cluster->Cluster combination: One for going A->B one for B->A. This results in 2C currently used sequence numbers at any given time.
# Any node in Cluster A that wants to contact Cluster B must use the A->B sequence number
WAN_SEQUENCE_NUMBER_WIDTH = 16
# WAN Num Sequence Number:
# Two sequence numbers are maintained for each Node->WAN Number Node combination: One for going A->B one for B->A. This results in 2N currently used sequence numbers at any given time.
WAN_NUM_SEQUENCE_NUMBER_WIDTH = 32
WAN_NUM_TDEST_WIDTH = 2
# Message destinations
ID_RPN_WAN_TX = 1
ID_RPN_KIP_TX = 2
ID_RPN_KIP_RX = 3
# ctrl_api_message_parameters.vh
# *****************************************************************************
# Control Messages
# *****************************************************************************
# Message Types
MSG_TYPE_WIDTH = 3
MSG_READ = 0
MSG_WRITE = 1
MSG_BRESP = 2
MSG_RDATA = 3
MSG_BUSY = 4 # Indicates that the AXI-Lite to Network Converter cannot read/store the message right now
# AXI-Lite Offsets
AXIL_IS_WAN_OFFSET = 0
# AXI-Lite LAN messages have addresses in the following format:
# | Extended Register Address | Base Register Address | TDEST | 0 |
# |63                       32|31                    9|8     1| 0 |
# Base Register Address forms bits 0-22 of Full Register Address
# Extended Register Address forms bits 23-MSB (up to 55 bits in total)
AXIL_LAN_TDEST_OFFSET = 1
AXIL_LAN_BASE_REG_ADDR_OFFSET = AXIL_LAN_TDEST_OFFSET + AXIS_LAN_TDEST_WIDTH
AXIL_LAN_BASE_REG_ADDR_WIDTH = 23
AXIL_LAN_EXTENDED_REG_ADDR_OFFSET = 32
AXIL_LAN_EXTENDED_REG_ADDR_WIDTH = AXI_LITE_ADDR_WIDTH - AXIL_LAN_EXTENDED_REG_ADDR_OFFSET # Will be 0-32 bits
AXIL_LAN_FULL_REG_ADDR_OFFSET = AXIL_LAN_BASE_REG_ADDR_OFFSET
AXIL_LAN_FULL_REG_ADDR_WIDTH = AXIL_LAN_BASE_REG_ADDR_WIDTH + AXIL_LAN_EXTENDED_REG_ADDR_WIDTH
# AXI-Lite WAN messages have addresses in the following format:
# | CReg Address | Ext. CTDEST | Ext. Port | Base CTDEST | Base Port | 1 |
# |63          49|48         33|     32    |31         16|15        1| 0 |
# If Address width is 32 bits only base port is used therefore only ports from 32768 onwards can be reached (bit 15 will be set to 1)
# Extended Port forms bit 15 of the Destination Port
# Base Cluster TDEST (CTDEST) forms bits 0-15 of Full CTDEST
# Extended CTDEST forms bits 16-MSB of Full Dest Cluster ID (up to bits 16-31)
# CReg Address is used to write to an address space within the targeted Cluster IP/Port
AXIL_WAN_BASE_PORT_OFFSET = 1
AXIL_WAN_BASE_PORT_WIDTH = 15
AXIL_WAN_BASE_CTDEST_OFFSET = AXIL_WAN_BASE_PORT_OFFSET + AXIL_WAN_BASE_PORT_WIDTH
AXIL_WAN_BASE_CTDEST_WIDTH = 16
AXIL_EXTENDED_PORT_EXISTS = 1 if (AXI_LITE_ADDR_WIDTH > (AXIL_WAN_BASE_CTDEST_OFFSET + AXIL_WAN_BASE_CTDEST_WIDTH)) else 0
AXIL_WAN_EXTENDED_PORT_OFFSET = (AXIL_WAN_BASE_CTDEST_OFFSET + AXIL_WAN_BASE_CTDEST_WIDTH) if (AXIL_EXTENDED_PORT_EXISTS == 1) else 0
# Figure out how wide Extended CTDEST is
# Base + Extended CTDEST Width must not exceed maximum CTDEST width
AXIL_EXTENDED_CTDEST_EXISTS = 1 if (AXIL_EXTENDED_PORT_EXISTS == 1 and (AXI_LITE_ADDR_WIDTH > (AXIL_WAN_EXTENDED_PORT_OFFSET + 1))) else 0
AXIL_WAN_EXTENDED_CTDEST_OFFSET = (AXIL_WAN_EXTENDED_PORT_OFFSET + 1) if (AXIL_EXTENDED_CTDEST_EXISTS == 1) else 0
AXIL_REMAINING_EXTENDED_CTDEST_WIDTH = (AXI_LITE_ADDR_WIDTH - AXIL_WAN_EXTENDED_CTDEST_OFFSET) if (AXIL_EXTENDED_CTDEST_EXISTS == 1) else 0
AXIL_MAX_EXTENDED_CTDEST_WIDTH = AXIS_WAN_TDEST_WIDTH - AXIL_WAN_BASE_CTDEST_WIDTH
AXIL_WAN_EXTENDED_CTDEST_WIDTH = AXIL_REMAINING_EXTENDED_CTDEST_WIDTH if (AXIL_REMAINING_EXTENDED_CTDEST_WIDTH <= AXIL_MAX_EXTENDED_CTDEST_WIDTH) else AXIL_MAX_EXTENDED_CTDEST_WIDTH # Will be 0-maximum of 16 bits
# Figure out how wide Cluster Register Address is
AXIL_CREG_ADDR_EXISTS = 1 if (AXIL_EXTENDED_CTDEST_EXISTS == 1 and (AXI_LITE_ADDR_WIDTH > (AXIL_WAN_EXTENDED_CTDEST_OFFSET + AXIL_MAX_EXTENDED_CTDEST_WIDTH))) else 0
AXIL_CREG_ADDR_OFFSET = (AXIL_WAN_EXTENDED_CTDEST_OFFSET + AXIL_MAX_EXTENDED_CTDEST_WIDTH) if (AXIL_CREG_ADDR_EXISTS == 1) else 0
AXIL_CREG_ADDR_WIDTH = AXI_LITE_ADDR_WIDTH - AXIL_CREG_ADDR_OFFSET
AXIL_MAX_CREG_ADDR_WIDTH = 15
# AXI-Stream Offsets
# to-LAN Interface
# AXI-Stream to-LAN TDATA messages are the following format:
# | WSTRB | Register Address | Data | Message Type |
# |107 104|103             40|39   8|7            0|
# Address and Message Type are allocated more bits than they need for future proofing
# Only register address (base extended) is sent not TDEST
AXIS_LAN_MSG_TYPE_WIDTH = 8 # Future proofing
AXIS_LAN_DATA_OFFSET = AXIS_LAN_MSG_TYPE_WIDTH
AXIS_LAN_DATA_WIDTH = AXI_LITE_DATA_WIDTH
AXIS_LAN_ADDR_OFFSET = AXIS_LAN_DATA_OFFSET + AXIS_LAN_DATA_WIDTH
AXIS_LAN_ADDR_WIDTH = 64 # Allows for addresses up to 64 bits
AXIS_LAN_WSTRB_OFFSET = AXIS_LAN_ADDR_OFFSET + AXIS_LAN_ADDR_WIDTH
AXIS_LAN_WSTRB_WIDTH = AXI_LITE_WSTRB_WIDTH # Due to AXI-Lite Data Width being 32 bits
# from-Network-Bridge Interface
# AXI-Stream from-Network-Bridge TDATA messages follow the format of the to-LAN interface with the following additions for LAN messages sent from the Gateway:
# | Requestor CTID | Requestor IP | Requestor TID | to-LAN format |
# |179          148|147        116|115         108|107           0|
# Requestor IP and TID are the IP address and LAN TID of the kernel that made the original request
AXIS_LAN_TID_OFFSET = AXIS_LAN_WSTRB_OFFSET + AXIS_LAN_WSTRB_WIDTH
AXIS_LAN_TID_WIDTH = AXIS_LAN_TDEST_WIDTH
AXIS_LAN_IP_OFFSET = AXIS_LAN_TID_OFFSET + AXIS_LAN_TID_WIDTH
AXIS_LAN_IP_WIDTH = IP_ADDRESS_WIDTH
AXIS_LAN_CTID_OFFSET = AXIS_LAN_IP_OFFSET + AXIS_LAN_IP_WIDTH
AXIS_LAN_CTID_WIDTH = CLUSTER_ID_WIDTH

# to-WAN Interface
# AXI-Stream to-WAN TDATA messages are the following format:
# |  CTID | R. IP | R. TID | WSTRB | CReg Addr | CTDEST | Dest Port | Data | Message Type |
# |179 148|147 116|115  108|107 104|103      88|87    56|55       40|39   8|7            0|
# Requestor IP and TID are the IP address and LAN TID of the kernel attached to this converter
# CTID and CTDEST are the Cluster IDs of the source and destination kernel
AXIS_WAN_MSG_TYPE_WIDTH = 8 # Future proofing
AXIS_WAN_DATA_OFFSET = AXIS_WAN_MSG_TYPE_WIDTH
AXIS_WAN_DATA_WIDTH = AXI_LITE_DATA_WIDTH
AXIS_WAN_ADDR_WIDTH = 64
AXIS_WAN_DEST_PORT_OFFSET = AXIS_WAN_DATA_OFFSET + AXIS_WAN_DATA_WIDTH
AXIS_WAN_DEST_PORT_WIDTH = IP_PORT_WIDTH
AXIS_WAN_CTDEST_OFFSET = AXIS_WAN_DEST_PORT_OFFSET + AXIS_WAN_DEST_PORT_WIDTH
AXIS_WAN_CTDEST_WIDTH = AXIS_WAN_TDEST_WIDTH
AXIS_WAN_CREG_ADDR_OFFSET = AXIS_WAN_CTDEST_OFFSET + AXIS_WAN_CTDEST_WIDTH
AXIS_WAN_CREG_ADDR_WIDTH = AXIL_MAX_CREG_ADDR_WIDTH
AXIS_WAN_WSTRB_OFFSET = AXIS_WAN_CREG_ADDR_OFFSET + AXIS_WAN_CREG_ADDR_WIDTH
AXIS_WAN_WSTRB_WIDTH = AXI_LITE_WSTRB_WIDTH
AXIS_WAN_TID_OFFSET = AXIS_WAN_WSTRB_OFFSET + AXIS_WAN_WSTRB_WIDTH
AXIS_WAN_TID_WIDTH = AXIS_LAN_TDEST_WIDTH
AXIS_WAN_IP_OFFSET = AXIS_WAN_TID_OFFSET + AXIS_WAN_TID_WIDTH
AXIS_WAN_IP_WIDTH = IP_ADDRESS_WIDTH
AXIS_WAN_CTID_OFFSET = AXIS_WAN_IP_OFFSET + AXIS_WAN_IP_WIDTH
AXIS_WAN_CTID_WIDTH = AXIS_WAN_TDEST_WIDTH

# Known IP Interface
# AXI-Stream Known IP TDATA messages are the following format:
# | CTDEST | KIP Sender TID | Requestor TID | Data | Message Type |
# |87    56|55            48|47           40|39   8|7            0|
# Only LAN Response messages will be sent using this interface
# Requestor TID (TDEST) represents the ID of the kernel that submitted the LAN/WAN request
# KIP Sender TID represents the ID of the kernel that sent this KIP message
# CTDEST is the ID of the destination cluster
# IMPORTANT: KIP Sender TID is not yet implemented in AXI-Lite to Network Converters
AXIS_KIP_MSG_TYPE_WIDTH = 8 # Future proofing
AXIS_KIP_DATA_OFFSET = AXIS_KIP_MSG_TYPE_WIDTH
AXIS_KIP_DATA_WIDTH = AXI_LITE_DATA_WIDTH
AXIS_KIP_TID_OFFSET = AXIS_KIP_DATA_OFFSET + AXIS_KIP_DATA_WIDTH
AXIS_KIP_TID_WIDTH = AXIS_LAN_TDEST_WIDTH
AXIS_KIP_SENDER_TID_OFFSET = AXIS_KIP_TID_OFFSET + AXIS_KIP_TID_WIDTH
AXIS_KIP_SENDER_TID_WIDTH = AXIS_LAN_TDEST_WIDTH
AXIS_KIP_CTDEST_OFFSET = AXIS_KIP_SENDER_TID_OFFSET + AXIS_KIP_SENDER_TID_WIDTH
AXIS_KIP_CTDEST_WIDTH = AXIS_WAN_TDEST_WIDTH
# AXI-Stream Known IP TUSER looks like the following:
# | Destination Port | Source Port | Requestor IP Address |
# |63              48|47         32|31                   0|
AXIS_KIP_TUSER_SRC_PORT_OFFSET = IP_ADDRESS_WIDTH
AXIS_KIP_TUSER_SRC_PORT_WIDTH = IP_PORT_WIDTH
AXIS_KIP_TUSER_DEST_PORT_OFFSET = AXIS_KIP_TUSER_SRC_PORT_OFFSET + AXIS_KIP_TUSER_SRC_PORT_WIDTH
AXIS_KIP_TUSER_DEST_PORT_WIDTH = IP_PORT_WIDTH
# AXI-Stream from-Network-Bridge TUSER looks like the following:
# | Destination Port | Source Port | Source IP Address |
# |63              48|47         32|31                0|
AXIS_FROM_NB_SRC_PORT_OFFSET = IP_ADDRESS_WIDTH
AXIS_FROM_NB_DEST_PORT_OFFSET = AXIS_FROM_NB_SRC_PORT_OFFSET + IP_PORT_WIDTH
# AXI-Stream LAN Header Offsets
# LAN messages received from the network will consist of two flits: a header followed by the payload
# The message header looks like the following:
# |    0   | TDEST | TID | TUSER |
# |511   24|23   16|15  8|7     0|
AXIS_LAN_HDR_TID_OFFSET = 8
AXIS_LAN_HDR_TID_WIDTH = AXIS_LAN_TDEST_WIDTH
AXIS_LAN_HDR_TDEST_OFFSET = AXIS_LAN_HDR_TID_OFFSET + AXIS_LAN_HDR_TID_WIDTH
AXIS_LAN_HDR_TDEST_WIDTH = AXIS_LAN_TDEST_WIDTH
# AXI-Stream LAN Port Numbers
AXIS_LAN_PORT_INFRASTRUCTURE = 1
AXIS_LAN_PORT_USER = 2
# ctrl_api_reliability_message_parameters.vh
# *****************************************************************************
# Reliability Messages
# *****************************************************************************
# Packets are identified based on their sequence number. There are 2 types of sequence number:
# - LAN Sequence Number
# - WAN Sequence Number
# Let N represent number of FPGA Nodes in a cluster and C represents the number of clusters

# Reliability Message Types
RPN_MSG_TYPE_LAN_PUB = 0
RPN_MSG_TYPE_LAN_ACK = 1
RPN_MSG_TYPE_LAN_SEQ_NUM_CHECK = 2
RPN_MSG_TYPE_LAN_SEQ_NUM_REPLY = 3
RPN_MSG_TYPE_WAN_PUB = 4
RPN_MSG_TYPE_WAN_ACK = 5
RPN_MSG_TYPE_WAN_SEQ_NUM_CHECK = 6 # Used by WNN Repos to query gateways for their currently stored Sequence numbers
RPN_MSG_TYPE_WAN_SEQ_NUM_REPLY = 7
RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_REQUEST = 8 # Sent by WAN TX to Gateway to request a sequence number to send the WAN message. Uses WAN->GW sequence number received using RPN_MSG_TYPE_WAN_GW_SEQ_NUM_CHECK
RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_REPLY = 14
RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_WRITE = 9 # Also serves to unlock the sequence number for another usage
RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_BRESP = 15
RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_CHECK = 10 # Used by KIP RX to verify the WAN sequence number and owner of the received KIP transmission.
RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_RDATA = 16
RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_REQUEST = 11 # Sent by WAN TX to Gateway to request a sequence number to send the WAN message. Uses WAN->GW sequence number received using RPN_MSG_TYPE_WAN_GW_SEQ_NUM_CHECK
RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_REPLY = 17
RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_WRITE = 12 # Also serves to unlock the sequence number for another usage
RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_BRESP = 18
RPN_MSG_TYPE_WAN_NUM_SEQ_NUM_CHECK = 13 # Sent by WAN Num TX to WAN Num Node to receive a sequence number for WAN->GW communications
RPN_MSG_TYPE_WAN_NUM_SEQ_NUM_REPLY = 19
RPN_MSG_TYPE_KIP_PUB = 20
RPN_MSG_TYPE_KIP_ACK = 21

# Packet Offsets
# LAN messages
# LAN PUB and SEQ REQUEST messages will be sent using LAN with TDATA fields set in the following format:
# | Packet Data | Forwarded WAN Seq Num | Forwarded CTID | LAN Sequence Number | RPN Sender Node ID | RPN_MSG_TYPE_LAN_PUB |
# |511        80|79                   64|63            32|31                 16|15                 8|7                    0|
# RPM overhead occupies 80 bits. The remaining bits are allocated for the LAN packet's data
# RPN Message Type identifies this as a PUB_LAN or SEQ NUM REQUEST message
# RPN Node ID is the ID of the FPGA hosting the kernel that made the original request
# LAN Sequence Number is used to maintain reliability
# Forwarded CTID and Forwarded WAN Sequence Number fields are used for LAN messages sent from the gateway. These are not used for LAN reliability but are used by the node to reply to the message. Set to 0 for pure LAN messages
# SEQ NUM REQUEST messages have everything set to 0 except for Sender Node ID and Message Type
PUB_LAN_SENDER_NODE_ID_OFFSET = RPN_MSG_TYPE_WIDTH
PUB_LAN_SENDER_NODE_ID_WIDTH = NODE_ID_WIDTH
PUB_LAN_SEQUENCE_NUMBER_OFFSET = PUB_LAN_SENDER_NODE_ID_OFFSET + PUB_LAN_SENDER_NODE_ID_WIDTH
PUB_LAN_SEQUENCE_NUMBER_WIDTH = LAN_SEQUENCE_NUMBER_WIDTH
PUB_LAN_FWD_CTID_OFFSET = PUB_LAN_SEQUENCE_NUMBER_OFFSET + PUB_LAN_SEQUENCE_NUMBER_WIDTH
PUB_LAN_FWD_CTID_WIDTH = CLUSTER_ID_WIDTH
# Currently PUB_LAN_FWD_WAN_SEQ_NUM is not used (sequence numbers are not forwarded in LAN messages)
PUB_LAN_FWD_WAN_SEQ_NUM_OFFSET = PUB_LAN_FWD_CTID_OFFSET + PUB_LAN_FWD_CTID_WIDTH
PUB_LAN_FWD_WAN_SEQ_NUM_WIDTH = WAN_SEQUENCE_NUMBER_WIDTH
PUB_LAN_DATA_OFFSET = PUB_LAN_FWD_WAN_SEQ_NUM_OFFSET + PUB_LAN_FWD_WAN_SEQ_NUM_WIDTH
PUB_LAN_DATA_WIDTH = AXIS_DATA_WIDTH -  PUB_LAN_DATA_OFFSET
# LAN ACK and SEQ NUM REPLY messages will be sent using the KIP interface and have TDATA in the following format:
# |      0      | LAN Sequence Number | RPN Sender Node ID | RPN_MSG_TYPE_LAN_ACK |
# |511        32|31                 16|15                 8|7                    0|
LAN_ACK_SENDER_NODE_ID_OFFSET = RPN_MSG_TYPE_WIDTH
LAN_ACK_SENDER_NODE_ID_WIDTH = NODE_ID_WIDTH
LAN_ACK_SEQUENCE_NUMBER_OFFSET = LAN_ACK_SENDER_NODE_ID_OFFSET + LAN_ACK_SENDER_NODE_ID_WIDTH
LAN_ACK_SEQUENCE_NUMBER_WIDTH = LAN_SEQUENCE_NUMBER_WIDTH

# WAN messages
# PUB WAN messages have TDATA fields set in the following format:
# | Packet Data | WAN Sequence Number | RPN Sender CTID | RPN_MSG_TYPE_WAN_PUB |
# |511        56|55                 40|39              8|7                    0|
# RPN overhead occupies 56 bits. The remaining bits are allocated for the WAN packet's data
# RPN Message Type identifies this as a PUB_WAN message
# RPN Sender CTID is the Cluster ID of the kernel that made the original request
# WAN Sequence Number is used to maintain reliability
PUB_WAN_SENDER_CTID_OFFSET = RPN_MSG_TYPE_WIDTH
PUB_WAN_SENDER_CTID_WIDTH = CLUSTER_ID_WIDTH
PUB_WAN_SEQUENCE_NUMBER_OFFSET = PUB_WAN_SENDER_CTID_OFFSET + PUB_WAN_SENDER_CTID_WIDTH
PUB_WAN_SEQUENCE_NUMBER_WIDTH = WAN_SEQUENCE_NUMBER_WIDTH
PUB_WAN_DATA_OFFSET = PUB_WAN_SEQUENCE_NUMBER_OFFSET + PUB_WAN_SEQUENCE_NUMBER_WIDTH
PUB_WAN_DATA_WIDTH = AXIS_DATA_WIDTH -  PUB_WAN_DATA_OFFSET
# WAN ACK messages will be sent using the KIP interface and have TDATA in the following format:
# |      0      | WAN Sequence Number | RPN Sender CTID | RPN_MSG_TYPE_WAN_ACK |
# |511        32|55                 40|39              8|7                    0|
WAN_ACK_SENDER_CTID_OFFSET = RPN_MSG_TYPE_WIDTH
WAN_ACK_SENDER_CTID_WIDTH = CLUSTER_ID_WIDTH
WAN_ACK_SEQUENCE_NUMBER_OFFSET = WAN_ACK_SENDER_CTID_OFFSET + WAN_ACK_SENDER_CTID_WIDTH
WAN_ACK_SEQUENCE_NUMBER_WIDTH = WAN_SEQUENCE_NUMBER_WIDTH

# KIP Messages
# KIP interface is used to send LAN response messages and all acknowledgement/reply messages
# PUB KIP TDATA messages are the following format:
# | Packet Data | WAN Sequence Number | RPN Sender CTID | RPN Message Type |
# |511        56|55                 40|39              8|7                0|
# PUB KIP messages will use the WAN sequence number used to send the WAN request
PUB_KIP_SENDER_CTID_OFFSET = RPN_MSG_TYPE_WIDTH
PUB_KIP_SENDER_CTID_WIDTH = CLUSTER_ID_WIDTH
PUB_KIP_SEQUENCE_NUMBER_OFFSET = PUB_KIP_SENDER_CTID_OFFSET + PUB_KIP_SENDER_CTID_WIDTH
PUB_KIP_SEQUENCE_NUMBER_WIDTH = WAN_SEQUENCE_NUMBER_WIDTH
PUB_KIP_DATA_OFFSET = PUB_KIP_SEQUENCE_NUMBER_OFFSET + PUB_KIP_SEQUENCE_NUMBER_WIDTH
PUB_KIP_DATA_WIDTH = AXIS_DATA_WIDTH - PUB_KIP_DATA_OFFSET
# KIP ACK messages will be sent using the KIP interface and have TDATA in the following format:
# | Packet Data | WAN Sequence Number | RPN Sender CTID | RPN Message Type |
# |511        56|55                 40|39              8|7                0|
KIP_ACK_SENDER_CTID_OFFSET = RPN_MSG_TYPE_WIDTH
KIP_ACK_SENDER_CTID_WIDTH = CLUSTER_ID_WIDTH
KIP_ACK_SEQUENCE_NUMBER_OFFSET = KIP_ACK_SENDER_CTID_OFFSET + KIP_ACK_SENDER_CTID_WIDTH
KIP_ACK_SEQUENCE_NUMBER_WIDTH = WAN_SEQUENCE_NUMBER_WIDTH
# All GW SEQ NUM request and reply messages () will look like the following:
# |   0  | Sequence Number Locked | CTDEST | WAN Sequence Number | WAN Num Sequence Number | RPN Sender Node ID | RPN Message Type |
# |511 97|          96            |95    64|63                 48|47                     16|15                 8|7                0|
# Replies to SEQ NUM REQUESTS will supply the sequence number in the WAN sequence number field. Otherwise this will be set to 0
# One 1 node in each cluster can write to the same destination cluster at the same time. Therefore a lock is transmitted in bit 64. If the lock bit is 1 then the WAN TX for that node will have to try again later.
# CTDEST refers to the cluster ID corresponding to the sent sequence number
GW_KIP_SENDER_NODE_ID_OFFSET = RPN_MSG_TYPE_WIDTH
GW_KIP_SENDER_NODE_ID_WIDTH = NODE_ID_WIDTH
GW_KIP_SEQUENCE_NUMBER_OFFSET = GW_KIP_SENDER_NODE_ID_OFFSET + GW_KIP_SENDER_NODE_ID_WIDTH
GW_KIP_SEQUENCE_NUMBER_WIDTH = WAN_NUM_SEQUENCE_NUMBER_WIDTH
GW_KIP_WAN_SEQUENCE_NUMBER_OFFSET = GW_KIP_SEQUENCE_NUMBER_OFFSET + GW_KIP_SEQUENCE_NUMBER_WIDTH
GW_KIP_WAN_SEQUENCE_NUMBER_WIDTH = WAN_SEQUENCE_NUMBER_WIDTH
GW_KIP_WAN_CTDEST_OFFSET = GW_KIP_WAN_SEQUENCE_NUMBER_OFFSET + GW_KIP_WAN_SEQUENCE_NUMBER_WIDTH
GW_KIP_WAN_CTDEST_WIDTH = AXIS_WAN_TDEST_WIDTH
GW_KIP_WAN_LOCK_OFFSET = GW_KIP_WAN_CTDEST_OFFSET + GW_KIP_WAN_CTDEST_WIDTH

# KIP TUSER looks like the following:
# | Destination Port | Source Port | Source IP Address |
# |63              48|47         32|31                0|
KIP_TUSER_SRC_PORT_OFFSET = IP_ADDRESS_WIDTH
KIP_TUSER_SRC_PORT_WIDTH = IP_PORT_WIDTH
KIP_TUSER_DEST_PORT_OFFSET = KIP_TUSER_SRC_PORT_OFFSET + KIP_TUSER_SRC_PORT_WIDTH
KIP_TUSER_DEST_PORT_WIDTH = IP_PORT_WIDTH
# Offsets for Packets from Control
# from-Control KnownIP Interface
FROM_CTRL_KIP_TDEST_OFFSET = 40
# Other
FROM_NB_TUSER_SRC_PORT_OFFSET = KIP_TUSER_SRC_PORT_OFFSET
FROM_NB_TUSER_SRC_PORT_WIDTH = KIP_TUSER_SRC_PORT_WIDTH
FROM_NB_TUSER_DEST_PORT_OFFSET = KIP_TUSER_DEST_PORT_OFFSET
FROM_NB_TUSER_DEST_PORT_WIDTH = KIP_TUSER_DEST_PORT_WIDTH
