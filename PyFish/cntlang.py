#!/usr/bin/python3.10
import os
import sys
from enum import Enum
from math import pow
from pathlib import Path
from typing import Dict, Iterator, Tuple, TypeVar, Union

StrPath = TypeVar("StrPath", str, Path)
args = None


class UnitSize(Enum):
    # class to store the various units
    BYTES = 1
    KB = 2
    MB = 3
    GB = 4


def human_readable(byte_sz: int) -> str:
    return str(byte_sz) + "a"


def unit_convertor(byte_sz: int, unit: UnitSize):
    match unit:
        case UnitSize.KB:
            return byte_sz / 1024
        case UnitSize.MB:
            return byte_sz / pow(1024, 2)
        case UnitSize.GB:
            return byte_sz / pow(1024, 3)
        case _:
            print("Warning")
            return byte_sz


ext2name = {
    "sh": "Bash/Fish",
    "fish": "Bash/Fish",
    "c": "C99/C++",
    "cpp": "C99/C++",
    "html": "HTML/CSS",
    "css": "HTML/CSS",
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

# Gracefully display (date, ext, f_num)


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
    for subdir, _, files in os.walk(pwdir):
        split_path = set(os.path.normpath(subdir).split(os.sep))
        if split_path.intersection(igndir):
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
    try:
        import numpy as np
        import pandas as pd

        columns = ["Lines", "Files", "Size"]
        data_m = np.zeros((len(file_data), 3)).astype(np.int32)
        index = []
        total_l, total_f, total_s = 0, 0, 0
        for i, (lang, (lines, files, size)) in enumerate(file_data.items()):
            total_l += lines
            total_f += files
            total_s += size
            data_m[i] = [lines, files, size]
            index.append(lang)
        # Format, Sort and Human readable
        col, asc = "Lines", False
        data_f = pd.DataFrame(data_m, index=index, columns=columns)
        data_f = data_f.sort_values(by=col, ascending=asc)
        data_f["Size"] = data_f["Size"].transform(human_readable)
        total_s = human_readable(total_s)
        # Append Total Row
        total_row = pd.DataFrame(
            [[total_l, total_f, total_s]], index=["Total"], columns=data_f.columns
        )
        data_f = pd.concat([data_f, total_row])
        print(data_f)
    except ImportError:
        pass


if __name__ == "__main__":
    file_data = classify_files(os.getcwd())
    format_output(file_data)
