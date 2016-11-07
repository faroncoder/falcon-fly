#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime
## BEGING of VBV
MAXRAT="1200k"
BUFRAT="900k"
BITRAT="900k"
## END OF VBV
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] lab.videoconvert.mp4.a.sh  [ACTIVE] y

