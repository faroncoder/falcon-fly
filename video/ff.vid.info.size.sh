#!/bin/bash

SIZECHK=$1

GET=( `find $PWD -maxdepth 1 -type f -name '*.mp4' -exec basename {} \; ` )

for file in "${GET[@]}"; do
#echo $file $SIZECHK

CHK=`mediainfo "$file" | grep 'Height' | cut -d':' -f2 | sed 's/[A-Za-z]//g' | sed 's/ //g'`

#if [[ "$SIZECHK" < "$CHK" ]]; then

	echo "$file: $CHK vs $SIZECHK"
#	COLLECT=( ${COLLECT[@]} $file )
#fi

done

#echo "${COLLECT[@]}" | tr ' ' '\n'


#././lab.vid.info.filter.sh "$FILE $CHK $SIZECHK"

exit 0
