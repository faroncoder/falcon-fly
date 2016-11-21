#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime;
####################START

cat $HOME/.ssh/id_rsa.pub | ssh faron@$1 'cat >> .ssh/authorized_keys'
echo -e "$fcok"

###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.opensl.server.fast.sh  [ACTIVE] y

