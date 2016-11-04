#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
####################START

PATHDIR="$PWD"
rename 's/.sh//g' $PATHDIR/*
<<<<<<< HEAD:bin/file-link-removing-sh-ext.sh
####################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] lab.file-link-removing-ext.sh  [ACTIVE] y

