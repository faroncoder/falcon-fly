#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/loader; startTime;
####################START


# ## check if directory 'media' exists
# 	if [[ ! -d "$PWD/media" ]]; then
# ## If not, make it
# 	    mkdir -p $PWD/media 2> /dev/null
# 	fi


if [[ "$1" == "" ]]; then
	echo "$_no filename? "
	doneTime
else
## Variablize the input
	INPUT="$1"
	PREFILE=`echo $INPUT | rev | cut -d'.' -f2 | rev`
    PREEXT=`echo $INPUT | rev | cut -d'.' -f1 | rev`


	#if [[ ! -f "$PWD/thumbs/$INPUT" ]]; then
	if [[ ! -d "$PWD/thumbs" ]]; then
		echo "`_warn` directory 'thumbs' created"
	    mkdir -p "$PWD/thumbs" 2> /dev/null;
	fi
	ffmpegthumbnailer -i $INPUT -s 256 -t 30% -c png -o $PWD/thumbs/$PREFILE-4.png < /dev/null

	ffmpegthumbnailer -i $INPUT -s 128 -t 30% -c png -o $PWD/thumbs/$PREFILE-3.png < /dev/null
	# ffmpeg -hide_banner -loglevel panic -ss 00:02:00.000 -i $INPUT -y -f image2 -vframes 1 "$PWD/$PREFILE.png" < /dev/null

	ffmpegthumbnailer -i $INPUT -s 64 -t 30% -c png -o $PWD/thumbs/$PREFILE-2.png < /dev/null

	ffmpegthumbnailer -i $INPUT -s 32 -t 30% -c png -o $PWD/thumbs/$PREFILE-1.png < /dev/null


	ffmpegthumbnailer -i $INPUT -s 0 -t 30% -c png -o $PWD/thumbs/$PREFILE-0.png < /dev/null
	# convert  -resize 340x256^ "$PWD/$PREFILE.png" "$PWD/thumbs/$PREFILEsm.png"
	# rm "$PWD/$PREFILE.png" 2> /dev/null
	echo "`_warn` $PREFILE.png thumbed"
fi
	#else
## otherwise, if this file exists, then we are all happy.
	# 	COUNT=0
	# 	for m in "${GETFILES[@]}"; do

	# 		COUNT=`echo $(( $COUNT + 1 ))`
	# 	done
	# 	echo "_stat $COUNT thumbs created"
	# else
	# 		PREFILE="$( rev <<< "$INPUT" | cut -d "." -f2 | rev )"
	# 		ffmpeg -ss 00:01:00.000 -i $INPUT -y -f image2 -vframes 1 "$PWD/thumbs/$PREFILE.png" < /dev/null
	# 		echo "_ok $PREFILE.png --> thumbs/"
doneTime

### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.media.thumbnailer.sh  [ACTIVE] y
