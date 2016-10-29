#!/bin/bash
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; 
if [[ "$1" != "" ]]; then
#################### BEGIN



sudo apt-get build-dep $1 -y --yes 2> /dev/null;
echo -e "$Fok build-dep checked!"


################### END
#cd $RETURN 1> /dev/null
else echo -e "$Finfo Enter name of the package you want to build from source. $Foff "; fi
### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FALCON] name=$( basename $0 ) active=y

