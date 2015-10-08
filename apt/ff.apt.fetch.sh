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

STRINGCOL=''
while :
	do
	case "$1" in
		$1)  	
			STRINGCOL="$STRINGCOL $1"
			if [ "$2" = '' ]; then
				shift
				break
			else
				shift
			fi
		;;
	esac
done
PACKS=( $STRINGCOL )
for appget in "${PACKS[@]}";
	do
	CMD=( "apt-get build-dep -y --force-yes $appget" "apt-get install -y --force-yes $appget" )
	for command in "${CMD[@]}";
		do
		if [[ "$EUID" != 0 ]]; then
			sudo $command
			echo $appget >> ~/.falcon/setup/apt-get/appsCurrent.list
		else
			$command
			echo $appget >> ~/.falcon/setup/apt-get/appsCurrent.list
		fi

	done
done

################### END
#elif [ "$1" = "" ];
#	then
#  echo "usage: ff.apt.fetch "
#  echo "example:    "
#fi


## TALON: ff.apt.fetch
XeF
