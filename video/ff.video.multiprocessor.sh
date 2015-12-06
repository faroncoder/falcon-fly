#!/bin/bash
if [ ! "$( echo $PATH | grep '/home/faron/.bin/' )" ]; then
	export PATH=$PATH:/home/faron/.bin
fi
XeB=`date +%s`
function XeF {
XeE=`date +%s`; XeT=$( echo "$(( $XeB - $XeE ))" ); logger "$0 | $XeB | $XeE | $XeT "; exit 0
}
#if [ "$1" != "" ]; then
#################### BEGIN

# processingLocals() {

# 		STPFILE=$( basename $z );
# 		STPNAME=$( echo $STPFILE | cut -d"." -f 1 );
# 		STPEXT=$( echo $STPNAME | cut -d"." -f 1 2);
# 	echo "$STPFILE as filename while $STPNAME  is the name of the file without extension ( $STPEXT )"

# echo $STPFILE
# echo $STPNAME
# echo $STPEXT
# }


HOMEHERE=$PWD

processingDirectory() {
	GETLOC=( $( find $PWD -maxdepth 1 -type d ) )
	for p in "${GETLOC[@]}"; do
		cd $p
		if [ ! -d "thumbs" ]; then
			mkdir -p "thumbs"
	 	fi
	 	if [ ! -d "mediainfo" ]; then
			mkdir -p "mediainfo"
	 	fi
		processingFiles
		cd $HOMEHERE
		find $PWD -empty -type d -exec rm -r {} \;
	done
	GETLOC=( );
}

processingFiles() {
	ff.file.uuid
	GETBATHES=( $( find $PWD -maxdepth 1 -type f ! -name '*.sh' ! -name 'lab*' ! -name 'ff.*' ) );
	for z in "${GETBATHES[@]}"; do
		STPLOC=$( dirname $z )
		STPFILE=$( basename $z );
		STPNAME=$( echo $STPFILE | cut -d"." -f 1 );
		STPEXT=$( echo $STPFILE | cut -d"." -f  2);
		PREFILE=$( rev <<< "$STPFILE" | cut -d "." -f2 | rev )
		ffmpegthumbnailer -i "$z" -o "thumbs/$PREFILE.png" -s "$( echo $(( 128 * 4 )) )" -t 13 -q 10 -c png;
		mediainfo $z >> mediainfo/$PREFILE.dat;
		#ffmpeg -ss 00:00:01.000 -i "$z" -vframes 1 "$HOMEHERE/thumbs/$STPNAME.png"
	done
	GETBATHES=( )
}




processingDirectory
# STPFILE=$( basename $z );
# 		STPNAME=$( echo $STPFILE | cut -d"." -f 1 );
# 		STPEXT=$( echo $STPNAME | cut -d"." -f 1 2);
# 	echo "$STPFILE as filename while $STPNAME  is the name of the file without extension ( $STPEXT #)"

# echo $STPFILE
# echo $STPNAME
# echo $STPEXT

# }

#processingFiles
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
