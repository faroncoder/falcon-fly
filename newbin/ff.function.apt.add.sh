#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
####################START

if [ ! "$EUID" = 0 ]; then
    echo "su yourself in first, Faron"
    stopwatchtime
else

APTLIST="/home/users/faron/.falcon/apt/aptlist.list"


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
###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.function.apt.add.sh  [ACTIVE] y

