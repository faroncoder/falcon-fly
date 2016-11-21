if [ ! "$( echo $PATH | grep ' /usr/local/bin/' )" ]; then
	export PATH=$PATH:/usr/local/bin
fi
XeB=`date +%s`
function doneTime {
XeE=`date +%s`; XeT=$( echo "$(( $XeB - $XeE ))" ); logger "$0 | $XeB | $XeE | $XeT "; exit 0
}
USERHOST=$1
USERDOMAIN=$2
URLDOMAINCALL=`hostname --long`
URLHOSTCALL=`hostname --short`
URLDOM=`hostname --domain`
URLDOMAIN=
URLHOST=
RESP=$1
domainCHECK(){		
		DOMAINCHECK=$( echo $RESP | awk '$0 ~ /[^a-zA-Z0-9$]/{print}' )
		if [[ ! "$DOMAINCHECK" ]]; then
			echo "$RESP is not a domain."
			DOMAINCHECK=""
		else
				dig @208.67.222.222 $RESP in all | sed '/;/d' | sed '/^$/d' | sed '/SOA/d' |   awk '{print $1"   "$4"    "$5}' 
				dig @192.168.1.1 $RESP in all | sed '/;/d' | sed '/^$/d' | sed '/SOA/d' |  awk '{print $1"   "$4"    "$5}' 
				dig @gtwy.faronhost.ca $RESP in all | sed '/;/d' | sed '/^$/d' | sed '/SOA/d' |  awk '{print $1"   "$4"    "$5}' 
			
		fi
		DOMAINCHECK=""
		
}
if [ -z $RESP ]; then
	echo -n "URL: $URLDOMAINCALL? [ x=no ]"
	read RESP0
	if [ ! "$RESP0" ]; then
		DOMFE="$URLDOMAINCALL"
	else
		echo -n "Host: ($URLHOSTCALL)? or =>  "
		read RESP2
			if [ ! "$RESP2" ]; then
				USERHOST=$URLHOSTCALL
			else
				USERHOST=$RESP2
			fi
		echo -n "Domain: $USERHOST.$URLDOM or $USERHOST."
		read RESP3
		if [ ! "$RESP3" ]; then
			DOMFE="$USERHOST.$URLDOM"
		else
			DOMFE="$USERHOST.$RESP3"
		fi
			RESP="$DOMFE"
			domainCHECK
		fi
	else
		
		domainCHECK	
fi
doneTime
