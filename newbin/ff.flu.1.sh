#!/bin/bash
startgreen=`date +%s`

#sudo flumotion-manager -v -T tcp -H 192.168.1.10 -P 8642 /etc/flumotion/managers/default/planet.xml
flumotion-manager -v -T tcp -H $( hostname -i ) -P 8642 /etc/flumotion/managers/default/planet.xml

<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8

