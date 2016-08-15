#!/bin/bash
if [ "$( echo $PATH | grep '/usr/local/bin/' )" = '']; then
	export PATH="$PATH:/usr/local/bin:/home/local/bin"
fi
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

#if [ "$1" != "" ]; then
#################### BEGIN

$1 | perl -e 'use JSON; @in=grep(s/\n$//, <>); print encode_json(\@in)."\n";'


################### END
#elif [ "$1" = "" ];
#	then
#  echo "usage: ff.json "
#  echo "example:    "
#fi

stopwatchtime
## TALON: ff.json


