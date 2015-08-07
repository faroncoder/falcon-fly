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

CHECKFUNCTION=$( basename `echo $( ls -al \`which rm\` | awk '{ print $11 }' )` )

if [ "$CHECKFUNCTION" = "rm_disabled" ]; then
	sleep 18000
	/bin/rm /bin/rm
	/bin/ln -s /bin/rm_safe /bin/rm
	./"$( dirname $0 )/$0"
else
	stopwatchtime
fi


################### END

stopwatchtime
## TALON: ff.function.rm-safe

