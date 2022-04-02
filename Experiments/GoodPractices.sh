#!/usr/bin/bash
# Based on: https://betterprogramming.pub/best-practices-for-bash-scripts-17229889774d

# Ensures the script exists as sonn as it
# encounters any nonzero exit code, usage
# of undefined variables, failed piped commands
set -o errexit
set -o nounset
set -o pipefail

function Exit(){
	exit 0
}

RANDIR="$(tr -dc 'a-zA-Z0-9' < /dev/urandom \
	| fold -w 16 | head -n 1)"

echo "$RANDIR"

#filepath="/usr/bin/ls"
#args="-l"

#time source "$filepath" "${args}" >> /tmp/report.log 2>&1 
trap Exit 0 SIGHUP SIGINT SIGQUIT SIGABRT SIGTERM
