#!/bin/bash
startgreen=`date +%s`
stopwatchtime() {
<<<<<<< HEAD
      stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
      stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
}

## USER CONFIGURATION
MSG="$1"
PATHICON="$2"

notifyonfly() {
PING="$( echo $MSG )"
DISPLAY=:0.0 /usr/bin//notify-send $ICON "$PING"
stopwatchtime
}

getmsg() {
                        echo -n "Message to send? "
                        read MSG
}

function getpath() {
      if [ -z "$PATHICON" ]; then
                  ICON=""
            else
                  ICON="-i $PATHICON"
      fi
}

function geticon() {
                        echo -n "Path to icon? "
                        read PATHICON
                        getpath
}

if [ -z "$MSG" ]
      then
            getmsg
            geticon
            notifyonfly
      else
            getpath
            notifyonfly
fi

stopwatchtime
## USAGE: notify-new "Hello you the world" $HOMElib/media/pic/self/sunfaron.png
