#!/usr/bin/bash

## Variables ####
OUTDIR="/tmp"

function valid_dir() {
	OUTDIR=$1
	if [[ -d "$OUTDIR" ]]; then
		echo "Directory $OUTDIR exists"
	else
		echo "Directory $OUTDIR will be created"
		mkdir $OUTDIR
	fi
}

while getopts i:d: flag; do
	case "${flag}" in
		i) INFILE=${OPTARG} ;;
		d) valid_dir ${OPTARG} ;;
		*) echo "Invalid option: -$flag" ;;
	esac
done

echo $OUTDIR

read -s -p "Enter password: " pswd
echo "Your password is $pswd"
