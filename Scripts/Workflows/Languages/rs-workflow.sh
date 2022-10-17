#!/usr/bin/bash

# Install rust
curl https://sh.rustup.rs -sSf | sh

project="name"
cargo new $project
cargo build
cargo run

# Useful examples and tips
curl -L https://git.io/install-rustlings | bash
rustup component add clippy
rustup component add rustfmt
cargo install cargo-audit # cargo audit
cargo install cargo-tarpaulin # cargo tarpaulin --ignore-tests
rustup toolchain install nightly --allow-downgrade
cargo install cargo-expand # cargo +nightly expand 

cargo install cargo-watch
cargo watch -x check -x test -x run

# .cargo/config.toml
# On Linux:
# - Ubuntu, `sudo apt-get install lld clang`
# - Arch, `sudo pacman -S lld clang`
[target.x86_64-unknown-linux-gnu]
rustflags = ["-C", "linker=clang", "-C", "link-arg=-fuse-ld=lld"]

# [dependencies]
# my_library = { path="~/full/path" }


