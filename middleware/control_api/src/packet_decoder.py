from include.ctrl_api_params import *
import argparse
import math


def reverse_bytearray(packet_bytearray):
    array_length = len(packet_bytearray)
    reversed_packet_bytearray = bytearray(array_length)
    for i in range(0, array_length):
        reversed_packet_bytearray[array_length-1-i] = packet_bytearray[i]
    return reversed_packet_bytearray

################################################################################
# Extract the sequence of bits from msb to lsb in the packet (eg. packet[63:32])
################################################################################
def extract_bits(packet, msb, lsb):
    #1. Figure out which bytes msb and lsb are in
    msb_byte = msb >> 3
    lsb_byte = lsb >> 3
    # print(msb_byte)
    # print(lsb_byte)
    #2. Extract bits for MSB and LSB
    extracted_bits = 0
    for i in range(lsb_byte, msb_byte+1):
        # print("%x" % packet[i])
        extracted_bits |= (packet[i] << (i*8))
    # print("Extracted Bytes: 0x%x" % extracted_bits)
    # trim down to lsb
    #lsb_offset = lsb % 8
    extracted_bits = (extracted_bits >> lsb)
    #print("LSB Trimmed: 0x%x" % extracted_bits)
    # trim off excess beyond msb
    mask = 0
    mask_length = msb - lsb + 1
    for i in range(0, mask_length):
        mask |= (1 << i)
    extracted_bits &= mask
    #print("0x%x" % extracted_bits)
    return extracted_bits

################################################################################
# Extract the sequence of bits from lsb +: width
################################################################################
def extract_bits_by_width(packet, lsb, width):
    msb = lsb + width - 1
    # print("MSB: %d" % msb)
    # print("LSB: %d" % lsb)
    return extract_bits(packet, msb, lsb)

################################################################################
# Decodes LAN, WAN, and KIP Packets
################################################################################
def packet_decoder(packet_type, packet):
    message_type = extract_bits_by_width(packet, 0, AXIS_LAN_MSG_TYPE_WIDTH)
    if (message_type == MSG_READ):
        print("Message Type: Read")
    elif (message_type == MSG_WRITE):
        print("Message Type: Write")
    elif (message_type == MSG_BRESP):
        print("Message Type: BRESP")
    elif (message_type == MSG_RDATA):
        print("Message Type: RDATA")
    elif (message_type == MSG_BUSY):
        print("Message Type: BUSY")
    # LAN Packet
    if (packet_type == 0):
        print("LAN Packet")
        packet_data = extract_bits_by_width(packet, AXIS_LAN_DATA_OFFSET, AXIS_LAN_DATA_WIDTH)
        packet_address = extract_bits_by_width(packet, AXIS_LAN_ADDR_OFFSET, AXIS_LAN_ADDR_WIDTH)
        packet_wstrb = extract_bits_by_width(packet, AXIS_LAN_WSTRB_OFFSET, AXIS_LAN_WSTRB_WIDTH)
        requestor_tid = extract_bits_by_width(packet, AXIS_LAN_TID_OFFSET, AXIS_LAN_TID_WIDTH)
        requestor_ip = extract_bits_by_width(packet, AXIS_LAN_IP_OFFSET, AXIS_LAN_IP_WIDTH)
        requestor_ctid = extract_bits_by_width(packet, AXIS_LAN_CTID_OFFSET, AXIS_LAN_CTID_WIDTH)
        print("Packet Data: 0x%x" % packet_data)
        print("Packet Register Address: 0x%x" % packet_address)
        print("Packet WSTRB: 0x%x" % packet_wstrb)
        print("Requestor TID: 0x%x" % requestor_tid)
        print("Requestor IP: 0x%x" % requestor_ip)
        print("Requestor CTID: 0x%x" % requestor_ctid)
    # WAN packet
    elif (packet_type == 1):
        print("WAN Packet")
        packet_data = extract_bits_by_width(packet, AXIS_WAN_DATA_OFFSET, AXIS_WAN_DATA_WIDTH)
        cluster_port = extract_bits_by_width(packet, AXIS_WAN_DEST_PORT_OFFSET, AXIS_WAN_DEST_PORT_WIDTH)
        cluster_id = extract_bits_by_width(packet, AXIS_WAN_CTDEST_OFFSET, AXIS_WAN_CTDEST_WIDTH)
        creg_address = extract_bits_by_width(packet, AXIS_WAN_CREG_ADDR_OFFSET, AXIS_WAN_CREG_ADDR_WIDTH)
        packet_wstrb = extract_bits_by_width(packet, AXIS_WAN_WSTRB_OFFSET, AXIS_WAN_WSTRB_WIDTH)
        requestor_tid = extract_bits_by_width(packet, AXIS_WAN_TID_OFFSET, AXIS_WAN_TID_WIDTH)
        requestor_ip = extract_bits_by_width(packet, AXIS_WAN_IP_OFFSET, AXIS_WAN_IP_WIDTH)
        requestor_ctid = extract_bits_by_width(packet, AXIS_WAN_CTID_OFFSET, AXIS_WAN_CTID_WIDTH)
        print("Packet Data: 0x%x" % packet_data)
        print("Packet WSTRB: 0x%x" % packet_wstrb)
        print("Cluster Port: 0x%x" % cluster_port)
        print("Cluster ID: 0x%x" % cluster_id)
        print("Cluster Reg Address: 0x%x" % creg_address)
        print("Requestor TID: 0x%x" % requestor_tid)
        print("Requestor IP: 0x%x" % requestor_ip)
        print("Requestor CTID: 0x%x" % requestor_ctid)
    # KIP packet
    else:
        print("KIP Packet")
        packet_data = extract_bits_by_width(packet, AXIS_KIP_DATA_OFFSET, AXIS_KIP_DATA_WIDTH)
        requestor_tid = extract_bits_by_width(packet, AXIS_KIP_TID_OFFSET, AXIS_KIP_TID_WIDTH)
        sender_tid = extract_bits_by_width(packet, AXIS_KIP_SENDER_TID_OFFSET, AXIS_KIP_SENDER_TID_WIDTH)
        ctdest = extract_bits_by_width(packet, AXIS_KIP_CTDEST_OFFSET, AXIS_KIP_CTDEST_WIDTH)
        print("Packet Data: 0x%x" % packet_data)
        print("Requestor TID (TDEST): 0x%x" % requestor_tid)
        print("Sender TID: 0x%x" % sender_tid)
        print("CTDEST: 0x%x" % ctdest)

