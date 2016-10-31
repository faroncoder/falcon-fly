#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
#################### BEGIN

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

#################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] video-stream-out.sh  [ACTIVE] y

