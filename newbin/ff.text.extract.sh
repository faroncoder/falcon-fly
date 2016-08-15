#!/bin/bash
startgreen=`date +%s`
stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo "$(( $startgreen - $stopred ))" );
<<<<<<< HEAD
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/faron/.falcon/logs/scripts.log;
=======
<<<<<<< HEAD
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log;
=======
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log;
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
	exit 0
}
#################### BEGIN



fileout="$1"
if [ -z "$1" ]
	then
	echo -n "which file to use?"
	read  FILEOUT
fi

if [ -z "$2" ]
	then
	echo -n "which file as output result?"
	read  FILEOUT
fi

tesseract $1 stdout -psm 3 $2

################### END
stopwatchtime
## TALON: ff.text.extract
