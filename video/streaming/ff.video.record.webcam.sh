#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions;  
RETURN=$PWD;
#if [[ "$1" != "" ]]; then
#################### BEGIN
## avail for coding in colors: ##
## Fok Fno Finfo Fwarn Fstat ##
## Fred Fblack Fgreen Fyellow Fblue Fpurple Fteal Fwhite Foff ##
file="`uuid | sed 's/-//g'`"
ffmpeg -f v4l2 -framerate 25 -video_size 640x480 -pix_fmt yuv420p -i /dev/video0 -vcodec libx264 -preset ultrafast -maxrate 1024k -bufsize 1024k -crf 25.0 -qp 0 -tune zerolatency -g 60 -pix_fmt yuv420p -flags +loop -flags +global_header -acodec libfdk_aac -b:a 128k -ar 44100 -ac 2 -f asf "$HOME/$file.avi"


################### END
#cd $RETURN 1> /dev/null
#else echo -e "$Fwarn Arg 1:$Fyellow name of arg $Foff \n$Fwarn Arg 2: $Fyellow name of arg $Foff"; exit 1; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=$( basename $0 ) active=y

