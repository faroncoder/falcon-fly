#!/bin/bash
find $PWD -maxdepth 1 -type f -exec basename {} \; > x.list
while read line
	do
		ORGIN=$line
		CLEANED="$( echo $line | sed 's/\.//g' )"
		mv $line $CLEANED
		echo "$ORGIN --> $CLEANED"
	done < x.list
rm x.list
exit 0

