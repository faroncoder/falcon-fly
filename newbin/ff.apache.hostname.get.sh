#!/bin/bash
if [ ! "$( echo $PATH | grep '/usr/local/bin/' )" ]; then
	export PATH=$PATH:/usr/local/bin
fi
XeB=`date +%s`
function XeF {
XeE=`date +%s`; XeT=$( echo "$(( $XeB - $XeE ))" ); logger "$0 | $XeB | $XeE | $XeT "; exit 0
}
#if [ "$1" != "" ]; then
#################### BEGIN
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




################### END
#elif [ "$1" = '' ];
#	then
#  echo "usage: ff.apache.siteconf.new "
#  echo "example:  ff.apache.siteconf.new  "
#fi
## TALON:
XeF


