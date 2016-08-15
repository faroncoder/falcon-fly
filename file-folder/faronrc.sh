#!/bin/bash
startgreen=`date +%s`
<<<<<<< HEAD
FARON_PATH="/usr/.bin:/usr/local/bin:/home/local/.bin"
=======
FARON_PATH="/usr/bin/:/home/users/$USER/bin:/home/local/bin"
>>>>>>> 7ec161e5c2fe99a9c3028e53ce2a2b3d0bb30954
export PATH="$PATH:$FARON_PATH"
<<<<<<< HEAD
LOG="/home/users/faron/.falcon/logs/faronrc/logging.log"
=======
LOG="/mnt/falcon/logs/faronrc/logging.log"
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
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

<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8

