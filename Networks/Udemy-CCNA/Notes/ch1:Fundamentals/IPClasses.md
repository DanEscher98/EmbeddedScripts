# IP Classes

## Subnet Size

- The bigger the host portion of the network, the more hosts we can
    have
- If the subnet mask is `/8`, we have 24 bits available to allocate to
    hosts, for example
- Unfortunately, when `IPv4` was created, the designers didn't realise
    how big the internet was going to get, and they didn't create a
    big enough address space. The long term solution to this, is
    `IPv6` which has a much bigger address space.
- `0.0.0.0/8` is reserved and signifies *this network*. From `0.0.0.1`
    to `0.255.255.255` are not valid host addresses.
- `127.0.0.0/8` in the Class `A` is reserved as the *loopback* address
    for testing the local computer. From `127.0.0.1` to `127.255.255.255`
    are not valid host addresses.
- This wipes out 33554428 ($2 * (2^{8 * 3} - 2)$) addresses from
    the global address pool.
- Private Addresses are directions valid to be assigned to hosts but
    they are not routable on the public internet. They were originally
    designed for hosts in a closed private network with no Internet
    connectivity.
-  Classes `A`, `B` and `C` include all the addresses which are valid
    to be assigned to hosts.
- `255.255.255.255` is the broadcast address for *this network*


| Class | Mask | B    | First Octet    | Nets    | Hosts   |
| :---: | ---- | ---  | :------------- | :------ | :------ |
| `A`   | 8    | 0    | `1` to `126`   | 126     | 1677214 |
| `B`   | 16   | 10   | `128` to `191` | 16384   | 65534   |
| `C`   | 24   | 110  | `192` to `223` | 2097152 | 254     |
| `D`   | `NA` | 1110 | `224` to `239` | `NA`    | `NA`    |
| `E`   | `NA` | 1111 | `240` to `255` | `NA`    | `NA`    |

### Class A

- Assigned to networks with a very large number of hosts.
- The first bit in a class `A` address is always set to zero.
- Private addresses: `10.0.0.0` to `10.255.255.255`

### Class B

- Assigned to medium-sized to large-sized networks
- The first bit is always set to '1' and the next to '0'
- Private addresses: `172.16.0.0` to `172.31.255.255`

### Class C

- Used in small networks
- Its firsts bites are set to `110`
- Private addresses: `192.168.0.0` to `192.168.255.255`

### Class D & E

- Class `D` addresses are reserved for IP multicast addresses.
- Class `E` addresses are experimental and reserved for future use.
