#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
#################### BEGIN
IPGET="$1"
CDR="$2"
if [[ "$IPGET" == "" ]]; then
	echo -n -e "${_stat} ip address: "
	read IPGET
fi
if [[ "$CDR" == "" ]]; then
	echo -n -e "${_stat} CIDR netmask? "
	read CDR
fi


#FINDME=`ifconfig -a | cut -d' ' -f1 | sort | sed '/^$/d' | sed '/lo/d' | tail -n 1`
#FINDMI=`echo $FINDME | cut -d ':' -f2 `

# grab the interface name via 
FINDMI=`source /usr/local/bin/ff.net.devices`

### NUMBER to assign to interface
ASSI=`echo $(( $FINDMI + 1 )) `
MEIFME=`echo $FINDME | cut -d ':' -f1 `

## fire the command to add virtual address via ifconfig ( ifconfig dev:# device )
$SUDO ifconfig $MEIFME:$ASSI $IPGET/$CDR;
echo -e "${_ok}"
# $SUDO ifconfig $MEIFME $ASSI IPGET/$CDR

# ifconfig

################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.net.ipadd.sh  [ACTIVE] y

