#!/bin/bash
startgreen=`date +%s`
<<<<<<< HEAD
BINPULL="/home/users/faron/.falcon/scripts/htmls/VAULT"
=======
<<<<<<< HEAD
BINPULL="/home/users/faron/.falcon/scripts/htmls/VAULT"
=======
BINPULL="/mnt/falcon/scripts/htmls/VAULT"
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
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

<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
<<<<<<< HEAD
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /home/users/faron/.falcon/logs/scripts.log; exit 0
=======
stopred=`date +%s`; faronruntime=$(( $stopred - $startgreen )); echo "$0 | $startgreen | $stopred | $faronruntime " >> /mnt/falcon/logs/scripts.log; exit 0
>>>>>>> 4a57841db1f93d2f7c01ff2befe5e273d068f2c8
>>>>>>> f9d0d2959eeb7851b72492ad118e70e0d9a2b347
