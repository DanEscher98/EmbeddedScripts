#!/usr/bin/bash 

for i in $(ls | grep ".sh" | awk -F. '{print $1}'); do
	if [ ! -f $i ]; then
		ln -s $PWD/$i.sh $PWD/$i
	fi
done