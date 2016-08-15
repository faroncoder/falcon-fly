#!/bin/bash
startgreen=`date +%s`
stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo `expr $startgreen - $stopred` );
<<<<<<< HEAD
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log;
=======
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log;
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
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
<<<<<<< HEAD
SPAWNFILES=( "$( find -L /home/users/faron/.falcon/bash -maxdepth 1 -type f -name '.*' -name '.bash*' ! -name '*functions' ! -name '*history' ! -name '.*logout*' ! -name '*help' -exec basename {} \; )" )
=======
SPAWNFILES=( "$( find -L /mnt/falcon/bash -maxdepth 1 -type f -name '.*' -name '.bash*' ! -name '*functions' ! -name '*history' ! -name '.*logout*' ! -name '*help' -exec basename {} \; )" )
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8

echo "FALCON: refreshing skel files"
for b in "${SPAWNFILES[@]}"; do
	rm "$PATHHOME/$b"
<<<<<<< HEAD
	ln -s "/home/users/faron/.falcon/bash/$b"
done
echo "FALCON: task completed"

# find -L /home/users/faron/.falcon/bash -maxdepth 1 -type f -name '.*' -name '.bash*' ! -name '*functions' ! -name '*history' ! -name '.*logout*' ! -name '*help' -exec ln -s {} \;
=======
	ln -s "/mnt/falcon/bash/$b"
done
echo "FALCON: task completed"

# find -L /mnt/falcon/bash -maxdepth 1 -type f -name '.*' -name '.bash*' ! -name '*functions' ! -name '*history' ! -name '.*logout*' ! -name '*help' -exec ln -s {} \;
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
# echo "FALCON: clean skel files injected"
source $PATHHOME/.bashrc
## END
stopwatchtime

