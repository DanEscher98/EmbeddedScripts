#!/usr/bin/bash

# dependencies
sudo dnf install openssl openssl-devel perl

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
cargo install cargo-crev
cargo install cargo-geiger
cargo install cargo-expand # cargo +nightly expand 
cargo rustc --bin=$PROJECT -- --emit=llvm-ir,asm
cargo watch -x "+nightly expand --bin=$PROJECT"
cargo bloat

cargo install cargo-watch
cargo watch -x check -x test -x run

# Run unit tests
cargo test --package $PROJECT --lib "mod"
# Run a single binary
cargo run --bin "binary"

# .cargo/config.toml
# On Linux:
# - Ubuntu, `sudo apt-get install lld clang`
# - Arch, `sudo pacman -S lld clang`
[target.x86_64-unknown-linux-gnu]
rustflags = ["-C", "linker=clang", "-C", "link-arg=-fuse-ld=lld"]

# [dependencies]
# my_library = { path="~/full/path" }

## CREATING NEW PROJECT
cargo new $project

# cat Cargo.toml
# [package]
# name = "$project"
# version = "0.1.0"
# edition = "2021"
# authors = ["Danyiel Colin <amaniel2718@protonmail.com>"]
# 
# [lib]
# path = "src/lib.rs"
# 
# [[bin]]
# path = "src/main.rs"
# name = "$project"

# run wasmi
rustup target add wasm32-unknown-unknown
cargo install wasmi_cli
cargo build --target wasm32-unknown-unknown --release
wasmi_cli target/wasm32-unknown-unknown/release/dummy.wasm --invoke func 1

# run wasmtime
rustup target add wasm32-wasi
curl https://wasmtime.dev/install.sh -sSf | bash
cargo build --target wasm32-wasi --release
wasmtime target/wasm32-wasi/release/dummy.wasm

# read wat
wasm2wat target/wasm32-*/debug/dummy.wasm | bat --language rust
