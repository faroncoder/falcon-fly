#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
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
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] falcon-perch.sh  [ACTIVE] y

