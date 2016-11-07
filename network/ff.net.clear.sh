#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime
####################START

GETSF=( `source /usr/local/bin/ff.net.iface-all` )
for c in "${GETSF[@]}"; do
	if [[ "$c" == "lo" ]]; then
		echo -e "_stat ignoring $c"
	else
		$SUDO ifconfig $c 0.0.0.0 2> /dev/null;
		echo -e "$_warn $c cleared"
	fi
done

###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.net.clear.sh  [ACTIVE] y

