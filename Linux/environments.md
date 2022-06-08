---
title: Environments
subtitle: VMs, Containers, Unikernels and the quest for the holy grial
author: Danyiel Colin
---

# Unikernels

**Uniernel**: a specialised single address space machine image
constructed by using library operating systems.

> Why do we have multi-user spaces? The reason we have that is to
> processes. If yours is in trouble, I want to make sure it won't
> influence mine,” she pointed out.
[Idit Levine at CF Summit](https://youtu.be/2AKHLKSM_OE)

## Vagrant

```txt
config.vm.box           # The OS
config.vm.provider      # VirtualBox, libvirt, VMWare
config.vm.network       # How your host sees the vm
config.vm.synced_folder # How you access files from the host
config.vm.provision     # What we want to setup
```
