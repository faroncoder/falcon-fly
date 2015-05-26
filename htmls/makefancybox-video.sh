#!/bin/bash
startgreen=`date`
BINPULL="$HOME/.falcon/scripting/falcon-fly/htmls/VALVE"
orderfiles=( $( find $BINPULL -type f ) )

function populateoption {
	find $BINPULL -type f ! -name '*old*' -exec basename {} \;
	echo -n "which package to install (full filename) ? "
	read PICK
	cp "$BINPULL/$PICK" "$PWD/$PICK"
	tar -zvxf $PICK
	rm "$PWD/$PICK"
}

populateoption

TYPE="$1"
if [ -z "$TYPE" ]
	then
	   echo -n "which type of file to be bind to new html (file extension) ? "
	   read TYPE
	   EXT=$( echo $TYPE | cut -d '.' -f2 )
	 fi
orderfiles=( $( find $PWD -type f -name "*.$EXT" | rev | cut -d "/" -f1 | rev ) )
cp ./jsc/templates/carsoual-videos.html "$PWD/listing.html"

for f in "${orderfiles[@]}";
	do
		mv "$f" "jsc/media/$f"
		NAME="$( rev <<< "$f" | cut -d "." -f2 | rev )"
		sed -i -e "/FILENAMEMEENTRY/a <a rel=\"gallery\" class=\"fancybox fancybox.iframe\" href=\".\/jsc\/media\/$( echo $NAME ).$EXT\"><img src=\".\/jsc\/img\/$( echo $NAME ).jpg\" alt=\"\"\/><\/a><br \/>"	"$PWD/listing.html"
	done

#rm mediaplayer.tar.gz

stopred=`date`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> ~/.falcon/logs/scripts.log; exit 0
