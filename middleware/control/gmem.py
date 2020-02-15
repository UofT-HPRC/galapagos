import sys
import socket
import struct

def connect_to_device(ip_addr, port):
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.connect((ip_addr, port))
    return sock


def get_word(sock,addr):

    values = (1, addr, 4)
    packer_cmd = struct.Struct('I I I')
    packed_cmd = packer_cmd.pack(*values)
    sock.send(packed_cmd)
    buff = sock.recv(4)
    unpacker = struct.Struct('I')
    unpacked_data = unpacker.unpack(buff)
    print(unpacked_data)


def set_word(sock, addr, write_data):

    values = (0, addr, 4)
    packer_cmd = struct.Struct('I I I')
    packed_cmd = packer_cmd.pack(*values)
    sock.send(packed_cmd)
    values_data = (write_data,)
    packer_data = struct.Struct('I')
    packed_data = packer_data.pack(*values_data)
    sock.send(packed_data)


ip_addr = sys.argv[1]
port = int(sys.argv[2])
addr = int(sys.argv[3])
sock = connect_to_device(ip_addr, port)

if len(sys.argv) > 4:
    write_data = int(sys.argv[4])
    print("SET ", addr, write_data)
    set_word(sock, addr, write_data)
elif len(sys.argv) == 4:
    #print("GET ", addr)
    get_word(sock, addr)
