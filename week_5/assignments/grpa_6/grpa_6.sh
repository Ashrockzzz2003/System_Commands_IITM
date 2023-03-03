#!/bin/bash

# perf_folder

mkdir $1

for line in $(ls -1 perf_folder | grep "\.c$" | grep "perf"); do
	mv perf_folder/$line perf_folder/program_$line
	mv perf_folder/program_$line $1
done
