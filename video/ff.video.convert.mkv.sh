#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
## BEGING of VBV
#MAXRAT="1200k"
#BUFRAT="900k"
#BITRAT="900k"
## END OF VBV
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.video.convert.mkv.sh  [ACTIVE] y

