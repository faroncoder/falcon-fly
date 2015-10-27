#!/bin/bash
startgreen=`date +%s`
stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo "$(( $startgreen - $stopred ))" );
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/faron/.falcon/logs/scripts.log;
	exit 0
}


#################### BEGIN

THISURLCHECK=$( echo $PWD )
fileGET="$1"

if [ ! "$( echo $THISURLCHECK | grep '/srv/www' )" ]; then
	THISURLOPEN=""
else
	THISURLOPEN=$( echo $THISURLCHECK | sed 's/\/srv\/www\/htdocs\///g'  )
	if [ ! $fileGET ]; then
		URLTHIS="http://$( hostname --short )/$THISURLOPEN"
	else
		URLTHIS="http://$( hostname --short )/$THISURLOPEN/$fileGET"
	fi
	chromium-browser --url "$URLTHIS" < /dev/null
	echo "this is webpath :: $URLTHIS"
fi



#chromium-browser --url "`echo $PWD | sed 's/\/home\/www\/html/http:\/\/www.faronintel.ca/g'`/$1" 2> /dev/null


################### END

stopwatchtime
## TALON: ff.web.preview


