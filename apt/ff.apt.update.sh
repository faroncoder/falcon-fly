#!/bin/bash
HERE=$PWD
if [ ! "$( echo $PATH | grep '/usr/local/bin' )" ]; then
	export PATH=$PATH:/usr/local/bin
fi
XeB=`date +%s`
function XeF {
XeE=`date +%s`; XeT=$( echo "$(( $XeB - $XeE ))" ); logger "$0 | $XeB | $XeE | $XeT "; exit 0
}
#if [ "$1" != "" ]; then
#################### BEGIN

sudo apt-get dist-upgrade
sudo apt-get autoremove -y --force-yes
sudo apt-get autoclean -y --force-yes
sudo apt-get clean -y --force-yes
sudo apt-get update -y --force-yes

################### END
cd $HERE
#elif [ "$1" = '' ];
#	then
#  echo "usage: ff.apt.update "
#  echo "example:  ff.apt.update  "
#fi
## TALON:
XeF


