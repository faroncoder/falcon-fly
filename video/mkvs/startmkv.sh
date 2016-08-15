#!/bin/bash
startgreen=`date +%s`
echo "y\\n" > mkvrespond.txt
<<<<<<< HEAD
/home/users/faron/.falcon/scripts/video/mkv-er.sh < mkvrespond.txt

stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
/mnt/falcon/scripts/video/mkv-er.sh < mkvrespond.txt

stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
