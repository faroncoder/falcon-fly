#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
#################### BEGIN
WHO="faron:faron"
if [[ "$1" = "33" ]]; then WHO="www-data:www-data"; fi
if [[ "$1" = "0" ]]; then WHO="root:root"; fi
if [[ "$1" = "666" ]]; then WHO="nobody:nogroup"; fi
CMD="chown $WHO $PWD/*; chown -R $WHO $PWD;"
if [[ "$EUID" != 0 ]]; then sudo $CMD; else $CMD; fi



################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.bin.owner.sh  [ACTIVE] y

