#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime
####################START

processingLocals() {

		STPFILE=$( basename $z );
		STPNAME=$( echo $STPFILE | cut -d"." -f 1 );
		STPEXT=$( echo $STPNAME | cut -d"." -f 1 2);
	echo "$STPFILE as filename while $STPNAME  is the name of the file without extension ( $STPEXT )"

echo $STPFILE
echo $STPNAME
echo $STPEXT
}


HOMEHERE=$PWD

processingDirectory() {

GETLOC=( $( find . -maxdepth 1 -type d -exec basename {} \; ) );
for p in "${GETLOC[@]}"; do
	cd $p
	processingFiles
done
}

processingFiles() {
	GETBATHES=( $( find $p -maxdepth 1 -type f -exec basename {} \; ) );
	for z in "${GETBATHES[@]}"; do
		STPFILE=$( basename $z );
		STPNAME=$( echo $STPFILE | cut -d"." -f 1 );
		STPEXT=$( echo $STPNAME | cut -d"." -f  2);
		echo "$STPFILE = $STPNAME.$STPEXT"
	done
}

# STPFILE=$( basename $z );
# 		STPNAME=$( echo $STPFILE | cut -d"." -f 1 );
# 		STPEXT=$( echo $STPNAME | cut -d"." -f 1 2);
# 	echo "$STPFILE as filename while $STPNAME  is the name of the file without extension ( $STPEXT )"

# echo $STPFILE
# echo $STPNAME
# echo $STPEXT

# }

processingFiles
# executingFunctions() {
# 	mediainfo $STPFILE >>
# }

# for f in "${DIRES[@]}"; do
# 	cd $f;
# 	if [ ! -d "$PWD/thumbs" ]; then
# 		mkdir -p "$PWD/thumbs";
# 	fi
# 	 GETBATHES=( $( find $f -type f -exec basename {} \; ) ); done; for j in "${GETBATHES[@]}"; do ffmpegthumbnailer -i $j -o $STPNAME.png -s $( echo $(( 128 * 4 )) ) -t 13 -q 10 -c png; done;

###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] lab.video.multiprocessor.sh  [ACTIVE] y

