#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
#################### BEGIN

cat $HOME/.ssh/id_rsa.pub | ssh faron@$1 'cat >> .ssh/authorized_keys'
echo -e "$fcok"

################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.opensl.server.fast.sh  [ACTIVE] y

