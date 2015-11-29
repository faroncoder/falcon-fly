#!/bin/bash
if [ ! "$( echo $PATH | grep '/home/faron/.bin/' )" ]; then
	export PATH=$PATH:/home/faron/.bin
fi
XeB=`date +%s`
function XeF {
XeE=`date +%s`; XeT=$( echo "$(( $XeB - $XeE ))" ); logger "$0 | $XeB | $XeE | $XeT "; exit 0
}
#if [ "$1" != "" ]; then
#################### BEGIN

ssh-engine
cd ~/.falcon/scripts 2> /dev/null
find -type f -name '*~' -exec rm {} \;
git fetch
git status
git add -A
git commit -a -m 'f10'
git push


################### END
#elif [ "$1" = '' ];
#	then
#  echo "usage: ff.git.updater "
#  echo "example:  ff.git.updater  "
#fi
## TALON:
XeF


