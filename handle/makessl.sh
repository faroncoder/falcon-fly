#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
#################### BEGIN

KEYSSL="$1"

if [ -z "$1" ];
	then
	echo "name of key? "
	read KEYSSL
fi
if [ -z "$LOCSSL" ];
	then
	echo "location of ssl? "
	read LOCSSL
fi


sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout "$LOCSSL/$KEYSSL.key" -out "$LOCSSL/$KEYSSL.crt"
#################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] makessl.sh  [ACTIVE] y

