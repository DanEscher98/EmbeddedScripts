#!/home/dany98/.asdf/installs/python/3.9.4/bin/python3.9

import sys
import socket
from binascii import hexlify
from sty import fg, bg, rs
import argparse

# Printing your machine's name and IPv4 address
def print_machine_info():
    host_name = socket.gethostname()
    ip_address = socket.gethostbyname(host_name)
    print("Host name: %s" % host_name)
    print("IP address: %s" % ip_address)
    print()

# Retrieving a remote machine's IP address
def get_remote_machine_info():
    remote_host = [
        'duckduckgo.com',
        'www.python.org',
        'youtube.com',
        'www.pollito.org']
    for host in remote_host:
        print(f"Host name: {host}")
        try:
            ip_address = socket.gethostbyname(host)
            print(f"IP address: {ip_address}")
        except socket.error as err_msg:
            print(f"{err_msg}")
    print()

# Converting an IPv4 address to different formats
def convert_ip4_address():
    for ip_addr in ['127.0.0.1', '192.168.0.1', '255.255.255.255']:
        packed_ip_addr = socket.inet_aton(ip_addr)
        unpacked_ip_addr = socket.inet_ntoa(packed_ip_addr)
        print("IP Address: %s => \n\tPacked: %s \n\tUnpacked: %s"\
            %(ip_addr, hexlify(packed_ip_addr), unpacked_ip_addr))
    print()

# Finding a service name, given the port and protocol
def find_service_name(protocolname, printallports=True):
    print(bg.blue + f"Protocol name: {protocolname}" + rs.bg)
    count = 0
    for port in range(80):
        try:
            servicename = socket.getservbyport(port, protocolname)
            print(fg.green + "Port: %s => service-name: %s"\
                % (port, servicename) + rs.fg)
            count += 1
        except socket.error as err_msg:
            if(printallports): print("Port: %s => %s" % (port, err_msg))
    print(fg.blue + f"Ports found: {count}\n" + rs.fg)

# Converting integers to and from host to network byte order
def convert_integer(data):
    print(f"Original: {data} =>")
    print("\tLong host byte order: %s\n\tNetwork byte order: %s"\
        % (socket.ntohl(data), socket.htonl(data))) #32-bit
    print("\tShort host byte order: %s\n\tNetwork byte order: %s\n"\
        % (socket.ntohs(data), socket.htons(data))) #16-bit

# Setting and getting the default socket timeout
def test_socket_timeout():
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    print("Default socket timeout: %s" % s.gettimeout())
    s.settimeout(100)
    print("Current socket timeout: %s\n" % s.gettimeout())


if __name__ == '__main__':
    parser = argparse.ArgumentParser(
        description='Miscellaneous simple functions')
    parser.add_argument('--data', action='store', dest='data', \
        type=int, help="enter data to convert")
    print(sys.version, "\n")

    #Use functions
    print_machine_info()
    get_remote_machine_info()
    convert_ip4_address()
    #find_service_name('tcp', False)
    #find_service_name('udp', False)
    test_socket_timeout()
