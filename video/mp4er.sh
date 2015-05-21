#!/bin/bash

PATHDIR="/home/faron/var/Streamings/files/engine/factory-mp4"


function ffmpegengine() {
		HEIGHTWT="360"
		TITLEFILE=""
		YEARFILE=""
		ALBUMFILE=""
		CONTAINTERFILE=""
		ARTISTFILE=""
		MAXRAT="896k"
		BUFRAT="0"
		BITRAT="800k"
		CRF="25"
		PRESET="ultrafast"
		COMMENTFILE="Encoded by Faron the Falcon $( date )"
		INPUT="$PATHDIR/$PREFILE.mkv"
		PREFILE="$( rev <<< "$INPUT" | cut -d"." -f2 | rev )"
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
			-sc_threshold 40 \
			-i_qfactor 0.71 \
			-b_strategy 1 \
			-flags +loop +global_header \
			-movflags +faststart \
			-pix_fmt +yuv420p \
			-acodec libfdk_aac \
			-ab 128k \
			-ar 44100 \
			-ac 2 \
			-metadata title="$TITLEFILE" \
			-metadata album="$ALBUMFILE" \
			-metadata year="$YEARFILE" \
			-metadata container="$CONTAINTERFILE" \
			-metadata artist="$ARTISTFILE" \
			-metadata comment="$COMMENTFILE" \
			-f mp4 "$PATHDIR/$PREFILE.mp4" < /dev/null
			mv "$PATHDIR/$PREFILE.mkv" completed/
			mv "$PATHDIR/$PREFILE.mp4" output/
}

FILEGRAB =$( find $PATHDIR -maxdepth 1 -type f -name '*.mkv' -exec basename {} \; | sort | head -n 1 )

if [[ ! -z "$FILEGRAB" ]]; then

        PREFILE="$( rev <<< "$FILEGRAB" | cut -d "." -f2 | rev )"
		INPUT="$PATHDIR/$PREFILE.mkv"
        ffmpegengine
    else
    	#FILEGRAB="$( find /media/mkv -maxdepth 1 -type f -name '*.mkv' -exec basename {} \; | sort | head -n 1 )"
    	FILEGRAB="nada.mkv"
    	INPUT="$PATHDIR/$PREFILE.mkv"
    	PREFILE="$( rev <<< "$FILEGRAB" | cut -d"." -f2 | rev )"
    	if [[ -z "$PREFILE" ]]; then
    		exit 0
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


$0

exit 0
