#./ch1-errors.py --host=www.python.org --port=80 --file=hello.txt
import sys
import socket
import argparse

# Handling socket errors gracefully
if __name__=='__main__':
    parser = argparse.ArgumentParser(description='Socket Error Examples')
    parser.add_argument('--host', action="store", dest="host", \
        required=False)
    parser.add_argument('--port', action="store", dest="port", \
        required=False, type=int)
    parser.add_argument('--file', action="store", dest="file", \
        required=False)
    given_args = parser.parse_args()
    host = given_args.host
    port = given_args.port
    filename = given_args.file

    # First try-except block: create socket
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    except socket.error as err_msg:
        print(f"Error creating socket: {err_msg}")
        sys.exit(1)

    # Second try-except block: connect to given host/port
    try:
        s.connect((host, port))
    except socket.gaierror as err_msg:
        print(f"Address-related error connecting to server: {err_msg}")
        sys.exit(1)
    except socket.error as err_msg:
        print(f"Connection error: {err_msg}")
        sys.exit(1)

    # Third try-except block: sending data
    try:
        s.sendall(f"GET {filename} HTTP/1.0\r\n\r\n".encode('utf-8'))
    except socket.error as err_msg:
        print(f"Error reciving data: {err_msg}")
        sys.exit(1)

    # Fourth try-except block: waiting to recive data from remote host
    while True:
        try:
            buf = s.recv(2048)
        except socket.error as err_msg:
            print(f"Error reciving data: {err_msg}")
            sys.exit(1)

        if not len(buf): break
        sys.stdout.write(buf.decode('utf_8'))
    print()
