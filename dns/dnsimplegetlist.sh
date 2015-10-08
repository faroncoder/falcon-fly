#!/bin/bash
startgreen=`date +%s`

function listrecords {
curl  -H "X-DNSimple-Token: $ACCESSAPI" -H "Accept: application/json" -H "Content-Type: application/json" --url "https://api.dnsimple.com/v1/domains/$DOMAIN_ID/records"
}

LOGIN="$( cat ~/.falcon/data/private/dnsimple.txt | head -n1 )"
TOKEN="$( cat ~/.falcon/data/private/dnsimple.txt | tail -n1 )"
ACCESSAPI="$LOGIN:$TOKEN"
#IP="$( curl http://icanhazip.com )"

DOMAIN_ID="$1"

if [ -z "$DOMAIN_ID" ]
    then
    echo -n "Which domain to obtain the listing? "
    read DOMAIN_ID
fi

GETDATA=$( listrecords )

OUTPUT="$( echo $GETDATA | sed 's/\[//g' | sed 's/\]//g' )"

jq  -a ".$OUTPUT"

stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
