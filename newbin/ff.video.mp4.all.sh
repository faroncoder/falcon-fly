#!/bin/bash
startgreen=`date +%s`; stopwatchtime() { stopred=`date +%s`; 	faronruntime=$( echo "$(( $startgreen - $stopred ))" ); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0 }
#################### BEGIN
FILEGRAB="$( find ./ -maxdepth 1 -type f  -name '*.avi' ! -name '*.sh' | sort | head -n1 )"

YEAR="$( echo $GETDATE | awk '{print$6}' )"
DAY="$( echo $GETDATE | awk '{print$3}' )"
MONTH="$( echo $GETDATE | awk '{print$2}' )"
TIME="$( echo $GETDATE | awk '{print$4}' )"
NOW="$MONTH-$DAY-$YEAR @ $TIME"
mypath="$(readlink -f "$0")"
fileonly="$( basename $mypath )"
streamlog="/home/faron/var/streamings/encoding.log"
TYPEFILE="480p"
TITLEFILE=""
YEARFILE=""
ALBUMFILE=""
CONTAINTERFILE=""
ARTISTFILE=""
BITRAT="800k"
MAXRAT="800k"
BUFFRAT="800K"
HEIGHTWT="480"
COMMENTFILE="Encoded by Faron the Falcon"

#function grabfps {
#TEMPNAME="$( rev <<< "$FILEGRAB" | cut -d "." -f2 | rev )"
#TEMPFILE="$TEMPNAME.list"
#mediainfo $FILEGRAB > $TEMPFILE
## FIND FPS
#GETFPS=$( awk '{ if ( $1 == "Frame" && $2 == "rate" && $5 == "fps" ) { print $4; exit; }}' $TEMPFILE )
#FPS=$( printf "%s" $GETFPS )


## RETURNS FPS in $FPS
## FIND MEMETHOD
#MEMETHOD=$( awk '{ if ( $1 == "Encoding" ) { print $12; exit; }}' $TEMPFILE )
#MEMETHOD="$( echo $MEMETHOD | sed 's/me=//g' )"

#GETBIT="$( awk '{ if ( $1 == "Bit" && $2 == "rate" ) { print $4; exit; }}' $TEMPFILE )"
#BITRAT=$(printf "%s" $GETBIT )

#GETCRF=23
#CRF="$(printf "%s" $GETCRF )"


#}



if [ -z "$FILEGRAB" ]
    then

   echo "nope there is no file -- ending the encoding engine..."
    


    else
#grabfps

INPUT="$( basename $FILEGRAB )"
PREFILE="$( rev <<< "$INPUT" | cut -d"." -f2 | rev )"
        GETDATE="$( date )"
        echo "$NOW :: $fileonly :: $INPUT ---> encoding" >> $streamlog

ffmpeg -i "$INPUT" -y  \
-vcodec libx264 \
-preset slow \
-pix_fmt yuv420p \
-b:v "$BITRAT" \
-maxrate "$MAXRAT" \
-bufsize "$BUFFRAT" \
-crf 23 \
-vf "scale=trunc(oh*a/2)*2:$HEIGHTWT" \
-acodec libfdk_aac \
-coder 1 \
-flags +loop \
-cmp chroma \
-partitions +parti4x4+partp8x8+partb8x8 \
-subq 6 \
-me_range 16 \
-g 60 \
-keyint_min 25 \
-sc_threshold 40 \
-i_qfactor 0.71 \
-b_strategy 1 \
-threads 0 \
-movflags +faststart \
-ar 44100 \
-ac 2 \
-ab 128k \
-f mp4 \
-metadata title="$TITLEFILE" \
-metadata album="$ALBUMFILE" \
-metadata year="$YEARFILE" \
-metadata container="$CONTAINTERFILE" \
-metadata artist="$ARTISTFILE" \
-metadata comment="$COMMENTFILE"  \
"$PREFILE.mp4" < /dev/null


    echo "$NOW :: $fileonly :: $INPUT  <--- completed" >> $streamlog
    mv $INPUT mkv/
    echo "$NOW :: $fileonly :: $INPUT ---> 'finish-mkv' folder" >> $streamlog
    mv "$PREFILE.mp4" mp4/
    echo "$NOW :: $fileonly :: $PREFILE.mp4 ---> 'mp4' folder" >> $streamlog
fi

ffmpegthumbnailer -i $INPUT -w -c png -s 0 -o "thumbs/$INPUT.png"

./$0


################### END
## TALON: ff.video.mp4.all.sh
stopwatchtime

