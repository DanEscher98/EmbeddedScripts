#!/usr/bin/bash

nvim +PlugInstall +qall
nvim +'CocInstall -sync coc-json' +qall
nvim +'CocInstall -sync coc-tabnine' +qall
nvim +'CocInstall -sync coc-rust-analyzer' +qall
nvim +'CocInstall -sync coc-rls' +qall
nvim +'CocInstall -sync coc-json' +qall
nvim +'CocInstall -sync coc-clangd' +qall
