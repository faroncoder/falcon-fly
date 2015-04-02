#!/bin/bash

filename="$1"
if [ -z "$filename" ]
  then
    	getall=( $( find . -maxdepth 1 -type f ! -type d ! -name '*.txt' ! -name '*.sh' ! -name '*.dat' ! -name '*.list' -exec basename {} \; ) )
	for filename in "${getall[@]}";
		do
			NEWNAME="$( echo $filename | tr 'A-Z' 'a-z' )";
			mv $filename $NEWNAME 2> /dev/null;
		done
		exit 0
    else
    		SINGLEFILE="$( echo $filename | tr 'A-Z' 'a-z' )";
    		mv $filename $SINGLEFILE 2> /dev/null
    		exit 0
fi

exit 0
