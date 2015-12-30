#!/bin/bash
VAR=$1
BINHOME="/home/faron/.bin"
SCRHOME="/media/falcon/scripts"
#WHICHUSER=$( echo $PWD | cut -d"/" -f 3 )
#if [[ $WHICHUSER = 'fly' ]]; then
#	BINHOME="/home/faron/.falcon/bin"
#	echo "Hello fly!"
#fi
FILEHUNT=( $( find -L "$SCRHOME" -type f -name "*$VAR*" ! -path '*/.git/*' ) )

getFileToLoad(){

 	if [[ ! "$FILEHUNT" ]]; then
		printf "no file"
	else
		for varget in "${FILEHUNT[@]}"; do
	 		#IFS= read -r varget ; do
			#FILENAME="$( rev <<< $varget | cut -d "." -f2 | rev )"
			#EXT="$( rev <<< $varget | cut -d "." -f1 | rev )"
			FILE=$( basename $varget )
			ORIG=$varget
			BINFILE=$( echo $FILE | sed 's/.sh//g' )
			BINFORMAT="$BINHOME/$BINFILE"

			#BIN=$PREFILE
			if [[ -f "$ORIG" ]]; then
				ORIGPRINT=$( printf ": original found" )
			fi
			if [[ -f "$BINFILE" ]]; then
				BINPRINT=$( printf ": true" )
			else
				BINPRINT=$( printf ": no link and created" )
				BACKHOME=$PWD
				cd $BINHOME
				rm "$BINFILE*" 2> /dev/null
				ln -s $ORIG $BINFILE
				cd $BACKHOME
			fi
		done
	fi
	echo $ORIG $ORIGPRINT
	echo $BIN $BINPRINT

}

getFileToLoad

# find -L $BINHOME -maxdepth 1 -name "$FIL2" -exec rm {} \;
# ln -s "$PWD/$FIL0" "$BINHOME/$FIL2"
#echo "FALCON: Symlink created for $FIL1 => $FIL2"
exit 0
