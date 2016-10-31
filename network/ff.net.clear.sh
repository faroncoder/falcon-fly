#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
#################### BEGIN

GETSF=( `/usr/local/bin/ff.net.iface-all` )
for c in "${GETSF[@]}"; do
	if [[ "$c" == "lo" ]]; then
		echo -e "$Fstat ignoring $c"
	else
		$SUDO ifconfig $c 0.0.0.0 2> /dev/null;
		echo -e "$Fwarn $c cleared"
	fi
done

################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.net.clear.sh  [ACTIVE] y

