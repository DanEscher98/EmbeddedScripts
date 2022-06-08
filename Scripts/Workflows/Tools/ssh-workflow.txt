#!/usr/bin/bash

EMAIL="<name>@<provider>.com"
ssh-keygen -t rsa -C $EMAIL


# OPENSSH FOR FEDORA
# check if installed
rpm -qa | grep openssh-server
sudo dnf install openssh-server

# start and enable daemon
sudo systemctl enable sshd
sudo systemctl start sshd
sudo systemctl status sshd

# open the port 22 for incoming connections
sudo ss -lt
