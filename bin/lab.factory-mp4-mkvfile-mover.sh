#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
#################### BEGIN
export PATH=$PATH

PATHMIEF="/home/users/$USER/var/Streamings/files/engine/factory-mp4"
PATHMIEE="$PATHMIEF/mkv"
PATHHOME="$PATHMIEF/hold"
cd $PATHMIEF
<<<<<<< HEAD
DATGET="$( /.bin/ls /home/users/$USER/var/Streamings/files/engine/factory-mp4/mkv/*.dat  source /usr/bin/sort  source /usr/bin/head -n 1 )"
PREFILE="$ source /usr/bin/rev <<< "$DATGET"  source /usr/bin/cut -d "." -f2  source /usr/bin/rev )"
=======
DATGET="$( /bin/ls /home/users/$USER/var/Streamings/files/engine/factory-mp4/mkv/*.dat  source /usr/bin//sort  source /usr/bin//head -n 1 )"
PREFILE="$ source /usr/bin//rev <<< "$DATGET"  source /usr/bin//cut -d "." -f2  source /usr/bin//rev )"
>>>>>>> 7ec161e5c2fe99a9c3028e53ce2a2b3d0bb30954
if [[ -z "$DATGET" ]]; then
#################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] lab.factory-mp4-mkvfile-mover.sh  [ACTIVE] y

