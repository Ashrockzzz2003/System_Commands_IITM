#!/bin/bash

echo "Use of for loop"

for i in $(ls /bin)
do
	echo $i
done

