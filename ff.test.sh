#!/bin/bash


source /usr/local/lib/faron_falcon/colors; source /usr/local/lib/faron_falcon/functions; 



j="$1"

GETNAME=$( rev <<< $j | cut -d"." -f2 | rev )
echo "$GETNAME"
echo -e	"$Fgreen-name$Foff"
GETEXT=".$( rev <<< $j | cut -d"." -f1 | rev )"
echo "$GETEXT"
echo -e	"$Fgreen-.ext$Foff"
GETFILE="$PWD/$GETNAME$GETEXT"
echo "$GETFILE"
echo -e	"$Fgreen-current file$Foff$Foff"
NEWNAME=`echo $GETNAME | tr '.' '-'`
echo "$NEWNAME"
echo -e	"$Fgreen-new name$Foff"
NEWFILE="$NEWNAME.mp4"
echo "$NEWFILE"
echo -e	"$Fgreen-new file name$Foff"
TRASH="$PWD/origs-trash/$GETNAME$GETEXT"
echo "$TRASH"
echo -e	"$Fgreen-file to be trashed$Foff"
COLLECT="$PWD/new-mp4/$NEWFILE"
echo "$COLLECT"
echo -e	"$Fgreen-converted file$Foff"
FEED="$PWD/$NEWNAME-feed.dat"
echo "$FEED"
echo -e	"$Fgreen-data -feed$Foff"

CHECKTHIS=`mediainfo $j | grep 'Format' | head -n 1 | awk '{ print $3 }'`; 

if [[ $CHECKTHIS == "" ]]; then 
		echo $CHECKTHIS
		echo -e "$Fno - not media video"
elif [[ "$( echo $CHECKTHIS | grep 'error' | head -n 1 )" != "" ]]; then
		echo $CHECKTHIS
		echo -e "$Fno - not media video"

	#LETSGO=0;
else 
		echo $CHECKTHIS
		echo -e $Fok
		echo -e "$Fok - media type"
	#LETSGO=1
fi


exit 0