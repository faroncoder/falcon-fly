#!/bin/bash

function sendrequest {
curl  -H "X-DNSimple-Token: $ACCESSAPI" -H "Accept: application/json" -H "Content-Type: application/json" -X "PUT" -d "{ \"record\": { \"id\": \"$RECORD_ID\", \"name\": \"$NAME\", \"content\": \"$IP\" }}" --url "https://api.dnsimple.com/v1/domains/$DOMAIN_ID/records/$RECORD_ID"
echo ""
echo ""
}

LOGIN="$( cat $HOME/.falcon/data/private/dnsimple.txt | head -n1 )"
TOKEN="$( cat $HOME/.falcon/data/private/dnsimple.txt | tail -n1 )"
ACCESSAPI="$LOGIN:$TOKEN"
IP="$( curl http://icanhazip.com )"

DOMAIN_ID="faron.ca"
RECORD_ID="1009145"
NAME=""
sendrequest

DOMAIN_ID="faron.ca"
RECORD_ID="2589952"
NAME="cloud"
sendrequest

DOMAIN_ID="faron.ca"
RECORD_ID="1743126"
NAME="ftp"
sendrequest

DOMAIN_ID="faron.ca"
RECORD_ID="2671851"
NAME="gtwy"
sendrequest

DOMAIN_ID="faron.ca"
RECORD_ID="3438181"
NAME="rtp"
sendrequest

DOMAIN_ID="faron.ca"
RECORD_ID="2288466"
NAME="mail"
sendrequest

DOMAIN_ID="faron.ca"
RECORD_ID="3450421"
NAME="rtmp"
sendrequest

DOMAIN_ID="faron.ca"
RECORD_ID="2916767"
NAME="rtsp"
sendrequest

DOMAIN_ID="faron.ca"
RECORD_ID="2288464"
NAME="smtp"
sendrequest

DOMAIN_ID="faron.ca"
RECORD_ID="1286925"
NAME="www"
sendrequest

DOMAIN_ID="faronhost.ca"
RECORD_ID="2448689"
NAME=""
sendrequest

DOMAIN_ID="faronhost.ca"
RECORD_ID="2448693"
NAME="www"
sendrequest

DOMAIN_ID="faronintel.ca"
RECORD_ID="1925280"
NAME=""
sendrequest

DOMAIN_ID="faronintel.ca"
RECORD_ID="2952141"
NAME="cloud"
sendrequest

DOMAIN_ID="faronintel.ca"
RECORD_ID="3450425"
NAME="rtmp"
sendrequest


DOMAIN_ID="faronintel.ca"
RECORD_ID="1925281"
NAME="www"
sendrequest

DOMAIN_ID="faronintel.ca"
RECORD_ID="3438042"
NAME="rtsp"
sendrequest

DOMAIN_ID="faronintel.ca"
RECORD_ID="3438062"
NAME="ftp"
sendrequest

DOMAIN_ID="faronintel.ca"
RECORD_ID="3438053"
NAME="rtp"
sendrequest

DOMAIN_ID="ovrs.ca"
RECORD_ID="1926062"
NAME=""
sendrequest

DOMAIN_ID="ovrs.ca"
RECORD_ID="2968558"
NAME="www"
sendrequest

DOMAIN_ID="ovrs.ca"
RECORD_ID="3001101"
NAME="ftp"
sendrequest

DOMAIN_ID="faronhost.ca"
RECORD_ID="3520797"
NAME="rtsp"

exit 0
