#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions;
#################### BEGIN


touch $HOME/Raws/ffmpeg-stop
echo "$Finfo FFMPEG stop requested"


################### END
XeF  ### exit code for clean exit
### [FILE:ff.script.new ACTIVE:y
