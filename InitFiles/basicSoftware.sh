#!/usr/bin/bash

[[ $EUID -ne 0 ]] && echo "This script must be run as root." && exit 1

if type dnf &>/dev/null; then # Fedora
    # Basic commands
    dnf install -y exa jq dua bat fd nmap trash-cli tree
    # Programming tools
    dnf 
elif type apt &>/dev/null; then # Ubuntu, Debian
    # Basic commands
    apt install exa jq dua bat fd nmap trash-cli tree
elif type pacman &>/dev/null; then # Arch, Manjaro
    # Basic commands
    pacman -s exa jq dua bat fd nmap trash-cli tree
else
    echo "WARNING: Could not find package manager."
    echo "Make sure necessary packages are installed."
fi