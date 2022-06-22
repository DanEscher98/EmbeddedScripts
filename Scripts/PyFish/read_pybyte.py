#!/usr/bin/python3

import sys
import platform
import time
import binascii
import marshal
import dis
import struct


def view_pyc_file(file_path):
    """READ and display the contents of a pyc file"""
    with open(file_path, "rb") as file:
        magic = file.read(4)
        timestamp = None
        bit_field = None
        hashstr = None
        size = None

        if sys.version_info.major == 3 and sys.version_info.minor >= 7:
            bit_field = int.from_bytes(file.read(4), byteorder=sys.byteorder)
            if 1 & bit_field == 1:
                hashstr = file.read(8)
            else:
                timestamp = file.read(4)
                size = file.read(4)
                size = struct.unpack("I", file.read(4))[0]
        elif sys.version_info.major == 3 and sys.version_info.minor >= 3:
            timestamp = file.read(4)
            size = struct.unpack("I", file.read(4))[0]
        else:
            timestamp = file.read(4)
        code = marshal.loads(file.read())

    magic = binascii.hexlify(magic).decode("utf-8")
    timestamp = time.asctime(time.localtime(struct.unpack("I", timestamp)[0]))
    dis.disassemble(code)

    print("-" * 60)
    print(f"Python version: {platform.python_version()}")
    print(f"Magic code: \t{magic}")
    print(f"Timestamp: \t{timestamp}")
    print(f"Size: \t\t{size}")
    print(f"Hash: \t\t{hashstr}")
    print(f"Bitfield: \t{bit_field}")


if __name__ == "__main__":
    view_pyc_file(sys.argv[1])
