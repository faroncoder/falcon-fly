#!/bin/bash
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; loadSudo;
#if [[ "$1" != "" ]]; then
#################### BEGIN
IPGET="$1"
CDR="$2"
if [[ "$IPGET" == "" ]]; then
	echo -n -e "$Fstat ip address: "
	read IPGET
fi
if [[ "$CDR" == "" ]]; then
	echo -n -e "$Fstat CIDR netmask? "
	read CDR
fi


#FINDME=`ifconfig -a | cut -d' ' -f1 | sort | sed '/^$/d' | sed '/lo/d' | tail -n 1`
#FINDMI=`echo $FINDME | cut -d ':' -f2 `

# grab the interface name via 
FINDMI=`/usr/local/bin/ff.net.devices`

### NUMBER to assign to interface
ASSI=`echo $(( $FINDMI + 1 )) `
MEIFME=`echo $FINDME | cut -d ':' -f1 `

## fire the command to add virtual address via ifconfig ( ifconfig dev:# device )
$SUDO ifconfig $MEIFME:$ASSI $IPGET/$CDR;
echo -e "$Fok"
# $SUDO ifconfig $MEIFME $ASSI IPGET/$CDR

# ifconfig

################### END
#cd $RETURN 1> /dev/null
#else echo -e $Finfo "Arg 1=$Fyellow empty $Foff "; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=$( basename $0 ) active=y

