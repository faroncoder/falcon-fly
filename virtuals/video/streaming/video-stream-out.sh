#!/bin/bash
startgreen=`date +%s`

GETFILE="$1"
if [ -z "$1" ]
    then
    echo -n "Which video to stream? "
    read GETFILE
fi

FILE="$PWD/$GETFILE"

cvlc "$FILE" --quiet --sout='#duplicate{\
dst="transcode{\
vcodec=h264,\
acodec=ac3,\
vb=1200,\
ab=128,\
channels=2,\
samplerate=44100\
}\
:rtp{\
mux=ts,\
dst=192.168.1.10,\
port=8001\
}\
:access{\
mux=ts,\
dst=192.168.1.10,\
port=8002,\
sdp=sap,\
name=video\
}"}' --sout-all --sout-keep

stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
