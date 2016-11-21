#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime;
####################START
TASKPOLICY=$1
STRINGCOL=$2

if [  ! "$TASKPOLICY" ]; then
	echo "FALCON: which category? "
	read TASKPOLICY
fi
if [  ! "$STRINGCOL" ]; then
	echo "FALCON: task? "
	read STRINGCOL
fi

while :
	do
	case "$2" in
		$2)
			STRINGCOL="$STRINGCOL $2"
			if [ "$3" = '' ]; then
				shift
				break
			else
				shift
			fi
		;;
	esac
done
yokadi t_add $TASKPOLICY $STRINGCOL


###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.task.add.sh  [ACTIVE] y

