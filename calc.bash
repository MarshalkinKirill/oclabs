#!/bin/bash
INT='^[+-]?[0-9]+$'
if [[ -n "$1" ]]
then
	if ! [[ -n "$2" && -n "$3" ]]
		then
			echo "No arguments found"
			exit -2
	else
	case "$1" in
		"sum")
			if [[ "$2" =~ $INT && "$3" =~ $INT ]]
				then
					res=$(( $2 + $3 ))
					echo "$res"
				else
					echo "Incorrect type"
					exit -3
			fi
		;;
		"sub")
			if [[ "$2" =~ $INT && "$3" =~ $INT ]]
				then
					res=$(( $2 - $3 ))
					echo "$res"
				else
					echo  "Incorect type"
					exit -3
			fi
		;;
		"nul")
			if [[ "$2" =~ $INT && "$3" =~ $INT ]]
				then
					res=$(( $2 + $3 ))
					echo "$res"
				else
					echo "Incorrect type"
					exit -3
			fi
		;;
		"div")
			if [[ "$2" =~ $INT && "$3" =~ $INT ]]
				then
					if [[ "$3" -ne 0 ]]
						then
							res=$(( $2 / $3))
							echo "$res"
						else
							echo "Zero dividing"
							exit -4
					fi
				else
					echo "Incorrect type"
					exit -3
			fi
		;;
	esac
	fi
else echo  "No arguments for calc"
fi
