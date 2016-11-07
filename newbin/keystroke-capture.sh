#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime
####################START

loadfunction1() {

	echo

}

SELECT=""
while [[ "$SELECT" != $"\x0a" && "$SELECT" != $"\x20" ]]; do
    echo "Select session type:"
    echo "Press <Enter> to do foo"
    echo "Press <Space> to do bar"
    #read -s -N 1 SELECT
    IFS= read -s -n 1 SELECT
 	echo "Debug/$SELECT/${#SELECT}"
 	case "$SELECT" in
 		a) echo "hey you faron!" shift ;;
		j) echo "peeboo!" shift; ;;
		h) echo "$SELECT" shift; ;;
		he) echo "$SELECT" shift; ;;
		hel) echo "Seriously?!  You need help?! y/n"; shift; ;;
        hely) echo "BOOOOO!!!"; stopwatchtime; break; ;;
		help ) echo "Smart ass"; shift; ;;
		help  ) echo "Hmmm"; shift;  ;;
		help\ m) echo "Who?"; shift;  ;;
		help\ me) echo "Oh you mean $EUID.  BAH!  You will be ok."; stopwatchtime; break;  ;;
	esac

    [[ "$SELECT" == $"" ]] && echo "enter" # do foo
    [[ "$SELECT" == $" " ]] && echo "space" # do bar
done



###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] keystroke-capture.sh  [ACTIVE] y

