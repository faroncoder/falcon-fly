#!/bin/bash
if [ ! "$( echo $PATH | grep '/usr/local/bin' )" ]; then export PATH=$PATH:/usr/local/bin; fi
<<<<<<< HEAD
fcbk="$(tput setaf 0)"; fcr="$(tput setaf 1)"; fcg="$(tput setaf 2)"; fcy="$(tput setaf 3)"; fcb="$(tput setaf 4)"; fcp="$(tput setaf 5)"; fcc="$(tput setaf 6)"; fcw="$(tput setaf 7)"; fco="$(tput sgr0)"; fcok="[$fcg OK $fco]"; fcer="[$fcr ERR $fco]";
=======
<<<<<<< HEAD
MEHERE="/home/users/faron/.falcon/scripts/bash/lib/"; source $MEHERE/colors; $MEHERE/functions;
=======
<<<<<<< HEAD
source /usr/local/lib/faron_falcon/colors
=======
fcbk="$(tput setaf 0)"; fcr="$(tput setaf 1)"; fcg="$(tput setaf 2)"; fcy="$(tput setaf 3)"; fcb="$(tput setaf 4)"; fcp="$(tput setaf 5)"; fcc="$(tput setaf 6)"; fcw="$(tput setaf 7)"; fco="$(tput sgr0)"; fcok="[$fcg OK $fco]"; fcer="[$fcr ERR $fco]";
>>>>>>> 1e8affc5bfb91802d90196acf1c34ab90c678927
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
XeB=`date +%s`
function XeF {
XeE=`date +%s`; XeT=$( echo "$(( $XeB - $XeE ))" ); logger "$0 | $XeB | $XeE | $XeT "; exit 0
}
<<<<<<< HEAD
=======
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347

#################### BEGIN

if [[ $USER != 0 ]]; then
	SUDO="sudo "
fi

## COLLECT THE VARS BEFORE DETERMINING IFCONFIG STATUS
## COLLECT INFORMATION FROM /etc/network/interfaces
<<<<<<< HEAD
GETIFACE=$( cat /etc/network/interfaces | grep 'auto' | sed '/lo/d' | sed 's/auto //g' )
=======
<<<<<<< HEAD
#GETIFACE=$( cat /etc/network/interfaces | grep 'auto' | sed '/lo/d' | sed 's/auto //g' )
GETIFACE=`/home/users/faron/.falcon/scripts/newbin/ff.network.devices.sh | sed '/lo/d' | sed '/:/d'`
=======
GETIFACE=$( cat /etc/network/interfaces | grep 'auto' | sed '/lo/d' | sed 's/auto //g' )
<<<<<<< HEAD
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
## COLLECT IFCONFIG CONFIGURATED IFACE
CHECKIFACE=$( ifconfig | grep 'HWaddr' | awk '{print $1}' )
## CHECK TO SEE IF PRE-LOADED IFCONFIG ACTUALLY USED RIGHT IFACE AT START UP
GETASSIGNIP=$( cat /etc/hosts | head -n 4 | awk '{ print $1 }' | sed '/127.0.0.1/d' | grep '192.168' )
CHECKIP=$( ifconfig | grep $GETASSIGNIP | awk '{ print $2 }' | cut -d":" -f2 )

CHECKLINK=$( ifconfig | grep '169.254' )
## CHECKS TO SEE IF IFCONFIG MATCHES THE FILE VS IF-UP.
<<<<<<< HEAD
#if [[ "$CHECKIFACE" != "$GETIFACE" ]]; then
## COLLECT IFCONFIG CONFIGURATED IFACE 
#CHECKIFACE=$( ifconfig | grep 'HWaddr' | awk '{print $1}' )
## CHECK TO SEE IF PRE-LOADED IFCONFIG ACTUALLY USED RIGHT IFACE AT START UP
#GETASSIGNIP=$( cat /etc/hosts | head -n 4 | awk '{ print $1 }' | sed '/127.0.0.1/d' | grep '192.168' )
#CHECKIP=$( ifconfig | grep $GETASSIGNIP | awk '{ print $2 }' | cut -d":" -f2 )	

## CHECKS TO SEE IF IFCONFIG MATCHES THE FILE VS IF-UP.
#if [[ "$CHECKIFACE" != "$GETIFACE" ]]; then 
		## IF NOT THEN PUT IT DOWN
		echo -e "$Finfo :: interface misconfigured"
		GETLOGA="IFCONFIG CHECK:: wrong interface: $GETIFACE"
ff		
		$SUDO ifconfig $GETIFACE down 2> /dev/null
		$SUDO ifconfig $GETIFACE $GETASSIGNIP
		echo -e "$fcok :: interface reconfigured"
#	else
		echo -e "$fcok :: interface is correctly configured"
		GETLOGA="IFCONFIG CHECK:: correct interface"
#fi
## IF IT DOESN'T SHOW THE ASSIGNED IP AS CONFIGURED, THEN LET DO IT OURSELVES

=======
if [[ "$CHECKIFACE" != "$GETIFACE" ]]; then
=======
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
## COLLECT IFCONFIG CONFIGURATED IFACE 
CHECKIFACE=$( ifconfig | grep 'HWaddr' | awk '{print $1}' )
## CHECK TO SEE IF PRE-LOADED IFCONFIG ACTUALLY USED RIGHT IFACE AT START UP
GETASSIGNIP=$( cat /etc/hosts | head -n 4 | awk '{ print $1 }' | sed '/127.0.0.1/d' | grep '192.168' )
CHECKIP=$( ifconfig | grep $GETASSIGNIP | awk '{ print $2 }' | cut -d":" -f2 )	

## CHECKS TO SEE IF IFCONFIG MATCHES THE FILE VS IF-UP.
if [[ "$CHECKIFACE" != "$GETIFACE" ]]; then 
<<<<<<< HEAD
=======
>>>>>>> 1e8affc5bfb91802d90196acf1c34ab90c678927
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
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
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
if [[ "$GETASSIGNIP" == "$CHECKIP" ]]; then
		echo -e "$fcok :: ip address correctly configured"
		GETLOGB="IFCONFIG CHECK:: correct ip"
	else
<<<<<<< HEAD
=======
=======
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
if [[ "$GETASSIGNIP" == "$CHECKIP" ]]; then 
		echo -e "$fcok :: ip address correctly configured"
		GETLOGB="IFCONFIG CHECK:: correct ip"
	else 
<<<<<<< HEAD
=======
>>>>>>> 1e8affc5bfb91802d90196acf1c34ab90c678927
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
		echo -e "$fcer$fcy$fco :: ip address misconfigured...fixing"
		$SUDO ifconfig $GETIFACE $GETASSIGNIP
		GETLOGB="IFCONFIG CHECK:: incorrect ip: $GETASSIGNIP"
	fi
<<<<<<< HEAD
=======
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8

 logger "$GETLOGA | $GETLOGB "

echo -e "$Finfo reseting ipv6 tunnel"
 $SUDO ifconfig teredo down
echo -e "$Finfo ipv6 tunnel up and operating"
 $SUDO ifconfig teredo up


 echo "=================="
 echo -e "$fcok :: interface check completed!"
 echo -e "$Finfo restarting the networking ...."
<<<<<<< HEAD
	service networking reload
 
 exit 0
=======
	service networking restart


=======
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
 
 logger "$GETLOGA | $GETLOGB "

 echo "=================="
 echo -e "$fcok :: interface check completed!"
<<<<<<< HEAD
 XeF

=======
>>>>>>> 1e8affc5bfb91802d90196acf1c34ab90c678927
 XeF

>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
