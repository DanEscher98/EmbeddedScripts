#!/usr/bin/bash

echo "LunarVim setup for $USER"

mkdir --parents lua

starters=("rust-ide" "c-ide" "go-ide" "latex-ide" "php-ide" "python-ide" "js-ts-ide" "vue-ide")
for config in ${starters[@]}; do
  if [ ! -f lua/"$config".lua ]; then
    echo "Downloading $config ..."
    curl -sS "https://raw.githubusercontent.com/LunarVim/starter.lvim/$config/config.lua" > lua/"$config".lua
    printf "-- require(\"$config\")" >> config.lua
  fi
done

# TreeSitter parsers
ts_lowlevel=( c cmake cpp make )
ts_webdev=( css html php json solidity )
ts_scriptm=( bash fish lua latex markdown )
ts_langs=( go haskell julia rust python scheme racket )
ts_parsers=( "${ts_lowlevel[@]}" "${ts_webdev[@]}" "${ts_scriptm[@]}" "${ts_langs[@]}" )
for parser in ${ts_parsers[@]}; do
  echo "$parser"
done
