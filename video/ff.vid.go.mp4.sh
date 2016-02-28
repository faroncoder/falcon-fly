THISVERSION=730ebd32-d446-11e5-b1f0-7bf895f2366a
FILEGET=$1
if [ ! -d "mp4" ]; then
	mkdir "mp4" -p 2> /dev/null
fi
if [ ! -d "done" ]; then
	mkdir "done" -p 2> /dev/null
fi
if [ ! "$FILEGET" ]; then
	FILEGRAB=( $( find . -maxdepth 1 -type f  -name '*.mov' -name '*.wmv' -name '*.flv' -name '*.*' -name '*.mkv' -name '*.avi' -name '*.mpeg' -name '*.mpg' -name '*.dv' -name '*.mp4' ! -name '*.sh' -exec basename {} \; ) )
else
	FILEGRAB=$FILEGET
fi
CODECVID="libx264"
BITRAT=1372
MAXRAT=1372
BUFRAT=$( echo $(( 2 * $MAXRAT )) )
HEIGHTWT=480
CRF=21
PRESET=5
	if [[ "$PRESET" == "1" ]]; then
		PRESETx264="ultrafast"
	fi
	if [[ "$PRESET" == "2" ]]; then
		PRESETx264="fast"
	fi
	if [[ "$PRESET" == "3" ]]; then
		PRESETx264="medium"
	fi
	if [[ "$PRESET" == "4" ]]; then
		PRESETx264="slow"
	fi
	if [[ "$PRESET" == "5" ]]; then
		PRESETx264="veryslow"
	fi
	COND="-tune zerolatency -qp 0"
	if [[ "$PRESET" == "5" ]] || [[ "$PRESET" == "1" ]]; then
		CALCULATED="$PRESETx264 $COND"
	else
		CALCULATED="$PRESETx264"
	fi
SEAF=$( uuid )
startFFMPEG() {
	for x in "${FILEGRAB[@]}"; do
		INPUT=$( basename $x)
 		STEPFULL=$( rev <<< $INPUT | cut -d"." -f2 | rev )
		TITLEFILE=""
		YEARFILE=""
		ALBUMFILE=""
		CONTAINTERFILE=""
		ARTISTFILE=""
		COMMENTFILE=""
		OUTPUTA="$STEPFULL"
		OUTPUT="$STEPFULL.mp4"
		ffmpeg -r 25 -i $x -y -codec:v $CODECVID -preset $CALCULATED -maxrate "$( echo $MAXRAT)k" -bufsize "$( echo $BUFRAT)k" -b:v "$( echo $BITRAT)k" -crf $CRF -pix_fmt +yuv420p -vf "scale=trunc(oh*a/2)*2:$HEIGHTWT" -coder 1 -flags +loop -flags +global_header -movflags +faststart -x264opts keyint=600:min-keyint=30:bframes=16 -cmp chroma -partitions +parti4x4+partp8x8+partb8x8 -me_method hex -subq 6 -me_range 16 -g 59.94 -keyint_min 25 -sc_threshold 40 -i_qfactor 0.71 -b_strategy 1 -threads 0 -codec:a aac -strict -2 -ar 44100 -ac 2 -ab 128k -f mp4 $OUTPUTA < /dev/null
		mv "$x" "done/"
		TITLEFILE="BIT=$BITRAT MAX=$MAXRAT BUF=$BUFRAT "
		ALBUMFILE=""
		CONTAINTERFILE="MP4/QT/FFMPEG"
		ARTISTFILE="$( echo $THISVERSION )"
		SIZEFILE=$( ls $INPUT -lh | awk '{ print $5 }' )
		KNFILE=$( ls $OUTPUTA -lh | awk '{ print $5 }' )
		COMMENTFILE="PST=$PRESETx264 CRF=$CRFSET OLD=$SIZEFILE NEW=$KNFILE" 								
		ffmpeg -i "$OUTPUTA" -codec copy -metadata title="$TITLEFILE" -metadata album="$ALBUMFILE" -metadata year="$YEARFILE" -metadata container="$CONTAINTERFILE" -metadata artist="$ARTISTFILE" -metadata comment="$COMMENTFILE" -f mp4  "mp4/$OUTPUT" < /dev/null
		rm $OUTPUTA												
		QUERY="db.result.insert( {\"NAME\":\"$OUTPUT\",\"ORIG\":\"$INPUT\",\"JOB\":\"$SEAF\", \"EXECUTED\":\"$SEAF\", \"PST\":\"$PRESETx264\", \"CRF\":\"$CRFSET\", \"OLD_SIZE\":\"$SIZEFILE\", \"NEW_SIZE\":\"$KNFILE\", \"BIT\":\"$BITRAT\", \"BUF\":\"$BUFRAT\", \"MAX\":\"$MAXRAT\"} )"
		echo $QUERY | mongo pornalive 
	done
		
}
        startFFMPEG
exit 0
