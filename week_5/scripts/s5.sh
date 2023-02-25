#!/bin/bash

echo Shell Scripts in /bin directory

for i in $(ls /bin)
do
	file /bin/$i | grep "shell script"
done

