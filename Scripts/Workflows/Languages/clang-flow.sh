#!/usr/bin/bash

dnf install clang clang-extra-tools clang-analyzer bear
dnf install llvm lld vim-syntastic-llvm

cargo install asm-lsp
sudo dnf install vim-syntastic-nasm nasm
