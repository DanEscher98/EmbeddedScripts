---
author: Daniel Sánchez
title: TAP interface to GNS3
---

## Create TAP interface

TAP is a virtual network kernel interface that does not have physical
devices associated. Though both are for tunneling purposes, TUN and
TAP can't be used together because they transmit and receive packets
at different layers of the network stack. TUN, namely network TUNnel,
simulates a network layer device and operates in layer 3 carrying IP
packets. TAP, namely network TAP, simulates a link layer device and
operates in layer 2 carrying Ethernet frames. TUN is used with
routing. TAP can be used to create a user space network bridge.

```bash
# User-mode Linux
sudo apt install uml-utilities
# Create and manage persistent TUN/TAP, -t <name>
sudo tunctl -t tap0
# Set a static IP and netmask
sudo ifconfig tap0 192.168.123.1 netmask 255.255.255.0 up
# To check that it was added
ifconfig tap0

sudo echo '
auto tap0
iface tap0 inet static
address 192.168.123.1
netmask 255.255.255.0
pre-up /usr/bin/tunctl -t tap0
' >> /etc/network/interfaces
```

## Create a GNS3 topology

Drag and drop a Cloud and Router to GNS3 Workspace. Right click on
Cloud and click configure, select the interface which we are added.
Click tab TAP Interfaces > tap0 > Add > Apply > OK. Now configure the
router.

```txt
# cofigure terminal
(config)# interface FastEthernet 0/0
(config-if)# ip address 192.168.123.2
(config-if)# no shutdown
(config-if)# end
```

Confirm in the terminal of local host: `ping -c 5 192.168.123.2`.
