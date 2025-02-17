from include.ctrl_api_params import *
import argparse

def extractBits(packet, msb, lsb):
    """
        Extracts specified bits from a packet (eg. extract bits 7-0 from packet)

        Args:
            packet(int): packet to extract bits from
            msb(int): msb
            lsb(int): lsb
    """
    bitmask = (1 << (msb + 1)) - 1
    extracted_bits = packet & bitmask
    extracted_bits = (extracted_bits >> lsb)
    return extracted_bits

def extractBitsByWidth(packet, lsb, width):
    """
        Extracts specified bits from a packet, based on an LSB and provided bitwidth. (eg. extract 32 bits starting from bit 3 = bits 34-3)

        Args:
            packet(int): packet to extract bits from
            lsb(int): lsb
            width(int): number of bits to extract, starting from lsb
    """
    msb = lsb + width - 1
    return extractBits(packet, msb, lsb)

################################################################################
# Set a specific bit in the packet (eg. packet[63])
################################################################################
def setBit(message, index, value):
    new_message = message | (value << index)
    return new_message

################################################################################
# Set the bits from msb to lsb in the packet (eg. packet[63:32])
################################################################################
def setBits(message, msb, lsb, value):
    for index in range(lsb, msb+1):
        # Select the bit corresponding to the current index, zero out all other bits
        bit_value = value >> (index-lsb)
        bit_value &= 1
        # Set bit 
        new_message = setBit(message, index, bit_value)
        # Prepare for next iteration
        message = new_message
    return new_message

def setBitsByWidth(message, lsb, width, value):
    msb = lsb + width - 1
    return setBits(message, msb, lsb, value)

if (__name__ == '__main__'):
    network_type = int(input("Please enter network type (LAN=0, WAN=1): "))
    if (network_type == 0):
        print("LAN message")
        tdest = int(input("Please enter TDEST (hex): "), 16)
        base_register_address = int(input("Please enter base register address (hex): "), 16)
        extended_register_address = int(input("Please enter extended register address (hex): "), 16)
        msg_1 = setBitsByWidth(0, AXIL_LAN_TDEST_OFFSET, AXIS_LAN_TDEST_WIDTH, tdest)
        msg_2 = setBitsByWidth(msg_1, AXIL_LAN_BASE_REG_ADDR_OFFSET, AXIL_LAN_BASE_REG_ADDR_WIDTH, base_register_address)
        msg_3 = setBitsByWidth(msg_2, AXIL_LAN_EXTENDED_REG_ADDR_OFFSET, AXIL_LAN_EXTENDED_REG_ADDR_WIDTH, extended_register_address)
        print("Message: 0x%x" % msg_3)
    elif (network_type == 1):
        print("WAN message")
        dest_port = int(input("Please enter port (up to 16 bits in hex form): "), 16)
        ctdest = int(input("Please enter entire CTDEST (base and extended together, if extended is used): "), 16)
        creg_address = int(input("Please enter Cluster REG Address in hex form(0 if not used): "), 16)
        # Separate into message components
        base_port = extractBitsByWidth(dest_port, 0, AXIL_WAN_BASE_PORT_WIDTH)
        extended_port = extractBits(dest_port, 15, 15)
        base_ctdest = extractBitsByWidth(ctdest, 0, AXIL_WAN_BASE_CTDEST_WIDTH)
        extended_ctdest = extractBitsByWidth(ctdest, AXIL_WAN_BASE_CTDEST_WIDTH, AXIL_WAN_EXTENDED_CTDEST_WIDTH)
        # Write the Address
        msg_1 = setBitsByWidth(1, 1, AXIL_WAN_BASE_PORT_WIDTH, base_port)
        msg_2 = setBitsByWidth(msg_1, AXIL_WAN_BASE_CTDEST_OFFSET, AXIL_WAN_BASE_CTDEST_WIDTH, base_ctdest)
        msg_3 = setBitsByWidth(msg_2, AXIL_WAN_EXTENDED_PORT_OFFSET, 1, extended_port)
        msg_4 = setBitsByWidth(msg_3, AXIL_WAN_EXTENDED_CTDEST_OFFSET, AXIL_WAN_EXTENDED_CTDEST_WIDTH, extended_ctdest)
        msg_5 = setBitsByWidth(msg_4, AXIL_CREG_ADDR_OFFSET, AXIL_CREG_ADDR_WIDTH, creg_address)
        print("Message: 0x%x" % msg_5)
    


