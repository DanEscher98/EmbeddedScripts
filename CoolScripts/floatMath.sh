#!/usr/bin/bash

float_scale=2

# Evaluate a floating point number expression
function float_eval(){
	local stat=0
	local result=0.0
	if [[ $# -gt 0 ]]; then
		result=$(echo "scale=$float_scale; $*" | bc -q 2> /dev/null)
		stat=$?
		if [[ $stat -eq 0 && -z $result ]]; then stat=1; fi
	fi
	echo $result
	return $stat 
}

# Evaluate a floating point conditional expression
function float_cond(){
	local cond=0
	if [[ $# -gt 0 ]]; then
		cond=$(echo "$*" | bc -q 2> /dev/null)
		if [[ $cond != 0 && $cond != 1 ]]; then cond=0; fi
	fi
	local stat=$((cond == 0))
	return $stat
}
