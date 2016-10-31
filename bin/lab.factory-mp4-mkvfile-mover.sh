#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
#################### BEGIN
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
#################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] lab.factory-mp4-mkvfile-mover.sh  [ACTIVE] y

