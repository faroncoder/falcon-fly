#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime;
## BEGIN
MOI=`whoami`
if [[ "$MOI" = "root" ]]; then
	#let check to be sure
	IDENT=`echo $EUID`
	if [[ "$IDENT" = 0 ]]; then
		PATHHOME="/root"
	else
		echo "FALCON: Identity match not confirmed"
		stopwatchtime
	fi
else
	if [ -d "/home/$MOI" ]; then
		PATHHOME="/home/$MOI"
	fi
fi
cd $PATHHOME
SPAWNFILES=( "$( find -L /home/users/faron/.falcon/bash -maxdepth 1 -type f -name '.*' -name '.bash*' ! -name '*functions' ! -name '*history' ! -name '.*logout*' ! -name '*help' -exec basename {} \; )" )

echo "FALCON: refreshing skel files"
for b in "${SPAWNFILES[@]}"; do
	rm "$PATHHOME/$b"
	ln -s "/home/users/faron/.falcon/bash/$b"
done
echo "FALCON: task completed"

# find -L /home/users/faron/.falcon/bash -maxdepth 1 -type f -name '.*' -name '.bash*' ! -name '*functions' ! -name '*history' ! -name '.*logout*' ! -name '*help' -exec ln -s {} \;
# echo "FALCON: clean skel files injected"
source $PATHHOME/.bashrc
## END
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] systembash.clear.skel.sh  [ACTIVE] y

