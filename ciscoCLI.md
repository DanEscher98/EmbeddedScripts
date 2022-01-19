# **2** Basic Switch and End Device Configuration

## Access Methods

- **Console:** This is a physical management port that provides
    out-of-band access to a Cisco device. Out-of-band access refers to
    access via a dedicated management channel that is used for device
    maintenance purposes only. The advantage of using a console port
    is that the device is accessible even if no networking services
    are configured, such as performing the initial configuration.

- **SSH:** This is an in-band and recommended method for remotely
    establishing a secure CLI connection, through a virtual interface,
    over a network. Unlike a console connection, SSH connections
    require active networking services on the device, including an
    active interface configured with an address.

- **Telnet:** This is an insecure, in-band method of remotely
    establishing a CLI session, through a virtual interface, over a
    network. Unlike SSH, Telnet does not provide a secure, encrypted
    connection and should only be used in a lab environment. User
    authentication, passwords, and commands are sent over the network
    in plaintext.


## Commands Mode
- **User EXEC Mode:** Mode allows access to only a limited number of
    basic monitoring commands. It is often referred to as “view-only"
    mode.
- **Privileged EXEC Mode:** Mode allows access to all commands and
    features. The user can use any monitoring commands and execute
    configuration and management commands.

## **2.4** Basic Device Configuration

#### Set a name
> \# configure terminal
> (config)\# hostname \<name>
> \<name>\#

#### User EXEC password
> \# configure terminal
> (config)\# line console 0
> (config-line)\# password \<password>
> (config-line)\# login
> (config-line)\# end
> \#

#### Priviliged EXEC password
> \# configure terminal
> (config)\# enable password \<password>
> (config)\# exit


#### Priviliged EXEC password with encryption
> \# configure terminal
> (config)\# enable secret \<password>
> (config)\# exit

#### Secure VTY lines
> \# configure terminal
> (config)\# line vty 0 15
> (config-line)\# password \<password>
> (config-line)\# login
> (config-line)\# end

#### Encrypt passwords
> \# configure terminal
> (config)\# service password-encryption

#### Configuration in the current session
> \# show running-config

#### Banner messages
> \# configure terminal
> (config)\# banner motd \#\<message>\#

---

## **2.5** Save Configurations

#### Save configurations
> \# copy running-config startup-config

---

## **2.7** Configure IP Addressing

#### Configure IP address
> \# configure terminal
> (config)\# interface vlan 1
> (config-if)\# ip address \<IP Address> \<subnet mask>
> (config-if)\# no shutdown
> (config-if)\# exit

#### Show IP configuration
> \# show ip interface brief

---
