#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime;
####################START

find $HOME/.falcon/scripts -type f -exec sed -i -e 's/AIzaSyCOagcFwhzewSG_KPAa3x1lD6pVxPw3WSM'
###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.handle.apiPrivatizer.sh  [ACTIVE] y

