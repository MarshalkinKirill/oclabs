#!/bin/bash

if ! [[ $# -eq 1 ]]
then
	echo "strlen script need omly one arg. not $#."
else
	echo "${#1}"
fi
