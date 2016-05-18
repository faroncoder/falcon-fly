#!/bin/bash
if [ ! "$( echo $PATH | grep '/usr/local/bin' )" ]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors
XeB=`date +%s`
function XeF {
XeE=`date +%s`; XeT=$( echo "$(( $XeB - $XeE ))" ); logger "$0 | $XeB | $XeE | $XeT "; exit 0
}

#################### BEGIN

if [[ $USER != 0 ]]; then
	SUDO="sudo "
fi

## COLLECT THE VARS BEFORE DETERMINING IFCONFIG STATUS
## COLLECT INFORMATION FROM /etc/network/interfaces
GETIFACE=$( cat /etc/network/interfaces | grep 'auto' | sed '/lo/d' | sed 's/auto //g' )
## COLLECT IFCONFIG CONFIGURATED IFACE
CHECKIFACE=$( ifconfig | grep 'HWaddr' | awk '{print $1}' )
## CHECK TO SEE IF PRE-LOADED IFCONFIG ACTUALLY USED RIGHT IFACE AT START UP
GETASSIGNIP=$( cat /etc/hosts | head -n 4 | awk '{ print $1 }' | sed '/127.0.0.1/d' | grep '192.168' )
CHECKIP=$( ifconfig | grep $GETASSIGNIP | awk '{ print $2 }' | cut -d":" -f2 )

CHECKLINK=$( ifconfig | grep '169.254' )
## CHECKS TO SEE IF IFCONFIG MATCHES THE FILE VS IF-UP.
if [[ "$CHECKIFACE" != "$GETIFACE" ]]; then
		## IF NOT THEN PUT IT DOWN
		echo -e "$fcer$fcy$fco :: interface misconfigured"
		GETLOGA="IFCONFIG CHECK:: wrong interface: $CHECKIFACE"
		$SUDO ifconfig $CHECKIFACE down 2> /dev/null
		$SUDO ifconfig $GETIFACE $GETASSIGNIP
		echo -e "$fcok :: interface reconfigured"
	else
		echo -e "$fcok :: interface is correctly configured"
		GETLOGA="IFCONFIG CHECK:: correct interface"
fi
## IF IT DOESN'T SHOW THE ASSIGNED IP AS CONFIGURED, THEN LET DO IT OURSELVES
if [[ "$GETASSIGNIP" == "$CHECKIP" ]]; then
		echo -e "$fcok :: ip address correctly configured"
		GETLOGB="IFCONFIG CHECK:: correct ip"
	else
		echo -e "$fcer$fcy$fco :: ip address misconfigured...fixing"
		$SUDO ifconfig $GETIFACE $GETASSIGNIP
		GETLOGB="IFCONFIG CHECK:: incorrect ip: $GETASSIGNIP"
	fi

 logger "$GETLOGA | $GETLOGB "

echo -e "$Finfo reseting ipv6 tunnel"
 $SUDO ifconfig teredo down
echo -e "$Finfo ipv6 tunnel up and operating"
 $SUDO ifconfig teredo up


 echo "=================="
 echo -e "$fcok :: interface check completed!"
 echo -e "$Finfo restarting the networking ...."
	service networking restart


 XeF

