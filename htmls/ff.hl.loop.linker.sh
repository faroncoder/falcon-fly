#!/bin/bash
startgreen=`date +%s`
#GETFILES=( $( find . -maxdepth 1 -type f -exec basename {} \; ) )
GET=( `find . -maxdepth 1 -type f -exec basename {} \;` )
DOMAINF=$1
SUBF=$2

for f in "${GET[@]}"; do
	PREFILE="$( rev <<< $f | cut -d"." -f2 | rev )"
	PREEXT="$( rev <<< $f | cut -d"." -f1 | rev )"

	COUNT=$( echo ${GET[@]} | wc -w )
	if [[ "$COUNT" = 1 ]]; then
#		THISENTRY=( $( echo "{ title: '$PREFILE', href: 'http://$SUBF.$DOMAINF:5917/$PREFILE.$PREEXT', type: 'video/$PREEXT', poster: 'http://$SUBF.$DOMAINF:5917/thumbs/$PREFILE.png'}" ) )
	echo "<a href=\"http://$( hostname --short ).$DOMAINF:5916/$f\" id =\"$PREFILE\" ><img src=\"http://$( hostname --short ).$DOMAINF:5916/thumbs/$PREFILE.png\" border='0'></img></a><br />" >> links.html

	else
		#THISENTRY=( $( echo ${THISENTRY[@]}, ) $( echo "{ title: '$PREFILE', href: 'http://$SUBF.$DOMAINF:5917/$PREFILE.mp4', type: 'video/mp4', poster: 'http://$SUBF.$DOMAINF:5917/thumbs/$PREFILE.png'}" ) )
		echo "<a href=\"http://$( hostname --short ).$DOMAINF:5916/$f\" id =\"$PREFILE\" ><img src=\"http://$( hostname --short ).$DOMAINF:5916/thumbs/$PREFILE.png\" border='0'></img></a><br />" >> links.html

	fi

	#THISENTRY=( $( echo "{ title: '$PREFILE', href: 'https://$SUBF.$DOMAINF:5917/$PREFILE.mp4', type: 'video/mp4', poster: 'https://$SUBF.$DOMAINF:5917/thumbs/$PREFILE.png'}" ) )
	#fi





	#THISENTRY=( $( echo "{ title: '$PREFILE', href: 'https://$SUBF.$DOMAINF:5917/$PREFILE.mp4', type: 'video/mp4', poster: 'https://$DOMIANF:5917/thumbs/$PREFILE.png'}" ) )
	done
	echo ${THISENTRY[@]} | sed 's/, {/{/g' | sed 's/}{/},{/g'

stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
## FARON.FALCON.HTML_LINKS_TO_FILES_IN_SAME_DIR

