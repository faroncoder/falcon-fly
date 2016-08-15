#!/bin/bash
startgreen=`date +%s`
stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo "$(( $startgreen - $stopred ))" );
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log;
	exit 0
}

# if [ "$1" != "" ]; then
#################### BEGIN

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



################### END
# elif [ "$1" = "" ];
# 	then
#   echo "usage: keystroke-capture "
#   echo "example:    "
# fi


## TALON: keystroke-capture


