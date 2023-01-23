import socket
import time

# Creates a socket object that supports the context manager type.
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
# Associate the socket with a specific network interface and port number.

sock.bind(('127.0.0.1', 8000)) # IP Address and Port number
# Specifies the number of unaccepted connections that the system will allow before refusing new connections.
sock.listen(5)
# Sample data you want to transfer to MATLAB. 
###############################################
a = [x for x in range(10000,10010)]
###############################################
while True:
    a = [x + 1 for x in a]
    s = str(a)
    # Blocks execution and waits for an incoming connection.
    connection, address = sock.accept()
    # Print client ip address
    print("client ip is:", address)
    # Receive data and put it into buf
    buf = connection.recv(40960)
    print(buf.decode('utf-8'))
    # Send data
    connection.send(bytes(s, encoding = "utf-8"))
    # Close connection
    connection.close()
    time.sleep(1)
# Close server
sock.close()
    
    


    
    
    
    
