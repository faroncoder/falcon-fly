#!/bin/bash
startgreen=`date +%s`
## FILE & FOLDER ROUTINE CHECK

  if [ ! -d "$PWD/thumbs" ]; then
        mkdir -p $PWD/thumbs
fi

INPUT=( `find -L . -maxdepth 1 -type f -name '*.mkv' -exec basename {} \; ` )
# if [ -z "$INPUT" ];
# 	then
# 		INPUT=( $( find $PWD -maxdepth 1 -type f -name '*.mp4' -exec basename {} \; ) )
# 	else
# 		INPUT="$1"
# fi

if [[ -z "${INPUT[@]}" ]]; then
		echo "nope there is no file -- ending the encoding engine..."
<<<<<<< HEAD
		stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/faron/.falcon/logs/scripts.log; exit 0
=======
<<<<<<< HEAD
		stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
		stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
else
		for f in "${INPUT[@]}";
		do
		PREFILE="$( rev <<< $f | cut -d"." -f2 | rev )"
		ffmpegthumbnailer -i $f -c png -s 512 -o "process.png"
		convert process.png -resize 250x -resize 'x200<' -resize 100% -gravity center -crop 250x200+0+0 +repage "thumbs/$PREFILE.png"
		rm process.png
		done
		# ffmpeg -ss 00:01:00 -i $f -y -t 1 -vf scale=-1:$HEIGHTPNG -f image2 -vframes 1 "$PWD/thumbs/$PREFILE.png" < /dev/null

		#ffmpeg -ss 00:01:00 -i $f -y -t 1 -vf "scale=trunc(oh*a/2)*2:$HEIGHTPNG" -f image2 -vframes 1 "thumbs/$f.png" < /dev/null ;

fi
<<<<<<< HEAD
	stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/faron/.falcon/logs/scripts.log; exit 0
=======
<<<<<<< HEAD
	stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
	stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
