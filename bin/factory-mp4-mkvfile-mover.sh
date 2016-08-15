#!/bin/bash
startgreen=`date +%s`
export PATH=$PATH

<<<<<<< HEAD
PATHMIEF="/home/users/$USER/var/Streamings/files/engine/factory-mp4"
PATHMIEE="$PATHMIEF/mkv"
PATHHOME="$PATHMIEF/hold"
cd $PATHMIEF
<<<<<<< HEAD
DATGET="$( /.bin/ls /home/users/$USER/var/Streamings/files/engine/factory-mp4/mkv/*.dat | /usr/bin/sort | /usr/bin/head -n 1 )"
PREFILE="$( /usr/bin/rev <<< "$DATGET" | /usr/bin/cut -d "." -f2 | /usr/bin/rev )"
=======
DATGET="$( /bin/ls /home/users/$USER/var/Streamings/files/engine/factory-mp4/mkv/*.dat | /usr/bin//sort | /usr/bin//head -n 1 )"
PREFILE="$( /usr/bin//rev <<< "$DATGET" | /usr/bin//cut -d "." -f2 | /usr/bin//rev )"
>>>>>>> 7ec161e5c2fe99a9c3028e53ce2a2b3d0bb30954
if [[ -z "$DATGET" ]]; then
=======
PATHMIEF="/home/faron/var/Streamings/files/engine/factory-mp4"
PATHMIEE="$PATHMIEF/mkv"
PATHHOME="$PATHMIEF/hold"
cd $PATHMIEF
DATGET="$( /bin/ls /home/faron/var/Streamings/files/engine/factory-mp4/mkv/*.dat | /usr/bin//sort | /usr/bin//head -n 1 )"
PREFILE="$( /usr/bin//rev <<< "$DATGET" | /usr/bin//cut -d "." -f2 | /usr/bin//rev )"
if [[ -z "$DATGET" ]]; then
<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
=======
<<<<<<< HEAD
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
else
	/.bin/mv "$PREFILE.mkv" hold/
	/.bin/mv "$PREFILE.dat" hold/
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
fi

$0
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
<<<<<<< HEAD
=======
=======
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> a7b8b3414c7756672e93487e5d0bcd7e38a26e27
else
	/bin/mv "$PREFILE.mkv" hold/
	/bin/mv "$PREFILE.dat" hold/
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
fi

$0
<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
=======
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> a7b8b3414c7756672e93487e5d0bcd7e38a26e27
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347



