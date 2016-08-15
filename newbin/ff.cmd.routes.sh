#!/bin/bash
RETURN=$PWD
if [ ! "$( echo $PATH | grep '/usr/local/bin' )" ]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions
#if [[ "$1" != "" ]]; then
#################### BEGIN

FILETHIS="/usr/local/lib/faron_falcon/routes"
if [[ "$EUID" == 0 ]]; then
	SUDO=""
else
	SUDO="sudo"
fi

IFACE=$( head -n 1 $FILETHIS )
MYIP=$( hostname -I )
CHECKFACE=$( ifconfig | cut -d' ' -f1 | tr ' ' '\n' | sed '/lo/d' )
if [[ "$CHECKFACE" == "$IFACE" ]]; then
	echo -e "$Finfo device matches"
else
	echo -e "$Fno interface mismatch$Foff"
	exit 1
fi
while read line; do
	if [[ "$line" != "$IFACE" ]] && [[ "$line" != "$MYIP" ]]; then
		CMD="$SUDO route add $line $IFACE"
		#printf "$CMD" %q
		$CMD 2> /dev/null < /dev/null
		echo -e "$Fok $line $Foff"
	fi
done < "$FILETHIS"



################### END
#cd $RETURN
#else echo -e $Finfo "Arg 1=$Fyellow path to file for read cmds$Foff "; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=$( basename $0 ) active=y

