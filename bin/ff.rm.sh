#!/bin/bash
startgreen=`date +%s`
stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo "$(( $startgreen - $stopred ))" );
<<<<<<< HEAD
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log;
=======
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log;
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
	exit 0
}

if [ "$1" != "" ]; then
#################### BEGIN
FOLDERSEND="/home/users/$USER/.local/share/Trash/files"
if [ -f "$1" ];
	then
		#mv $1 "$FOLDERSEND/`uuid`-$1"
		LOCASS=`echo "$FOLDERSEND$PWD"`
		mkdir $LOCASS -p
		mv $1 "$LOCASS/`uuid | sed 's/-//g'`_$1"
	fi



################### END
elif [ "$1" = "" ];
	then
  echo "usage: ff.rm  "
  echo "example:    "
fi

stopwatchtime
## TALON: ff.rm


