#!/usr/bin/python3.10
import argparse
import os
import sys
from argparse import Namespace
from math import pow
from pathlib import Path
from typing import Dict, Iterator, Tuple, TypeVar, Union

StrPath = TypeVar("StrPath", str, Path)


class Colors:  # You may need to change color settings
    RED = "\033[31m"
    ENDC = "\033[m"
    GREEN = "\033[32m"
    YELLOW = "\033[33m"
    BLUE = "\033[34m"

    def colored(self, string, color):
        return f"{color}{string}{Colors.ENDC}"


ext2name = {
    "sh": "Bash/Fish",
    "fish": "Bash/Fish",
    "c": "C99/C++",
    "js": "JavaScript",
    "ts": "JavaScript",
    "asm": "Assembly",
    "nasm": "Assembly",
    "scm": "Scheme",
    "rkt": "Scheme",
    "hs": "Haskell",
    "jl": "Julia",
    "go": "Golang",
    "lua": "Lua",
    "py": "Python",
    "rs": "Rust",
    "r": "RLang",
    "sv": "Verilog",
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
    "python-packages",
    "py-support",
    "Experiments",
    ".ccls-cache",
    ".ipynb_checkpoints",
    ".hidden",
    ".cabal",
    ".stack-work",
    ".pyenv",
    ".local",
}

ignfile = {
    "setupTypeScript",
}


def args_namespace() -> Namespace:
    """
    - Sort by: lines, files, size (default lines)
    - humand readable: bool (default True)
    - only since date: date (default since ever)
    - only trash file: bool (default False)
    """
    parser = argparse.ArgumentParser(
        prog="cntlang",
        usage="%(prog)s [options] path",
        description="Count lines from source code files",
        epilog="Keep the good coding effort!",
    )
    parser.add_argument("Path", metavar="path", type=str, help="the path to list")
    parser.add_argument(
        "-H", "--human-readable", action="store_true", help="show size in KB, MB and GB"
    )
    parser.add_argument(
        "-s",
        "--sort-by",
        type=str,
        default="line",
        choices=["l", "f", "s"],
        help="sort by lines, files or size",
    )
    parser.add_argument(
        "-t", "--since-date", help="only show files modified since date"
    )
    parser.add_argument(
        "-i",
        "--inverse-order",
        action="store_false",
        help="set if normal or inverse order",
    )
    return parser.parse_args(sys.argv)


def human_readable(byte_sz: int) -> str:
    kb, mb, gb = 1024, pow(1024, 2), pow(1024, 3)
    if byte_sz > gb:
        size_hr = f"{(byte_sz / gb):.2f}G"
    elif byte_sz > mb:
        size_hr = f"{(byte_sz / mb):.2f}M"
    elif byte_sz > kb:
        size_hr = f"{(byte_sz / kb):.2f}K"
    else:
        size_hr = f"{byte_sz}B"
    return size_hr


def count_lines(filename: StrPath) -> Union[None, int]:
    lines = None
    with open(filename, "r") as file:
        try:
            lines = sum(1 for _ in file)
        except UnicodeDecodeError:
            sys.stderr.write(f"Can't read: {filename}\n")
    return lines


def recurse_files(pwdir: StrPath) -> Iterator[Tuple[str, str]]:
    """Recurse through the directory and yield only the
    files that are not in a config directory."""
    for subdir, _, files in os.walk(pwdir, followlinks=False):
        split_path_set = set(os.path.normpath(subdir).split(os.sep))
        if split_path_set.intersection(igndir):
            continue
        for file in files:
            if os.path.splitext(file)[0] in ignfile:
                continue
            ext = os.path.splitext(file)[1].lstrip(".")
            if lang := ext2name.get(ext):
                filename = os.path.join(subdir, file)
                yield (lang, filename)


def classify_files(pwdir: StrPath) -> Dict[str, Tuple]:
    file_data = {}
    for extype, file in recurse_files(pwdir):
        if not (ln := count_lines(file)):
            continue
        sz = os.path.getsize(file)
        if extype in file_data:
            (lines, files, size) = file_data[extype]
            file_data[extype] = (lines + ln, files + 1, size + sz)
        else:
            file_data[extype] = (ln, 1, sz)
    return file_data


def format_output(file_data: Dict[str, Tuple]):
    col = 2
    by_value = lambda item: item[1][col]
    colored = lambda string, color: f"{color}{string}{Colors.ENDC}"
    humanread = lambda num: human_readable(num) if args.human_readable else num
    total_l, total_f, total_s = 0, 0, 0

    lang, lines, files, size = map(
        lambda st: colored(st, Colors.GREEN), ["LANGUAGE", "LINES", "FILES", "SIZE"]
    )
    print(f"{lang:<15} {lines:>18} {files:>16} {size:>18}")
    for lang, (lines, files, size) in sorted(
        file_data.items(), key=by_value, reverse=args.inverse_order
    ):
        total_l += lines
        total_f += files
        total_s += size
        print(f"{lang:<10} {lines:8} {files:8} {humanread(size):>10}")
    total = colored("Total", Colors.RED)
    print(f"{total:<18} {total_l:8} {total_f:8} {humanread(total_s):>10}")


if __name__ == "__main__":
    global args
    args: Namespace = args_namespace()
    file_data = classify_files(os.getcwd())
    format_output(file_data)
