#!/bin/bash

if [[ $# -ne 2 ]]; then
	echo "Error"
else
	echo $(( $1 + $2 ))
fi


