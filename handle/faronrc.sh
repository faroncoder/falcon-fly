#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime
####################START
<<<<<<< HEAD
FARON_PATH="source /usr/.bin:source /usr/local/bin:/home/local/.bin"
=======
FARON_PATH="source /usr/bin/:/home/users/$USER/bin:/home/local/bin"
>>>>>>> 7ec161e5c2fe99a9c3028e53ce2a2b3d0bb30954
export PATH="$PATH:$FARON_PATH"
LOG="/home/users/faron/.falcon/logs/faronrc/logging.log"
DTW=$( date )
cd /home/users/$USER/.faronrc-listen

function init {
SRLOG=$( awk 'NR 1 {print $0}' faronrc )
CMDSRV=$( awk 'NR 1 {print $1}' faronrc )
LOGSEND="$DTW ......initialize"
echo $LOGSEND >> $LOG
}

function doCmd {
SRLOG=$( awk 'NR 1 {print $0}' faronrc )
echo $SRLOG >> $LOG
sed -i -e "s/$CMDSRV//g" faronrc
sed -i -e "s/|//g" faronrc
LOGSEND="$DTW ___ cmd executing"
echo $LOGSEND >> $LOG
awk 'NR 1 {print $0}' faronrc >> $LOG
./faronrc
}

function endCmd {
sed -i -e '1d' faronrc
LOGSEND="$DTW ~~~ cmd executed"
echo $LOGSEND >> $LOG
}

init
doCmd
endCmd

####################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] faronrc.sh  [ACTIVE] y

