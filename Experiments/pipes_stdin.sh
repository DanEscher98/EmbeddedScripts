#!/usr/bin/bash

#read -p "Y/[N]: " reply
#reply=${reply:-N}}
#echo $reply

# Checks if is a pipe
if [[ -p /dev/stdin ]]; then
	# If there is no stdin, cat will wait forever
	PIPE=$(cat -)
fi

n=0
for i in $PIPE; do
	echo $n')' $i
	n=$(( $n + 1 ))
done
