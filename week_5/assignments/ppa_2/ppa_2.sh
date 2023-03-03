#!/bin/bash

# Filename Format: ./firstname_lastname

# data
# map
# result

# Find investor_name from result

total=0

while read investor_hash; do
	# Find investor file
	investor_data_path=$(grep "$investor_hash" map | cut -d " " -f2)
	# Find amount invested by the investor
	invested_amount=$(grep "INVESTMENT" $investor_data_path | cut -d "$" -f2)
	# Add to total
	total=$((total + invested_amount))
done < result

echo $total
