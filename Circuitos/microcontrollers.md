---
author: Daniel Sanchez
date: 2021 October 3
---

# Types of micro-controllers

A *micro-controller* is a single Integrated Circuit (IC) is
comparable to a little stand alone computer and it is
designed to perform the specific tasks of embedded systems.

## PIC (Peripheral Interface Controller)

1975 Microchip Technology
low power consumption
very good support
Popular PIC16F88x, PIC18Fxx8, PIC18F4525, PIC32Mxx
Is vendor-specific

## 8051 micro-controller

1981 Intel
Popular AT89C51, P89v51
average power consumption
Energy Management, touch screens, automobiles, medical
devices

## MSP430

Very good for C
14 February 1992 Texas Instruments Von-Neumann architecture
Vast community support
Ultra low consumption
Popular MSP430G2553, MSP430 Launchpad
The MSP430FRxx line has FRAM

## AVR (Advanced Virtual RISC)

1996 RISC (Reduced Instruction Set Computer)
Popular Atmega8, 16, 32, Arduino
Is vendor-specific

## ARM Cortex-M (Advanced RISC Machine)

vast support
ARM Holdings
Popular LPC2148, ARM Cortex-M0-7, STM32
power low cheap
Because of their reduced instruction set, they need fewer
transistors, which enable a smaller die size of the IC.

|               | PIC     | 8051    | MSP340  | AVR     | ARM     |
| :---          | ---     | ---     | ---     | ---     | ---     |
| bus width     | 8/16/32 | 8       | 16      | 8/32    | 32/64   |
| CPI           | 4       | 12      | 6       | 1       | 1       |
| ISA           | RISC    | CLSC    |         | RISC    | RISC    |
| architecture  | Harvard | Neumann | Neumann | Harvard | Harvard |

## Supported Protocols

|         | PIC   | 8051  | MSP340| AVR   | ARM   |
| :---    | :---: | :---: | :---: | :---: | :---: |
| CAN     | ·     |       |       |       | ·     |
| DSP     |       |       |       |       | ·     |
| Ethernet| ·     |       |       |       | ·     |
| I2C     | ·     | ·     | ·     | ·     | ·     |
| LIN     | ·     |       | ·     |       | ·     |
| PIC     | ·     |       | ·     |       |       |
| SAI     |       |       |       |       | ·     |
| SPI     | ·     | ·     | ·     | ·     | ·     |
| UART    | ·     | ·     | ·     | ·     | ·     |
| USART   | ·     | ·     | ·     | ·     | ·     |

## Memory used

|        | PIC   | 8051  | MSP340| AVR   | ARM   |
| :---   | :---: | :---: | :---: | :---: | :---: |
| EEPROM |       |       | ·     | ·     | ·     |
| Flash  | ·     | ·     | ·     | ·     | ·     |
| ROM    |       | ·     |       |       |       |
| SDRAM  |       |       | ·     |       | ·     |
| SRAM   | ·     | ·     |       | ·     |       |
