#!/bin/bash
startgreen=`date +%s`
stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo "$(( $startgreen - $stopred ))" );
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log;
	exit 0
}
#################### BEGIN

URL="$1"

if [[ -z "$URL" ]]; then
	echo -n "FALCON: url for POST query? (include 'http://') "
	read URL
fi

OBJN="$2"
if [[ -z "$OBJN" ]]; then
	echo -n "FALCON: name of string ? "
	read OBJN
fi

DATAFAL="$3"
if [[ -z "$DATAFAL" ]]; then
	echo -n "FALCON: data of the string?  "
	read DATAFAL
fi

curl -H "Content-Type: application/json" -X POST -d "{\"$OBJN\": \"$DATAFAL\"}" "$URL"

################### END
stopwatchtime
## TALON: ff.curl.post


