#!/bin/bash
startgreen=`date +%s`
stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo "$(( $startgreen - $stopred ))" );
	echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log;
	exit 0
}


#################### BEGIN


chromium-browser --url "`echo $PWD | sed 's/\/home\/www\/html/http:\/\/www.faronintel.ca/g'`/$1" 2> /dev/null


################### END

stopwatchtime
## TALON: ff.web.preview


