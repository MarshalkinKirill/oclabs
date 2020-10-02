#!/bin/bash

for number in calc.bash search.bash reverse.bash strlen.bash log.bash ex.bash help.bash interactive.bash
do
	if ! [[ -f $number ]]
		then
			echo "Script "${number}" is not availible"
	fi
done

if [[ -n $1 ]]
	then
		case "$1" in
			"calc")
				if ! [[ -f "calc.bash" ]]
					then
						echo "This script is not availible"
					else
						bash ./calc.bash $2 $3 $4
				fi
		;;
			"search")
				if ! [[ -f "search.bash" ]]
					then
						echo "This script is not availible"
					else
						bash ./search.bash $2 $3
				fi
		;;
			"reverse")
				if ! [[ -f "reverse.bash" ]]
					then
						echo "This script is not availible"
					else
						bash ./reverse.bash $2 $3
				fi
		;;
			"strlen")
				if ! [[ -f "strlen.bash" ]]
					then
						echo "This script is not availible"
					else
						bash ./strlen.bash "$@"
				fi
		;;
			"log")
				if ! [[ -f "log.bash" ]]
					then
						echo "This script is not availible"
					else
						bash ./log.bash "$@"
				fi
		;;
			"exit")
				if ! [[ -f "exit.bash" ]]
					then
						echo "This script is not availible"
					else
						bash ./ex.bash $2
				fi
		;;
			"help")
				if ! [[ -f "ex.bash" ]]
					then
						echo "This script is not availible"
					else
						bash ./help.bash
				fi
		;;
			"interactive")
				if ! [[ -f "interactive.bash" ]]
					then
						echo "This script is not availible"
					else
						bash ./interactive.bash
				fi
		;;
		esac
	else echo "Not found first argument";
	exit 0
fi

