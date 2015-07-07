#!/bin/bash
startgreen=`date +%s`
function stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo "$(( $startgreen - $stopred ))" );
	echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log;
	exit 0
}
## IGNORE ABOVE :: LOGGING PURPOSE | use 'stopwatchtime' instead of 'exit 0' ##
## BEGIN
FALCONFLY="/home/faron/.falcon/scripts/falcon-fly"
if [ ! -d "$FALCONFLY/data" ]; then
    mkdir -p $FALCONFLY/data
fi
if [ ! -d "$FALCONFLY/archives" ]; then
    mkdir -p $FALCONFLY/archives
fi
if [ ! -d "$FALCONFLY/archives/unresolved" ]; then
    mkdir -p $FALCONFLY/archives/unresolved
fi
if [ ! -d "$FALCONFLY/archives/sealed" ]; then
    mkdir -p $FALCONFLY/archives/sealed
fi
if [ ! -d "$FALCONFLY/dvlp" ]; then
    mkdir -p $FALCONFLY/dvlp
fi
if [ ! -d "$FALCONFLY/deploy" ]; then
    mkdir -p $FALCONFLY/deploy
fi

FILE1=$1
if [[ -z $FILE1 ]]; then
		echo -n "Which file you wish to talon in? "
		read FILE1
fi

if [ -f $FILE1 ]; then
    	echo "File found as confirmed"
    	FILESIGN=$( md5sum $FILE1 | awk '{print $1}' )
		#FILECHKTRUE=$( grep $FILESIGN $FALCONFLY/logs/md5s.log )
		MENAME=$( echo $FILE1 | cut -d"." -f1 )
		ASSIGNUID=$( uuid )
	else
		echo "Can't confirm type of file nor if it exists & aborted"
		stopwatchtime
fi

SEARCHFILE=$( grep `md5sum $FILE1 | awk '{ print $1 }'` -o "$FALCONFLY/logs/md5s.log" )
if [[ -z "$SEARCHFILE" ]]; then
	FILECHKTRUE="1"
else
	FILECHKTRUE="0"
fi

if [[ "$FILECHKTRUE" = "0" ]]; then
	echo "$FILESIGN | $MENAME" >> "$FALCONFLY/logs/duplications.log"
	#rm $FILE1
	echo "duplication detected & aborted"
else
	echo "`md5sum $FILE1 | awk '{ print $1 }'` | $FILE1" >> "$FALCONFLY/logs/md5s.log"
 	cat $FILE1 > "$FALCONFLY/data/$ASSIGNUID.dat"
 	echo "file copied"
 	chmod +x "$FALCONFLYdata/$ASSIGNUID.dat"
 	echo "file chmod-ed"
 	cp $FILE1 "$FALCONFLY/archives/sealed/$MENAME.txt"
 	echo "file archived as a copy file"
 	chmod -x "$FALCONFLY/archives/sealed/$MENAME.txt"
 	echo "file execution permission removed"
 	rm -f $FILE1
 	echo "file no longer exists but spawned into library"
fi

if [ -f "$FALCONFLY/data/$ASSIGNUID.dat" ]; then
		rm -f "/home/faron/.bin/$MENAME"
		echo "file unliked from old source"
		echo "$( date ) | $FILE1 => $ASSIGNUID.dat AS $MENAME" >> "$FALCONFLY/logs/taloned-ins.log"
		echo "file activity logged"
		ln -s "$FALCONFLY/data/$ASSIGNUID.dat" "/home/faron/.bin/$MENAME"
		echo "file symlinked as new"
fi
## END
stopwatchtime
