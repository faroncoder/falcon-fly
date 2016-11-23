#!/bin/bash

GETALL=( `find . -maxdepth 1 -type f -name '*.mp4*' -exec basename {} \; ` )

THUMPORT=7781
CLIPPORT=7780

COUNT=`echo ${GETALL[@]} | wc -w`

makeHtml(){
		sudo chmod 775 $FILE
		sudo chown faron:www-data $FILE

echo -e "\$( function()
{
  'use strict'

// Initialize the Gallery as video carousel:
blueimp.Gallery( [" > $FILE

CONNECT=""
for j in "${GETALL[@]}"; do

	if [[ "$j" != "" ]]; then


		 TR=`echo $j | sed 's/.mp4//g'`
		 echo -n -e "$CONNECT
		{
		\t title: \"$TR\",
		\t href: \"http://$IP:$CLIPPORT/$TR.mp4\",
		\t type: \"video/mp4\",
		\t poster: \"http://$IP:$THUMPORT/$TR-0.png\"
		}" >> $FILE
		CONNECT=","
	fi
done

echo -e "],
  {
    container: '#blueimp-video-carousel',
    carousel: true
  })
})" >> $FILE
}


IP="192.168.1.6"
FILE="internal-listing.js"
makeHtml
IP="f6.faron.ca"
FILE="external-listing.js"
makeHtml


exit 0


