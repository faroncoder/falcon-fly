#!/bin/bash
if [[ ! "$( echo $PATH | grep '/usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
LDD=/usr/local/lib/faron_falcon; . $LDD/colors; . $LDD/functions; startTime
#################### BEGIN

LOC="/home/users/faron/.falcon/scripts";


if [[ ! -d "$LOC" ]]; then
		echo "$Fno Falcon is not mounted. Exiting"
		XeF
	else

	if [[ "$1" != "" ]]; then
		FILEHUNT=( `find $LOC -type f -name "*$1*" ! -path '*/.git/*' ` )
	else
		FILEHUNT=( ` find $LOC -type f -name 'ff.*' ! -path '*/.git/*' ` );
	fi
	COUN=`echo "${FILEHUNT[@]}" | wc -w`
	export _send=${CHR182}
	echo "${_ok}Total ${COUN} accounted for loading."



	makelink(){
				EXT=".`echo $entry | rev | cut -d'.' -f1 | rev`"
				FILEBODY=`echo $entry | sed "s/$EXT//g"`
				NEWHOME=`basename $FILEBODY`
				BINLOC="/usr/local/bin/$NEWHOME"
				#echo "$entry --> $BINLOC"
				ln -s "$entry" "$BINLOC"
	}

	if [[ -z "$FILEHUNT" ]];  then
		echo "$Fno None found"
		XeF
	else
		find -L /usr/local/bin -name 'ff.*' -exec rm {} \;
		for entry in "${FILEHUNT[@]}"; do
				makelink;
		done
	fi
	source $HOME/.bashrc
	#echo "$Fok Falcon Bin sync-ed."
		#export GETMSG=$CHR145; FTmsg;
		#echo "$FMsend So, you are this?$Foff "
	#export GETMSG=$CHR99; FPmsg
	#	echo "$FMsend$COLR$RESSF$Foff $k"
	#	echo "$FMsend Oh ok, ahem! $Foff "
	#export GETMSG=$CHR145; FTmsg;
	#echo "$`FMsend $( echo "${FILEHUNT[@]}" | wc -w )`"
#	echo "`FTmsg $( echo "${FILEHUNT[@]}" | wc -w )`"

	export _send=${CHR182}
	#COUFN=`find -L /usr/local/bin -type f -name 'ff.*' | wc -l`
	echo "${_FY}Total $TOTALCOU sync-ed."

fi

	COMPR=`find -L . -name "ff.*" | wc -l `
	export _send=${CHR230}
	echo "${_FG}Total $TOTALCOU found.  $COMPR files installed. "


#checkTime

### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] ff.load.sh  [ACTIVE] y

