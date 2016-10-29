#!/bin/bash
RETURN=$PWD
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; 

#################### BEGIN

if [[ "$UID" != 0 ]]; then
	SUDO="sudo"	#statements
else
	SUDO=""
fi

for i in G M K; do $SUDO du -ah |  $SUDO grep [0-9]$i | $SUDO sort -nr -k 1; done | $SUDO head -n 11 | $SUDO sort -h
echo "$Fok"


################### END
#cd $RETURN 1> /dev/null;

### exit code for clean exit
XeF
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] /home/users/faron/.falcon/scripts/handle/ff.handle.folders.memory.sh [ACTIVE] y


