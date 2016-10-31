#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
#################### BEGIN

CMD="chown -R faron:faron $PWD; chown faron:faron $PWD/*;"
if [[ "$EUID" != 0 ]]; then sudo $CMD; else $CMD; fi



################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.bin.write.sh  [ACTIVE] y

