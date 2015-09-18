#!/bin/bash
if [ "$( echo $PATH | grep '/home/faron/.bin/' )" = '' ]; then
	export PATH=$PATH:/home/faron/.bin:/usr/local/bin
fi
XeB=`date +%s`
function XeF {
XeE=`date +%s`; XeT=$( echo "$(( $XeB - $XeE ))" ); echo "$0 | $XeB | $XeE | $XeT " >> ~/.falcon/logs/scripts.log; exit 0 
}

#if [ "$1" != "" ]; then
#################### BEGIN
TASKPOLICY=$1
STRINGCOL=''

if [ $TASKPOLICY = '' ]; then
	echo "FALCON: which task group? "
	read TASKPOLICY
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
#		*)
#			break
#		;;
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


