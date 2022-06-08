# IP version 4 and version 6

- IPv4 isn't particularly efficient in its use of the available space,
    with many addresses being wasted.
- IPv6 uses 128 bit addresses, compared to IPv4's 32 bit address. It
    provides more than $7.9 * 10^28$ times as many addresses as IPv4.
- `NAT` (Network Address Translation) was implemented as a temporary
    workaround to mitigate the lack of IPv4 addresses until
    organisations had time to migrate to IPv6.
- Most enterprises today use `RFC 1918` IPv4 addresses with NAT. `RFC
    1918` has the security benefit of hiding inside hosts by default.
- IPv6 is mostly found in service provider networks, mobile services
    and large countries with later Internet adoption.
- It's common to see `/24` for end hosts, `/30` for point to point
    links and `/32` for loopbacks.
