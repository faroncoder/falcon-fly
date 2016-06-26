#!/bin/bash
startgreen=`date +%s`
stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo "$(( $startgreen - $stopred ))" );
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log;
	exit 0
}

# if [ "$1" != "" ]; then
#################### BEGIN

loadfunction1() {

	echo

}
FPATH="/var/www/faronintel/html/.jsc/projects"
tput sc
SELECT=""
TYPE=""


while [[ "$SELECT" != $"\x0a" && "$SELECT" != $"\x20" ]]; do
    # echo "Select session type:"
    # echo "Press <Enter> to do foo"
    # echo "Press <Space> to do bar"
    #read -s -N 1 SELECT
    IFS= read -s -n 1 SELECT
 	 	# echo "Debug/$SELECT/${#SELECT}"
 	#echo "h|html   c|css   "
 	case "$SELECT" in
 		a) tput rc; tput ed; echo -e -n "$Green hey you faron!$Color_Off"  ;;
		j) tput rc; tput ed; echo -e -n "peeboo!"  ;;
		x) echo -e "\n"; break ;;
		" ") tput rc; tput ed; echo -n "space" ;;
		"") tput rc; tput ed; echo -n "enter" ;;
		*) tput rc; tput ed; echo -n "$SELECT" ;;
	esac

    #[[ "$SELECT" == $"" ]] && echo "enter" # do foo
    #[[ "$SELECT" == $" " ]] && echo "space" # do bar
done



################### END
# elif [ "$1" = "" ];
# 	then
#   echo "usage: keystroke-capture "
#   echo "example:    "
# fi


## TALON: keystroke-capture


