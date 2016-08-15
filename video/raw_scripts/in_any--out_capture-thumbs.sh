#!/bin/bash
startgreen=`date +%s`

INPUT="$1"
if [ -z $INPUT ]
	then
		echo "INPUT name is needed (orginial file)"
		exit 1
fi

FILE="$( rev <<< "$INPUT" | cut -d"." -f2 | rev )"


ffmpeg \
-i $INPUT \
-y \
-t 1 \
-ss 10 \
-r 1 \
-f image2 "$FILE.jpg"  < /dev/null


ffmpeg \
-i $INPUT \
-y \
-t 1 \
-ss 20 \
-r 1 \
-f image2 "$FILE2.jpg"  < /dev/null


ffmpeg \
-i $INPUT \
-y \
-t 1 \
-ss 30 \
-r 1 \
-f image2 "$FILE3.jpg"  < /dev/null

ffmpeg \
-i $INPUT \
-y \
-t 1 \
-ss 40 \
-r 1 \
-f image2 "$FILE4.jpg"  < /dev/null


ffmpeg \
-i $INPUT \
-y \
-t 1 \
-ss 50 \
-r 1 \
-f image2 "$FILE5.jpg"  < /dev/null


echo "thumb snapper is completed..."
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0

