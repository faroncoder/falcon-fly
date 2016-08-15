#!/bin/bash
startgreen=`date +%s`
## FILE & FOLDER ROUTINE CHECK
  if [[ ! -d "$PWD/thumbs" ]]; then
        mkdir -p "$PWD/thumbs"
fi

GETFILES=( ` find . -maxdepth 1 -type f -name '*.mp4' -exec basename {} \; ` )

	#
		#ffmpegthumbnailer -i "output/$PREFILE.mp4" -w -c png -s 0 -o "thumbs/$INPUT.png"

for m in "${GETFILES[@]}"; do
		PREFILE="$( rev <<< "$m" | cut -d "." -f2 | rev )"
		ffmpeg -ss 00:01:00.000 -i $m -y -f image2 -vframes 1 "$PREFILE.png" < /dev/null
		#mv "$PWD/$PREFILE.mp4" "$PWD/output/"
	done


# INDVI="$1"
# if [[ -z "$INDVI" ]]; then
# 		FILEGRAB="$( find $PWD -maxdepth 1 -type f  -name '*.mp4' ! -name '*.sh' ! -name 'mp4this' | sort | head -n 1 )"
# 		if [[ -z "$FILEGRAB" ]]; then
# 				echo "nope there is no file -- ending the thumbnailing engine..."

# 			else
# 				INPUT=$( basename $FILEGRAB )
# 				compileThumbs
# 		fi
# 	else
# 		INPUT=$( basename $INDVI )
# 		compileThumbs
# fi


#$0  ## self-execute the script again for reloop
