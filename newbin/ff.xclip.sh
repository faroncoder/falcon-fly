#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; startTime
####################START
# By keeping options in alphabetical order, it's easy to add more.

display_help() {
	echo "Sorry - help hasn't been developed yet"
}

while :
do
    case "$1" in
      -f | --file)
		if [[ -f "$2" ]]; then
			xclip -in -sel clipboard $2   # You may want to check validity of $2
			echo "parsed to memory!  CTRL-X to paste."
	  		break
	  	else
	  		THISFILE=`uuid`
	  		echo $1 > "/tmp/$THISFILE-xclip.dat"
	  		xclip -sel clip < "/tmp/$THISFILE-xclip.dat"
	  		echo "clipped into memory!  CTRL-X to paste."
	  		break
	  	fi
			;;
      -h | --help) 	display_help ;;  # Call your function
			# no shifting needed here, we're done.
	esac
done
####################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.xclip.sh  [ACTIVE] y

