#!/usr/bin/bash


repo="JuliaLang/julia"
release_url="https://api.github.com/repos/$repo/releases/latest"
version=$(echo $release_url | jq.[0].tag_name)
file="julia-$version.tar.gz"

cd $HOME/Packages
wget -qO - $release_url \
	| jq .assets[2].browser_download_url \
	| xargs wget -O $file

tar -xvf $file
