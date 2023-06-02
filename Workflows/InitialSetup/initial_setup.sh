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
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo apt update && sudo apt upgrade
# sudo dnf install util-linux-user
sudo add-apt-repository ppa:appimagelauncher-team/stable
sudo apt-get update
sudo apt-get install appimagelauncher
sudo dnf -y install bridge-utils libvirt virt-install qemu-kvm

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
alias cls="clear && ls"' >~/.config/fish/config.fish
ln -s ~/.config/fish/config.fish ~/.fishrc
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
# omf install simple-ass-prompt
omf install cbjohnson
if [ -d Fish ]; then
    mv Fish/*.fish ~/.config/nvim/functions
fi

# BASIC AND USEFUL COMMANDS
sudo apt install curl build-essential
sudo apt -y install neofetch trash-cli pkg-config
sudo apt install fonts-powerline
sudo apt -y install gawk mplayer
sudo mv trans ~/usr/local/bin/
sudo apt install autojump
curl -sS https://webinstall.dev/zoxide | bash
zoxide init fish && source
# gcc gmp gmp-devel make ncurses ncurses-compat-libs xz perl

# Configuring nvim
sudo apt install neovim
mkdir ~/.config/nvim
mkdir ~/.config/nvim/autoload
mkdir ~/.config/nvim/autoload/plugged
# cd ~/.config/nvim && ln -s ./autoload/plugged/neoformat/autoload/neoformat/formatters/ ./
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if [ -d nvim ]; then
    mv nvim/coc-settings.json nvim/init.vim nvim/plugins.vim
    \ ~/.config/nvim/
fi

# Developing tools
echo "deb [arch=$(dpkg --print-architecture)" \
    "signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg]" \
    "https://cli.github.com/packages stable main" |
    sudo tee /etc/apt/sources.list.d/github-cli.list >/dev/null

curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg |
    sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg

sudo apt update
sudo apt install gh
sudo apt -y install clang --install-suggests
sudo apt install clangd make valgrind nasm
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
sudo apt install nodejs npm
sudo npm install -g n
sudo n stable
sudo npm install -g yarn

vagrant plugin install vagrant-disksize
vagrant plugin install vagrant-libvirt

# Language Servers and NPM
curl -sL https://deb.nodesource.com/setup_current.x | sudo -E bash -
npm i -g bash-language-server
rustup component add rls rust-analysis rust-src
cargo install --git https://github.com/bergercookie/asm-lsp

# Programming languages
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
sudo apt-get install libgmp-dev
stack install stylish-haskell
cd ~/Packages
git clone https://github.com/lazamar/haskell-docs-cli.git
cd haskell-docs-cli && stack install

# Autoformaters
cargo install stylua --features lua52
sudo apt install clang-format # C/C++
sudo pip install black        # Python
julia -e 'import Pkg; Pkg.add("JuliaFormatter")'
npm install -g typescript-formatter
npm install -g remark-cli
go install mvdan.cc/sh/cmd/shfmt@latest
go install github.com/klauspost/asmfmt/cmd/asmfmt@latest
go install github.com/ruinshe/nasmfmt@latest

# C Drive in WSL
# mkdir ~/MyWindows
# ls -s /mnt/c/User/$name/Documents/Programs ~/MyWindows

# Plutus working setup

# sh <(curl -L https://nixos.org/nix/install) --no-daemon
# . $HOME/.nix-profile/etc/profile.d/nix.sh
# mkdir ~/.config/nix
# echo 'substituters = https://hydra.iohk.io https://iohk.cachix.org https://cache.nixos.org/' >>~/.config/nix/nix.conf
# echo 'trusted-public-keys = hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ= iohk.cachix.org-1:DpRUyj7h7V830dp/i6Nti+NEO2/nhblbov/8MW7Rqoo= cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=' >>~/.config/nix/nix.conf
# sudo apt install nix-bin

cd ~/Packages
git clone https://github.com/input-output-hk/plutus
cd plutus
nix build -f default.nix plutus.haskell.packages.plutus-core
# cd ~/Packages/plutus && nix-shell
# cd plutus-playground-server && plutus-playground-server
# cd plutus && nix-shell
# cd plutus-playground-client && npm run start
