#!/usr/bin/python3

import re
from ipaddress import IPv4Address, IPv4Interface, IPv4Network

addr = IPv4Address("220.14.9.37")

num_connections = {
    IPv4Address("220.14.9.37"): 2,
    IPv4Address("100.201.0.4"): 16,
    IPv4Address("8.240.12.2"): 4,
}

# IPv4Address class supports:
# - hash(addr)
# - print(addr)
# - comparison <==>

# IPv4Network class supports:
# - idiomatic membership (in)
# - iteration (in)
# - net.subnets() iterator

# A *host interface* is a way to describe, in a single
# compact form, both a host IP address and a network that it
# sits in
# IPv4Interface class supports:

# IPv4Network class supports
net1 = IPv4Network("192.4.2.0/24")
net1.num_addresses
net1.max_prefixlen
net1.netmask

if IPv4Address("192.4.2.12") in net1:
    print(True)

net2 = IPv4Network("100.64.0.0/10")
net2.num_addresses  # 4194304
net2.netmask  # 255.192.0.0

net = IPv4Network("200.100.10.0/24")
for sn in net.subnets():
    print(sn)


class MyIPv4(IPv4Address):
    def __and__(self, other: IPv4Address):
        if not isinstance(other, (int, IPv4Address)):
            raise NotImplementedError
        return self.__class__(int(self) & int(other))

    @property
    def binary_repr(self, sep=".") -> str:
        """Represent IPv4 as 4 blocks of 8 bits"""
        return sep.join(f"{i:086b}" for i in self.packed)

    @classmethod
    def from_binary_repr(cls, binary_repr: str):
        """Construct IPv4 from binary representation."""
        # Remove anything that's not a 0 or 1
        i = int(re.sub(r"[^01]", "", binary_repr), 2)
        return cls(i)
