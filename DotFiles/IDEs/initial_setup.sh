#/usr/bin/bash

sudo apt update && sudo apt upgrade
# Basic and useful commands
sudo apt -y install neofetch trash-cli

# Developing tools
sudo apt install clang clangd
sudo apt install nvim

# The Fish shell
sudo apt install fish
chsh -s /usr/bin/fish
touch ~/.config/fish/config.fish
ln -s ~/.config/fish/config.fish ~/.fishrc
curl -L https://get.oh-my.fish | fish
omf install pisces
omf install harleen
omf theme harleen
