startgreen=`date +%s`
stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo `expr $startgreen - $stopred` )
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/faron/.falcon/logs/scripts.log
	exit 0
}
export PATH=$PATH
PATHDIR="$PWD"
MASTERPATH=$( dirname $PATHDIR )
BASELOC=$( basename $PATHDIR )
SERVER=$( hostname --short )
cd $PATHDIR
INPUT="$( basename $1 )"
PREFILE=$( rev <<< $INPUT | cut -d"." -f2 | rev )
EFXI=$( rev <<< $INPUT | cut -d"." -f1 | rev )
CODECVID="libx264"
PRESET="3"
FORCINGHIGHPROFILE=""
CRF="25"
HEIGHTWT="480"
MAXRAT="1200k"
BUFRAT="900k"
BITRAT="900k"
TITLEFILE=" "
YEARFILE=""
ALBUMFILE=""
CONTAINTERFILE=""
ARTISTFILE=""
function ffmpegengine() {
                    CODECAID="libmp3lame"
    if [[ "$CODECVID" == "libx264" ]]; then
    		COND1="-tune zerolatency -qp 0"
        	if [[ "$PRESET" == "1" ]]; then
					PRESETx264="ultrafast $COND1"
        	fi
	        if [[ "$PRESET" == "2" ]]; then
					PRESETx264="fast"
	        fi
	        if [[ "$PRESET" == "3" ]]; then
					PRESETx264="medium"
	        fi
	        if [[ "$PRESET" == "4" ]]; then
					PRESETx264="veryslow $COND1"
	        fi
	        if [[ -z "$FORCINGHIGHPROFILE" ]] || [[ ! "$FORCINGHIGHPROFILE" ]]; then
	        			FORCEPROFILE=""
	        	else
	        			FORCEPROFILE="-profile high"
	        fi
	        CODECVCOMMANDS=" -vcodec $CODECVID -preset $PRESETx264 -crf $CRF $FORCEPROFILE"
	        FILETYPE="mp4"
	fi
	COMMENTFILE="Falcon $( date ) - $0"
cp "$PWD/$INPUT" "$HOME/$INPUT"
mv "$INPUT" "hold/$( hostname --short )_$INPUT"
cd $HOME
	ffmpeg -fflags genpts -ss 00:00:00 -i $INPUT -y -ss 00:00:00 $CODECVCOMMANDS \
		-maxrate $MAXRAT -bufsize $BUFRAT -b:v $BITRAT \
		-coder 1 -cmp chroma -partitions +parti4x4+partp8x8+partb8x8 \
		-me_method hex -subq 6 -me_range 16 -keyint_min 25 -sc_threshold 40 \
		-i_qfactor 0.71 -b_strategy 1 \
		-vf "scale=trunc(oh*a/2)*2:$HEIGHTWT" \
		-flags +loop -flags +global_header -movflags +faststart  \
		-pix_fmt +yuv420p -g 60 -acodec "$CODECAID" -b:a 128k -ar 44100 -ac 2 \
		-metadata title="$TITLEFILE" \
		-metadata album="$ALBUMFILE" \
		-metadata year="$YEARFILE" \
		-metadata container="$CONTAINTERFILE" \
		-metadata artist="$ARTISTFILE" \
		-metadata comment="$COMMENTFILE" \
		-f mp4 "$( hostname --short )_$( echo $INPUT | sed 's/.mkv/.mp4/g' )"
		mv "$( hostname --short )_$( echo $INPUT | sed 's/.mkv/.mp4/g' )" "$PATHDIR/mp4/$( echo $INPUT | sed 's/.mkv/.mp4/g' )"
		rm $INPUT
		cd $PATHDIR
		mv "hold/$( hostname --short)_$INPUT" "done/$INPUT"
}
if [[ ! -z "$INPUT" ]]; then
        ffmpegengine
    else
    	if [[ -z "$PREFILE" ]]; then
		stopwatchtime
    	fi
fi
stopwatchtime
