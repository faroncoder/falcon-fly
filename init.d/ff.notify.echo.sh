#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader;
 #################### START

notify-send "$@"   -i "$FLIB/icon.jpg"  2> /dev/null;  1< /dev/null

####################STOP
doneTime
### [FILE] ff.script.kill.sh  [ACTIVE] y