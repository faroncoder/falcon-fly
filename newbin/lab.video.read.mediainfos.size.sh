#!/bin/bash
if [ ! "$( echo $PATH | grep '/home/faron/.bin' )" ]; then
	export PATH=$PATH:/home/faron/.bin
	echo "exporting real PATH into here."
fi
XeB=`date +%s`
function XeF {
XeE=`date +%s`; XeT=$( echo "$(( $XeB - $XeE ))" ); logger "$0 | $XeB | $XeE | $XeT "; exit 0
}
#if [ "$1" != "" ]; then
#################### BEGIN
INPUT="$1"
MASTER="/media/clips/lib"


startScreening(){
	for a in "${INPUT[@]}";
		do
			INPUT=$( basename $a )
			PREFILE=$( rev <<< $INPUT | cut -d"." -f2 | rev )
			EXT=$( rev <<< $INPUT | cut -d"." -f1 | rev )
			#cat $MASTER/mediainfo/$PREFILE.dat
			echo $PREFILE
			#WIDHTD=$( grep 'Width' $MASTER/mediainfo/$PREFILE.dat | awk '{print $3}' )
			#HEIGHTD=$( grep 'Height' $MASTER/mediainfo/$PREFILE.dat | awk '{print $3}' )
			#INPUT=`echo "${INPUT[@]}" | sed '/.png/d'`
			#INPUT=`echo "${INPUT[@]}" | sed '/.dat/d'`


			#echo "$a = $WIDHTD x $HEIGHTD"

			# if [[ "$HEIGHTD" -gt 480 ]]; then
			# 	find . -name "$PREFILE.mkv" -exec mv {} "$MASTER/resize/" \;  2> /dev/null
			# fi
		done
	}

if [[ ! "$INPUT" ]]; then
	INPUT=( $( find $MASTER -type f ! -name '*.dat' ! -name '*.png' ! -name '*_*-*-*-*-*.*' ) )
	echo "${INPUT[@]}"
	#echo "filename required"
	#exit 0
else
	echo "${INPUT[@]}"
fi



# GETALL=( $1 )
# 	for GRAB in "${GETALL[@]}"; do
# 		INPUT=$( basename $GRAB )
# 		PREFILE=$( rev <<< $INPUT | cut -d"." -f2 | rev )
# 		EXT=$( rev <<< $INPUT | cut -d"." -f1 | rev )
# 		cat /media/clips/lib/mediainfo/$PREFILE.dat
# 	done

################### END
#elif [ "$1" = '' ];
#	then
#  echo "usage: lab.video.read.mediainfos.size "
#  echo "example:  lab.video.read.mediainfos.size  "
#fi
## TALON:
XeF


