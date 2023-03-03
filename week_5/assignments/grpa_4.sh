#!/bin/bash

n=$1

if (( $n >= 2 )); then
	for (( i=2; i*i<=$n; i++ )); do
		if (( $n % $i == 0 )); then
			echo "No"
			exit 0
		fi
	done
	echo "Yes"
else
	echo "No"
fi
