#!/bin/bash
startgreen=`date +%s`
function stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo `expr $startgreen - $stopred` )
	echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log
	exit 0
}
#### IGNORE ABOVE -
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
    	## Let's check whether we have file or not; via sort/find by filename
    	if [[ -z "$PREFILE" ]]; then
		## if there is no filename, let's exit via logger.
		stopwatchtime
    	fi
fi

# 		#          	if [ -z "$( ls *.mkv )" ]; then
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


## script self-initation to loop.
./$0
stopwatchtime
### Faron's note:  I didn't use loop via array for this one. We all know that FFMPEG does take time to finish processing one file at a rate of movie's length time which it'll stands as an ETA for FMPEG to finish processing.  I.e. if mkv has a movie stream and it's movie time is 1hr and 30min; therefore it would take 1hr and 30min (more or less) for FFMPEG to finish processing it [ x264 is huge reason ].  So, if I did use array method to loop / process my files, at anytime I break the code via CTRL-C, script will stop processing the file, but it'll still move on to next movie to process.  It'll have to be stopped via CTRL-Z.  I prefer using CTRL-C since it is how I am able to track all of my scripts meanwhile CTRL-Z only kill the script but leaving with no footprints - thus harder for me to track (and it opens the door for bugs).  This method simply process the file at a time, and script will exit  everytime it finishes processing a file, however script will also self-execute so, it'd loop to next file leaving footprints which are trackable.
