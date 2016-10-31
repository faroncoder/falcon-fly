#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
#################### BEGIN





#okno(){ echo -e \"$fcer void $fcy empty$fco\"" }
#okout(){ echo -e "$fcok $fcy$( echo \"fun\" )$fco" }


	if [[ ! "$1" ]]; then
		TER="NADA"
	else
		TER="$1"
	fi
	echo -e "$fcok $TER $fco";





################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.ls.sh  [ACTIVE] y

