#!/bin/bash
HERE=$PWD
if [ ! "$( echo $PATH | grep '/usr/local/bin' )" ]; then export PATH=$PATH:/usr/local/bin; fi
fcg="$(tput setaf 0)"; fcr="$(tput setaf 1)"; fcg="$(tput setaf 2)"; fcy="$(tput setaf 3)"; fcb="$(tput setaf 4)"; fcp="$(tput setaf 5)"; fcc="$(tput setaf 6)"; fcw="$(tput setaf 7)"; fco="$(tput sgr0)";
XeB=`date +%s`
function XeF {
XeE=`date +%s`; XeT=$( echo "$(( $XeB - $XeE ))" ); logger "$0 | $XeB | $XeE | $XeT "; exit 0
}
#if [ "$1" != "" ]; then
#################### BEGIN

if [[ "$last_command" == 0 ]]; then
	echo -e "[ ${ffg} OK ${ffo} ]"
fi

################### END
cd $HERE
#elif [ "$1" = '' ];
#	then
#  echo "usage: __ff_scp_server "
#  echo "example:  __ff_scp_server  "
#fi
## TALON:
XeF


