#!/usr/bin/bash

# To get a function mir call-graph in a Rust project

function="$1"
dot_file=$(ls mir_dump/*.runtime-optimized.after.dot | grep -m1 "$function" | sed 's|.*/\(.*\)\..*|\1|')
dot -Tsvg -Nfontname="DejaVu Sans Mono" "mir_dump/$dot_file.dot" -o "target/mir_svg/$dot_file.svg"
echo "Success"

