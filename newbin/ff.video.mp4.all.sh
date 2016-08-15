#!/bin/bash
<<<<<<< HEAD
startgreen=`date +%s`; stopwatchtime() { stopred=`date +%s`; 	faronruntime=$( echo "$(( $startgreen - $stopred ))" ); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0 }
=======
startgreen=`date +%s`; stopwatchtime() { stopred=`date +%s`; 	faronruntime=$( echo "$(( $startgreen - $stopred ))" ); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0 }
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
#################### BEGIN
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



################### END
## TALON: ff.video.mp4.all.sh
stopwatchtime
