import argparse
import socket

# Definitions
DNS_PORT = 9001

DATA_WIDTH = 512 # bits
DATA_WIDTH_BYTES = int(DATA_WIDTH/8) # bytes
IP_LENGTH = 32
KERN_BITS = 24
KERN_INDEX_BITS = 5
KERN_TAG_BITS = (KERN_BITS - KERN_INDEX_BITS)
KERN_TABLE_ENTRY_BITS = (IP_LENGTH + KERN_TAG_BITS)
KERN_TABLE_ENTRY_BYTES = 7

#######################################################################
# Convert IP in A.B.C.D into a single decimal number
#######################################################################
def ip_str_to_decimal(ip_str):
    # IP Addresses look like A.B.C.D
    ip_digits = ip_str.split(".")
    ip_decimal = 0
    # Traverse through in order A->B->C->D
    for i in range(0, 4):
        # Convert each digit into hexadecimal
        ip_digit = ip_digits[i]
        ip_digit_dec = int(ip_digit)
        # Shift each digit into the correct position
        ip_decimal |= (ip_digit_dec << (24-8*i))
    return ip_decimal

#######################################################################
# Read IP addresses from file and generate dictionary of kernel IPs
#######################################################################
def gen_ip_dict(ip_file):
    with open(ip_file) as f:
        ip_entries = f.read().splitlines()
    ip_dict = {}
    for ip_entry in ip_entries:
        kernel_id, kernel_ip = ip_entry.split(":")
        kernel_id = int(kernel_id)
        kernel_ip_decimal = ip_str_to_decimal(kernel_ip)
        ip_dict[kernel_id] = kernel_ip_decimal
        # print(str(kernel_id) + ": " + hex(kernel_ip_decimal))
    return ip_dict

#######################################################################
# Read request and get kernel ID
#######################################################################
def get_kernel_id(fetch_request):
    return int(fetch_request)

#######################################################################
# Get IP Address and Form Response
#######################################################################
def make_response(kernel_id, ip_dict):
    # Get IP address
    if kernel_id not in ip_dict.keys():
        raise KeyError("Kernel ID %d not found in IP Dictionary" % (kernel_id))
    ip_address = ip_dict[kernel_id]
    print("Kernel %d IP: %s" % (kernel_id, hex(ip_address)))
    # Construct response packet
    fetch_response = (kernel_id << IP_LENGTH) | (ip_address)
    return fetch_response

#######################################################################
# Convert Endianness
#######################################################################
def create_mask(start_index, end_index):
    mask = 0
    for i in range(start_index, end_index+1):
        mask += 2**i
    return mask

def get_bits(data, start_index, end_index):
    mask = create_mask(start_index, end_index)
    return (data & mask) >> start_index

def convert_endianness(bitstream):
    converted_bitstream = 0
    for byte in range(0, DATA_WIDTH_BYTES):
        data_byte = get_bits(bitstream, 8*byte, 8*byte+7)
        converted_bitstream |= (data_byte << (DATA_WIDTH-8-8*byte))
    return converted_bitstream

#######################################################################
# IP Server
#######################################################################
def ip_server(server_ip, in_port, ip_file):
	ip_dict = gen_ip_dict(ip_file)
	print("IP Dictionary Loaded")
    # Set up UDP socket using IPv4
	sock = socket.socket(family=socket.AF_INET, type=socket.SOCK_DGRAM)
	# sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
	sock.bind((server_ip, in_port))
	print("Socket Ready")
	print(sock.getsockname())
	#print("IP: %s" % (socket.gethostbyname(socket.gethostname()))) 
    # Listen for Requests
	while True:
		print("Fetching")
		# Read 64 bytes for header, 64 for data
		fetch_packet = sock.recvfrom(128)
		# Separate header and payload
		fetch_request = fetch_packet[0] # bytes-like object
		request_header_big_endian = fetch_request[0:63].hex()
		request_payload_big_endian = fetch_request[64:128]
		request_payload = int.from_bytes(request_payload_big_endian,
										 byteorder="little")
		#request_payload_big_endian = int(request_payload_big_endian, 16)
		#request_payload = convert_endianness(request_payload_big_endian)
		# Get source address
		requestor_address = fetch_packet[1]
		requestor_ip = requestor_address[0]
		requestor_port = requestor_address[1]
		# Get Kernel ID and find IP Address
		kernel_id = get_kernel_id(request_payload)
		print("Request from %s port %d: Kernel %d" % (requestor_ip, requestor_port, kernel_id))
		fetch_response = make_response(kernel_id, ip_dict)
		response_header = 1 # ID = 0, DEST = 0, Size = 1
		# Convert endianness of flits
		response_bytes = fetch_response.to_bytes(64, byteorder="little")
		header_bytes = response_header.to_bytes(64, byteorder="little")
		#response_big_endian = convert_endianness(fetch_response)
		#header_big_endian = convert_endianness(response_header)
		# Concatenate 
		response_packet = header_bytes + response_bytes
		sock.sendto(response_packet, requestor_address)

if (__name__ == "__main__"):
