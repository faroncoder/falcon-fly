#!/bin/bash
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions;
# if [[ "$1" != "" ]]; then
#################### BEGIN


mv /etc/bind/db.root /etc/bind/db.root_old
wget -q -O /etc/bind/db.root http://www.internic.net/zones/named.root
service bind9 reload
logger "BIND9 Table updated!"

################### END
#cd $RETURN 1> /dev/null
# else echo -e $Finfo "Arg 1=$Fyellow empty $Foff "; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=$( basename $0 ) active=y

