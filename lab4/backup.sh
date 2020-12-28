#!/bin/bash

function CreateBackup {
	catalog=$(echo "Backup-"$(date +"%Y-%m-%d"))
	mkdir /home/user/$catalog
	echo "Created "$catalog $(date +"%Y-%m-%d")>> /home/user/backup-report
	for file in $(ls /home/user/source)
	do	
		cp /home/user/source/$file /home/user/$catalog/$file 2> /dev/null
		echo $file >> /home/user/backup-report
	done
}

function DoBackup {
	stat="0"
	for i in $(ls /home/user/source)
	do
		find /home/user/$1/$i 2> /dev/null
		if [[ $? == "1" ]]
		then
			if [[ $stat == "0" ]]
			then
				echo "Updatd "$1 $(date +"%Y-%m-%d") >> /home/user/backup-report
				stat="1"
			fi
			cp /home/user/source/$i /home/user/$1/$i 2> /dev/null
			echo "Copied " $i >> /home/user/backup-report
		else
			size1=$(wc -c /home/user/$1/$i | awk '{print $1}')
			size2=$(wc -c /home/user/source/$i | awk '{print $1}')
			if [[ $size1 -ne $size2 ]]
			then
				if [[ $stat == "0" ]]
				then
					echo "Updated "$1  $(date +"%Y-%m-%d") >> /home/user/backup-report
					stat="1"
				fi
				mv /home/user/$1/$i /home/user/$1/$i"."$(echo $1 | awk -F "-" '{print $2"-"$3"-"$4}')
				cp /home/user/source/$i /home/user/$1/$i 2> /dev/null
				echo "New "$i  $i"."$(echo $1 | awk -F "-" '{print $2"-"$3"-"$4}') >> /home/user/backup-report
			fi
		fi
	done
}

space="$(ls /home/user/source/)"
if [[ "$space" != "${space// /_}" ]]
then
	exit 1
elif [[ "$(tree /home/user/source/ | tail -l | awk '{print $1}')" != 0 ]]
then
	exit 1
fi

backup=$(find /home/user -name "Backup-[0-9]*-[0-9]*-[0-9]*" -type d 2> /dev/null | sort -n | tail -1 | awk -F "/" '{print $4}' )

if [[ -z $backup ]]
then	
	CreateBackup
	exit 0
fi

old=$(echo $backup | awk -F "-" '{print $4}')
new=$(echo $(date +"%Y-%m-%d") | awk -F "-" '{print $3}')
age=$(echo $new"-"$old | bc)

if [[ $age -ge 7 ]]
then
	CreateBackup
	exit 0	
fi

DoBackup $backup
