# I'm the other :)

## **Index**

1. [Socket types](#id1)
2. [Address classes](#id2)
3. [Other file](./myfile.md)

*Sockets* allow communication between two different processes on the same or different machines using standard Unix file descriptors.

A Unix Socket is used in a client-server application framework.
In Unix, every I/O action is done by writing or reading a file descriptor. Commands such as read() and write() work with sockets in the same way they do with files and pipes.

> **File descriptor:**
    An integer associated with an open file.
    It can be a network connection, a text file, a terminal or something else.

> **Internet Protocol host address:**
    Is a 32-bit quantity interpreted as four 8-bit numbers or octets.
    Is used to identify hosts connected to the Internet.
    Addresses beginning with 01111111, or 127 decimal, are reserved   for loopback and for internal testing on a local machine.

---

### Socket types<a name="id1"></a>

  - **Stream sockets:**
    Delivery in a networked environment is guaranteed.
    Packages arrive at the same order they were send.
    These sockets use TCP (*Transmission Control Protocol*).
    If delivery is impossible, the sender receives an error indicator.
    Data records do not have any boundaries.

  - **Datagram sockets:**
    Delivery is not guaranteed.
    These sockets use UDP (*User Datagram Protocol*).
    They're connection-less.

  - **Raw sockets:**
    These provide users access to the underlying communication protocols.
    Raw sockets are not intended for the general user.

  - **Sequenced-packet sockets:**
    They are similar to a stream socket but the record boundaries are preserved.
    Is very important in most serious Network Systems applications.
    They allow to manipulate the SSP (*Sequence Packet Protocol*) or IDP (*Internet Datagram Protocol*) headers on a packet.

---

### Address classes<a name="id2"></a>

  - **Class A** => [1.0.0.0, 126.0.0.0]

        Addresses begin with 0xxx
        Are for networks with large number of total hosts.
        Subnet Mask: 255.0.0.0 (8 bits)
        Number of Networks: 126
        Number of Hosts per Network: 16,777,214

  - **Class B** => [128.0.0.0, 191.255.0.0]

        Addresses begin with 10xx
        Are for medium to large sized networks.
        Subnet Mask: 255.255.0.0 (16 bits)
        Number of Networks: 16,382
        Number of Hosts per Network: 65,534

  - **Class C** => [192.0.0.0, 223.255.255.0]

        Addresses begin with 110x
        Are used in small local area networks (LANs).
        Subnet Mask: 255.255.255.0 (24 bits)
        Number of Networks: 2,097,150
        Number of Hosts per Network: 254

  - **Class D** => [224.0.0.0, 239.255.255.255]

        Addresses begin with 1110
        Are not allocated to hosts and are used for multicasting.
        Number of Networks: N/A
        Number of Hosts per Network: Multicasting

  - **Class E** => [240.0.0.0, 254.255.255.255]

        Addresses begin with 1111, or 240 to 254 decimal.
        Are not allocated to hosts and are reserved for research purposes.
        Number of Networks: N/A
        Number of Hosts per Network: Research/Reserved/Experimental

* $x = {-b \pm \sqrt{b^2-4ac} \over 2a}$ And so on

$$ a = {\frac{!4}{2} }$$

$$ x = {-b \pm \sqrt{b^2-4ac} \over 2a} $$

$$\begin{aligned}
3x-1 &= -10 \\
  3x &= -9 \\
   x &= -3 \\
   {n \choose k} &=\frac{a!}{(b-a)!b!}
\end{aligned}$$

$$ f(x)=x^2 $$

* $x = {-b \pm \sqrt{b^2-4ac} \over 2a}$ And so on

$$ a = {\frac{!4}{2} }$$

$$ x = {-b \pm \sqrt{b^2-4ac} \over 2a} $$

$$ \vec{W} = \int \mathrm{e}^{\mathrm{i}x} x^2 \mathrm{d}x \phi$$

$$\mathrm{e}^x = \sum^{\infty}_{n=0} \frac{x^n}{n!}$$

$$e^{ix} = \cos x + i\sin x$$

$$\begin{aligned}
3x-1 &= -10 \\
  3x &= -9 \\
   x &= -3 \\
   {n \choose k} &=\frac{a!}{(b-a)!b!}
\end{aligned}$$

<center>

| Column 1       | Column 2     | Column 3     |
| :------------- | :----------: | -----------: |
| An equation | $x = {-b \pm \sqrt{b^2-4ac} \over 2a}$ | And Again    |
| You Can Also   | Put Pipes In | Like this    |
| An equation | $x = {-b \pm \sqrt{b^2-4ac} \over 2a}$ | And Again    |

</center>

| A table | Another |
| ---- | ---- |
| a | b |
|   |   |

$$\cos x = \Big(\sum^\infty_{k=0} \frac{(-1)^k x^{2n}}{(2k)!}\Big)$$
$$\sin x = \Big(\sum^\infty_{k=0} \frac{(-1)^k x^{2n+1}}{(2k+1)!}\Big)$$
