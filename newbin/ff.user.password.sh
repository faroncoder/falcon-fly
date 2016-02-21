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
GETPASS=$( ruby -e 'print "$1".crypt("JU"); print("\n");' )
echo $GETPASS >> /srv/www/access/.htpasswd
if [ ! $1 ]; then echo "passcode needed" exit 1 fi
if [ ! $2 ]; then echo "email needed" exit 2 fi
echo $GETPASS | mail -s 'New password: $1 generated at %{%H:%M:%S}d' $2
################### END
cd $HERE
#elif [ "$1" = '' ];
#	then
#  echo "usage: ff.user.password "
#  echo "example:  ff.user.password  "
#fi
## TALON:
XeF


