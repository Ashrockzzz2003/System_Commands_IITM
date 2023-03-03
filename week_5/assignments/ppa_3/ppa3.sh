#!/bin/bash

if [[ $(wc -l data.txt | cut -d " " -f1) -gt 16 ]]; then
	echo "Yes"
else
	echo "No"
fi

