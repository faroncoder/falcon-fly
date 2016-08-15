#!/bin/bash
startgreen=`date +%s`
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

<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347

