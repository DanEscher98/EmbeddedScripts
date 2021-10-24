---
author: Daniel Sánchez
title: Bash Techniques
toc: true
toc-title: Table of contents
date: 2021 Octubre 12
---

## Read from stdin

Process the stdin in the moment

```bash
while read LINE; do
    echo $LINE
done < /dev/stdin
```

Stores the stdin in a variable

```bash
# Checks if there is stdin
if [[ -p /dev/stdin ]]; then
# If there is no stdin, cat will wait forever
    PIPE=$(cat -)
fi
```

POSIX compilant

```bash
FILE=${1--}
while IFS= read -r line; do
    printf '%s\n' "$line"
done < <(cat -- "$file")
```

To read a file

```bash
if [[ $# -ge 1 && -f "$1" ]]; then
    input="$1"
    echo "Normal input"
else
    input="-"
    echo "Pipe input"
fi

cat $input | while read x; do
    echo "$x"
done
```

Variable slicing

```bash
# ${variable_name:start:size}
${var:0:1}
${var%${var#?}} 
# The # is a call to delete the first instance of a given pattern
# The ? is a regular expression that matches exactly one character
# The call ${var%pattern} produces a substring with everything left
# over once the specified pattern is removed from var .
$(echo $var | cut -c1)
```
