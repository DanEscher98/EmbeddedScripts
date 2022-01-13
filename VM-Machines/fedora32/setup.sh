#!/usr/bin/bash
#####################################################
#			Setup compiler environment				#
# This is a simple program to perform updates on a	#
# Linux computer. It installs:						#
# - The 'clang' compiler							#
# - The 'make' tool									#
# - Optional: The Haskell interpreter 'ghci'		#
# - Optional: The general markup converter 'pandoc'	#
#####################################################

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
function InstallProcess() {
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
#GREEN='\033[0;32m'
#NC='\033[0m' # No Color
ERRORS=0

# Check for root
if [ "$(id -u)" != 0 ]; then
    echo "┌-------------------------------------------┐"
    echo "| You must be root user to run this program |"
    echo "└-------------------------------------------┘"
    CountLines
    exit 1
fi

SelectPkgMgr
if [ -n "$PkgMgr" ]; then
    declare -a PkgList=("git" "make" "gcc")
    for package in ${PkgList[@]}; do
        fst=$(echo $package | tr -d "[:blank:]" | awk -F, '{ print $1 }')
        snd=$(echo $package | tr -d "[:blank:]" | awk -F, '{ print $2 }')
        InstallProcess $fst $snd
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
