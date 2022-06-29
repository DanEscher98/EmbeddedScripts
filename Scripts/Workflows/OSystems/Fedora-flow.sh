sudo dnf upgrade --refresh
sudo dnf install dnf-plugin-system-upgrade
sudo dnf system-upgrade download --releasever=36
sudo dnf system-upgrade reboot
cat /etc/os-release | grep VERSION_ID

# Add RPM Fusion
sudo dnf install \
	https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install ffmpeg

sudo dnf system-upgrade clean
sudo symlinks -r -d /usr


# Install QEMU
egrep '^flags.*(vmx|svm)' /proc/cpuinfo
sudo dnf group install --with-optional virtualization
sudo systemctl start libvirtd
sudo systemctl enable libvirtd
lsmod | grep kvm
## For embedded
dnf install qemu-system-arm
dnf install tunctl

# References
# - https://docs.fedoraproject.org/en-US/quick-docs/getting-started-with-virtualization/index.html
# - https://ostechnix.com/how-to-use-vagrant-with-libvirt-kvm-provider/



## Docker and Podman

## SSH Server and NFS````
