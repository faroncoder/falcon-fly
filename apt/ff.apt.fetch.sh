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

CMD=( 
"apt-get build-dep $1"
"apt-get install $1"
)

for command in "${CMD[@]}"; 
do
	if [[ "$EUID" != 0 ]]; then
		sudo $command
	else
		$command
	fi
done

################### END
#elif [ "$1" = "" ];
#	then
#  echo "usage: ff.apt.fetch "
#  echo "example:    "
#fi


## TALON: ff.apt.fetch
XeF


