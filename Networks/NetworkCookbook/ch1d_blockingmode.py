#!/home/dany98/.asdf/installs/python/3.9.4/bin/python3.9

import socket

def test_socket_modes():
    mysock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    mysock.setblocking(1)
    mysock.settimeout(0.5)
    mysock.bind(("127.0.0.1", 0))
