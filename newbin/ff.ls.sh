#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
####################START





#okno(){ echo -e \"$fcer void $fcy empty$fco\"" }
#okout(){ echo -e "$fcok $fcy$( echo \"fun\" )$fco" }


	if [[ ! "$1" ]]; then
		TER="NADA"
	else
		TER="$1"
	fi
	echo -e "$fcok $TER $fco";





###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.ls.sh  [ACTIVE] y

