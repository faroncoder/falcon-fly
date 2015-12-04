#!/bin/bash
if [ ! "$( echo $PATH | grep '/home/faron/.bin/' )" ]; then
	export PATH=$PATH:/home/faron/.bin
fi
XeB=`date +%s`
function XeF {
XeE=`date +%s`; XeT=$( echo "$(( $XeB - $XeE ))" ); logger "$0 | $XeB | $XeE | $XeT "; exit 0
}
if [ "$1" != "" ]; then
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
elif [ "$1" = '' ];
	then
  echo "usage arguments: --day --dark  -n (as 'night') -d (as 'daytime')"
fi
## TALON:
XeF


