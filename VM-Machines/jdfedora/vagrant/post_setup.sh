#!/usr/bin/bash
#####################################################
#           Script to setup dev environment         #
# This is a simple program to perform updates on a  #
# Linux computer. It installs:                      #
# - Various dev tools                               #
# - The Haskell interpreter and compiler            #
# - Optional: The general markup converter 'pandoc' #
#####################################################

#GREEN='\033[0;32m'
#NC='\033[0m' # No Color
ERRORS=0
SHARED="vagrant"
HOME="/home/vagrant"

#######################################
## Select Package Manager #############
function SelectPkgMgr() {
    # get the Distribution, release and architecture
    if command -v apt &>/dev/null; then
        PkgMgr=apt # For Debian based distros
        apt update
        apt upgrade
    elif command -v dnf &>/dev/null; then
        PkgMgr=dnf # For Fedora
        #dnf upgrade
    elif command -v pacman &>/dev/null; then
        PkgMgr=pacman # For Arch based distros
        pacman -Syu
    else
        echo "Unable to define the Package Manager."
        error=7
        Quit $error
    fi
    printf 'Using %s as Package Manager\n\n' "$PkgMgr"
}

function InstallLibrary() {
    local library=$1
    local flags=$3

    echo "Installing $library ..."
    yes | "$PkgMgr" install "$library" &>/dev/null
    ret=$?
    if [ "$ret" -eq 0 ]; then
        echo "Ok => The library $library has been installed"
    else
        echo "Err => The library $library hasn't been installed"
        ERRORS=$((ERRORS + 1))
    fi
    printf "\n"
}

function InstallProcess() {
    local package=$1
    if [ -v $2 ]; then
        local executable=$1
    else
        local executable=$2
    fi
    local flags=$3

    echo "Installing $package ..."
    yes | "$PkgMgr" install "$package" &>/dev/null
    if command -v "$executable" &>/dev/null; then
        echo "Ok => The package $package has been installed"
    else
        echo "Err => The package $package hasn't been installed"
        ERRORS=$((ERRORS + 1))
    fi
    printf "\n"
}

#######################################
## Specific setups ####################

function FishSetup() {
    #chsh -s /usr/bin/fish
    if [ ! -f $HOME/config.fish ]; then
        echo 'set fish_greeting
set -xg EDITOR nvim
set -gx PAGER less
fish_vi_key_bindings
set PATH $PATH $HOME/.local/bin
set PATH $PATH /usr/local/go/bin
alias bat="bat --style=plain"
alias tress="tree|less"
alias cls="clear && ls
alias ls=exa"
zoxide init fish | source' > $HOME/.config/fish/config.fish
        ln -s $HOME/.config/fish/config.fish $HOME/config.fish
        #curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
        #omf install cbjohnson
    fi
    if [ -d $SHARED/fish ]; then
        mkdir --parents -m777 $HOME/.config/fish/functions
        cp $SHARED/fish/*.fish $HOME/.config/fish/functions/
    fi
    echo "Fish is ready!"
}

function NeovimSetup() {
    if [ true ]; then #if [ ! -d $HOME/.config/nvim ]; then
        #mkdir --parents -m777 $HOME/.config/nvim/autoload/plugged
        #InstallProcess nodejs node
        #InstallProcess npm
        #npm install -g n; n stable; npm install -g yarn
        #curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs \
        #    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        if [ true ]; then #if [ -d $SHARED/nvim ]; then
            cp /$SHARED/nvim/{coc-settings.json,init.vim,plugins.vim} \
                $HOME/.config/nvim/
			chmod 777 -R $HOME/.config/nvim
            nvim +PlugInstall +qall
            nvim +'CocInstall -sync coc-json' +qall
            nvim +'CocInstall -sync coc-tabnine' +qall
            cd $HOME/.config/nvim
            ln -s ./autoload/plugged/neoformat/autoload/neoformat/formatters/ ./
            npm i -g bash-language-server
    	else
	    echo "/$SHARED"/nvim does not exist
	fi
    fi
    echo "NeoVim is ready!"
}

function GithubSetup() {
    if [ "$PkgMgr" == "dnf" ]; then
        dnf config-manager --add-repo \
            https://cli.github.com/packages/rpm/gh-cli.repo
        yes | dnf install -y gh
    fi
    echo "Github is ready!"
}

function ClangSetup() {
	declare -a PkgList=("clang" "clang-analyzer"
		"clang-tools-extra" "valgrind" "nasm")
    for package in ${PkgList[@]}; do
        InstallLibrary $package
    done
	npm install clang-format

}

function PythonSetup() {
    pip3 install pynvim --upgrade
    pip3 install ipython
    nvim +'CocInstall -sync coc-pyright' +qall
    echo "Python is ready!"
}

#######################################
## Main program #######################

# Check if root
if [ "$(id -u)" != 0 ]; then
    echo "┌-------------------------------------------┐"
    echo "| You must be root user to run this program |"
    echo "└-------------------------------------------┘"
    CountLines
    exit 1
fi

SelectPkgMgr
if [ -n "$PkgMgr" ]; then
    FishSetup
    NeovimSetup
    GithubSetup
    chmod --recursive 777 $HOME
    chown -R vagrant $HOME
else
    exit 1
fi

if [ "$ERRORS" -eq 0 ]; then
    printf "\nThe setup is complete!\n"
else
    printf "\nSome packages hasn't been installed.\n"
    echo "=> $ERRORS errors were found"
fi

## End of program #####################
#######################################
