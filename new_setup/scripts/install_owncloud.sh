#!/bin/bash
if [ ! "$( echo $PATH | grep '/usr/local/bin/' )" ]; then
	export PATH=$PATH:/usr/local/bin
fi
XeB=`date +%s`
function XeF {
XeE=`date +%s`; XeT=$( echo "$(( $XeB - $XeE ))" ); logger "$0 | $XeB | $XeE | $XeT "; exit 0
}
#if [ "$1" != "" ]; then
#################### BEGIN
wget -nv https://download.owncloud.org/download/repositories/stable/Ubuntu_15.10/Release.key -O Release.key
sudo apt-key add - < Release.key 

sudo sh -c "echo 'deb http://download.owncloud.org/download/repositories/stable/Ubuntu_15.10/ /' >> /etc/apt/sources.list.d/owncloud.list"
sudo apt-get update
sudo apt-get install owncloud


################### END
#elif [ "$1" = '' ];
#	then
#  echo "usage: install_owncloud "
#  echo "example:  install_owncloud  "
#fi
## TALON:
XeF


