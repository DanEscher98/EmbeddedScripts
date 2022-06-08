#!/home/dany98/.asdf/installs/python/3.9.4/bin/python3.9

import socket

SEND_BUF_SIZE = 4096
RECV_BUF_SIZE = 4096

def modify_buff_size():
    mysock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    # Get the size of the socket's send buffer
    bufsize = mysock.getsockopt(socket.SOL_SOCKET, socket.SO_SNDBUF)
    print(f"Buffer size [Before]: {bufsize}")

    mysock.setsockopt(socket.SOL_TCP, socket.TCP_NODELAY, 1)
    mysock.setsockopt(socket.SOL_SOCKET, socket.SO_SNDBUF, SEND_BUF_SIZE)
    mysock.setsockopt(socket.SOL_SOCKET, socket.SO_RCVBUF, RECV_BUF_SIZE)

    bufsize = mysock.getsockopt(socket.SOL_SOCKET, socket.SO_SNDBUF)
    print(f"Buffer size [After] : {bufsize}")

if __name__=='__main__':
    modify_buff_size()
