#!/usr/bin/bash

project="name"
cargo new $project
cargo build
cargo run

# [dependencies]
# my_library = { path="~/full/path" }
