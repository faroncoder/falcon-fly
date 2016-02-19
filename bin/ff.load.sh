#!/bin/bash -e
VAR=$1
ALSR=$2
BINHOME="/usr/local/bin"
SCRHOME="/home/faron/.falcon/scripts"


fg0="$(tput setaf 0)"
fcr="$(tput setaf 1)"
fcg="$(tput setaf 2)"
fcy="$(tput setaf 3)"
fcb="$(tput setaf 4)"
fcp="$(tput setaf 5)"
fcc="$(tput setaf 6)"
fcw="$(tput setaf 7)"
fco="$(tput sgr0)"

#BIN=$PREFILE
#WHICHUSER=$( echo $PWD | cut -d"/" -f 3 )
#if [[ $WHICHUSER = 'fly' ]]; then
#	BINHOME="/home/faron/.falcon/bin"
#	echo "Hello fly!"
#fi

askAliasname(){
	echo -n "alias for $BINFILE ? "
	read GETNEWMANE
	if [[ "$GETNEWMANE" != "" ]]; then
		GETNEWMANE="$BINHOME/$BINFILE"
		RC="$RC and aliased."
	fi
}

sniffLink(){
	for entry in "${THIS[@]}"; do

#recify file
			if [ -f "$entry" ]; then
#link assume=no
#checks for linked
				RC="$BINFILE ${fcg}found${fco}"
				if [[ -f "$BINFORMAT" ]]; then
#We have link
	#reverify link is same
					 RECIFY=$( ls -al $BINFORMAT | awk '{ print $11 }' )
		 # yes  = same link
					 if [[ "$BINFORMAT" == "$RECIFY" ]]; then
	 	#no action and log result
					 	RC+="...${fcg}linked${fco}"
		#but if link not same
					 else
	 	# then remove link and log result
				 		rm $BINFORMAT 2>/dev/null
				 		RC+="...${fcr}link repaired${fco}"
				  	fi
				 fi
#but if no link
#create link with request
				GETNEWMANE="$BINHOME/$BINFILE"
				RC+="...${fcg}linked${fco}"
				if [[ ! "$2" ]]; then
					GETNEWMANE="$2"

				else
					askAliasname
					RC+="...${fcg}aliased${fco}"
				fi
				RC+="...${fcg}we are done!${fco}"
			fi
	echo -e "$RC"
	done


}


getFileToLoad(){
#find files
FILEHUNT=( $( find "$SCRHOME" -type f -name "*$VAR*" ! -path '*/.git/*' ) )
#if query empty
	if [ ! "$FILEHUNT" ]; then
		printf "$BRed$fancyX"
#but if query not empty
	else
	#for each find
		for varget in "${FILEHUNT[@]}"; do
		#get attirbutes
			FILE=$( basename $varget )
			THIS=$varget
			echo "$BGreen_SHELL $checkmark_SHELL "
		#remove extension
		#arraizing all in
			BINFILE="$BINFILE $( echo $FILE | sed 's/.sh//g' )"
		done
	#results delivered as object BINFILE
	fi
sniffLink
}


getFileToLoad





#BINHUNT=( $( find -L $BINHOME -type l -name "$BINFILE"  ) )
			# 	 fi

			# 		=1
			# 	fi

			# 	ORIGPRINT=$( printf ": original found" )
			# 	ORIGCHECK=$( md5sum $ORIG )
			# 	CHECKLINK=$( find -L $BINHOME -type l -name "*$BINFILE*" )
			# 	HAVELINK=$( basename "$CHECKLINK" )
			# 	if [ ! "$2" ]; then
			# 		if [ -f "$HAVELINK" ]; then
			# 			#
			# 			BINCHECK=$( md5sum $HAVELINK | awk '{ print $1}' )
			# 			if [[ "$BINCHECK" == "$ORIGCHECK" ]]; then
			# 				ORIGPRINT=$( printf ": original found and the link is same" )
			# 			else
			# 				rm "$BINHOME/$HAVELINK" 2> /dev/null
			# 				ORIGPRINT=$( printf ": original found and link repaired." )
			# 				ln -s "$varget"  "$BINFORMAT"
			# 			fi
			# 		else
			# 			ORIGPRINT=$( printf " = New script and new link spawned as $ALSR." )
			# 			ln -s $varget "$BINHOME/$ALSR"
			# 		fi
			# 	else
			# 		HAVEALSR=$( find -L $BINHOME -type l -name "*$ALSR*" )
			# 		if [ -f "$BINHOME/$ALSR" ]; then
			# 			BINCHECK=$( md5sum "$BINHOME/$ALSR" | awk '{ print $1}' )
			# 			if [[ "$BINCHECK" == "$BINHOME/$ALSR" ]]; then
			# 				ORIGPRINT=$( printf ": original found and the link is same")
			# 			else
			# 				rm "$BINHOME/$ALSR" 2> /dev/null
			# 				ORIGPRINT=$( printf ": original found and link repaired." )
			# 				ln -s "$varget"  "$BINHOME/$ALSR"
			# 			fi
			# 		else
			# 			ln -s "$varget" "$BINHOME/$ALSR"
			# 			ORIGPRINT=$( printf ": this is new script and your personalized link spawned." )
			# 		fi
			# 	fi
			# else
			# 	ORIGPRINT=$( printf ": can not find it." )
			# fi

			# # if [[ -f "$BINFILE" ]]; then
			# # 	BINPRINT=$( printf ": true" )
			# # else
			# # 	BINPRINT=$( printf ": linked" )
			# # 	BACKHOME=$PWD
			# # 	cd $BINHOME
			# # 	rm "$BINFILE*" 2> /dev/null
			# # 	ln -s $ORIG $BINFILE
			# # 	cd $BACKHOME
			# # fi

# 		done

# 	fi

# }

# getFileToLoad

# find -L $BINHOME -maxdepth 1 -name "$FIL2" -exec rm {} \;
# ln -s "$PWD/$FIL0" "$BINHOME/$FIL2"
#echo "FALCON: Symlink created for $FIL1 => $FIL2"
exit 0
