#!/bin/bash
if [ "$( echo $PATH | grep '/home/faron/.bin/' )" = '']; then
	export PATH="$PATH:/home/faron/.bin:/home/local/bin"
fi
startgreen=`date +%s`
stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo "$(( $startgreen - $stopred ))" );
	echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log;
	exit 0
}

#if [ "$1" != "" ]; then
#################### BEGIN

## FUNCTIONS

## SCRIPTING


################### END
#elif [ "$1" = "" ];
#	then
#  echo "usage: ff.bin.emptydir.remove.sh "
#  echo "example:    "
#fi

stopwatchtime
## TALON: ff.bin.emptydir.remove.sh


