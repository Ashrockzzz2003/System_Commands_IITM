#!/bin/bash

max=$1
min=$1

for n in "${@:2}"; do
	if [[ $n =~ ^-?[0-9]+\.?[0-9]*$ ]]; then
		if (( $(echo "$n > $max" | bc -l) )); then
			max=$n
		fi
		if (( $(echo "$n < $min" | bc -l) )); then
			min=$n
		fi
	fi
done

echo "Maximum: $max | Minimum: $min"
