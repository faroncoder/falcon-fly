#!/bin/bash
startgreen=`date`
> x.list
find $PWD -maxdepth 1 -type f -exec basename {} \; >> x.list
while read line
	do
		ORGIN=$line
		#CLEANED="$( echo $line | sed 's/\.//g' )"
		mv $line ".$line"
		echo "$ORGIN --> $line as hidden"
	done < x.list
rm x.list
stopred=`date`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0

