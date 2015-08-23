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
else

APTLIST="/home/faron/.falcon/apt/aptlist.list"


if [ "$1" != "" ]; then
	echo $1 >> $APTLIST
	echo "$1 added"
	stopwatchtime
else
	GRAB=( $( cat $APTLIST | uniq | sort ) )
	for f in "${GRAB[@]}"; do
		ff.apt.fetch $f
	done
fi

fi
################### END


stopwatchtime
## TALON: ff.setup.apt-install


