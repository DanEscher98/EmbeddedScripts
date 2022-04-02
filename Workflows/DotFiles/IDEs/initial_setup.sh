#/usr/bin/bash

sudo apt update && sudo apt upgrade
# Basic and useful commands
sudo apt -y install neofetch trash-cli

# Developing tools
sudo apt -y install clang clangd make
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Configuring nvim
sudo apt install nvim
mkdir ~/.config/nvim/autoload
mkdir ~/.config/nvim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# The Fish shell
sudo apt install fish
chsh -s /usr/bin/fish
mkdir ~/.config/fish
touch ~/.config/fish/config.fish
ln -s ~/.config/fish/config.fish ~/.fishrc
curl -L https://get.oh-my.fish | fish
omf install pisces
omf install harleen
omf theme harleen
