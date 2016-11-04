#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors;  source /usr/local/lib/faron_falcon/functions; startTime
####################START
CT=0
while read line; do
	CT=`echo $(( $CT + 1 ))`
 	edit=`echo $line | cut -d"=" -f2`
 	trim="[$Fgreen$CT$Foff]$edit"
	MEF="echo -n "
	if [[ "$NE" == 5 ]]; then
        		MEF="echo "
        		NE=0
    	fi
	$MEF$trim
    	NE=`echo $(( $NE + 1))`
	done  < /usr/local/lib/faron_falcon/characters
echo ""

###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.script.characters-ls.sh  [ACTIVE] y

