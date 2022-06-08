#!/usr/bin/bash

array=(4 3 2 5 1)
arrayLen=${#array[@]}

for ((j=0; j<$arrayLen-1; j++))
do
    for ((i=0; i<$arrayLen-$j-1; i++))
	do
        if [ "${array[$i]}" -gt "${array[$i+1]}" ]
		then
            temp=${array[$i]}
            array[$i]=${array[$i+1]}
            array[$i+1]=$temp
        fi
        echo {array[@]}
    done
    echo '---------------------'
done
