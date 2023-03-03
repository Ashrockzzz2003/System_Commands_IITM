#!/bin/bash

if [[ $1 -gt 9 ]]; then
	echo "ERROR"
else
	weekdays=('ERROR' 'SUNDAY' 'MONDAY' 'TUESDAY' 'WEDNESDAY' 'THURSDAY' 'FRIDAY' 'SATURDAY' 'SUNDAY' 'MONDAY')
	echo ${weekdays[$1]}
fi


