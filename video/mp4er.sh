#!/bin/bash
startgreen=`date +%s`
export PATH
PATHDIR="/home/faron/var/Streamings/files/engine/factory-mp4"
cd $PATHDIR
INPUT=$( find "$PATHDIR" -maxdepth 1 -type f -name '*.mkv' -exec basename {} \; | sort | head -n 1 )

function ffmpegengine() {
		HEIGHTWT="360"
		TITLEFILE=""
		YEARFILE=""
		ALBUMFILE=""
		CONTAINTERFILE=""
		ARTISTFILE=""
		MAXRAT="896k"
		BUFRAT="800k"
		BITRAT="800k"
		CRF="25"
		PRESET="ultrafast"
		COMMENTFILE="Falcon $( date ) - $0"
		if [[ "$( hostname )" == "f10" ]]; then
                        CODECAID="libfdk_aac"
                else
                        CODECAID="libvo_aacenc"
                fi

		ffmpeg -i "$INPUT" -y \
			-vcodec libx264 \
			-preset "$PRESET" \
			-maxrate "$MAXRAT" \
			-bufsize "$BUFRAT" \
			-b:v "$BITRAT" \
			-vf "scale=trunc(oh*a/2)*2:$HEIGHTWT" \
			-crf "$CRF" \
			-tune zerolatency \
			-g 250 \
			-coder 1 \
			-cmp chroma \
			-partitions +parti4x4+partp8x8+partb8x8 \
			-me_method hex \
			-subq 6 \
			-me_range 16 \
			-keyint_min 25 \
			-qp 0 \
			-sc_threshold 40 \
			-i_qfactor 0.71 \
			-b_strategy 1 \
			-flags +loop \
			-flags +global_header \
			-movflags +faststart \
			-pix_fmt +yuv420p \
			-acodec "$CODECAID" \
			-ab 128k \
			-ar 44100 \
			-ac 2 \
			-metadata title="$TITLEFILE" \
			-metadata album="$ALBUMFILE" \
			-metadata year="$YEARFILE" \
			-metadata container="$CONTAINTERFILE" \
			-metadata artist="$ARTISTFILE" \
			-metadata comment="$COMMENTFILE" \
			-f mp4 "$PREFILE.mp4" < /dev/null
			mv "$PREFILE.mkv" completed/
			mv "$PREFILE.mp4" output/
}

## if we do have a file to process
if [[ ! -z "$INPUT" ]]; then
		## we grab filename of the file without extension
        PREFILE="$( rev <<< $INPUT | cut -d "." -f2 | rev )"
        ## start ffmpeg
        ffmpegengine
    else
    	#FILEGRAB="$( find /media/mkv -maxdepth 1 -type f -name '*.mkv' -exec basename {} \; | sort | head -n 1 )"
    	#FILEGRAB="nada.mkv"
    	#INPUT="$PATHDIR/$PREFILE.mkv"
    	#PREFILE="$( rev <<< "$FILEGRAB" | cut -d"." -f2 | rev )"

    	## If we do not have anything to process, we then exit (w/ log)
    	if [[ -z "$PREFILE" ]]; then
		stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
    	fi
    	#cp "/media/mkv/$PREFILE.mkv" $PATHDIR/
    	#touch "$PREFILE.dat"
		#mv "$PREFILE.dat" /media/mkv/
    	#ffmpegengine
fi






# else

#     else
# 		PREFILE="$( rev <<< "$FILEGRAB" | cut -d"." -f2 | rev )"

#          	if [ -z "$( ls *.mkv )" ]; then
#                 INPUT="$PATHDIR/$PREFILE.mkv"
#                 cp "/media/mkv/$PREFILE.mkv" $PATHDIR/


# fi
# #		INPUT="$PATHDIR/$PREFILE.mkv"
#		cp "/media/mkv/$FILEGRAB" $PATHDIR/


#ffmpeg -ss 00:00:10.435 -i "output/$PREFILE.mp4" -y -f  image2 -vframes 1 "$PREFILE.png"  < /dev/null
#convert "$PREFILE.png" -resize "330x248^" -gravity center -background black -extent 330x248 "thumbs/$INPUT.png" < /dev/null
#convert "$PREFILE.png" -resize 256x256\> "thumbs/$PREFILE.png"
#rm "$PREFILE.png"
#ffmpegthumbnailer -i "output/$PREFILE.mp4" -w -c png -s 0 -o "thumbs/$INPUT.png"


./$0

stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