# ################################################################################
# # Decodes Reliability Packets
# ################################################################################
# def reliability_packet_decoder(packet_type, packet):
#     rpm_msg_type = extract_bits_by_width(packet, 0, PACKET_MSG_TYPE_WIDTH)
#     if (rpm_msg_type == RPM_MSG_TYPE_PUB):
#         print("Reliability Message: PUB")
#     elif (rpm_msg_type == RPM_MSG_TYPE_PUBREC):
#         print("Reliability Message: PUBREC")
#     elif (rpm_msg_type == RPM_MSG_TYPE_PUBREL):
#         print("Reliability Message: PUBREL")
#     elif (rpm_msg_type == RPM_MSG_TYPE_PUBCOMP):
#         print("Reliability Message: PUBCOMP")
#     elif (rpm_msg_type == RPM_MSG_TYPE_BUSY):
#         print("Reliability Message: BUSY")

#     # PUB LAN/WAN
#     if (packet_type == 4 or packet_type == 5):
#         rpm_sender_tid = extract_bits_by_width(packet, PUB_LAN_TID_OFFSET, PUB_LAN_TID_WIDTH)
#         rpm_sender_ip_addr = extract_bits_by_width(packet, PUB_LAN_IP_OFFSET, PUB_LAN_IP_WIDTH)
#         rpm_packet_id = extract_bits_by_width(packet, PUB_LAN_PACKET_ID_OFFSET, PACKET_ID_WIDTH)
#         print("RPM Sender TID: 0x%x" % rpm_sender_tid)
#         print("RPM Sender IP Address: 0x%x" % rpm_sender_ip_addr)
#         print("RPM Packet ID: 0x%x" % rpm_packet_id)
#         # Extract the PUB message's Data
#         packet_data = extract_bits_by_width(packet, PUB_LAN_DATA_OFFSET, PUB_LAN_DATA_WIDTH)
#         packet_data_num_bytes = math.ceil(PUB_LAN_DATA_WIDTH >> 3)
#         packet_data_bytearray = packet_data.to_bytes(packet_data_num_bytes, 'little')
#         packet_decoder((packet_type-4), packet_data_bytearray)
#     # PUB KIP
#     elif (packet_type == 6):
#         rpm_sender_tid = extract_bits_by_width(packet, KIP_TID_OFFSET, KIP_TID_WIDTH)
#         rpm_sender_ip_addr = extract_bits_by_width(packet, KIP_IP_OFFSET, KIP_IP_WIDTH)
#         rpm_packet_id = extract_bits_by_width(packet, KIP_PACKET_ID_OFFSET, PACKET_ID_WIDTH)
#         rpm_tdest = extract_bits_by_width(packet, KIP_TDEST_OFFSET, KIP_TDEST_WIDTH)
#         print("RPM Sender TID: 0x%x" % rpm_sender_tid)
#         print("RPM Sender IP Address: 0x%x" % rpm_sender_ip_addr)
#         print("RPM Packet ID: 0x%x" % rpm_packet_id)
#         print("RPM TDEST: 0x%x" % rpm_tdest)
#         # Extract the PUB message's Data
#         packet_data = extract_bits_by_width(packet, KIP_DATA_OFFSET, KIP_DATA_WIDTH)
#         packet_data_num_bytes = math.ceil(KIP_DATA_WIDTH >> 3)
#         packet_data_bytearray = packet_data.to_bytes(packet_data_num_bytes, 'little')
#         packet_decoder(2, packet_data_bytearray)
#     # Reliability
#     elif (packet_type == 7):
#         rpm_sender_tid = extract_bits_by_width(packet, RESP_TID_OFFSET, RESP_TID_WIDTH)
#         rpm_sender_ip_addr = extract_bits_by_width(packet, RESP_IP_OFFSET, RESP_IP_WIDTH)
#         rpm_packet_id = extract_bits_by_width(packet, RESP_PACKET_ID_OFFSET, PACKET_ID_WIDTH)
#         rpm_tdest = extract_bits_by_width(packet, RESP_TDEST_OFFSET, RESP_TDEST_WIDTH)
#         print("RPM Sender TID: 0x%x" % rpm_sender_tid)
#         print("RPM Sender IP Address: 0x%x" % rpm_sender_ip_addr)
#         print("RPM Packet ID: 0x%x" % rpm_packet_id)
#         print("RPM TDEST: 0x%x" % rpm_tdest)

