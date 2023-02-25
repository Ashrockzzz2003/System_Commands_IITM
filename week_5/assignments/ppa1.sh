#!/bin/bash

for ((i=1; i<=$#; i++))
do
	if (( $i % 2 == 1  )); then
		echo -n "${!i} "
	fi
done
echo ""

