#!/bin/bash
startgreen=`date +%s`
## USER CONFIGURATION
MSG="$1"
PATHICON="$2"

function notifyonfly() {
PING="$( echo $MSG )"
DISPLAY=:0.0 /usr/bin/notify-send $ICON "$PING"
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
}

function getmsg() {
                        echo -n "Message to send? "
                        read MSG
}

function getpath() {
      if [ -z "$PATHICON" ]
            then
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
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
## USAGE: notify-new "Hello you the world" ~/lib/media/pic/self/sunfaron.png
