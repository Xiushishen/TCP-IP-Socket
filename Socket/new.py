import socket

UDP_IP_P = "127.0.0.1"
UDP_PORT_P = 5005

UDP_IP_S = "127.0.0.1"
UDP_PORT_S = 5005

sock_p = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
sock_s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
sock_p.bind((UDP_IP_P, UDP_PORT_P))
sock_s.bind((UDP_IP_P, UDP_PORT_P))
message = "Hello, World!"
sock_p.sendto(message.encode(), (UDP_IP_P, UDP_PORT_P))
data, addr = sock.recvfrom(1024)
mess = data.decode()
print(mess)