#!/bin/bash

if [[ -n "$1" && -n "$2" ]]
	then
		if [[ -d "$1" ]] && [[ -e "$1" ]]
			then
				if ! [[ -z "$2" ]]
					then
						grep -r "$2" "$1" 2>/dev/null
					else
						echo "Invalid parameter"
						exit -5
				fi
			else
				echo "Directory does not exists"
				exit -5
		fi
	else
		echo "No arguments"
		exit -2
fi
