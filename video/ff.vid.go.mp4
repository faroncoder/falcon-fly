<<<<<<< HEAD
#!/bin/bash
=======
>>>>>>> 1e8affc5bfb91802d90196acf1c34ab90c678927
THISVERSION=730ebd32-d446-11e5-b1f0-7bf895f2366a
FILEGET=$1
if [ ! -d "mp4" ]; then
	mkdir "mp4" -p 2> /dev/null
fi
if [ ! -d "done" ]; then
	mkdir "done" -p 2> /dev/null
fi
<<<<<<< HEAD

if [ ! "$FILEGET" ]; then
	FILEGRAB=( $( find . -maxdepth 1 -type f  -name '*.mov' -name '*_*.*' -name '*.mkv' -name '*.avi' -name '*.mpeg' -name '*.mpg' -name '*.dv' -name '*.mp4' ! -name '*-*.*' ! -name '*.sh' -exec basename {} \; ) )
else
	FILEGRAB=$FILEGET
fi

CODECVID="libx264"
BITRAT=1372  ## 1500k for internet  1500k MINUS 128K TO DIVIDE BANDWIDTH FOR BOTH VIDEO AND AUDIO USE; 
MAXRAT=1372  ## DUH - WE DONT WANT MOVIE TO RUN BEYOND THE MAXRATE SO IT'D NOT CLOG NETWORK USED BY OTHER APPS
BUFRAT=$(( 2 * $MAXRAT ))  #SET VIDEO TO BE PARSABLE IN AHEAD PREBUFFERING BY SAME MAXRATE
PRESET=4  # 5=veryslow 4=slow 3=medium 2=fast 1=ultrafast
HEIGHTWT=480
CRFSET=21
CRF="$CRFSET.0"
if [[ "$PRESET" == "1" ]]; then
=======
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
>>>>>>> 1e8affc5bfb91802d90196acf1c34ab90c678927
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
<<<<<<< HEAD


