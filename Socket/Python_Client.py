import socket
Host = socket.gethostname()
Port = 5004                  # The same port as used by the server
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
#Connect to Server
s.connect((Host, Port))
i = 1
#Read Write infinitly
while True:
    s.sendall(b'Hello, world')
    data = s.recv(1024) # Socket is going to attempt to receive data, in a buffer size of 1024 bytes at at time.
    print('Received',i,": ", repr(data))
    i = i + 1
s.close()
    