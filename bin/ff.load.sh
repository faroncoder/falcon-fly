#!/bin/bash
if [[ ! "$( echo $PATH | grep 'source /usr/local/bin' )" ]]; then export PATH=$PATH:/usr/local/bin; fi
 source /usr/local/lib/faron_falcon/colors;  source /usr/local/lib/faron_falcon/functions; startTime
#################### BEGIN

if [[ ! -d "$FALCON" ]]; then
		echo "$Fno Falcon is not mounted. Exiting"
		XeF
	else

	if [[ "$1" != "" ]]; then
		FILEHUNT=( `find $FALCON -type f -name "*$1*" ! -path '*/.git/*' ` )
	else
		FILEHUNT=( ` find $FALCON -type f -name 'ff.*' ! -path '*/.git/*' ` );
	fi

	export GETMSG=$CHR145; FTmsg;
	echo "$FMsend $( echo "${FILEHUNT[@]}" | wc -w )"



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

	GETMSG=$CHR95; FGmsg
	echo "$FMsend Falcon Bin sync-ed."
	FMsend=""
	GETMSG=""
fi
	#checkTime
#	echo "$HOWLONG"

### exit code for clean exit
doneTime
### IGNORE BELOW. THIS IS MEGATAG FOR MY SCRIPTS
### [FILE] /home/users/faron/.falcon/scripts/handle/ff.handle.folders.memory.sh [ACTIVE] y

