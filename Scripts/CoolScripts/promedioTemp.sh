#!/usr/bin/bash

temps=$(sensors -u | grep -E 'temp.*input' | awk -F: '{ print $2 }' | xargs)
values=$(echo $temps | tr ' ' '+')
num=$(echo $temps | wc --words)

bc <<< "($values)/$num" | xargs -I % echo "$(hostname) has % °C on average."
