#!/usr/bin/bash

# Haskell Language server
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
echo "set -gx PATH $PATH /home/dany98/.ghcup/bin/" >> ~/.fishrc
echo "set -gx PATH $PATH /home/dany98/.cabal/bin/" >> ~/.fishrc
ghcup install hls
ghcup upgrade 
# Plug 'hasufell/ghcup.vim'
# Plug 'rbgrouleff/bclose.vim'
# nnoremap <Leader>g :GHCup<CR>

# First time
stack install hpack-convert
echo "alias hpack=./~/.local/bin/hpack-convert" >> ~/.fishrc

# Initialization
project="name"
stack new $project
cd $project/
stack setup
stack build
stack exec $project-exec
stack test
