import socket
import os

serverAddressPort   = ("10.1.24.132", 9000)
bufferSize          = 1024
UDPClientSocket = socket.socket(family=socket.AF_INET, type=socket.SOCK_DGRAM)

print("listening")

UDPClientSocket.bind(serverAddressPort)
while(True):

    msgFromServer = UDPClientSocket.recvfrom(bufferSize)

    msg = "Message from Server {}".format(msgFromServer[0].hex())
    # print(msg)
    reversed_data = msgFromServer[0][::-1]
    rawdata = int.from_bytes(reversed_data, "big")
    # print(hex(rawdata))
    metadata = 0xFFFFFFFF & rawdata
    dest = (0xFF000000 & metadata) >> 24
    src = (0x00FF0000 & metadata) >> 16
    data =(rawdata >> 512)
    
    os.system('date')
    print("Received from:", src, " at:", dest)
    print("Answer:",data," hex:",hex(data))


msgFromServer = UDPClientSocket.recvfrom(bufferSize)

msg = "Message from Server {}".format(msgFromServer[0].hex())
print(msg)
reversed_data = msgFromServer[0][::-1]
rawdata = int.from_bytes(reversed_data, "big")
# print(hex(rawdata))
metadata = 0xFFFFFFFF & rawdata
data =(rawdata >> 512)

print(hex(metadata))
print("Answer:",data," hex:",hex(data))