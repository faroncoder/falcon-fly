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


################### END
#elif [ "$1" = '' ];
#	then
#  echo "usage: ff.apache.siteconf.new "
#  echo "example:  ff.apache.siteconf.new  "
#fi
## TALON:
XeF


