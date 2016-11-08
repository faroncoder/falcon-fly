#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime
####################START

if [[ $USER != 0 ]]; then
	SUDO="sudo "
fi

## COLLECT THE VARS BEFORE DETERMINING IFCONFIG STATUS
## COLLECT INFORMATION FROM /etc/network/interfaces
GETIFACE=$( cat /etc/network/interfaces | grep 'auto' | sed '/lo/d' | sed 's/auto //g' )
<<<<<<< HEAD
## COLLECT IFCONFIG CONFIGURATED IFACE
CHECKIFACE=$( ifconfig | grep 'HWaddr' | awk '{print $1}' )
## CHECK TO SEE IF PRE-LOADED IFCONFIG ACTUALLY USED RIGHT IFACE AT START UP
GETASSIGNIP=$( cat /etc/hosts | head -n 4 | awk '{ print $1 }' | sed '/127.0.0.1/d' | grep '192.168' )
CHECKIP=$( ifconfig | grep $GETASSIGNIP | awk '{ print $2 }' | cut -d":" -f2 )

CHECKLINK=$( ifconfig | grep '169.254' )
## CHECKS TO SEE IF IFCONFIG MATCHES THE FILE VS IF-UP.
if [[ "$CHECKIFACE" != "$GETIFACE" ]]; then
=======
## COLLECT IFCONFIG CONFIGURATED IFACE 
CHECKIFACE=$( ifconfig | grep 'HWaddr' | awk '{print $1}' )
## CHECK TO SEE IF PRE-LOADED IFCONFIG ACTUALLY USED RIGHT IFACE AT START UP
GETASSIGNIP=$( cat /etc/hosts | head -n 4 | awk '{ print $1 }' | sed '/127.0.0.1/d' | grep '192.168' )
CHECKIP=$( ifconfig | grep $GETASSIGNIP | awk '{ print $2 }' | cut -d":" -f2 )	

## CHECKS TO SEE IF IFCONFIG MATCHES THE FILE VS IF-UP.
if [[ "$CHECKIFACE" != "$GETIFACE" ]]; then 
>>>>>>> 1e8affc5bfb91802d90196acf1c34ab90c678927
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
if [[ "$GETASSIGNIP" == "$CHECKIP" ]]; then
		echo -e "$fcok :: ip address correctly configured"
		GETLOGB="IFCONFIG CHECK:: correct ip"
	else
=======
if [[ "$GETASSIGNIP" == "$CHECKIP" ]]; then 
		echo -e "$fcok :: ip address correctly configured"
		GETLOGB="IFCONFIG CHECK:: correct ip"
	else 
>>>>>>> 1e8affc5bfb91802d90196acf1c34ab90c678927
		echo -e "$fcer$fcy$fco :: ip address misconfigured...fixing"
		$SUDO ifconfig $GETIFACE $GETASSIGNIP
		GETLOGB="IFCONFIG CHECK:: incorrect ip: $GETASSIGNIP"
	fi
<<<<<<< HEAD

 logger "$GETLOGA | $GETLOGB "

echo -e "_info clearing ipv6 tunnel"
 $SUDO ifconfig teredo down
echo -e "_info ipv6 tunnel up and operating"
 $SUDO ifconfig teredo up


 echo "=================="
 echo -e "$fcok :: interface check completed!"
 echo -e "_info restarting the networking ...."
	service networking restart


=======
 
 logger "$GETLOGA | $GETLOGB "

 echo "=================="
 echo -e "$fcok :: interface check completed!"
>>>>>>> 1e8affc5bfb91802d90196acf1c34ab90c678927
 doneTime

### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.net.ifconfig.sh  [ACTIVE] y

### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.net.ifconfig.sh  [ACTIVE] y

