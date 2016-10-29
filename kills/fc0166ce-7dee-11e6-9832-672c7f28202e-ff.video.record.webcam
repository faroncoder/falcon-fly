#!/bin/bash
startgreen=`date +%s`

file="`uuid | sed 's/-//g'`"

ffmpeg -f v4l2 -framerate 25 -video_size 640x480 -pix_fmt yuv420p -i /dev/video0 -vcodec libx264 -preset ultrafast -maxrate 1024k -bufsize 1024k -crf 25.0 -qp 0 -tune zerolatency -g 60 -pix_fmt yuv420p -flags +loop -flags +global_header -acodec libfdk_aac -b:a 128k -ar 44100 -ac 2 -f asf "/home/$USER/$file.avi"

stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0

