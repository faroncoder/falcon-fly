#!/bin/bash
startgreen=`date +%s`
BINPULL="/home/fly/scripts/htmls/VAULT"
orderfiles=( $( find $BINPULL -type f ) )

function populateoption {
	find $BINPULL -type f ! -name '*old*' -exec basename {} \;
	echo -n "which package to install (full filename) ? "
	read PICK
	cp "$BINPULL/$PICK" "$PWD/$PICK"
	tar -zvxf $PICK
}

populateoption

TYPE="$1"
if [ -z "$TYPE" ]
	then
	   echo -n "which type of file to be bind to new html? "
	   read TYPE
	   EXT=$( echo $TYPE | cut -d '.' -f2 )
	 fi
orderfiles=( $( find . -maxdepth 1 -type f -name "*.$EXT" | rev | cut -d "/" -f1 | rev ) )
#cp ./jsc/templates/carsoual-videos.html "$PWD/listing.html"
FILELOCA='./jsc/media'
if [ "$EXT"="flv" ]
	then
		EXTTYPE="x-flv"
	fi

if [ "$EXT"="mp4" ]
	then
	EXTTYPE="mp4"
fi
if [ "$EXT"="webm" ]
	then
	EXTTYPE="webm"
fi

for f in "${orderfiles[@]}";
	do
		mv $f jsc/media/
		NAME="$( rev <<< "$f" | cut -d "." -f2 | rev )"
		cat $PWD/jsc/templates/videoplayer.html | sed "s/FILENAMEME/$( echo $NAME )/g" > "$NAME.html"
		sed -i -e "s/FILELOCA/$( echo $FILELOCA )/g" "$NAME.html"
		sed -i -e "s/EXTTYPE/$( echo $EXTTYPE )/g" "$NAME.html"
		sed -i -e "s/EXT/$( echo $EXT )/g" "$NAME.html"

		#sed -i -e "/FILENAMEMEENTRY/a
		#<a rel=\"gallery\" class=\"fancybox fancybox.iframe\" href=\"./jsc/media/$( echo $NAME ).html\"><img src=\"./jsc/img/$( echo $NAME ).jpg\" alt=\"\"/></a><br />"	"$PWD/listing.html"
	done

#rm mediaplayer.tar.gz

stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
