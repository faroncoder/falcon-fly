#!/bin/bash
startgreen=`date`

filename="$1"
if [ -z "$filename" ]
  then
    	getall=( $( find . -maxdepth 1 -type f ! -type d ! -name '*.txt' ! -name '*.sh' ! -name '*.dat' ! -name '*.list' -exec basename {} \; ) )
	for filename in "${getall[@]}";
		do
			NEWNAME="$( echo $filename | tr 'A-Z' 'a-z' )";
			mv $filename $NEWNAME;
		done
stopred=`date`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
    else
    		SINGLEFILE="$( echo $filename | tr 'A-Z' 'a-z' )";
    		mv $filename $SINGLEFILE
stopred=`date`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
fi

stopred=`date`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
