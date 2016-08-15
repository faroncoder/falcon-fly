#!/bin/bash
startgreen=`date +%s`
stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo "$(( $startgreen - $stopred ))" );
<<<<<<< HEAD
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log;
=======
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log;
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
	exit 0
}
#################### BEGIN

QURID="$1"
if [[ -z "$QURID" ]]; then
	echo -n "FALCON: url for POST query? (include 'http://') "
	read QURID
fi


PREURL="$2"
if [[ -z "$PREURL" ]]; then
	echo -n "FALCON: url for POST query? (include 'http://') "
	read PREURL
fi

URL="`echo $PREURL/$QURID`"

OBJN="$3"
if [[ -z "$OBJN" ]]; then
	echo -n "FALCON: name of string ? "
	read OBJN
fi

DATAFAL="$4"
if [[ -z "$DATAFAL" ]]; then
	echo -n "FALCON: data of the string?  "
	read DATAFAL
fi

curl -H "Content-Type: application/json" -X PUT -d "{\"$OBJN\": \"$DATAFAL\"}" "$URL" | jq .

################### END
stopwatchtime
## TALON: ff.curl.post


