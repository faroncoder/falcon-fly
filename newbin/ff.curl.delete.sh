#!/bin/bash
startgreen=`date +%s`
stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo "$(( $startgreen - $stopred ))" );
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log;
	exit 0
}
#################### BEGIN

URL="$1"
if [[ -z "$QURID" ]]; then
	echo -n "FALCON: url for DELETE query? (include 'http://') "
	read URL
fi

# URL="`echo $PREURL/$QURID`"

OBJN="$2"
if [[ -z "$OBJN" ]]; then
	echo -n "FALCON: which key to delete ? "
	read OBJN
fi

DATAFAL="$4"
if [[ -z "$DATAFAL" ]]; then
	echo -n "FALCON: data of the string?  "
	read DATAFAL
fi

curl -H "Content-Type: application/json" -X DELETE -d "{\"$OBJN\": \"$DATAFAL\"}" "$URL"

################### END
stopwatchtime
## TALON: ff.curl.post


