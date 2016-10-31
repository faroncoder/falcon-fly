#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
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
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.cmd.routes.sh  [ACTIVE] y

