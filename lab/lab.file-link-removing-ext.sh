#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
#################### BEGIN

PATHDIR="$PWD"
rename 's/.sh//g' $PATHDIR/*
<<<<<<< HEAD:bin/file-link-removing-sh-ext.sh
#################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] lab.file-link-removing-ext.sh  [ACTIVE] y

