#!/bin/bash

read n

if [[ $n =~ ^-?[0-9]+\.?[0-9]*$ ]]; then
	if (( $(echo "$n >= 0" | bc -l) )); then
		echo "PNUM"
	else
		echo "NNUM"
	fi
elif [[ $n =~ ^-?+\.?[0-9]*$ ]]; then
	if (( $(echo "$n >= 0" | bc -l) )); then
		echo "PNUM"
	else
		echo "NNUM"
	fi
else
	echo "STRING"
fi
