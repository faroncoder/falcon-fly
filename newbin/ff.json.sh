#!/bin/bash
if [ "$( echo $PATH | grep '/usr/local/bin/' )" = '']; then
	export PATH="$PATH:/usr/local/bin:/home/local/bin"
fi
startgreen=`date +%s`
stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo "$(( $startgreen - $stopred ))" );
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/faron/.falcon/logs/scripts.log;
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


