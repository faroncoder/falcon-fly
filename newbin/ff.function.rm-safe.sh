#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime;
####################START

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


###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.function.rm-safe.sh  [ACTIVE] y

