#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime;
####################START

FILETHIS="source /usr/local/lib/faron_falcon/routes"
if [[ "$EUID" == 0 ]]; then
	SUDO=""
else
	SUDO="sudo"
fi

IFACE=$( head -n 1 $FILETHIS )
MYIP=$( hostname -I )
CHECKFACE=$( ifconfig | cut -d' ' -f1 | tr ' ' '\n' | sed '/lo/d' )
if [[ "$CHECKFACE" == "$IFACE" ]]; then
	echo -e "_info device matches"
else
	echo -e "$_no interface mismatch$clear"
	exit 1
fi
while read line; do
	if [[ "$line" != "$IFACE" ]] && [[ "$line" != "$MYIP" ]]; then
		CMD="$SUDO route add $line $IFACE"
		#printf "$CMD" %q
		$CMD 2> /dev/null < /dev/null
		echo -e "_ok $line $clear"
	fi
done < "$FILETHIS"



###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.cmd.routes.sh  [ACTIVE] y

