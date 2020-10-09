#!/bin/bash
INT='^[+-]?[0-9]+$'
if [[ -n $1 ]]
	then
		if [[ "$1" =~ $INT ]]
			then
				exit $1
			else
				echo  "exit code is not a number"
				exit -8
		fi
	else
	exit 0
fi
