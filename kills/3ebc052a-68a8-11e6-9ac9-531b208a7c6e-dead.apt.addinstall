#!/bin/bash
startgreen=`date +%s`
stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo "$(( $startgreen - $stopred ))" );
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log;
	exit 0
}

#################### BEGIN

if [ ! "$EUID" = 0 ]; then
    echo "su yourself in first, Faron"
    stopwatchtime
fi

APTLIST="/home/users/faron/.falcon/apt/aptlist.list"



	GRAB=( "$( cat $APTLIST | uniq | sort )" )
	for f in "${GRAB[@]}"; do
		/usr/local/bin/ff.apt.fetch $f
	done
################### END


stopwatchtime
## TALON: ff.setup.apt-install


