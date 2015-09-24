#!/bin/bash
startgreen=`date +%s`
stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo "$(( $startgreen - $stopred ))" );
	echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log;
	exit 0
}

#################### BEGIN

if [ ! "$EUID" = 0 ]; then
    echo "su yourself in first, Faron"
    stopwatchtime
fi

APTLIST="/home/fly/apt/aptlist.list"



	GRAB=( "$( cat $APTLIST | uniq | sort )" )
	for f in "${GRAB[@]}"; do
		/home/faron/.bin/ff.apt.fetch $f
	done
################### END


stopwatchtime
## TALON: ff.setup.apt-install


