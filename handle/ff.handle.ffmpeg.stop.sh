#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
#################### BEGIN


touch $HOME/Raws/ffmpeg-stop
echo "$Finfo FFMPEG stop requested"


################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.handle.ffmpeg.stop.sh  [ACTIVE] y
