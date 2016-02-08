#!/bin/bash
if [ ! "$( echo $PATH | grep '/usr/local/bin/' )" ]; then
	export PATH=$PATH:/usr/local/bin
fi
XeB=`date +%s`
function XeF {
XeE=`date +%s`; XeT=$( echo "$(( $XeB - $XeE ))" ); logger "$0 | $XeB | $XeE | $XeT "; exit 0
}
#if [ "$1" != "" ]; then
#################### BEGIN

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

################### END
#elif [ "$1" = '' ];
#	then
#  echo "usage: lab.video.multiprocessor "
#  echo "example:  lab.video.multiprocessor  "
#fi
## TALON:
XeF


