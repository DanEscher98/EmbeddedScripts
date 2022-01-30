#!/usr/bin/bash


repo="JuliaLang/julia"
release_url="https://api.github.com/repos/$repo/releases"
version=$(echo $release_url | jq.[0].tag_name)
file="julia-$version.tar.gz"
download_url="https://github.com/$repo/releases/download/v$version/$file"
