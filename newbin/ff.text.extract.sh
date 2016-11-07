#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime
####################START



fileout="$1"
if [ -z "$1" ]
	then
	echo -n "which file to use?"
	read  FILEOUT
fi

if [ -z "$2" ]
	then
	echo -n "which file as output result?"
	read  FILEOUT
fi

tesseract $1 stdout -psm 3 $2

###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.text.extract.sh  [ACTIVE] y

