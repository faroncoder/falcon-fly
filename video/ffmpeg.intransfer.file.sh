#!/bin/bash
startgreen=`date +%s`
function stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo `expr $startgreen - $stopred` );
	echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log;
	exit 0
}
## IGNORE ABOVE :: LOGGING PURPOSE | use 'stopwatchtime' instead of 'exit 0' ##
## BEGIN
PATHLINK="/home/faron/var/Streamings/files/engine/factory-mp4/output"
cd $PATHLINK
if [ ! -d "$PATHLINK/streamer" ]; then
	echo "no streamer folder - exiting"
	stopwatchtime
fi


scp "faron@192.168.1.6:$PATHLINK/{*.mp4,*.dat}" "$PATHLINK/"
scp "faron@192.168.1.2:$PATHLINK/{*.mp4,*.dat}" "$PATHLINK/"
GETDAT=( $( find -maxdepth 1 -type f -name '*.dat' -exec basename {} \; | sort ) )
for f in "${GETDAT[@]}"; do
	PREFILE="$( rev <<< $f | cut -d "." -f2 | rev )"
	INFILE=$( md5sum $PREFILE.mp4 ) | awk '{ print $1 }'
	CHECKFILE=$( cat $PREFILE.dat | head -n 1 | awk '{ print $1 }' )
	if [[ "$INFILE"="$CHECKFILE" ]]; then
		##if we have a match - move the file into archive
		mv "$PREFILE.mp4" streamer/
		echo "$PREFILE.mp4 is clean" >> $PWD/result.txt
		#create blank file with same name - aka decoy-kill
		touch $PREFILE.mp4
		#sending decoy-kill file to server
		scp $PREFILE.mp4 faron@{192.168.1.6,192.168.1.2}:$PATHLINK/
		#remove decoy-kill and dat file to complete the process
		rm $PREFILE.mp4 $f
	else
		##if we dont have match - delete the file
		echo "$PREFILE.mp4 is corrputed" >> $PWD/result.txt
		rm $PREFILE.mp4 $f
	fi
done
## END
stopwatchtime

