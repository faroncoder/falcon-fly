#!/bin/bash
startgreen=`date +%s`
stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo `expr $startgreen - $stopred` );
<<<<<<< HEAD
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log;
=======
<<<<<<< HEAD
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log;
=======
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log;
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
	exit 0
}
## IGNORE ABOVE :: LOGGING PURPOSE | use 'stopwatchtime' instead of 'exit 0' ##
## BEGIN
<<<<<<< HEAD
export PATH="$PATH:/usr/.bin:/.bin:/faron/home/.bin"
=======
export PATH="$PATH:/usr/bin/:/bin:/faron/home/bin"
>>>>>>> 7ec161e5c2fe99a9c3028e53ce2a2b3d0bb30954
PATHLINK="/home/users/$USER/var/Streamings/files/engine/factory-mp4/output"
cd $PATHLINK
if [ ! -d "$PATHLINK/streamer" ]; then
	echo "no streamer folder - exiting"
	stopwatchtime
fi


scp faron@192.168.1.6:$PATHLINK/{*.mp4,*.dat} ./
#scp "faron@192.168.1.2:$PATHLINK/{*.mp4,*.dat}" "$PATHLINK/"
GETDAT=( $( find -maxdepth 1 -type f -name '*.dat' -exec basename {} \; | sort ) )
> delete.list
for f in "${GETDAT[@]}"; do
	PREFILE="$( rev <<< $f | cut -d "." -f2 | rev )"
	INFILE=$( md5sum $PREFILE.mp4 | awk '{ print $1 }' )
	CHECKFILE=$( cat $PREFILE.dat | head -n 1 | awk '{ print $1 }' )
	if [[ "$INFILE"="$CHECKFILE" ]]; then
		##if we have a match - move the file into archive
		mv "$PREFILE.mp4" streamer/
		echo "$PREFILE.mp4 is clean" >> $PWD/result.txt
		#create blank file with same name - aka decoy-kill
		echo "$PREFILE.mp4" >> delete.list
		echo "$PREFILE.dat" >> delete.list
		#sending decoy-kill file to server
		scp "$PREFILE.mp4" "faron@192.168.1.6:$PATHLINK/"
		#remove decoy-kill and dat file to complete the process
		rm "$PREFILE.mp4" $f
	else
		##if we dont have match - delete the file
		echo "$PREFILE.mp4 is corrputed" >> $PWD/result.txt
		rm $PREFILE.mp4 $f
	fi
done
scp delete.list "faron@192.168.1.6:$PATHLINK/"
rm delete.list
## END
stopwatchtime