################################################################################
# Decodes Reliability Packets
################################################################################
def reliability_node_packet_decoder(packet_type, packet):
    rpn_msg_type = extract_bits_by_width(packet, 0, RPN_MSG_TYPE_WIDTH)
    if (rpn_msg_type == RPN_MSG_TYPE_LAN_PUB):
        print("Reliability Message: LAN PUB")
    elif (rpn_msg_type == RPN_MSG_TYPE_LAN_ACK):
        print("Reliability Message: LAN ACK")
    elif (rpn_msg_type == RPN_MSG_TYPE_LAN_SEQ_NUM_CHECK):
        print("Reliability Message: LAN Sequence Number Check")
    elif (rpn_msg_type == RPN_MSG_TYPE_LAN_SEQ_NUM_REPLY):
        print("Reliability Message: LAN Sequence Number Reply")
    elif (rpn_msg_type == RPN_MSG_TYPE_WAN_PUB):
        print("Reliability Message: WAN PUB")
    elif (rpn_msg_type == RPN_MSG_TYPE_WAN_ACK):
        print("Reliability Message: WAN ACK")
    elif (rpn_msg_type == RPN_MSG_TYPE_WAN_NUM_SEQ_NUM_CHECK):
        print("Reliability Message: WAN Num Sequence Number Check")
    elif (rpn_msg_type == RPN_MSG_TYPE_WAN_NUM_SEQ_NUM_REPLY):
        print("Reliability Message: WAN Num Sequence Number Reply")
    elif (rpn_msg_type == RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_REQUEST):
        print("Reliability Message: Outgoing WAN Sequence Number Request")
    elif (rpn_msg_type == RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_REPLY):
        print("Reliability Message: Outgoing WAN Sequence Number Reply")
    elif (rpn_msg_type == RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_WRITE):
        print("Reliability Message: Outgoing WAN Sequence Number Write")
    elif (rpn_msg_type == RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_BRESP):
        print("Reliability Message: Outgoing WAN Sequence Number BRESP")
    elif (rpn_msg_type == RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_REQUEST):
        print("Reliability Message: Incoming WAN Sequence Number Request")
    elif (rpn_msg_type == RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_REPLY):
        print("Reliability Message: Incoming WAN Sequence Number Reply")
    elif (rpn_msg_type == RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_WRITE):
        print("Reliability Message: Incoming WAN Sequence Number Write")
    elif (rpn_msg_type == RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_BRESP):
        print("Reliability Message: Incoming WAN Sequence Number BRESP")
    elif (rpn_msg_type == RPN_MSG_TYPE_WAN_SEQ_NUM_CHECK):
        print("Reliability Message: WAN Sequence Number Check")
    elif (rpn_msg_type == RPN_MSG_TYPE_WAN_SEQ_NUM_REPLY):
        print("Reliability Message: WAN Sequence Number Reply")
    elif (rpn_msg_type == RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_CHECK):
        print("Reliability Message: Outgoing WAN Sequence Number Check")
    elif (rpn_msg_type == RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_RDATA):
        print("Reliability Message: Outgoing WAN Sequence Number RDATA")
    elif (rpn_msg_type == RPN_MSG_TYPE_KIP_PUB):
        print("Reliability Message: KIP PUB")
    elif (rpn_msg_type == RPN_MSG_TYPE_KIP_ACK):
        print("Reliability Message: KIP ACK")

        
    # RPN Messages sent using the LAN interface
    if (packet_type == 4):
        rpn_sender_node_id = extract_bits_by_width(packet, PUB_LAN_SENDER_NODE_ID_OFFSET, PUB_LAN_SENDER_NODE_ID_WIDTH)
        rpn_sequence_number = extract_bits_by_width(packet, PUB_LAN_SEQUENCE_NUMBER_OFFSET, PUB_LAN_SEQUENCE_NUMBER_WIDTH)
        print("RPN Sender Node ID: 0x%x" % rpn_sender_node_id)
        print("RPN LAN Sequence Number: %d" % rpn_sequence_number)
        if (rpn_msg_type == RPN_MSG_TYPE_LAN_PUB):
            rpn_forwarded_ctid = extract_bits_by_width(packet, PUB_LAN_FWD_CTID_OFFSET, PUB_LAN_FWD_CTID_WIDTH)
            rpn_forwarded_WAN_sequence_number = extract_bits_by_width(packet, PUB_LAN_FWD_WAN_SEQ_NUM_OFFSET, PUB_LAN_FWD_WAN_SEQ_NUM_WIDTH)
            print("RPN Forwarded CTID: 0x%x" % rpn_forwarded_ctid)
            print("RPN Forwarded WAN Sequence Number: %d" % rpn_forwarded_WAN_sequence_number)
            # Extract the PUB message's Data
            packet_data = extract_bits_by_width(packet, PUB_LAN_DATA_OFFSET, PUB_LAN_DATA_WIDTH)
            packet_data_num_bytes = math.ceil(PUB_LAN_DATA_WIDTH >> 3)
            packet_data_bytearray = packet_data.to_bytes(packet_data_num_bytes, 'little')
            packet_decoder((packet_type-4), packet_data_bytearray)
        elif (rpn_msg_type == RPN_MSG_TYPE_LAN_SEQ_NUM_CHECK):
            pass

    # RPN Messages sent using the WAN interface
    elif (packet_type == 5):
        if (rpn_msg_type == RPN_MSG_TYPE_WAN_SEQ_NUM_CHECK):
            rpn_sender_ctid = extract_bits_by_width(packet, PUB_WAN_SENDER_CTID_OFFSET, PUB_WAN_SENDER_CTID_WIDTH)
            print("RPN Sender CTID: 0x%x" % rpn_sender_ctid)
        elif (rpn_msg_type == RPN_MSG_TYPE_WAN_PUB):
            rpn_sender_ctid = extract_bits_by_width(packet, PUB_WAN_SENDER_CTID_OFFSET, PUB_WAN_SENDER_CTID_WIDTH)
            print("RPN Sender CTID: 0x%x" % rpn_sender_ctid)
            rpn_WAN_sequence_number = extract_bits_by_width(packet, PUB_WAN_SEQUENCE_NUMBER_OFFSET, PUB_WAN_SEQUENCE_NUMBER_WIDTH)
            print("RPN WAN Sequence Number: %d" % rpn_WAN_sequence_number)
            # Extract the PUB message's Data
            packet_data = extract_bits_by_width(packet, PUB_WAN_DATA_OFFSET, PUB_WAN_DATA_WIDTH)
            packet_data_num_bytes = math.ceil(PUB_WAN_DATA_WIDTH >> 3)
            packet_data_bytearray = packet_data.to_bytes(packet_data_num_bytes, 'little')
            packet_decoder(1, packet_data_bytearray)
    # RPN Messages sent using the KIP interface
    elif (packet_type == 6):
        if (rpn_msg_type == RPN_MSG_TYPE_KIP_PUB):
            rpn_sender_ctid = extract_bits_by_width(packet, PUB_KIP_SENDER_CTID_OFFSET, PUB_KIP_SENDER_CTID_WIDTH)
            print("RPN Sender CTID: 0x%x" % rpn_sender_ctid)
            rpn_WAN_sequence_number = extract_bits_by_width(packet, PUB_KIP_SEQUENCE_NUMBER_OFFSET, PUB_KIP_SEQUENCE_NUMBER_WIDTH)
            print("RPN WAN Sequence Number: %d" % rpn_WAN_sequence_number)
            # Extract the PUB message's Data
            packet_data = extract_bits_by_width(packet, PUB_KIP_DATA_OFFSET, PUB_KIP_DATA_WIDTH)
            packet_data_num_bytes = math.ceil(PUB_KIP_DATA_WIDTH >> 3)
            packet_data_bytearray = packet_data.to_bytes(packet_data_num_bytes, 'little')
            packet_decoder((packet_type-4), packet_data_bytearray)
        elif (rpn_msg_type == RPN_MSG_TYPE_KIP_ACK):
            rpn_sender_ctid = extract_bits_by_width(packet, KIP_ACK_SENDER_CTID_OFFSET, KIP_ACK_SENDER_CTID_WIDTH)
            print("RPN Sender CTID: 0x%x" % rpn_sender_ctid)
            rpn_WAN_sequence_number = extract_bits_by_width(packet, KIP_ACK_SEQUENCE_NUMBER_OFFSET, KIP_ACK_SEQUENCE_NUMBER_WIDTH)
            print("RPN WAN Sequence Number: %d" % rpn_WAN_sequence_number)
        elif (rpn_msg_type == RPN_MSG_TYPE_LAN_ACK or rpn_msg_type == RPN_MSG_TYPE_LAN_SEQ_NUM_REPLY):
            rpn_sender_node_id = extract_bits_by_width(packet, LAN_ACK_SENDER_NODE_ID_OFFSET, LAN_ACK_SENDER_NODE_ID_WIDTH)
            rpn_sequence_number = extract_bits_by_width(packet, LAN_ACK_SEQUENCE_NUMBER_OFFSET, LAN_ACK_SEQUENCE_NUMBER_WIDTH)
            print("RPN Sender Node ID: 0x%x" % rpn_sender_node_id)
            print("RPN LAN Sequence Number: %d" % rpn_sequence_number)
        elif (rpn_msg_type == RPN_MSG_TYPE_WAN_NUM_SEQ_NUM_CHECK
           or rpn_msg_type == RPN_MSG_TYPE_WAN_NUM_SEQ_NUM_REPLY
           or rpn_msg_type == RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_REQUEST
           or rpn_msg_type == RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_REPLY
           or rpn_msg_type == RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_WRITE
           or rpn_msg_type == RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_BRESP
           or rpn_msg_type == RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_REQUEST
           or rpn_msg_type == RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_REPLY
           or rpn_msg_type == RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_WRITE
           or rpn_msg_type == RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_BRESP
           or rpn_msg_type == RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_CHECK
           or rpn_msg_type == RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_RDATA):
            rpn_sender_node_id = extract_bits_by_width(packet, GW_KIP_SENDER_NODE_ID_OFFSET, GW_KIP_SENDER_NODE_ID_WIDTH)
            rpn_sequence_number = extract_bits_by_width(packet, GW_KIP_SEQUENCE_NUMBER_OFFSET, GW_KIP_SEQUENCE_NUMBER_WIDTH)
            rpn_WAN_sequence_number = extract_bits_by_width(packet, GW_KIP_WAN_SEQUENCE_NUMBER_OFFSET, GW_KIP_WAN_SEQUENCE_NUMBER_WIDTH)
            rpn_WAN_CTDEST = extract_bits_by_width(packet, GW_KIP_WAN_CTDEST_OFFSET, GW_KIP_WAN_CTDEST_WIDTH)
            rpn_WAN_sequence_number_lock = extract_bits_by_width(packet, GW_KIP_WAN_LOCK_OFFSET, 1)
            print("RPN Sender Node ID: 0x%x" % rpn_sender_node_id)
            print("RPN WAN Num Sequence Number: %d" % rpn_sequence_number)
            print("RPN WAN Sequence Number: %d" % rpn_WAN_sequence_number)
            print("RPN WAN Sequence Number Lock: %d" % rpn_WAN_sequence_number_lock)
            print ("RPN WAN CTDEST: 0x%x" % rpn_WAN_CTDEST)
        elif (rpn_msg_type == RPN_MSG_TYPE_WAN_SEQ_NUM_REPLY):
            rpn_sender_ctid = extract_bits_by_width(packet, KIP_ACK_SENDER_CTID_OFFSET, KIP_ACK_SENDER_CTID_WIDTH)
            rpn_WAN_sequence_number = extract_bits_by_width(packet, WAN_ACK_SEQUENCE_NUMBER_OFFSET, WAN_ACK_SEQUENCE_NUMBER_WIDTH)
            print("RPN Sender CTID: 0x%x" % rpn_sender_ctid)
            print("WAN Sequence Number: %d" % rpn_WAN_sequence_number)
        elif (rpn_msg_type == RPN_MSG_TYPE_WAN_ACK):
            rpn_sender_ctid = extract_bits_by_width(packet, WAN_ACK_SENDER_CTID_OFFSET, WAN_ACK_SENDER_CTID_WIDTH)
            print("RPN Sender CTID: 0x%x" % rpn_sender_ctid)
            rpn_WAN_sequence_number = extract_bits_by_width(packet, WAN_ACK_SEQUENCE_NUMBER_OFFSET, WAN_ACK_SEQUENCE_NUMBER_WIDTH)
            print("RPN WAN Sequence Number: %d" % rpn_WAN_sequence_number)
       


        


