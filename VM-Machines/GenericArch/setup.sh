yes | sudo pacman -Sy base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay
yes | makepkg -si
yay -Syu
