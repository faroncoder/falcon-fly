#!/bin/bash
startgreen=`date +%s`
stopwatchtime() {
	stopred=$( date +%s); faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
	}

#################### BEGIN

LIST="/aptlist.list"
PATH="/home/faron/.falcon/apt"
APTLIST="$PATH$LIST"

if [[ "$1" != "" ]]; then
	sudo sh -c "echo \"$1\" >> $APTLIST"
	echo "$1 added"
	stopwatchtime
else
	sudo mv "$APTLIST" "$PATH/tmp.list"
	GRAB=( echo "$( cat "$PATH/tmp.list" | sort | uniq | sort  | tr '\n' ' ' )" )
		# sudo apt-get build-dep "${GRAB[@]}"
		# sudo apt-get install -y "${GRAB[@]}"
	for f in "${GRAB[@]}"; do
		sudo sh -c "echo \"$f\" >> $APTLIST"
		ff.apt.fetch $f
	done
fi

################### END


stopwatchtime
## TALON: ff.setup.apt-install


