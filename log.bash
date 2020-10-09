#!/bin/bash

BLUE='\033[34m'
YELLOW='\033[33m'
NC='\033[0m'
log="/var/log/anaconda/X.log"
if [[ -f "$log" ]]
	then
		warnings=$(cat $log | awk '/\[/ && /WW/')
		infos=$(cat $log | awk '/\[/ && /II/')
		echo -e "${warnings//"(WW)"/"${YELLOW}Warning:${NC}"}"
		echo -e "${infos//"(II)"/"${BLUE}Information:${NC}"}"
	else
		echo "Not readable"
		eixt -7
fi
