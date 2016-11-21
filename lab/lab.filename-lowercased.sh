#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime;
####################START

filename="$1"
if [ -z "$filename" ]
  then
    	getall=( $( find . -maxdepth 1 -type f ! -type d ! -name '*.txt' ! -name '*.sh' ! -name '*.dat' ! -name '*.list' -exec basename {} \; ) )
	for filename in "${getall[@]}";
		do
			NEWNAME="$( echo $filename | tr 'A-Z' 'a-z' )";
			mv $filename $NEWNAME 2> /dev/null;
		done
<<<<<<< HEAD:bin/filename-lowercased.sh
####################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] lab.filename-lowercased.sh  [ACTIVE] y

