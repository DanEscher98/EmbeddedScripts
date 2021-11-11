#/usr/bin/bash

sudo apt update && sudo apt upgrade
# Basic and useful commands
sudo apt install curl build-essential
sudo apt -y install neofetch trash-cli
sudo apt install fonts-powerline
sudo apt -y install gawk mplayer
sudo mv trans ~/usr/local/bin/
sudo apt install autojump

# Developing tools
sudo apt -y install clang clangd make
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Configuring nvim
sudo apt install nvim
mkdir ~/.config/nvim/autoload
mkdir ~/.config/nvim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
if [ -d nvim ]; then
	mv nvim/coc-settings.json nvim/init.vim nvim/plugins.vim
	\ ~/.config/nvim/
fi

# Language Servers and NPM

curl -sL https://deb.nodesource.com/setup_current.x | sudo -E bash -
sudo apt install nodejs
npm i -g bash-language-server
rustup component add rls rust-analysis rust-src
cargo install --git https://github.com/bergercookie/asm-lsp

# The Fish shell
sudo apt install fish
chsh -s /usr/bin/fish
mkdir ~/.config/fish
mkdir ~/.config/fish/functions
touch ~/.config/fish/config.fish
if [ -d Fish ]; then
	mv Fish/*.fish ~/.config/nvim/functions
fi
ln -s ~/.config/fish/config.fish ~/.fishrc
curl -L https://get.oh-my.fish | fish
omf install pisces
omf install harleen
omf theme harleen
echo "source /usr/share/autojump/autojump.fish" >> ~/.fishrc

# C Drive in WSL
mkdir ~/MyWindows
ls -s /mnt/c/User/$name/Documents/Programs ~/MyWindows
