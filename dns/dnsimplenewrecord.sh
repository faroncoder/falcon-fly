#!/bin/bash

function newrecord {
curl  -H "X-DNSimple-Token: $ACCESSAPI" -H "Accept: application/json" -H "Content-Type: application/json" -X "POST" -d "{ \"record\": { \"name\": \"$NAME\", \"record_type\": \"$RECORD_TYPE\", \"content\": \"$IP\" }}" --url "https://api.dnsimple.com/v1/domains/$DOMAIN_ID/records/$RECORD_ID"
}

LOGIN="$( cat $HOME/.falcon/data/private/dnsimple.txt | head -n1 )"
TOKEN="$( cat $HOME/.falcon/data/private/dnsimple.txt | tail -n1 )"
ACCESSAPI="$LOGIN:$TOKEN"
IP="$( curl http://icanhazip.com )"

DOMAIN_ID="$1"
NAME=""
RECORD_TYPE="$2"
POINTER="$3"

if [ -z "$DOMAIN_ID" ]
    then
    echo -n "Which domain is the new record for? "
    read DOMAIN_ID
fi

if [ -z "$RECORD_TYPE" ]
    then
    echo -n "Which record type is this for? "
    read RECORD_TYPE
fi

if [ -z "$POINTER" ]
  then
    echo -n "Enter subdomain the record should point to? "
    read POINTER
    NAME="$POINTER"
fi

newrecord


exit 0
