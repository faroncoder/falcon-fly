#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
#################### BEGIN

SCORE=""
while :
do
    case "$1" in
	-n | --dark) 
		SCORE=0.4 
		break ;;
	-d | --day) 
		SCORE=1
		break ;;
	*)  break ;;
    esac
	xrandr --output DFP2 --brightness $SCORE
done

################### END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.display.brightness.sh  [ACTIVE] y

