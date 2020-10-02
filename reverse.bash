#!/bin/bash

if [[ -n "$1" && -n "$2" ]]
	then
		if [[ -f "$1" ]]
			then
				rev "$1" > "$2"
			else
				echo -e "Argument is not a file"
				exit -6
		fi
	else
		echo -e "No argumet found"
		exit -2
fi
