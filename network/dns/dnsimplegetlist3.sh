#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
#################### BEGIN

function listrecords {
curl  -H "X-DNSimple-Token: $ACCESSAPI" -H "Accept: application/json" -H "Content-Type: application/json" --url "https://api.dnsimple.com/v1/domains/$DOMAIN_ID/records"
}

LOGIN="$( cat $HOME/.falcon/data/private/dnsimple.txt | head -n1 )"
TOKEN="$( cat $HOME/.falcon/data/private/dnsimple.txt | tail -n1 )"
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

#################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] dnsimplegetlist3.sh  [ACTIVE] y

