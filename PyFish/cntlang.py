#!/usr/bin/python3
import os
import re
import sys

ext2name = {
    "sh": "Bash/Fish",
    "fish": "Bash/Fish",
    "c": "C99/C++",
    "cpp": "C99/C++",
    "html": "HTML/CSS",
    "css": "HTML/CSS",
    "js": "Type/JavaScript",
    "ts": "Type/JavaScript",
    "asm": "Assembly",
    "nasm": "Assembly",
    "scm": "Scheme/Racket",
    "rkt": "Scheme/Racket",
    "hs": "Haskell",
    "jl": "Julia",
    "go": "Golang",
    "lua": "Lua",
    "py": "Python",
    "rs": "Rust",
    "r": "RLang",
}

igndir = {
    "bin",
    "build",
    "config",
    "env",
    "deps",
    "dev",
    "node_modules",
    "public",
    "target",
    "venv",
    "setupTypeScript",
    "python-packages",
    "py-support",
}

# Recurse through all files
# Discard trash dirs
# Classify by extension
# Gracefully display (date, ext, f_num)


def recurse_files(root):
    for subdir, _, files in os.walk(root):
        split_path = set(os.path.normpath(subdir).split(os.sep))
        if split_path & igndir:
            for file in files:
                ext = os.path.splitext(file)[1].lstrip(".")
                if lang := ext2name.get(ext):
                    print(lang, os.path.join(subdir, file))

recurse_files(os.getcwd())
