#!/bin/bash
startgreen=`date +%s`
stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo "$(( $startgreen - $stopred ))" );
<<<<<<< HEAD
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log;
=======
<<<<<<< HEAD
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log;
=======
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log;
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
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


