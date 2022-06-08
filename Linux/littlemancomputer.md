# The Little Man Computer

## The Algorithm

1. Read the number displayed in the Counter (it starts at 0)
2. Go to the mailbox with that same number, look and remember the
number that appears on a slip of paper in  that mailbox.
3. Push a button to increment the Counter
4. Perform the instruction designated by the number on the slip of paper.
5. Go back to step 1 or halt

## The OpCodes

| Numeric | Mnemonic |
| :-----: | :------- |
| 000     | STOP     |
| 1xx     | ADD xx   |
| 2xx     | SUB xx   |
| 3xx     | SET xx   |
| 5xx     | LOAD xx  |
| 6xx     | JUMP xx  |
| 7xx     | ZERO xx  |
| 8xx     | NEG xx   |
| 901     | READ     |
| 902     | PRINT    |

- `000`: Stops the Computer
- `1xx`: Adds the contents of the mailbox xx to the accumulator value
- `2xx`: Subtracts the contents of the mailbox xx from the accumulator value
- `3xx`: Stores the accumulator value into the mailbox xx
- `5xx`: Replace the accumulator value with the contents of the mailbox xx
- `6xx`: Sets the counter to the number xx
- `7xx`: If the accumulator value is zero, sets the counter to the number xx
- `8xx`: If the accumulator value is greater or equals to 0, then set the
    counter to the number xx
- `901`: Read a number from the inbox and write it into the accumulator
- `902`: Copy the number in the accumulator onto a slip of paper and place
    it into the outbox

## Examples

### Countdown

```asm
0 901   read
1 902   print
2 308   set 8
3 207   sub 7
4 308   set 8
5 801   neg 1
6 000   stop
7 001
8 000   stop
```

## References

- (Richard LMC)[https://richard-ramos.github.io/lmc]
- (jb3/cpu_emulator)[https://github.com/jb3/cpu_emulator]
