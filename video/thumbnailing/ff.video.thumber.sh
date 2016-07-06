#!/bin/bash
startgreen=`date +%s`
## FILE & FOLDER ROUTINE CHECK

  if [ ! -d "$PWD/thumbs" ]; then
        mkdir -p $PWD/thumbs
fi

INPUT=( $( find -L $PWD -maxdepth 1 -type f -name '*.mp4' ) )
 if [ -z "$INPUT" ];
 	then
 		INPUT=( $( find $PWD -maxdepth 1 -type f -name '*.mp4' ) )
 	else
 		INPUT="$1"
 fi

if [[ ! "${INPUT[@]}" ]]; then
		echo "nope there is no file -- ending the encoding engine..."
		stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/faron/.falcon/logs/scripts.log; exit 0
else
		for f in "${INPUT[@]}";
		do
		fixme=$( basename $f )
		PREFILE="$( rev <<< $fixme | cut -d"." -f2 | rev )"
		ffmpegthumbnailer -i $f -c png -s 512 -o "$PWD/process.png"
		convert "$PWD/process.png" -resize 512x -resize 'x288<' -resize 100% -gravity center -crop 512x288+0+0 +repage "$PWD/thumbs/$PREFILE.png"
		rm "$PWD/process.png"
		done
		# ffmpeg -ss 00:01:00 -i $f -y -t 1 -vf scale=-1:$HEIGHTPNG -f image2 -vframes 1 "$PWD/thumbs/$PREFILE.png" < /dev/null

		#ffmpeg -ss 00:01:00 -i $f -y -t 1 -vf "scale=trunc(oh*a/2)*2:$HEIGHTPNG" -f image2 -vframes 1 "thumbs/$f.png" < /dev/null ;

fi
	stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/faron/.falcon/logs/scripts.log; exit 0
