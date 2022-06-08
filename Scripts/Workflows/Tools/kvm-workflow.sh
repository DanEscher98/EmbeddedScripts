# FEDORA INSTRUCTIONS
# install kmv/qemu
sudo dnf -y install bridge-utils libvirt virt-install qemu-kvm
# verify that the Kernel modules are loaded
lsmod | grep kvm
# install useful tools for management
sudo dnf install \
	libvirt-devel virt-top libguestfs-tools guestfs-tools
# start and enable daemon
sudo systemctl start libvirtd
sudo systemctl enable libvirtd
# install GUI
sudo dnf -y install virt-manager
