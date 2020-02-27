import sys
import socket
import struct



def connect_to_device(ip_addr, port):
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.connect((ip_addr, port))
    return sock


def get_bin(sock,addr, read_file_name, size):

    values = (3, addr, size)
    packer_cmd = struct.Struct('I I I')
    packed_cmd = packer_cmd.pack(*values)
    sock.send(packed_cmd)
    buff = sock.recv(size)
    read_file = open(read_file_name, "wb")
    read_file.write(buff)


def set_bin(sock, addr, write_file_name):

    values_data = open(write_file_name, "rb").read()
    values = (2, addr, len(values_data))
    packer_cmd = struct.Struct('I I I')
    packed_cmd = packer_cmd.pack(*values)
    sock.send(packed_cmd)
    sock.send(values_data)


ip_addr = sys.argv[1]
port = int(sys.argv[2])
addr = int(sys.argv[3],0)
file_name = sys.argv[4]


sock = connect_to_device(ip_addr, port)
if (len(sys.argv) > 5):
    size = int(sys.argv[5],0)
    print("GET_BIN ", addr, size)
    get_bin(sock, addr, file_name, size)
elif len(sys.argv) == 5:
    set_bin(sock, addr, file_name)
