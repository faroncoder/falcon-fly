#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
####################START

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

###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.curl.delete.sh  [ACTIVE] y

