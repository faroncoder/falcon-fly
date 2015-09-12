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

$1 | perl -e 'use JSON; @in=grep(s/\n$//, <>); print encode_json(\@in)."\n";'


################### END
#elif [ "$1" = "" ];
#	then
#  echo "usage: ff.json "
#  echo "example:    "
#fi

stopwatchtime
## TALON: ff.json


