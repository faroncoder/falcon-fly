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
cd ~/.falcon/scripts 
ff.clean
git status
git add -A
git commit -a -m "$( hostname --short )"
git pull
git push


################### END
#elif [ "$1" = '' ];
#	then
#  echo "usage: ff.git.updater "
#  echo "example:  ff.git.updater  "
#fi
## TALON:
XeF
