#!/usr/bin/bash

function format_h() {
	tr '@' '\n' <<< $1 | tr -dC '[:print:]\t\n' \
		| sed '/^0/d' | awk '{print $2}' | sort \
		| uniq --count | sort --sort=numeric --key=1
}

hsys=""
hloc=""

for file in $(find ./ -type f | grep -E "*.c|*.h"); do
	while read line; do
		if [[ "$line" == "#include <"* ]]; then
			hsys+="$line@"
		elif [[ "$line" == "#include \""* ]]; then
			hloc+="$line@"
		fi
	done <$file
done

format_h "$hloc"
format_h "$hsys"
