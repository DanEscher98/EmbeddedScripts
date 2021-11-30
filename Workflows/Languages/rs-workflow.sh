#!/usr/bin/bash

project="name"
cargo new $project
cargo build
cargo run

# Useful examples and tips
curl -L https://git.io/install-rustlings | bash
rustup component add clippy
rustup component add rustfmt

# [dependencies]
# my_library = { path="~/full/path" }
