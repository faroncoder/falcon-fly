#!/bin/bash
startgreen=`date +%s`
## FILE & FOLDER ROUTINE CHECK
if [[ ! -d "$PWD/completed" ]];
	then
  	mkdir -p "$PWD/completed"
fi
if [[ ! -d "$PWD/thumbs" ]];
  	then
        mkdir -p "$PWD/thumbs"
fi
if [[ ! -d "$PWD/output" ]];
	then
        mkdir -p "$PWD/output"
fi
HEIGHTWT="$1"
if [[ -z "$HEIGHTWT" ]];
	then
	echo -n "which mode ( 360 for 360p; 480 for 480p; etc )?  "
	read HEIGHTWT
fi

	TITLEFILE=""
	YEARFILE=""
	ALBUMFILE=""
	CONTAINTERFILE=""
	ARTISTFILE=""
	TYPE="mp4"
	PROFILE="main"
	FPS=30
	FPSG="$( echo $(( $FPS * 2 )) )"
	AUDBITRAT="128"
	MAXRAT="$( echo $(( ( $BITRAT - $AUDBITRAT  ) + 200 )) )"
	BITRAT="800"
	BUFFRAT="$( echo $(( $BITRAT * 2 )) )"
	PRESETx264="ultrafast"
	CRF="25"
	COMMENTFILE="Encoded by Faron the Falcon $( date )"

ffmpegstart() {
		ffmpeg -i $PREFILE.mkv \
		-b:v 800k \
		-minrate 800k \
 		-maxrate 972k \
		-bufsize 800k \
		-c:v libx264 \
		-preset ultrafast \
		-crf 26.0 \
		-profile:v main \
		-level 3.1 \
		-vf "scale=trunc(oh*a/2)*2:$HEIGHTWT" \
		-g 60 \
		-keyint_min 60 \
		-x264opts "keyint=60:min-keyint=60:no-scenecut" \
		-ab 128k \
		-ar 48000 \
		-ac 2 -f mp4 \
		"$PWD/output/$PREFILE-$HEIGHTWT.mp4"
}
		# -map 0 \
		# -coder 1 \
		# -reset_timestamps 1 \
		# -flags +loop \
		# -cmp chroma \
		# -partitions +parti4x4+partp8x8+partb8x8 \
		# -me_method hex \
		# -subq 6 \
		# -me_range 16 \
		# -keyint_min 25 \
		# -sc_threshold 40 \
		# -i_qfactor 0.71 \
		# -b_strategy 1 \
		# -movflags +faststart \
		# -g 60 \
		# -pix_fmt yuv420p \
		# -maxrate "$MAXRAT" \
		# -b:v "$BITRAT" \
		# -bufsize "$BUFFRAT" \
		# -vf "scale=trunc(oh*a/2)*2:$HEIGHTWT" \
		# -ar 44100 \
		# -ac 2 \
		# -ab 128k \
		# -f `echo $TYPE` "$PWD/output/$PREFILE-$HEIGHTWT.$TYPE" < /dev/null

	# 	ffmpeg -ss 00:00:00.00 -i `printf "$LOADER"` \
	# 	-coder 1 \
	# 	-map 0 \
	# 	-reset_timestamps 1 \
	# 	-flags +loop \
	# 	-cmp chroma \
	# 	-partitions +parti4x4+partp8x8+partb8x8 \
	# 	-me_method hex \
	# 	-subq 6 \
	# 	-me_range 16 \
	# 	-keyint_min 25 \
	# 	-sc_threshold 40 \
	# 	-i_qfactor 0.71 \
	# 	-b_strategy 1 \
	# 	-movflags +faststart \
	# 	-g 250 \
	# 	-pix_fmt yuv420p \
	# 	-b:v "$BITRAT" \
	# 	-maxrate "$MAXRAT" \
	# 	-bufsize "$MAXRAT" \
	# 	-vf "scale=trunc(oh*a/2)*2:$HEIGHTWT" \
	# 	-pass 2 \
	# 	-ar 44100 \
	# 	-ac 2 \
	# 	-ab 128k \
	# 	-metadata title="$TITLEFILE" \
	# 	-metadata album="$ALBUMFILE" \
	# 	-metadata year="$YEARFILE" \
	# 	-metadata container="$CONTAINTERFILE" \
	# 	-metadata artist="$ARTISTFILE" \
	# 	-metadata comment="$COMMENTFILE"  \
	# 	-f "$TYPE" "$PWD/output/$PREFILE-$HEIGHTWT.$TYPE" < /dev/null

# thumbing() {
# 	THUMBLOC="$PWD/output/$PREFILE.mp4"
# 	HEIGHTPNG="256"
# 	ffmpeg -ss 00:01:00 -i $THUMBLOC -t 1 -vf -vf scale=-1:$HEIGHTPNG -f image2 -vframes 1 "$PWD/thumbs/$INPUT.png" < /dev/null
# 	}