SEAF=$( uuid )
startFFMPEG() {
for x in "${FILEGRAB[@]}"; do
		SIZEFILE=$( ls $x -lh | awk '{print $5}' )  ## GET FILE SIZE IN K/M/G
		SIZEKILE=$( ls $x -s | awk '{print $5}' ) ## GET BYTE SIZE
 		INPUT=$( basename $x)
 		#STEPEXT=$( rev <<< $INPUT | cut -d"." -f1 | rev )  ## GET FILE EXTENSION
 		STEPFULL=$( rev <<< $INPUT | cut -d"." -f2 | rev )  ## GET FILE EXTENSION
		#STEPNUM=$( rev <<< "$x" | cut -d"."  -f2  | rev | cut -d"_" -f2 )  ## GET FILE EXTENSION
 		#STEPNUM=( $( find . -maxdepth 1 -type f -name "*_$STEPFULL*" | wc -l ) ) ## CHECKS FOR SERIAL NUMBER 
					#if [[ "$STEPNUM" = 0 ]]; then   ## IF THERE IS NO SERIAL NUMBER
				#		SEQ=$( seq -w 0 0 | tail -n 1 )  ##ASSIGN SERIAL NUMBER
				#	else
					#	SEQ=$( seq -w 0 `echo "$(( $STEPNUM + 1 ))"` | tail -n 1 )  #IF THERE IS SERIAL NUMBER THEN ROTATE THE NUMBER ONE UP
					#fi
=======
SEAF=$( uuid )
startFFMPEG() {
	for x in "${FILEGRAB[@]}"; do
		INPUT=$( basename $x)
 		STEPFULL=$( rev <<< $INPUT | cut -d"." -f2 | rev )
>>>>>>> 1e8affc5bfb91802d90196acf1c34ab90c678927
		TITLEFILE=""
		YEARFILE=""
		ALBUMFILE=""
		CONTAINTERFILE=""
		ARTISTFILE=""
		COMMENTFILE=""
		OUTPUTA="$STEPFULL"
		OUTPUT="$STEPFULL.mp4"
<<<<<<< HEAD
		#EXIT="$STEPFULL-$SEQ-done-$SEAF.$STEPEXT"
		#EXITA="$STEPFULL-$STEPNUM.$STEPEXT"
	
	        			#DEGREE=$( echo $(( $SIZEKILE - $KNFILE )) )
	       


		        			#ffmpeg -r 25 -i $x -y -codec:v $CODECVID -profile:v high -maxrate "$( echo $MAXRAT)k" -bufsize "$( echo $BUFRAT)k" -b:v "$( echo $BITRAT)k" -crf $CRF -pix_fmt +yuv420p -vf "scale=trunc(oh*a/2)*2:$HEIGHTWT" -coder 1 -flags +loop -flags +global_header -movflags +faststart -x264opts keyint=600:min-keyint=30:bframes=16 -cmp chroma -partitions +parti4x4+partp8x8+partb8x8 -me_method hex -subq 6 -me_range 16 -g 59.94 -keyint_min 25 -sc_threshold 40 -i_qfactor 0.71 -b_strategy 1 -threads 0 -codec:a aac -strict -2 -ar 44100 -ac 2 -ab 128k -f mp4 "$OUTPUTA" < /dev/null
							#ffmpeg -r 25 -i $x -y -codec:v $CODECVID -profile:v high -preset $CALCULATED -maxrate "$( echo $MAXRAT)k" -bufsize "$( echo $BUFRAT)k" -b:v "$( echo $BITRAT)k" -crf $CRF -pix_fmt +yuv420p -vf "scale=trunc(oh*a/2)*2:$HEIGHTWT" -coder 1 -flags +loop -flags +global_header -movflags +faststart -x264opts keyint=600:min-keyint=30:bframes=16 -cmp chroma -partitions +parti4x4+partp8x8+partb8x8 -me_method hex -subq 6 -me_range 16 -g 59.94 -keyint_min 25 -sc_threshold 40 -i_qfactor 0.71 -b_strategy 1 -threads 0 -codec:a aac -strict -2 -ar 44100 -ac 2 -ab 128k -f mp4 "$OUTPUTA" < /dev/null
							ffmpeg -r 25 -i $x -y -codec:v $CODECVID -preset $CALCULATED -maxrate "$( echo $MAXRAT)k" -bufsize "$( echo $BUFRAT)k" -b:v "$( echo $BITRAT)k" -crf $CRF -pix_fmt +yuv420p -vf "scale=trunc(oh*a/2)*2:$HEIGHTWT" -coder 1 -flags +loop -flags +global_header -movflags +faststart -x264opts keyint=600:min-keyint=30:bframes=16 -cmp chroma -partitions +parti4x4+partp8x8+partb8x8 -me_method hex -subq 6 -me_range 16 -g 59.94 -keyint_min 25 -sc_threshold 40 -i_qfactor 0.71 -b_strategy 1 -threads 0 -codec:a aac -strict -2 -ar 44100 -ac 2 -ab 128k -f mp4 "$OUTPUTA" < /dev/null
			        		
			        		#INFILE=$( ls $OUTPUT -lh | awk '{ print $5 }' )  #GET FILE SIZE RESULT
			        		TITLEFILE="BIT=$BITRAT MAX=$MAXRAT BUF=$BUFRAT "
							KNFILE="$( ls $OUTPUTA -lh | awk '{ print $5 }' )"  #GET FILE SIZE RESULT			        		
							ALBUMFILE=""
							CONTAINTERFILE="MP4/QT/FFMPEG"
							ARTISTFILE="$( echo $THISVERSION )"
							COMMENTFILE="PST=$PRESETx264 CRF=$CRFSET OLD=$SIZEFILE NEW=$KNFILE"
			        		
			        		#echo $(( $SIZEKILE - $KNFILE ))
							OUTFILE="converted: ID=$SEAF FILE=$x  IN=$SIZEFILE  OUT=$KNFILE  version=$THISVERSION" #LOG FORMAT
							mv $x "done/" 2> /dev/null		#
							#rename "s/-/_/g" "done/$EXIT"  #DISABLE FILE LOCK
							
							ffmpeg -i $OUTPUTA -codec copy -metadata title="$TITLEFILE" -metadata album="$ALBUMFILE" -metadata year="$YEARFILE" -metadata container="$CONTAINTERFILE" -metadata artist="$ARTISTFILE" -metadata comment="$COMMENTFILE" -f mp4  "$OUTPUT" < /dev/null
							rm $OUTPUTA
							mv "$OUTPUT" "mp4/"
							#rename "s/-/_/g" "mp4/$OUTPUT"  #DISABLE FILE LOCK
							
	        				echo $OUTFILE >> .result_converted #SEND TO LOG
	    					QUERY="db.result.insert( {\"NAME\":\"$OUTPUT\",\"ORIG\":\"$INPUT\",\"JOB\":\"$SEAF\", \"EXECUTED\":\"$SEAF\", \"PST\":\"$PRESETx264\", \"CRF\":\"$CRFSET\", \"OLD_SIZE\":\"$SIZEFILE\", \"NEW_SIZE\":\"$KNFILE\", \"BIT\":\"$BITRAT\", \"BUF\":\"$BUFRAT\", \"MAX\":\"$MAXRAT\"} )"
							echo $QUERY | mongo pornalive 
	        done
		
}
        startFFMPEG

=======
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
>>>>>>> 1e8affc5bfb91802d90196acf1c34ab90c678927
exit 0
