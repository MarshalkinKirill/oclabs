#!/bin/bash

if [[ -n "$1" && -n "$2" ]]
	then
		if [[ -d "$2" || -d "$1" ]]
			then
				echo "it is directory"
				exit -9
			else
				if [[ -f "$1" ]]
					then
					if [[ -r "$1" ]]
						then
							rev "$1" > "$2"
						else
							echo -e "Not readable"
							exit -6
					fi
					else
						echo "Is not a file"
				fi
		fi
	else
		echo -e "No argumet found"
		exit -2
fi
