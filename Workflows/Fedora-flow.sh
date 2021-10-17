sudo dnf upgrade --refresh
sudo dnf install dnf-plugin-system-upgrade
sudo dnf system-upgrade download --releasever=35
sudo dnf system-upgrade reboot
cat /etc/os-release | grep VERSION_ID
