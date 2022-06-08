#!/usr/bin/bash

# iVV Z52mQF6q4jNSB L321jK0f1JH33
# iVV Bf2Qhm3PqM7nR L321jK0f1JH33
# cntlang.py
file_url="https://raw.githubusercontent.com/DanEscher98/Scripts/main/PyFish/cntlang.py?_sm_au_=iVVBf2Qhm3PqM7nRL321jK0f1JH33"
out_dir="$HOME/.local/bin"
out_file="cntlang"

mkdir --parents $out_dir
wget -qcL --output-document="$out_dir/$out_file" $file_url
chmod +x "$out_dir/$out_file"
