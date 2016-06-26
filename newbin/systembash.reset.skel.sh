#!/bin/bash
startgreen=`date +%s`
stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo `expr $startgreen - $stopred` );
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log;
	exit 0
}
## IGNORE ABOVE :: LOGGING PURPOSE | use 'stopwatchtime' instead of 'exit 0' ##
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
SPAWNFILES=( "$( find -L /mnt/falcon/bash -maxdepth 1 -type f -name '.*' -name '.bash*' ! -name '*functions' ! -name '*history' ! -name '.*logout*' ! -name '*help' -exec basename {} \; )" )

echo "FALCON: refreshing skel files"
for b in "${SPAWNFILES[@]}"; do
	rm "$PATHHOME/$b"
	ln -s "/mnt/falcon/bash/$b"
done
echo "FALCON: task completed"

# find -L /mnt/falcon/bash -maxdepth 1 -type f -name '.*' -name '.bash*' ! -name '*functions' ! -name '*history' ! -name '.*logout*' ! -name '*help' -exec ln -s {} \;
# echo "FALCON: clean skel files injected"
source $PATHHOME/.bashrc
## END
stopwatchtime

