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
