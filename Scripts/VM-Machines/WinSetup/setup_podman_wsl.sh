#!/usr/bin/bash

# Check if the script is being run with sudo privileges
if [ "$EUID" -ne 0 ]; then
  echo "This script requires superuser privileges. Please run with sudo."
  exit 1
fi

# ensure the DNS server settings are correct 
rm /etc/resolv.conf
echo 'nameserver 8.8.8.8' > /etc/resolv.conf
echo '[network]' > /etc/wsl.conf
echo 'generateResolvConf = false' >> /etc/wsl.conf
chattr +i /etc/resolv.conf

# install Podman
. /etc/os-release
echo 'deb http://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/x${NAME}_${VERSION_ID}/ /' \
  > /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list
wget -nv https://download.opensuse.org/repositories/devel:kubic:libcontainers:stable/x${NAME}_${VERSION_ID}/Release.key -O Release.key
apt-key add - < Release.key
apt-get update -qq
apt-get -qq -y install podman
mkdir -p /etc/containers
echo -e "[registries.search]\nregistries = ['docker.io', 'quay.io']" | tee /etc/containers/registries.conf

# configurations to be tweaked for WSL
mkdir ~/.config/containers
echo "[engine]" >> ~/.config/containers/containers.conf
echo "cgroup_manager = 'cgroupfs'" >> ~/.config/containers/containers.conf 
echo "events_logger = 'file'" >> ~/.config/containers/containers.conf

# using Podman
echo "alias docker='podman'" >> ~/.bashrc
if command -v podman &> /dev/null; then
    echo "Podman is installed."
    echo $(podman info)
else

# REFERENCES
# https://blog.scottlogic.com/2022/02/15/replacing-docker-desktop-with-podman.html
