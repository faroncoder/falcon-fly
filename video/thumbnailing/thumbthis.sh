#!/bin/bash
## FILE & FOLDER ROUTINE CHECK

  if [ ! -d "$PWD/thumbs" ]; then
        mkdir -p $PWD/thumbs
fi

INPUT="$( find $PWD -maxdepth 1 -type f -name '*.mkv' -exec basename {} \;  )"
if [ -z "$1" ];
	then
		INPUT=( $( find $PWD -maxdepth 1 -type f -name '*.mkv' -exec basename {} \; ) )
	else
		INPUT="$1"
fi

if [ -z "$INPUT" ];
	then
    	echo "nope there is no file -- ending the encoding engine..."
 		exit 0
fi
for f in "${INPUT[@]}"; do
		HEIGHTPNG="256"

		ffmpeg -ss 00:01:00 -i $f -y -t 1 -vf scale=-1:$HEIGHTPNG -f image2 -vframes 1 "$PWD/thumbs/$f.png" < /dev/null


		#ffmpeg -ss 00:01:00 -i $f -y -t 1 -vf "scale=trunc(oh*a/2)*2:$HEIGHTPNG" -f image2 -vframes 1 "thumbs/$f.png" < /dev/null ;
	done

exit 0
