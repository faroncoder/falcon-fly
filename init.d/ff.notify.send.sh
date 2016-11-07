#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader;
 #################### START

notify-send -u critical -a "FFMPEG" "COMPLETED!" -i $FLIB/icon.jpg"$@"  < /dev/null

####################STOP
doneTime
### [FILE] ff.script.kill.sh  [ACTIVE] y