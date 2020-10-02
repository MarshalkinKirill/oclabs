#!/bin/bash

if [[ -n "$1" && -n "$2" ]]
	then
		if [[ -d "$1" ]]
			then
				grep -r "$2" "$1"
			else
				echo "Cant find directory"
				exit -5
		fi
	else
		echo "No arguments"
		exit -2
fi
