#!/bin/bash
startgreen=`date +%s`
find $PWD -maxdepth 1 -type f -exec basename {} \; > x.list
while read line
	do
		ORGIN=$line
		CLEANED="$( echo $line | sed 's/\.//g' )"
		mv $line $CLEANED
		echo "$ORGIN --> $CLEANED"
	done < x.list
rm x.list
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0

