#!/bin/bash
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
ssh-copy-id -i /home/faron/.ssh/$NAMECONN.pub $ACCESSSERVER
ssh-add -t life /home/faron/.ssh/$NAMECONN.pub $ACCESSSERVER

exit 0

