#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime;
####################START

 dvgrab -noavc -format dv2 -guid 1 - | cvlc - \
 --sout='#duplicate{dst=display,\
 dst="transcode{\
 vcodec=mp4v,\
 acodec=aac,\
 vb=1200,\
 ab=128,\
 channels=2,\
 samplerate=44100\
}\
:rtp{\
mux=ts,\
dst=192.168.1.10:8001\
}\
:access{\
mux=ts,\
dst=192.168.1.10,\
port=8002,\
sdp=sap,\
name=live\
}"}' --sout-all --sout-keep

####################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ffcam-stream-basic.sh  [ACTIVE] y

