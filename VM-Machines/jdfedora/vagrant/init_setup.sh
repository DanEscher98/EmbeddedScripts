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
SHARED="/vagrant"
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

#######################################
## Count how many lines writed ########
function CountLines() {
    for i in $(find . -type f -not -path "./target" |
        grep -v -E ".out|.pdf"); do
        wc -l "$i"
    done | sort -n -r | tee /dev/tty |
        awk '{ print $2 }' |
        xargs cat | wc -l |
        xargs -I % echo "Total lines: " %
}

########################################
## Installation proccess ###############
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

########################################
## Installation proccess ###############
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
## Handles interactive installation ###
function OptionalInstall() {
    local package=$1
    local executable=$2
    local flags=$3
    echo "Do you want to install $package?"
    read -p -r "$* [y/n]: " yn
    case $yn in
    [Yy]*)
        echo "Ok, this may take a little bit ..."
        InstallProcess "$package" "$executable" "$flags"
        ;;
    [Nn]*) printf "Aborted\n\n" ;;
    esac
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
    mkdir -m777 $HOME/{Working,Packages}
    if [ ! -d $HOME/.config ]; then
        mkdir -m777 $HOME/.config
    fi
    declare -a PkgList=("git" "xz" "make"
        "gcc" "perl" "fish" "neovim,nvim" "neofetch"
        "python3" "python3-pip,pip3" "zoxide" "tree"
        "trash-cli,trash" "exa" "htop")
    for package in ${PkgList[@]}; do
        fst=$(echo $package | tr -d "[:blank:]" | awk -F, '{ print $1 }')
        snd=$(echo $package | tr -d "[:blank:]" | awk -F, '{ print $2 }')
        InstallProcess $fst $snd
    done

    declare -a LibList=("util-linux-user"
        "gmp" "gmp-devel" "ncurses" "ncurses-compat-libs")
    for library in ${LibList[@]}; do
        InstallLibrary $library
    done
else
    exit 1
fi

if [ "$ERRORS" -eq 0 ]; then
    printf "\nEverything ready!\n"
else
    printf "\nSome packages hasn't been installed.\n"
    echo "=> $ERRORS errors were found"
fi

## End of program #####################
#######################################
