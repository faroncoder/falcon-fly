#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime
####################START
FILEGRAB=$1
#FILEGRAB="$( find ./ -maxdepth 1 -type f  -name '*.mkv' ! -name '*.sh' | sort | head -n1 )"
TYPEFILE="480p"
TITLEFILE=""
YEARFILE=""
ALBUMFILE=""
CONTAINTERFILE=""
ARTISTFILE=""
BITRAT="1024k"
MAXRAT="1200k"
BUFFRAT="1024K"
HEIGHTWT="480"
COMMENTFILE="Encoded by Faron the Falcon"

INPUT=$( basename $1 )
PREFILE=$( rev <<< "$INPUT" | cut -d"." -f2 | rev )
ffmpeg -i $INPUT -y  \
-vcodec libx264 \
-preset slow \
-pix_fmt yuv420p \
-b:v "$BITRAT" \
-maxrate "$MAXRAT" \
-bufsize "$BUFFRAT" \
-vf "scale=trunc(oh*a/2)*2:$HEIGHTWT" \
-acodec libfdk_aac \
-coder 1 \
-flags +loop \
-cmp chroma \
-partitions +parti4x4+partp8x8+partb8x8 \
-subq 6 \
-me_range 16 -g 60 \
-keyint_min 25 \
-sc_threshold 40 \
-i_qfactor 0.71 \
-b_strategy 1 \
-threads 0 \
-movflags +faststart \
-ar 44100 \
-ac 2 \
-ab 128k -f mp4 \
-metadata title="$TITLEFILE" \
-metadata album="$ALBUMFILE" \
-metadata year="$YEARFILE" \
-metadata container="$CONTAINTERFILE" \
-metadata artist="$ARTISTFILE" \
-metadata comment="$COMMENTFILE"  \
$PREFILE.mp4 < /dev/null



###################STOP
### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.video.mp4.all.sh  [ACTIVE] y

