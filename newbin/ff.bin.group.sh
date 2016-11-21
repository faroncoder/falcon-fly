#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime;
####################START
WHO="faron"
if [[ "$1" = "33" ]]; then WHO="www-data:www-data"; fi
if [[ "$1" = "0" ]]; then WHO="root:root"; fi
if [[ "$1" = "666" ]]; then WHO="nobody:nogroup"; fi
if [[ "$1" = "" ]]; then echo "u"
CMD="chgroup $WHO $PWD/*; chgroup -R $WHO $PWD;"
if [[ "$EUID" != 0 ]]; then sudo $CMD; else $CMD; fi



###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.bin.group.sh  [ACTIVE] y

