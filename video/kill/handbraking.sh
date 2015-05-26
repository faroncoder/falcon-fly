#!/bin/bash
startgreen=`date`

YEAR="$( echo $GETDATE | awk '{print$6}' )"
DAY="$( echo $GETDATE | awk '{print$3}' )"
MONTH="$( echo $GETDATE | awk '{print$2}' )"
TIME="$( echo $GETDATE | awk '{print$4}' )"
NOW="$MONTH-$DAY-$YEAR @ $TIME"
mypath="$(readlink -f "$0")"
fileonly="$( basename $mypath )"
streamlog="/home/faron/var/streamings/encoding.log"

if [  ! -d mp4 ]; then
	GETDATE="$( date )"
    ln -s ../mp4 mp4
    echo "$NOW :: $fileonly :: folder 'mp4' is missing - created linked folder" >> $streamlog
fi

if [  ! -d finish-mkv ]; then
	GETDATE="$( date )"
    ln -s ../finish-mkv finish-mkv
    echo "$NOW :: $fileonly :: folder 'finish-mkv' is missing - created linked folder" >> $streamlog
fi
FILECHECK="$(  find $PWD -maxdepth 1 -type f  -name '*.mkv' | sort | head -n1 )"
if [ -z "$FILECHECK" ]
      then
	GETDATE="$( date )"
            echo "$NOW :: $fileonly :: no more file to encode ---> script terminated" >> $streamlog
            echo "$NOW :: $fileonly ---> exiting"
stopred=`date`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
      else
	GETDATE="$( date )"        
	    INPUT="$( basename $FILECHECK )"
            echo "$NOW :: $fileonly :: $INPUT ---> encoding" >> $streamlog
            PREFILE="$( rev <<< "$INPUT" | cut -d "." -f2 | rev )"
            HandBrakeCLI -i "$INPUT" -o "$PREFILE.mp4" -f mp4 -O -I -e x264 --x264-preset veryslow --x264-tune psnr -q 23 --vfr --width 720 --height 480 -Y 480 -X 720 --loose-anamorphic --modulus 4 -5 -8 -E faac -B 128 -6 stereo -R 44.1
            mv $INPUT finish-mkv/
		GETDATE="$( date )"
            echo "$NOW :: $fileonly :: $INPUT ---> moved to 'finish-mkv' folder" >> $streamlog
            mv "$PREFILE.mp4" mp4/
            echo "$NOW :: $fileonly :: $PREFILE.mp4 ---> moved to 'mp4' folder" >> $streamlog
            echo "$NOW :: $fileonly :: $INPUT  <--- completed" >> $streamlog
fi
./handbraking.sh
stopred=`date`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
