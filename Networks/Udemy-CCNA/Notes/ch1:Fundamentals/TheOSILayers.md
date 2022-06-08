# The OSI Layers

## L7 - The Application Layer

- Provides network services to the applications of the user
- Establishes the availability of intended communication partners
- It then synchronizes and establishes agreement on procedures for
    error recovery and control of data integrity.

## L6 - The Presentation Layer

- Ensures that the information that is sent at the application layer
    of one system is readable by the application layer of another
    system.
- Can translate among multiple data formats using a common format (ex.
    computers with different encoding schemes)

## L5 - The Session Layer

- Establishes, manages and terminates sessions between two
    communicating hosts.
- It also synchronizes dialog between the presentation layers of the
    two hosts and manages their data exchange.
- It also offers efficient data transfer, CoS (Class of Service) and
    exception reporting of upper layer problems.

## L4 - The Transport Layer

- Main characteristics: whether TCP or UDP transport is used
    and the port number.
- Defines services to segment, transfer and reassemble the data for
    individual communications between the end devices.
- Is responsible for end-to-end error recovery and flow control.
- It breaks down large files into smaller segments that are less
    likely to incur transmission problems.
- Session multiplexing is the process by which a host is able to
    support multiple sessions simultaneously and manage the individual
    traffic streams over a single link. 
- The L4 *destination port number* is used to identify the upper layer
    protocol. The sender also adds a *source port* number to the L4
    header. The combination of both numbers can be used to track
    sessions.
- `TCP` and `UDP` are the most common L4 protocols.
    - `TCP` is connection oriented, once a connection is established,
        data can be sent bidirectionally over that connection.
    - `TCP` carries out sequencing to ensure segments are processed in
        the correct order and none are missing.
    - `TCP` is reliable, the receiving host sends acknowledgments back
        to the sender. Lost segments are resent.
    - `TCP` performs flow control.
    - `UDP` is basically the opposite of `TCP`. If error detection and
        recovery is required it is up to the upper layers to provide
        it.
    - Application developers will typically choose to use `TCP` for
        traffic which requires reliability. Real-Time applications
        such as voice and video, can't afford the extra overhead of
        `TCP` so they use `UDP`. Some applications can use both
        protocols.

## L3 - The Network Layer

- Important information: the source and destination IP addresses.
- Provides connectivity and path selection between two host systems
    that may be located on geographically separated networks.
- Is the layer that manages the connectivity of hosts by providing
    logical addressing

## L2 - The Data-Link Layer

- Important information: the source and destination layer 2 addresses
- Defines how data is formatted for transmission and how access to
    physical media is controlled.
- It also typically includes error detection and correction to ensure
    a reliable delivery of the data.
- If it's not Ethernet, which other technologies could be used?

## L1 - The Physical Layer

- It concerns the physical components of the network
- Enables bit transmission between end devices.
- Defines specifications needed for activating, maintaining and
    deactivating the physical link between end devices.
- Voltage levels, physical data rates, maximum transmission distances,
    physical connectors, etc.
