import socket

a = 3
b = 5
c = 7

out_data = 0x0000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

out_data = out_data | (((a << 64) | (b << 32) | c) << 440 )
print(hex(out_data))

bytesToSend         = out_data.to_bytes(128,'big')

serverAddressPort   = ("10.1.24.102", 9000)
UDPClientSocket = socket.socket(family=socket.AF_INET, type=socket.SOCK_DGRAM)
UDPClientSocket.sendto(bytesToSend, serverAddressPort)
print("Sent to multiplierA (10.1.24.102)")



# msgFromClient = 0x00000102000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070000000F0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
# # print(hex(msgFromClient))
# # bytesToSend         = int.to_bytes(32,msgFromClient)
# bytesToSend         = msgFromClient.to_bytes(128,'big')

# serverAddressPort   = ("10.1.24.103", 9000)
# UDPClientSocket = socket.socket(family=socket.AF_INET, type=socket.SOCK_DGRAM)
# UDPClientSocket.sendto(bytesToSend, serverAddressPort)
# print("Sent to multiplierB (10.1.24.103)")
