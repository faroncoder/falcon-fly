#!/bin/bash
startgreen=`date +%s`
stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo "$(( $startgreen - $stopred ))" );
	echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log;
	exit 0
}
#################### BEGIN



fileout="$1"
if [ -z "$1" ]
	then
	echo -n "which file to use?"
	read  FILEOUT
fi

if [ -z "$2" ]
	then
	echo -n "which file as output result?"
	read  FILEOUT
fi

tesseract $1 stdout -psm 3 $2

################### END
stopwatchtime
## TALON: ff.text.extract
