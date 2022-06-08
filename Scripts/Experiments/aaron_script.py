#!/usr/bin/python
"""
Created on Tue Feb  1 16:00:24 2022

@author: Aaron Escoboza
@version: 1.0
"""
import sys

#
sw_version = 1.0
mcu_family = "TC21x/TC22x/TC23x"

#
num_taps = 8


def print_menu_info():
    print_n_t(1, num_taps)
    print("[1] Program version")
    print_n_t(0, num_taps)
    print("[2] Microcontroller family")
    print_n_t(0, num_taps)
    print("[0] Exit")


def menu_info():
    print_header("Welcome to program and microcontroller information")
    print_menu_info()
    option = int(input("\n*Enter your option: "))
    while option != 0:
        print_header("Welcome to program and microcontroller information")
        if option == 1:
            print_n_t(1, num_taps)
            print("Program version: {}".format(sw_version))
        elif option == 2:
            print_n_t(1, num_taps)
            print("Microcontroller family: {}".format(mcu_family))
        else:
            print_n_t(1, num_taps)
            print("Invalid option")
        print_menu_info()
        option = int(input("Enter your option: "))


def menu_cal_baudrate():
    dic_regs = {
        "fA": 0,
        "PRESCALER": 0,
        "NUMERATOR": 0,
        "DENOMINATOR": 0,
        "OVERSAMPLING": 0,
    }

    for i in dic_regs:
        dic_regs[i] = int(input("\t\t\t\t\t\t\t\tEnter {}: ".format(i)))
    baud_rate = (dic_regs["fA"] * dic_regs["NUMERATOR"]) / (
        (dic_regs["PRESCALER"] + 1)
        * dic_regs["DENOMINATOR"]
        * (dic_regs["OVERSAMPLING"] + 1)
    )
    print_n_t(0, num_taps)
    print("Baudrate: {}".format(baud_rate))


def print_star(length):
    sys.stdout.write("\n")
    for i in range(0, length, 1):
        sys.stdout.write("*")
    sys.stdout.write("\n")


def print_n_t(length_n, length_t):
    for i in range(0, length_n, 1):
        sys.stdout.write("\n")

    for i in range(0, length_t, 1):
        sys.stdout.write("\t")


def print_header(text):
    print_star(120)
    print("\n\t\t" + text)
    print_star(120)


def print_menu_main():
    print_header(
        "Welcome to UART baudrate calculator version: {} for the microcontroller family: {}".format(
            sw_version, mcu_family
        )
    )
    print_n_t(1, num_taps)
    print("[1] Calculate UART baudrate")
    print_n_t(0, num_taps)
    print("[2] Program and microcontroller information")
    print_n_t(0, num_taps)
    print("[0] Exit the program")


def menu_main():
    print_menu_main()
    option = int(input("*Enter your option: "))

    while option != 0:
        if option == 1:
            menu_cal_baudrate()
        elif option == 2:
            menu_info()
        else:
            print_n_t(1, num_taps)
            print("invalid option")
        print_n_t(1, 0)
        print_menu_main()
        option = int(input("\n*Enter your option: "))


menu_main()

print_n_t(1, 0)
print_star(120)
print_n_t(1, num_taps)
print("Thanks for using the UART baudrate calculator program!.")
print_star(120)
