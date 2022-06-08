# What is a Socket?

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

### Socket types
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