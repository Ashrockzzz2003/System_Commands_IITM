#!/bin/bash


file_permission=$(ls -l | grep $1 | cut -d " " -f1)

if [[ $file_permission =~ "-r--------" ]]; then
	echo "Yes"
fi
