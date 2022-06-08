# Access Methods

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
