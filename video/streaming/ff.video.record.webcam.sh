#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime;
####################START
## avail for coding in colors: ##
## Fok Fno Finfo Fwarn Fstat ##
## b_red Fblack b_green b_yellow b_blue b_purple b_teal Fwhite clear ##
file="`uuid | sed 's/-//g'`"
ffmpeg -f v4l2 -framerate 25 -video_size 640x480 -pix_fmt yuv420p -i /dev/video0 -vcodec libx264 -pclear ultrafast -maxrate 1024k -bufsize 1024k -crf 25.0 -qp 0 -tune zerolatency -g 60 -pix_fmt yuv420p -flags +loop -flags +global_header -acodec libfdk_aac -b:a 128k -ar 44100 -ac 2 -f asf "$HOME/$file.avi"


###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.video.record.webcam.sh  [ACTIVE] y

