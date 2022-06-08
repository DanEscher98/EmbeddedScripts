#!/usr/bin/bash

function in_path() {
	cmd=$1
	ourpath=$2
	result=1
	oldIFS=$IFS
	IFS=":"

	for directory in "$ourpath"; do
		printf "$directory/$cmd\n"
		if [ -x "$directory/$cmd" ]; then
			result=0
		fi
	done

	IFS=$oldIFS
	return $result
}

function checkForCMDinPath() {
	var=$1

	if [ "$var" != "" ]; then
		if [ "${var:0:1}" = "/" ]; then
			if [ ! -x $var ]; then
				return 1
			fi
		elif ! in_path $var "$PATH"; then
			return 2
		fi
	fi
}

if [ $# -ne 1 ]; then
	echo "Usage: $0 <command>" >&2
	exit 1
fi

checkForCMDinPath "$1"
case $? in
	0 ) echo "$1 found in PATH"					;;
	1 ) echo "$1 not found or not executable"	;;
	2 ) echo "$1 not found in PATH"				;;
esac
exit 0
