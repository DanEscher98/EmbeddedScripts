#!/usr/bin/bash

dnf install clang clang-extra-tools clang-analyzer bear
dnf install llvm lld vim-syntastic-llvm

cargo install asm-lsp
sudo dnf install vim-syntastic-nasm nasm

# Emit llvm and graphviz
filename="main"
funcname="collatz"
humanread_flg="-Xclang -disable-O0-optnone -fno-discard-value-names -Xclang -disable-llvm-passes"

clang -S -emit-llvm $humanread_flg -o $filename.ll $filename.c
opt -dot-cfg -disable-output -enable-new-pm=0 $filename.ll
dot -Tsvg -Nfontname="DejaVu Sans Mono" -o $funcname.svg .$funcname.dot
geeqie $funcname.svg


