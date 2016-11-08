#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime
####################START
## avail for coding in colors: ##
## Fok Fno Finfo Fwarn Fstat ##
## b_red Fblack b_green b_yellow b_blue b_purple b_teal Fwhite clear ##

#echo -e "_ok$b_yellow $( basename $0 ) $clear"
FWDP="<>1<3<<$BP:$LP<<$IP"


###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.net.ports.sh  [ACTIVE] y

