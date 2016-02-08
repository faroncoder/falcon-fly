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
ff.apt.fetch apache2-dev
cd /tmp
wget http://people.apache.org/~pquerna/modules/mod_flvx.c
sudo apxs -i -a -c mod_flvx.c 
ff.apache2.restart

################### END
cd $HERE
#elif [ "$1" = '' ];
#	then
#  echo "usage: install_apache_mod_flv1.sh "
#  echo "example:  install_apache_mod_flv1.sh  "
#fi
## TALON:
XeF


