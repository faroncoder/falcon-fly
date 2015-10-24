#!/bin/bash
if [ "$( echo $PATH | grep '/home/faron/.bin/' )" = '' ]; then
	export PATH=$PATH:/home/faron/.bin:/usr/local/bin
fi
XeB=`date +%s`
function XeF {
XeE=`date +%s`; XeT=$( echo "$(( $XeB - $XeE ))" ); echo "$0 | $XeB | $XeE | $XeT " >> /home/faron/.falcon/logs/scripts.log; exit 0
}

#if [ "$1" != "" ]; then
#################### BEGIN
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


################### END
#elif [ "$1" = "" ];
#	then
#  echo "usage: ff.task.add "
#  echo "example:    "
#fi


## TALON: ff.task.add
XeF


