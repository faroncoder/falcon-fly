#!/bin/bash
startgreen=`date +%s`
export PATH=$PATH

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
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
else
	/.bin/mv "$PREFILE.mkv" hold/
	/.bin/mv "$PREFILE.dat" hold/
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
fi

$0
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0



