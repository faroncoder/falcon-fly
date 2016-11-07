#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime
####################START

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

###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.curl.post.sh  [ACTIVE] y