# mp4er() {
# 	LIB264="$( echo $INPUT -y -vcodec libx264 -preset $PRESETx264 -qp 0 -tune zerolatency -crf $CRF -acodec libfdk_aac  )"
# 	LOADER="$( echo $LIB264 )"
# 	TYPE="mp4"
# 	ffmpegstart
# 	thumbing
# 	}

# webmer() {
# 	INPUT="$PWD/output/$PREFILE-$HEIGHTWT.mp4"
# 	LIBWEBM="$( echo $INPUT -y -vcodec libvpx -q:v 5 -qmin 10 -qmax 42 -q:a 6 -acodec libvorbis )"
# 	LOADER="$( echo $LIBWEBM )"
# 	TYPE="webm"
# 	thumbing
# 	ffmpegstart
# 	}


		# ffmpeg -i "$INPUT" -y \
		# -vcodec libx264 \
		# -preset veryslow \
		# -map 0 \
		# -pix_fmt yuv420p \
		# -b:v "$BITRAT" \
		# -maxrate "$MAXRAT" \
		# -minrate "$BITRAT" \
		# -bufsize "$BUFFRAT" \
		# -vf "scale=trunc(oh*a/2)*2:$HEIGHTWT" \
		# -g 60 \
		# -crf "$CRF" \
		# -coder 1 \
		# -flags +loop \
		# -cmp chroma \
		# -partitions +parti4x4+partp8x8+partb8x8 \
		# -me_method hex \
		# -subq 6 \
		# -me_range 16 \
		# -keyint_min 25 \
		# -sc_threshold 40 \
		# -i_qfactor 0.71 \
		# -b_strategy 1 \
		# -threads 0 \
		# -qp 0 \
		# -movflags +faststart \
		# -acodec libfdk_aac \
		# -ar 44100 \
		# -ac 2 \
		# -ab 128k \
		# -pass 1 \
		# -f mp4 "$PWD/pass1-$PREFILE.mp4" < /dev/null &&
		# ffmpeg -i "$INPUT" -y \
		# -vcodec libx264 \
		# -preset veryslow \
		# -map 0 \
		# -pix_fmt yuv420p \
		# -b:v "$BITRAT" \
		# -maxrate "$MAXRAT" \
		# -minrate "$BITRAT" \
		# -bufsize "$BUFFRAT" \
		# -vf "scale=trunc(oh*a/2)*2:$HEIGHTWT" \
		# -g 60 \
		# -crf "$CRF" \
		# -pass 2 \
	 #    -coder 1 \
		# -flags +loop \
		# -cmp chroma \
		# -partitions +parti4x4+partp8x8+partb8x8 \
		# -me_method hex \
		# -subq 6 \
		# -me_range 16 \
		# -g 60 \
		# -keyint_min 25 \
		# -sc_threshold 40 \
		# -i_qfactor 0.71 \
		# -b_strategy 1 \
		# -threads 0 \
		# -qp 0 \
		# -movflags +faststart \
		# -acodec libfdk_aac \
		# -ar 44100 \
		# -ac 2 \
		# -ab 128k \
		# -metadata title="$TITLEFILE" \
		# -metadata album="$ALBUMFILE" \
		# -metadata year="$YEARFILE" \
		# -metadata container="$CONTAINTERFILE" \
		# -metadata artist="$ARTISTFILE" \
		# -metadata comment="$COMMENTFILE"  \
		# -f mp4 "$PWD/output/$PREFILE.mp4" < /dev/null
		#    GETDATE="$( date )"
		#    echo "$NOW :: $fileonly :: $INPUT  <--- completed" >> $streamlog
	#	mv "$PWD/$INPUT" "$PWD/completed/"
		#    echo "$NOW :: $fileonly :: $INPUT ---> 'finish-mkv' folder" >> $streamlog

		#    echo "$NOW :: $fileonly :: $PREFILE.mp4 ---> 'mp4' folder" >> $streamlog
		#ffmpegthumbnailer -i "output/$PREFILE.mp4" -w -c png -s 0 -o "thumbs/$INPUT.png"

# function cleanup {
# 	mv $INPUT completed/
# }

if [ -z "$2" ];
		then
			INPUT="$( find $PWD -maxdepth 1 -type f  -name '*.mkv' -exec basename {} \; | sort | head -n 1 )"
		else
			INPUT="$2"
	fi

if [ -z "$INPUT" ];
		then
			echo "nope there is no file -- ending the encoding engine..."
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
		else
			PREFILE="$( rev <<< $INPUT | cut -d "." -f2 | rev )"
	fi

	ffmpegstart
	#mp4er
	#webmer
	#cleanup

$0 $HEIGHTWT  ## self-execute the script again for reloop

stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0

