#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime
####################START
SERVER="$1"
if [[ -z "$1" ]]; then
	echo -n "Which server ip?  "
	read SERVER
fi
ACCESSSERVER="faron@$SERVER"

if [[ -z "$2" ]]; then
	echo -n "Name of the connection? [ i.e \"f2def10\" for ssh to f2 from f10 ]  "
	read NAMECONN
fi

eval `ssh-agent -s`
ssh-copy-id -i /home/users/$USER/.ssh/$NAMECONN.pub $ACCESSSERVER
ssh-add -t life /home/users/$USER/.ssh/$NAMECONN.pub $ACCESSSERVER

####################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ffagent.sh  [ACTIVE] y

