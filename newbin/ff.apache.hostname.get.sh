#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime;
####################START
USERHOST=$1
USERDOMAIN=$2
URLDOMAINCALL=`hostname --domain`
URLHOSTCALL=`hostname --short`
URLDOMAIN=
URLHOST=

echo -n "URL: $URLHOSTCALL.$URLDOMAINCALL? [ x=no ]"
read RESP0

if [ ! "$RESP0" ]; then
	DOMFE="$URLHOSTCALL.$URLDOMAINCALL"
	echo "Confirm URL to export: $DOMFE"
else
	echo -n "Host: ($URLHOSTCALL)? or =>  "
	read RESP2
		if [ ! "$RESP2" ]; then
			USERHOST=$URLHOSTCALL
		else
			USERHOST=$RESP2
		fi

		echo -n "Domain: $USERHOST.$URLDOMAINCALL or $USERHOST."
		read RESP3
		if [ ! "$RESP3" ]; then
			DOMFE="$USERHOST.$URLDOMAINCALL"
		else
			DOMFE="$USERHOST.$RESP3"
		fi
		echo "Confirm URL to export: $DOMFE"
		
		# fi
		# echo -n "Domain: $URLDOMAIN.$URLDOMAINCALL"
		# read RESP3
		# if [ ! "$RESP3" ]; then
		# 	USERDOMAIN="$RESP3"
		# fi
		# DOMFE="$USERHOST.$USERDOMAIN"
	fi




###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.apache.hostname.get.sh  [ACTIVE] y

