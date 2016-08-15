#!/bin/bash
startgreen=`date +%s`

THISFILE=$( cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1  )

nohup $( firewire-recording $THISFILE ) & sleep 3; ffplay "$THISFILE.mpg";
<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8


