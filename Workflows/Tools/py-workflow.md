# Python work-flow

## Python
```bash
# Installation


# Python requirements
pip3 install pipreqs pip-tools
pipreqs --savepath=requirements.in && pip-compile


# Environment

# https://github.com/justinmayer/virtualfish
# https://github.com/pyenv/pyenv-virtualenv
# https://github.com/pyenv/pyenv

# Different versions


```

## Vagrant: kvm, libvirt, VirtualBox
```bash
egrep '^flags.*(vmx|svm)' /proc/cpuinfo
sudo dnf group install --with-optional virtualization
sudo systemctl start libvirtd
sudo systemctl enable libvirtd
lsmod | grep kvm
# https://docs.fedoraproject.org/en-US/quick-docs/getting-started-with-virtualization/index.html
# https://ostechnix.com/how-to-use-vagrant-with-libvirt-kvm-provider/


```


## Docker and Podman
```bash

```


## Nim Language


## SSH Server and NFS
