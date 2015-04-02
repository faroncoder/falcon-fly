#!/bin/bash
FARON_PATH="/usr/bin:/home/faron/bin:/home/local/bin"
export PATH="$PATH:$FARON_PATH"
LOG="/home/faron/bin/core/logs/faronrc/logging.log"
DTW=$( date )
cd /home/faron/.faronrc-listen

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

exit 0

