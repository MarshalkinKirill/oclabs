#!/bin/bash

if [[ -n "$1" ]]
	then
		echo "${#1}"
	else
		echo "No argumet"
		exit -2
fi
