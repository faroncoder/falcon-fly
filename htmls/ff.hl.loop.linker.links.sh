#!/bin/bash
startgreen=`date +%s`
#GETFILES=( $( find . -maxdepth 1 -type f -exec basename {} \; ) )
GET=( `find . -maxdepth 1 -type f -exec basename {} \;` )

ff.video.thumber

for f in "${GET[@]}"; do
	PREFILE="$( rev <<< $f | cut -d "." -f2 | rev )"
	# COUNT=$( echo ${GET[@]} | wc -w )
	# if [[ "$COUNT" = 1 ]]; then
	# 	THISENTRY=( $( echo "{ title: '$PREFILE', href: 'http://tv.faronhost.ca:5917/$PREFILE.mp4', type: 'video/mp4', poster: 'http://tv.faronhost.ca:5917/thumbs/$PREFILE.png'}" ) )
	# else
	# 	THISENTRY=( $( echo ${THISENTRY[@]}, ) $( echo "{ title: '$PREFILE', href: 'http://tv.faronhost.ca:5917/$PREFILE.mp4', type: 'video/mp4', poster: 'http://tv.faronhost.ca:5917/thumbs/$PREFILE.png'}" ) )
	# fi

	#THISENTRY=( $( echo "{ title: '$PREFILE', href: 'https://f7.faronhost.ca:5917/$PREFILE.mp4', type: 'video/mp4', poster: 'https://f7.faronhost.ca:5917/thumbs/$PREFILE.png'}" ) )
	#fi



	echo "<a href=\"http://f6.faronhost.ca:5916/$f\" id =\"$PREFILE\" ><img src=\"http://f6.faronhost.ca:5916/thumbs/$PREFILE.png\" border='0'></img>$f</a><br />" >> links.html


	#THISENTRY=( $( echo "{ title: '$PREFILE', href: 'https://f7.faronhost.ca:5917/$PREFILE.mp4', type: 'video/mp4', poster: 'https://f7.faronhost.ca:5917/thumbs/$PREFILE.png'}" ) )
	done
#	echo ${THISENTRY[@]} | sed 's/, {/{/g' | sed 's/}{/},{/g'

stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
## FARON.FALCON.HTML_LINKS_TO_FILES_IN_SAME_DIR

