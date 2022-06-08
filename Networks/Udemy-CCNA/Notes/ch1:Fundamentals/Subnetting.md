# Subnetting

*Classless Inter-Domain Routing* (`CIDR`) was introduced in 1993 to
alleviate waste of global address space with classfull addresses.
Companies can now be allocated an address range which more closely
matches their needs and does not waste addresses

### Benefits of `CIDR`:

- By removing the fixed `/8`, `/16` and `/24` requirements for the
    address classes, allows them to be *subnetted* into smaller ones.
- Aggregated blocks of networks can be advertised on the Internet.

### Route Summarisation Benefits

- `ISP A` doesn't know about all 256 `/24` networks reachable in `ISP B`
- It only has the single `175.11.0.0/16` summary route.
- This reduces the size of `ISP A`'s routing table, using less memory
- If and individual link goes down in `ISP B`, it has no impact on
    `ISP A`. The single summary route does not change.
- This restricts issues to the local part of the network and reduces
    CPU load.

---

## Borrowing Host Bits

- To subnet the network into smaller subnets, we need to borrow host
    bits and add them to the network portion of the address.
- The network address line always moves to the right when we subnet
- The further to the right we go, the more subnets we'll have of that
    size but less hosts.

## Calculating the Number of Networks and Hosts

- Available subnets: $2^{\text{bits borrowed}}$
- Hosts on different subnets need to go via a router if they want to
    communicate with each other. 
- Available hosts: $2^{\text{host bits}} - 2$
- We substract 2 because the network address and broadcast address
    cannot be assigned to hosts.
- The amount of hosts will depend on the subnet size and it's equal
    for any IP class.
- In the original Internet standards it wasn't allowed to use network
    bits of all 0's or all 1's, so we used to have to substract 2 to
    get the number of networks. The `ip subnet-zero` command on a
    router overrides the limitation.
- `\31` subnets are supported on Cisco Routers for *point to point*
    links (which have no need for a network or broadcast address).
    It's useful if you need to maximise use of your address space.
    `/30` is more standard and commonly used. For the `CCNA exam`, use
    `/30` when a subnet to support 2 hosts is required, unless told to
    use `/31`.

## Trivia

- Early routing protocols only supported *Fixed Length Subnet Masking*
    (FLSF). You couldn't have have subnets with different size in the
    same network. All modern routing protocols support *Variable LSM*.

---

## Subnetting Considerations

- How many locations do we have in the network?
- How many hosts are in each location?
- What are the IP addressing requirements for each location? (Should
    different departments or types of host be in different subnets?)
- What size is appropriate for each subnet? (Don't waste addresses,
    but leave room for growth)
- The routers need a IP address too.
- The router loopback interfaces also need allocated address space

## Subnetting Design Steps

1. Find the largest segment and allocate a suitable subnet size
2. Allocate this subnet at the start of the address space
3. You will likely allocate spare subnets for future growth and leave
   space in the subnets for additional hosts

## Private Addresses

- The *Internet Engineering Task Force* (IETF) documents standards
    with *RFC* (Requests For Comments). RFC 1918 specifies private IP
    addresses ranges which are not routable on the public internet.
- Theses addresses were originally designed for hosts which should
    have no internet connectivity. Public IP addresses cost money. So,
    if an organisation has a part of their network where the hosts
    need to communicate with each other over IP, but don't require
    connectivity to the Internet, they can assign private IP addresses
    an save money.

## Extra Resources

- [Subnetting Questions](http://www.subnettingquestions.com)
- [Subnetting Practice](https://subnettingpractice.com)
- [Subnetting](http://www.subnetting.org)
- [Calculator](https://www.subnet-calculator.com)
