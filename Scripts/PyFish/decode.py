#!/usr/bin/python3

import argparse
from argparse import Namespace


def args_namespace() -> Namespace:
    parser = argparse.ArgumentParser(
        prog="encoding",
        usage="%(prog)s [options] FILE",
        description="Encode or Decode with a numeric base",
    )
    parser.add_argument("FILE", type=str, help="File to encode or decode")
    parser.add_argument(
        "-a",
        "--action",
        type=str,
        default="encode",
        choices=["encode", "decode"],
        help="select the action to perform",
    )
    parser.add_argument(
        "-b",
        "--base",
        type=int,
        default=16,
        choices=[2, 8, 10, 16],
        help="select the numeric base to encode",
    )
    parser.add_argument(
        "-w",
        "--wpl",
        type=int,
        default=6,
        help="set the number of words per line in output",
    )
    parser.add_argument(
        "-o",
        "--output",
        type=str,
        default="/dev/stdout",
        help="set the file to write the output",
    )
    return parser.parse_args()


def decode_bin(filename, base: int) -> str:
    letters = []
    with open(filename, "r") as file:
        for line in file.readlines():
            try:
                chrs_line = map(lambda b: chr(int(b, base)), line.split())
                letters.extend(list(chrs_line))
            except ValueError:
                break
    return "".join(letters)


def encode_bin(message, filename, wpl, fmt):
    message = list(message.replace("\n", " "))
    match fmt:
        case 2:
            frmt_num = lambda n: f"{n:08b}"
        case 16:
            frmt_num = lambda n: f"{n:02x}"
        case _:
            frmt_num = lambda n: f"{n:03d}"

    space_code = frmt_num(ord(" "))
    with open(filename, "w") as file:
        while message:
            line = []
            for i in range(wpl):
                try:
                    line.append(frmt_num(ord(message.pop(0))))
                except IndexError:
                    line.extend([space_code] * (wpl - i))
                    break
            file.write(" ".join(line) + "\n")


if __name__ == "__main__":
    global args
    args: Namespace = args_namespace()
    if not args.wpl > 0:
        raise ValueError("wpl must be greater than 0")
    if args.action == "decode":
        msg = decode_bin(args.FILE, args.base)
        with open(args.output, "w") as ofile:
            ofile.write(msg.replace(". ", ".\n").strip() + "\n")
    else:
        with open(args.FILE, "r") as file:
            encode_bin(file.read(), args.output, args.wpl, args.base)