################################################################################
# Decodes KIP TUSER side channel
################################################################################
def kip_tuser_packet_decoder(packet):
    dest_ip = extract_bits_by_width(packet, 0, IP_ADDRESS_WIDTH)
    dest_port = extract_bits_by_width(packet, AXIS_KIP_TUSER_DEST_PORT_OFFSET, AXIS_KIP_TUSER_DEST_PORT_WIDTH)
    src_port = extract_bits_by_width(packet, AXIS_KIP_TUSER_SRC_PORT_OFFSET, AXIS_KIP_TUSER_SRC_PORT_WIDTH)
    print("TUSER IP: 0x%x" % dest_ip)
    print("TUSER Dest Port: 0x%x" % dest_port)
    print("TUSER Src Port: 0x%x" % src_port)
    
if (__name__ == '__main__'):
    parser = argparse.ArgumentParser()
    parser.add_argument('packet_type',
                        help="0 for LAN, \
                              1 for WAN, \
                              2 for KIP, \
                              4 for RPN packet sent over LAN (PUB LAN, LAN SEQ NUM REQUEST), \
                              5 for RPN packet sent over WAN, \
                              6 for RPN packet sent over KIP (LAN ACK, LAN SEQ NUM REPLY), \
                              7 for Reliability Messages, \
                              8 for KIP TUSER Messages")
    parser.add_argument('packet', 
                        help="Packet in hex form. 13 bytes are expected eg. 0b0208030507cfefefabababab") # Hexadecimal packet
    args = parser.parse_args()
    reversed_packet_bytearray = bytearray.fromhex(args.packet)
    # Byte array order is reversed (MSB is at left-most location), so reverse it
    packet_bytearray = reverse_bytearray(reversed_packet_bytearray)
    packet_type = int(args.packet_type)
    if (packet_type == 0):
        print("LAN Packet")
    elif (packet_type == 1):
        print("WAN Packet")
    elif (packet_type == 2):
        print("KIP Packet")
    elif (packet_type == 3):
        print("UNUSED")
    elif (packet_type == 4):
        print("RPN packet sent over LAN")
    elif (packet_type == 5):
        print("RPN packet sent over WAN")
    elif (packet_type == 6):
        print("RPN packet sent over KIP")
    elif (packet_type == 8):
        print("KIP TUSER Packet")
    else:
        print("Incorrect Packet Type")
    # Case 1: Reliability Packets
    if packet_type in [4,5,6,7]:
        # reliability_packet_decoder(packet_type, packet_bytearray)
        reliability_node_packet_decoder(packet_type, packet_bytearray)
    # Case 2: KIP TUSER Packets
    elif packet_type == 8:
        kip_tuser_packet_decoder(packet_bytearray)
    # Case 3: Regular Packets
    else:
        packet_decoder(packet_type, packet_bytearray)
