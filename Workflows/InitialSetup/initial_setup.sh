#!/usr/bin/bash

# 1. Package managers and essentials
#	- apt, flatpak, fish, commands
# 2. Development tools
#	- nvim, coc, language servers, compilers
#	- gh, git
# 3. Extras

# Initialization
mkdir ~/Working ~/Packages

# PACKAGE MANAGERS
sudo apt update && sudo apt upgrade
sudo add-apt-repository ppa:appimagelauncher-team/stable
sudo apt-get update
sudo apt-get install appimagelauncher

# The Fish shell
sudo apt install fish
chsh -s /usr/bin/fish
mkdir ~/.config/fish
mkdir ~/.config/fish/functions
echo 'set fish_greeting
cd ~/Working
set -xg EDITOR nvim
set -gx PAGER less
fish_vi_key_bindings
source /usr/share/autojump/autojump.fish
alias bat="batcat"
alias tress="tree|less"
alias cls="clear && ls"' > ~/.config/fish/config.fish
ln -s ~/.config/fish/config.fish ~/.fishrc
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
omf install jacaetevha
if [ -d Fish ]; then
	mv Fish/*.fish ~/.config/nvim/functions
fi


# BASIC AND USEFUL COMMANDS
sudo apt install curl build-essential
sudo apt -y install neofetch trash-cli
sudo apt install fonts-powerline
sudo apt -y install gawk mplayer
sudo mv trans ~/usr/local/bin/
sudo apt install autojump

# Configuring nvim
sudo apt install neovim
mkdir ~/.config/nvim
mkdir ~/.config/nvim/autoload
mkdir ~/.config/nvim/autoload/plugged
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if [ -d nvim ]; then
	mv nvim/coc-settings.json nvim/init.vim nvim/plugins.vim
	\ ~/.config/nvim/
fi

# Developing tools
echo "deb [arch=$(dpkg --print-architecture)" \
	"signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg]" \
	"https://cli.github.com/packages stable main" \
	| sudo tee /etc/apt/sources.list.d/github-cli.list >/dev/null

curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg \
	| sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg

sudo apt install gh
sudo apt -y install clang --install-suggests
sudo apt install clangd make valgrind
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
sudo apt instal install nodejs npm
sudo npm install -g n
sudo n stable
sudo npm install -g yarn

# Autoformaters
cargo install stylua --features lua52
sudo apt install clang-format # C/C++
sudo pip install black # Python
julia -e 'import Pkg; Pkg.add("JuliaFormatter")'
npm install -g typescript-formatter
npm install -g remark-cli
go get -u mvdan.cc/sh/cmd/shfmt
go get -u github.com/klauspost/asmfmt/cmd/asmfmt

# Language Servers and NPM
curl -sL https://deb.nodesource.com/setup_current.x | sudo -E bash -
sudo apt install nodejs
npm i -g bash-language-server
rustup component add rls rust-analysis rust-src
cargo install --git https://github.com/bergercookie/asm-lsp

# C Drive in WSL
# mkdir ~/MyWindows
# ls -s /mnt/c/User/$name/Documents/Programs ~/MyWindows
