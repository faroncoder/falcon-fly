#!/bin/bash
startgreen=`date +%s`
stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo "$(( $startgreen - $stopred ))" );
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log;
	exit 0
}
#################### BEGIN


SUDO=""
if [[ "$USER" == "root" ]]; then
	SUDO="sudo"
fi

$SUDO service apache2 restart


################### END
stopwatchtime
## TALON: ff.apache2.restart


