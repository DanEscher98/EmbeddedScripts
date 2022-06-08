# CISCO CLI  cheat sheet

## Basic Device Configuration

### Set a name
```
# configure terminal
(config)# hostname <name>
<name>#
```

### User EXEC password
```
# configure terminal
(config)# line console 0
(config-line)# password <password>
(config-line)# login
(config-line)# end
#
```

### Priviliged EXEC password
```
# configure terminal
(config)# enable password <password>
(config)# exit
```

### Priviliged EXEC password with encryption
```
# configure terminal
(config)# enable secret <password>
(config)# exit
```

### Secure VTY lines
```
# configure terminal
(config)# line vty 0 15
(config-line)# password <password>
(config-line)# login
(config-line)# end
```

### Encrypt passwords
```
# configure terminal
(config)# service password-encryption
```

### Configuration in the current session
```
# show running-config
```

### Banner messages
```
# configure terminal
(config)# banner motd #<message>
#
```

### Save configurations
```
# copy running-config startup-config
```
---

## Configure IP Addressing

#### Configure IP address
```
# configure terminal
(config)# interface vlan 1
(config-if)# ip address <IP Address> <subnet mask>
(config-if)# no shutdown
(config-if)# exit
```

#### Show IP configuration
```
# show ip interface brief
```
