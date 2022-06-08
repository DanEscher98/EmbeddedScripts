# Automate Embedded Development Setup

## Introduction

This script has the purpose of automating the work area for the
embedded systems area. It eliminates the process of installing tools
one by one, configures an `Ubuntu` virtual machine and installs tools
inside the virtual machine as well. In order to automate the
environment setup, installation of required tools and the compilation
process, a `bash` and a `PowerShell` scripts are provided.

## Specifications

The script will perform the following steps:

1. On the Windows Host:
    - Download and install `winget`, the Windows package manager
    - Using `winget` it will install:
        - Microsoft `PowerShell` 7
        - Microsoft `Windows Terminal`
        - Oracle `VirtualBox`
        - Hashicorp `Vagrant`
        - Axosoft `GitKraken`
        - `git` and `gsudo`
    - Add global variables to the `$PROFILE` of `$PowerShell`
2. Inside the Virtual Machine:
    - Install: git, make, gcc, neovim, python3, pip3
    - Install: valgrind, nasm, clang
    - Set a default configuration for neovim
    - Configure `gh` the cli-tool of Github.

## Instructions

1. Download the ZIP from the repository
2. Extract the contents
3. Execute the script `Win-Setup.ps1` with `PowerShell`
4. The file `Microsoft.Desktop.AppInstaller.msixbundle` should be
   downloaded and asked for permission to install
5. Back into `PowerShell` it should ask for confirmation. Press `Y`.
   This step will take 10 to 15 minutes to complete.
6. There should be a new application on your Windows: `Windows
   Terminal`.
7. In the new terminal, write `$Get-Content $PROFILE`. It shouldn't be
   empty.
8. Write `VBoxManage --version`, if this command executes
   successfully, then all is alright.
9. From the command line, go to the directory from the step `2)`. Go
   inside the subdirectory `jdubuntu`.
10. Right there, write `vagrant up`. The virtual machine will began to
    be installed and configured.
11. When the last step is complete, write `vagrant ssh` to enter to
    the virtual machine.
12. Inside the `Linux VM` write the following commands:
    ```bash
    cd /vagrant # This is a shared directory with your host machine
    chmod u+x post_setup.sh # Change to executable mode
    sudo ./post_setup.sh # To install the remaining packages
    #svn export https://github.com/DanEscher98/ClasesMaterial/trunk/Setups/jdubuntu
    ```
