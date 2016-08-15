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

FINDME=`ifconfig -a | cut -d' ' -f1 | sort | sed '/^$/d' | sed '/lo/d' | tail -n 1`
FINDMI=`echo $FINDME | cut -d ':' -f2 `
ASSI=`echo $(( $FINDMI + 1 )) `
MEIFME=`echo $FINDME | cut -d ':' -f1 `


$SUDO ifconfig $MEIFME:$ASSI $IPGET/$CDR;
echo -e "$Fok"
# $SUDO ifconfig $MEIFME $ASSI IPGET/$CDR

# ifconfig

################### END
<<<<<<< HEAD
#cd $RETURN 1> /dev/null
#else echo -e $Finfo "Arg 1=$Fyellow empty $Foff "; fi
=======
#cd $RETURN 1> /dev/null;
#else echo -e "$Finfo Arg 1=$Fyellow empty $Foff "; fi
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=$( basename $0 ) active=y

