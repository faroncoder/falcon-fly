#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
####################START
USERHOST=$1
USERDOMAIN=$2
URLDOMAIN=$( `hostname --long` )
URLHOST=$( `hostname --short` )


if [ ! "$HOSTFE" ]; then
	echo -n "URL: $URLHOST.$URLDOMAIN ('m|manual or enter if yes')"
	read RESP1
	if [ ! "$RESP1" ]; then
		DOMFE="$URLHOST.$URLDOMAIN"
	else
		echo -n "Host: ($URLHOST) | "
		read RESP2
		if [ ! "$RESP2" ]; then
			URLHOST="$RESP2"
			
		fi
		
		DOM_MASTER="$USERHOST.$USERDOMAIN"

	fi		
if [ ! "$HOSTFE" ]; then
	
fi

if [ ! "$DOMFE" ]; then
	echo -n "Domain: ($HOSTFE.$( `hostname -d` ))| "
	READ DOMFE
fi


###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.apache.siteconf.new.sh  [ACTIVE] y

