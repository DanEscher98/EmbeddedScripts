sudo dnf upgrade --refresh
sudo dnf install dnf-plugin-system-upgrade
sudo dnf system-upgrade download --releasever=36
sudo dnf system-upgrade reboot
cat /etc/os-release | grep VERSION_ID

sudo dnf system-upgrade clean
sudo symlinks -r -d /usr
