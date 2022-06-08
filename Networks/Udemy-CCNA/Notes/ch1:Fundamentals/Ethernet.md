# Ethernet

| Section     | Bytes   |
| :---------- | :-----: |
| Preamble    | 8       |
| Destination | 6       |
| Source      | 6       |
| Ethertype   | 2       |
| Data        | 46-1500 |
| FCS         | 4       |

## The MAC address

- Ethernet uses a 48-bit hexadecimal *MAC* address. 
- The first 24 bits is the *OUI* (Organizationally Unique Identifier),
    it identifies the manufacturer of the Ethernet port. The *OUI* is
    assigned by the *IEEE*. The last 24 bits is vendor assigned. The
    burned in *MAC* address on every *NIC* port in the world is
    globally unique.
- The 48-bit address space contains $2^48 = 281'474'976'710'656$
    possible MAC addresses.
