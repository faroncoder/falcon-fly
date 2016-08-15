#!/bin/bash
startgreen=`date +%s`
stopwatchtime() {
	stopred=`date +%s`
	faronruntime=$( echo `expr $startgreen - $stopred` )
<<<<<<< HEAD
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/faron/.falcon/logs/scripts.log
=======
<<<<<<< HEAD
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log
=======
	echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
	exit 0
}

export PATH=$PATH


GRABMOV=( echo $( find . -maxdepth 1 -type f ) )
for m in "${GRABMOV[@]}";
	do
		INPUT=$( basename $1 )
		PREFILE=$( rev <<< $INPUT | cut -d"." -f2 | rev )
		EXT=$( rev <<< $INPUT | cut -d"." -f1 | rev )
		REQEXT=""
		#echo "$m | `ls -al --block-size=M $m | awk '{print $5}'`" > "_list/$PREFILE.list"
		#echo -e "y" | avidemux2_cli --force-alt-h264 --load $m --unpack-vop --save THISFILE.mkv --output-format  MATROSKA --quit
		#echo "THISFILE.mkv | `ls -al --block-size=M THISFILE.mkv | awk '{print $5}'`" >> "_list/$PREFILE.list"
	 	#rm $m
	 	ffmpeg -fflags genpts -i $m -flags +global_header -codec copy "$PREFILE.$FILETYPE" < /dev/null
		mv $m to_be_discarded_after_checking/
		#rm THISFILE.mkv
		echo "$PREFILE.$FILETYPE | `ls -al --block-size=M \"$PREFILE.$FILETYPE\" | awk '{print $5}'`" >> "_list/$PREFILE.list"
		echo "-----------" >> "_list/$PREFILE.list"
		mediainfo "$PREFILE.$FILETYPE" >> "_list/$PREFILE.list"
		PREFILE=""
	done
GRABAVI=( `ls *.avi` )
for a in "${GRABAVI[@]}";
	do
		PREFILE=$( printf "$a" | cut -d"." -f 1 )
		FILETYPE="mkv"
		#echo "$a | `ls -al --block-size=M $a | awk '{print $5}'`" > "_list/$PREFILE.list"
		#echo -e "y" | avidemux2_cli --force-alt-h264 --load $a --unpack-vop --save THISFILE.mkv --output-format  MATROSKA --quit
		#echo "THISFILE.mkv | `ls -al --block-size=M THISFILE.mkv | awk '{print $5}'`" >> "_list/$PREFILE.list"

		ffmpeg -fflags genpts -i $a -flags +global_header -codec copy "$PREFILE.$FILETYPE" < /dev/null
		mv $a to_be_discarded_after_checking/
		#rm THISFILE.mkv
		echo "$PREFILE.$FILETYPE | `ls -al --block-size=M \"$PREFILE.$FILETYPE\" | awk '{print $5}'`" >> "_list/$PREFILE.list"
		echo "-----------" >> "_list/$PREFILE.list"
		mediainfo "$PREFILE.$FILETYPE" >> "_list/$PREFILE.list"
		PREFILE=""
	done
GRABMPEG=( `ls *.mp4` )
for p in "${GRABMPEG[@]}";
	do
		PREFILE=$( printf "$p" | cut -d"." -f 1 )
		FILETYPE="mkv"
		#echo "$p | `ls -al --block-size=M $p | awk '{print $5}'`" > "_list/$PREFILE.list"
		#echo -e "y" | avidemux2_cli  --force-alt-h264 --load $p --unpack-vop --save THISFILE.mkv --output-format  MATROSKA --quit
		#echo "THISFILE.mkv | `ls -al --block-size=M THISFILE.mkv | awk '{print $5}'`" >> "_list/$PREFILE.list"
	 	ffmpeg -fflags genpts -i $p -flags +global_header -codec copy "$PREFILE.$FILETYPE" < /dev/null
		mv $p to_be_discarded_after_checking/
		#rm THISFILE.mkv*\		echo "$PREFILE.$FILETYPE | `ls -al --block-size=M \"$PREFILE.$FILETYPE\" | awk '{print $5}'`" >> "_list/$PREFILE.list"
		echo "-----------" >> "_list/$PREFILE.list"
		mediainfo "$PREFILE.$FILETYPE" >> "_list/$PREFILE.list"
		PREFILE=""
	done


stopwatchtime
