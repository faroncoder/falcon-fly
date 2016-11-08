#!/bin/bash
export PATH=$PATH
MYHOME="/home/`whoami`"
file=`uuid | sed 's/-//g'`

dvgrab -noavc -format dv2 -guid 1 - | ffmpeg -re -i - -vcodec libx264 -pclear ultrafast -maxrate 1024k -bufsize 1024k -crf 25.0 -qp 0 -tune zerolatency -g 60 -pix_fmt yuv420p -flags +loop -flags +global_header -acodec libfdk_aac -b:a 128k -ar 44100 -ac 2 -f asf $file.avi > /dev/null & sleep 2; ffplay $file.avi;

exit 0
