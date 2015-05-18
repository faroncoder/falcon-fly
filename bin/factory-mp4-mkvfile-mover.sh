#!/bin/bash
export PATH=$PATH

PATHMIEF="/home/faron/var/Streamings/files/engine/factory-mp4"
PATHMIEE="$PATHMIEF/mkv"
PATHHOME="$PATHMIEF/hold"
cd $PATHMIEF
DATGET="$( /bin/ls /home/faron/var/Streamings/files/engine/factory-mp4/mkv/*.dat | /usr/bin/sort | /usr/bin/head -n 1 )"
PREFILE="$( /usr/bin/rev <<< "$DATGET" | /usr/bin/cut -d "." -f2 | /usr/bin/rev )"
if [[ -z "$DATGET" ]]; then
	exit 0
else
	/bin/mv "$PREFILE.mkv" hold/
	/bin/mv "$PREFILE.dat" hold/
	exit 0
fi

$0
exit 0



