#!/bin/bash
startgreen=`date +%s`
stopwatchtime() {
<<<<<<< HEAD
	stopred=$( date +%s); faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
	stopred=$( date +%s); faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
	}

#################### BEGIN

LIST="/aptlist.list"
<<<<<<< HEAD
PATH="/home/users/faron/.falcon/apt"
=======
PATH="/mnt/falcon/apt"
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
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


