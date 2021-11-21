# Networking setup

```txt
# nano /etc/network/interfaces
auto eth0
iface eth0 inet static 
  address 192.168.0.100
  netmask 255.255.255.0
  gateway 192.168.0.1
  dns-nameservers 4.4.4.4
  dns-nameservers 8.8.8.8
```

```bash
# /etc/init.d/network restart  [On SysVinit]
# systemctl restart network    [On SystemD]
```
