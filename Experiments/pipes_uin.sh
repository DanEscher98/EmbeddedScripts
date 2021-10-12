#!/usr/bin/bash

while getopts i:d: flag; do
	case "${flag}" in
		i) INFILE=${OPTARG} ;;
		d) OUTDIR=${OPTARG} ;;
		*) echo "Invalid option: -$flag" ;;
	esac
done

if [[ -d "$OUTDIR" ]]; then
	echo "Directory $OUTDIR exists"
else
	echo "Directory $OUTDIR will be created"
	mkdir $OUTDIR
fi
