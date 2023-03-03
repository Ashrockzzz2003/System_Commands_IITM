#!/bin/bash

read -a number_arr

sum=0
for n in "${number_arr[@]}"; do
	if [[ $(( $n % 2 )) -eq 0 ]]; then
		sum=$(( $sum + $n ))
	fi
done
echo $sum
