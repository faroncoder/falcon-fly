#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime
####################START

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

###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.curl.update.sh  [ACTIVE] y

