#!/bin/bash
startgreen=`date +%s`

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

<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
